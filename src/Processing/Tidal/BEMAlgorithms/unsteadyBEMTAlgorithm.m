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
            obj.wind = incomingWind(Wind.windSpeed_nom, Wind.hhub_nom, Wind.alphaPowerLaw, Wind.a, Wind.towerShadow);

            % Coordinate transformation
            obj.rot = coordTransformations(Rot.yaw, Rot.tilt, Rot.cone);

            % Wind turbine
            obj.turb = windTurbine(Turb.Rr, Turb.Rh, Turb.Rb,Turb.chord, Turb.twist, Turb.pitch, ...
                                   Turb.nB, Turb.nBE, Turb.nDoF, Turb.RPM, Turb.n);

            % Aerodynamic corrections
            obj.cor = aeroCorrections(Cor.prandtlCorrection, Cor.prandtlTipLoss, ...
                                      Cor.prandtlHubLoss, Cor.glauertCorrection, ...
                                      Cor.dynamicStall, ...
                                      Cor.dynamicWake, Cor.skewedWake, Cor.ac , Cor.airfoilFile, Cor.linThresh, obj.wind, obj.rot, obj.turb);

            % Variables
            obj.var = variablesBEMT(obj.sim.N, obj.turb.nB, obj.turb.nBE, obj.turb.nDoF);

            % this also sets initial azimuthal position of blades
        end


        function runSimulation(obj)
            % Main unsteady BEM time-stepping loop


            for t = 2:obj.sim.N-1
                %display(t)

                for inB = 1:obj.turb.nB
                    % Update azimuthal position
                    obj.var.psi(t, inB) = mod(obj.var.psi(t-1, inB) + obj.turb.omega * obj.sim.dt, 2*pi);
                    %display(inB)
                    % Update rotation matrices for this blade
                    obj.rot.updateAzimuthal(obj.var.psi(t,inB));

                    for inBE = 1:obj.turb.nBE
                        %display(inBE)
                        % ------------------------------
                        % Blade element position
                        obj.var.rb_4(t,:,inB,inBE) = [obj.turb.Rb(inBE); 0; 1]; % assume blade offset from hub
                        obj.var.rb_1(t,:,inB,inBE) = obj.rot.R14 * obj.var.rb_4(t,:,inB,inBE)';

                        % Incoming wind
                        obj.var.V0_1(t,:,inB,inBE) = obj.wind.fgetWindSpeed(obj.var.rb_1(t,:,inB,inBE));
                        obj.var.V0_3(t,:,inB,inBE) = obj.rot.R13 * obj.var.V0_1(t,:,inB,inBE)';
                        obj.var.V0_4(t,:,inB,inBE) = obj.rot.R14 * obj.var.V0_1(t,:,inB,inBE)';

                        obj.var.V0_3(t,:,inB,inBE) = [0; obj.var.V0_3(t,2,inB,inBE); obj.var.V0_3(t,3,inB,inBE)];
                        obj.var.V0_4(t,:,inB,inBE) = [0; obj.var.V0_4(t,2,inB,inBE); obj.var.V0_4(t,3,inB,inBE)];

                        % Induced velocity in frame 3
                        obj.var.Wprev_3(t,:,inB,inBE) = obj.rot.R34' *  obj.var.W(t-1,:,inB,inBE)';

                        % Velocity seen by the blade
                        obj.var.Vrot_4(t,:,inB,inBE) = [0; -obj.turb.omega * obj.turb.Rb(inBE) * cosd(obj.rot.cone); 0];
                        obj.var.Velas_4(t,:,inB,inBE) = [0; 0; 0];
                        obj.var.Vrel_4(t,:,inB,inBE) = obj.var.V0_4(t,:,inB,inBE) + ...
                            obj.var.Vrot_4(t,:,inB,inBE) + ...
                            obj.var.Velas_4(t,:,inB,inBE) + obj.var.W(t-1,:,inB,inBE);

                        % Wind velocity in the wake
                        obj.var.Vprime(t,:,inB,inBE) = obj.var.V0_3(t,:,inB,inBE)' + obj.var.n * (obj.var.n' * obj.var.Wprev_3(t,:,inB,inBE)');

                        obj.var.a(t,inB,inBE) = min(norm(obj.var.V0_3(t,:,inB,inBE)) - norm(obj.var.Vprime(t,:,inB,inBE))) / norm(obj.var.V0_3(t,:,inB,inBE), 0.5);

                        % Local tip-speed ratio
                        obj.var.lambda(t,inB,inBE) = -obj.turb.omega^2 * obj.turb.Rb(inBE) * ...
                            cosd(obj.rot.cone) / norm(obj.var.V0_3(t,:,inB,inBE));

                        obj.var.Re(t,inB,inBE) = norm(obj.var.Vrel_4(t,:,inB,inBE)) * ...
                                                 obj.turb.chord(inBE) / obj.fluid.kinVisc;

                        % Flow angle
                        %obj.var.phi(t,inB,inBE) = 0.1;
                        obj.var.phi(t,inB,inBE) = atan2(obj.var.Vrel_4(t,3,inB,inBE), -obj.var.Vrel_4(t,2,inB,inBE));
                        if imag(obj.var.phi(t,inB,inBE)) ~= 0
                            fprintf('Algorithm failed: r=%.2f\n', obj.turb.Rb(inBE));
                            break;
                        end

                        % Prandtl correction
                        Fp = obj.cor.fprandtlCorrection(obj.turb.nB, obj.turb.Rr, obj.turb.Rh, ... 
                            obj.turb.Rb(inBE), obj.var.phi(t,inB,inBE));

                        % Glauert correction
                        fg = obj.cor.fglauertCorrection(obj.var.a(t,inB,inBE));
                        
                        % Wind velocity in the wake (fg)
                        obj.var.Vprime_fg(t,:,inB,inBE) = obj.var.V0_3(t,:,inB,inBE)' + fg * obj.var.n * (obj.var.n' * obj.var.Wprev_3(t,:,inB,inBE)');
            
                        % Angle of attack
                        obj.var.alpha(t,inB,inBE) = obj.var.phi(t,inB,inBE) - (obj.turb.twist(inBE) + obj.turb.pitch);

                        % Airfoil coefficients
                        [obj.var.Cl(t,inB,inBE), obj.var.Cd(t,inB,inBE)] = obj.cor.fAeroCoeff(obj.var.alpha(t,inB,inBE), obj.var.Re(t,inB,inBE));

                        % Dynamic stall
                        obj.var.Cl(t,inB,inBE) = obj.cor.fdynamicStall(obj.var.alpha(t,inB,inBE), obj.var.Cl(t,inB,inBE), obj.sim.dt, obj.turb.chord(inBE), obj.var.Vrel_4(t,:,inB,inBE));

                        obj.var.L(t,inB,inBE) = 1 / 2 * obj.fluid.rho * norm(obj.var.Vrel_4(t,:,inB,inBE))^2 * obj.var.Cl(t,inB,inBE) * obj.turb.chord(inBE);
                        obj.var.D(t,inB,inBE) = 1 / 2 * obj.fluid.rho * norm(obj.var.Vrel_4(t,:,inB,inBE))^2 * obj.var.Cd(t,inB,inBE) * obj.turb.chord(inBE);
                        
                        % Tangential
                        obj.var.py(t,inB,inBE) = obj.var.L(t,inB,inBE) * sin(obj.var.phi(t,inB,inBE)) - obj.var.D(t,inB,inBE) * cos(obj.var.phi(t,inB,inBE));
                        % Normal (thrust)
                        obj.var.pz(t,inB,inBE) = obj.var.L(t,inB,inBE) * cos(obj.var.phi(t,inB,inBE)) + obj.var.D(t,inB,inBE) * sin(obj.var.phi(t,inB,inBE));
                        
                        % Tangential  
                        obj.var.fy(t,inB,inBE) = obj.var.py(t,inB,inBE) * obj.turb.dr(inBE);
                        % Normal (thrust)
                        obj.var.fz(t,inB,inBE) = obj.var.pz(t,inB,inBE) * obj.turb.dr(inBE);

                        % Torque
                        obj.var.Ty(t,inB,inBE) = obj.var.fy(t,inB,inBE) * obj.turb.Rb(inBE);
                        % Power 
                        obj.var.Py(t,inB,inBE) = obj.var.Ty(t,inB,inBE) * obj.turb.omega;

                        % Quasi-steady induced velocities
                        obj.var.Wqs_y(t,inB,inBE) = - obj.turb.nB * obj.var.L(t,inB,inBE) * sin(obj.var.phi(t,inB,inBE)) / ...
                            (4 * pi * obj.fluid.rho * obj.turb.Rb(inBE) * Fp * norm(obj.var.Vprime_fg(t,:,inB,inBE)));
                        obj.var.Wqs_z(t,inB,inBE) = - obj.turb.nB * obj.var.L(t,inB,inBE) * cos(obj.var.phi(t,inB,inBE)) / ...
                            (4 * pi * obj.fluid.rho * obj.turb.Rb(inBE) * Fp * norm(obj.var.Vprime_fg(t,:,inB,inBE)));
                        obj.var.Wqs(t,:,inB,inBE) = [0; obj.var.Wqs_y(t,inB,inBE); obj.var.Wqs_z(t,inB,inBE)];

                        % Dynamic wake
                        [obj.var.W(t,:,inB,inBE), obj.var.Wint(t,:,inB,inBE)] = obj.cor.fdynamicWake(obj.var.V0_4(t,:,inB,inBE), obj.var.Wqs(t,:,inB,inBE), obj.var.Wqs(t-1,:,inB,inBE), obj.var.Wint(t-1,:,inB,inBE), obj.var.W(t-1,:,inB,inBE), obj.var.a(t,inB,inBE), obj.turb.Rr, obj.turb.Rb(inBE), obj.sim.dt);
                        
                        % Skewed wake 
                        obj.var.gamma(t,inB,inBE) = obj.cor.fskewedWake(obj.var.psi(t, inB), obj.var.W(t-1,3,:,:), inB, inBE);
                        obj.var.W(t,:,inB,inBE) = obj.var.gamma(t,inB,inBE) * obj.var.W(t,:,inB,inBE);

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
                'W' ...
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
