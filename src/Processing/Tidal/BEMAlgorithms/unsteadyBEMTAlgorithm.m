classdef unsteadyBEMTAlgorithm < handle
    % unsteadyBEMT
    % Class wrapper for the Unsteady BEM Algorithm
    % Developed by Thomas Hogan, 05/08/2025

    properties
        sim         % Simulation settings object
        fluid       % Fluid properties object
        wind        % Incoming wind object
        rot         % Coordinate transformation object
        cor         % Aerodynamic corrections object
        turb        % Wind turbine object
        var         % Variables object (stores results)
    end

    methods
        function obj = unsteadyBEMTAlgorithm(Sim, Fluid, Wind, Rot, Cor, Turb)
            % Constructor - initialises all sub-components

            % Simulation settings
            obj.sim = simulationSettings(Sim.dt, Sim.t_end);

            % Fluid properties
            obj.fluid = fluidProperties(Fluid.rho, Fluid.kinVisc);

            % Incoming wind
            obj.wind = incomingWind(Wind.windSpeed_nom);

            % Coordinate transformation
            obj.rot = coordTransformations(Rot.yaw, Rot.tilt, Rot.wing, Rot.cone);

            % Aerodynamic corrections
            obj.cor = aeroCorrections(Cor.tipLoss, Cor.thrustCorrection, ...
                                      Cor.hubLoss, Cor.dynamicStall, ...
                                      Cor.dynamicWake, Cor.yawModel);

            % Wind turbine
            obj.turb = windTurbine(Turb.R, Turb.r, Turb.chord, Turb.twist, Turb.pitch, ...
                                   Turb.nB, Turb.nBE, Turb.nDoF, Turb.RPM, Turb.n, Turb.airfoilFile);

            % Variables
            obj.var = variablesBEMT(obj.sim.N, obj.turb.nB, obj.turb.nBE, obj.turb.nDoF);

        end


        function runSimulation(obj)
            % Main unsteady BEM time-stepping loop

            for t = 2:obj.sim.N-1
                for inB = 1:obj.turb.nB
                    for inBE = 1:obj.turb.nBE
                        
                        % ------------------------------
                        % Blade element position
                        obj.var.rb_4(t,:,inB,inBE) = [obj.turb.r(inBE); 0; 0];
                        obj.var.rb_1(t,:,inB,inBE) = (obj.rot.R14') * obj.var.rb_4(t,:,inB,inBE)';

                        % Incoming wind
                        obj.var.V0_1(t,:,inB,inBE) = obj.wind.getWindSpeed(obj.var.rb_1(t,:,inB,inBE));
                        obj.var.V0_3(t,:,inB,inBE) = obj.rot.R13 * obj.var.V0_1(t,:,inB,inBE)';
                        obj.var.V0_4(t,:,inB,inBE) = obj.rot.R14 * obj.var.V0_1(t,:,inB,inBE)';

                        obj.var.V0_3(t,:,inB,inBE) = [0; obj.var.V0_3(t,2,inB,inBE); obj.var.V0_3(t,3,inB,inBE)];
                        obj.var.V0_4(t,:,inB,inBE) = [0; obj.var.V0_4(t,2,inB,inBE); obj.var.V0_4(t,3,inB,inBE)];

                        % Velocity seen by the blade
                        obj.var.Vrot_4(t,:,inB,inBE) = [0; obj.turb.omega * obj.turb.r(inBE); 0];
                        obj.var.Velas_4(t,:,inB,inBE) = [0; 0; 0];
                        obj.var.Vrel_4(t,:,inB,inBE) = obj.var.V0_4(t,:,inB,inBE) + ...
                            obj.var.Vrot_4(t,:,inB,inBE) + ...
                            obj.var.Velas_4(t,:,inB,inBE) + obj.var.W0(t,:,inB,inBE);

                        % Local tip-speed ratio
                        obj.var.lambda(t,inB,inBE) = -obj.turb.omega^2 * obj.turb.r(inBE) * ...
                            cosd(obj.rot.cone) / norm(obj.var.V0_3(t,:,inB,inBE));

                        % Velocity components
                        obj.var.Ut(t,inB,inBE) = obj.var.Vrel_4(t,2,inB,inBE);
                        obj.var.Un(t,inB,inBE) = obj.var.Vrel_4(t,3,inB,inBE);

                        obj.var.Vrel_s_norm(t,inB,inBE) = sqrt(obj.var.Un(t,inB,inBE)^2 + ...
                                                               obj.var.Ut(t,inB,inBE)^2);
                        obj.var.Re(t,inB,inBE) = obj.var.Vrel_s_norm(t,inB,inBE) * ...
                                                 obj.turb.chord(inBE) / obj.fluid.kinVisc;

                        % Flow angle
                        obj.var.phi(t,inB,inBE) = atan2(obj.var.Un(t,inB,inBE), obj.var.Ut(t,inB,inBE));
                        if imag(obj.var.phi(t,inB,inBE)) ~= 0
                            fprintf('Algorithm failed: r=%.2f\n', obj.turb.r(inBE));
                            break;
                        end

                        % Tip loss
                        F = obj.cor.fTipLoss(obj.turb.nB, obj.turb.r(inBE), ...
                                             obj.turb.R, obj.var.phi(t,inB,inBE));

                        % Angle of attack
                        obj.var.alpha(t,inB,inBE) = obj.var.phi(t,inB,inBE) - ...
                            (obj.turb.twist(inBE) + obj.turb.pitch);

                        % Airfoil coefficients
                        [Cl, Cd] = obj.turb.fAeroCoeff(obj.var.alpha(t,inB,inBE), obj.var.Re(t,inB,inBE));

                        % Force coefficients
                        obj.var.cn(t,inB,inBE) = Cl * cosd(obj.var.phi(t,inB,inBE)) + ...
                                                 Cd * sind(obj.var.phi(t,inB,inBE));
                        obj.var.ct(t,inB,inBE) = Cl * sind(obj.var.phi(t,inB,inBE)) + ...
                                                 Cd * cosd(obj.var.phi(t,inB,inBE));

                        % Thrust and torque coefficients
                        obj.var.Ct(t,inB,inBE) = (obj.var.Vrel_s_norm(t,inB,inBE)^2 / 1^2) * ...
                                                 obj.turb.sigma(inBE) * obj.var.cn(t,inB,inBE);
                        obj.var.Cq(t,inB,inBE) = (obj.var.Vrel_s_norm(t,inB,inBE)^2 / 1^2) * ...
                                                 obj.turb.sigma(inBE) * obj.var.ct(t,inB,inBE);

                        % Induced velocities
                        obj.var.Wn_4(t,:,inB,inBE) = [0; 0; 1 + obj.var.W0(t-1,3,inB,inBE)];
                        obj.var.Wn_3(t,:,inB,inBE) = obj.rot.R34' * obj.var.Wn_4(t,:,inB,inBE)';
                        obj.var.nnW_3(t,:,inB,inBE) = obj.turb.n * (obj.turb.n' * obj.var.Wn_3(t,:,inB,inBE));

                        obj.var.v_prime_indiction_3(t,:,inB,inBE) = obj.var.V0_3(t,:,inB,inBE) + ...
                                                                    obj.var.nnW_3(t,:,inB,inBE);

                        sgn = 1;
                        if obj.var.v_prime_indiction_3(t,3,inB,inBE) < 0
                            sgn = -1;
                        end

                        obj.var.a(t,inB,inBE) = (norm(obj.var.V0_3(t,:,inB,inBE)) - sgn * ...
                                                 norm(obj.var.v_prime_indiction_3(t,:,inB,inBE))) / ...
                                                 norm(obj.var.V0_3(t,:,inB,inBE));

                        % Tangential induction
                        obj.var.ap(t,inB,inBE) = obj.var.Cq(t,inB,inBE) / (4 * F * ...
                            (1 - obj.var.a(t,inB,inBE)) * obj.var.lambda(t,inB,inBE));

                        % Quasi-steady induced velocities
                        obj.var.Wqs_y(t,inB,inBE) = obj.turb.omega * obj.turb.r(inBE) * obj.var.ap(t,inB,inBE);
                        obj.var.Wqs_z(t,inB,inBE) = -norm(obj.var.V0_3(t,:,inB,inBE)) * obj.var.a(t,inB,inBE);
                        obj.var.Wqs(t,:,inB,inBE) = [0; obj.var.Wqs_y(t,inB,inBE); obj.var.Wqs_z(t,inB,inBE)];

                        % Dynamic wake
                        if obj.cor.dynamicWake
                            obj.var.tau1(t,inB,inBE) = 1.1 / (1 - 1.3 * min(obj.var.a(t,inB,inBE), 0.5)) * ...
                                obj.turb.R / norm(obj.var.V0_4(t,:,inB,inBE));
                            obj.var.tau2(t,inB,inBE) = (0.39 - 0.26 * ...
                                (obj.turb.r(inBE) / obj.turb.R)^2) * obj.var.tau1(t,inB,inBE);

                            H = obj.var.Wqs(t,:,inB,inBE) + 0.6 * obj.var.tau1(t,inB,inBE) * ...
                                (obj.var.Wqs(t,:,inB,inBE) - obj.var.Wqs(t-1,:,inB,inBE)) / obj.sim.dt;
                            obj.var.Wint(t,:,inB,inBE) = H + ...
                                (obj.var.Wqs(t-1,:,inB,inBE) - H) * exp(obj.sim.dt / obj.var.tau1(t,inB,inBE));
                            obj.var.W0(t,:,inB,inBE) = obj.var.Wint(t,:,inB,inBE) + ...
                                (obj.var.W0(t-1,:,inB,inBE) - obj.var.Wint(t,:,inB,inBE)) * ...
                                exp(obj.sim.dt / obj.var.tau2(t,inB,inBE));
                        else
                            obj.var.W0(t,:,inB,inBE) = obj.var.Wqs(t,:,inB,inBE);
                        end
                    end
                end
            end
        end

        function plotResults(obj, Plot)
            % Plot key variables from obj.var in a 3x3 subplot grid
            % Plots blade=1, element=1 time histories

            blade = Plot.blade;
            element = Plot.element;


            varsToPlot = { ...
                'a', ...
                'ap', ...
                'phi', ...
                'V0_4', ...
                'Vrot_4', ...
                'Vrel_4', ...
                'alpha', ... 
                'Wqs', ...
                'W0' ...
            };
    
            units = { ...
                '', ...
                '', ...
                ' [rad]', ...
                ' [m/s]', ...
                ' [m/s]', ...
                ' [m/s]', ...
                ' [rad]', ...
                ' [m/s]', ...
                ' [m/s]' ...
            };
    
            figure;
            nVars = numel(varsToPlot);
            t = (0:obj.sim.N-1) * obj.sim.dt;
    
            for iVar = 1:nVars
                subplot(3,3,iVar);
                varName = varsToPlot{iVar};
                data = obj.var.(varName);
    
                if ndims(data) == 3
                    % Scalar: (time, blade, element)
                    y = squeeze(data(:,blade,element));
                    plot(t, y, 'LineWidth', 1.2);
                    ylabel([varName, units{iVar}]);
                elseif ndims(data) == 4
                    % Vector: (time, xyz, blade, element)
                    y = squeeze(data(:,:,blade,element)); % (time, xyz)
                    plot(t, y, 'LineWidth', 1.2);
                    ylabel([varName, units{iVar}]);
                    legend('x','y','z','Location','best');
                else
                    warning('Unexpected dimensions for %s', varName);
                    continue;
                end
    
                grid on;
                xlabel('Time [s]');
                title(varName,'Interpreter','none');
            end
    
            sgtitle(sprintf('Unsteady BEMT Results — Blade %d, Element %d', blade, element));
        end
    end
end
