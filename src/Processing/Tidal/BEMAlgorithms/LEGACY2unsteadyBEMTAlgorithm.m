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

            % Aerodynamic corrections
            obj.cor = aeroCorrections(Cor.prandtlCorrection, Cor.prandtlTipLoss, ...
                                      Cor.prandtlHubLoss, Cor.glauertCorrection, ...
                                      Cor.dynamicStall, ...
                                      Cor.dynamicWake, Cor.skewedWake, Cor.ac , Cor.airfoilFile, Cor.linThresh);

            % Wind turbine
            obj.turb = windTurbine(Turb.Rr, Turb.Rh, Turb.Rb,Turb.chord, Turb.twist, Turb.pitch, ...
                                   Turb.nB, Turb.nBE, Turb.nDoF, Turb.RPM, Turb.n);

            % Variables
            obj.var = variablesBEMT(obj.sim.N, obj.turb.nB, obj.turb.nBE, obj.turb.nDoF);

            % this also sets initial azimuthal position of blades
        end


        function runSimulation(obj)
            % Main unsteady BEM time-stepping loop
            for t = 2:obj.sim.N-1
                for inB = 1:obj.turb.nB

                    % Update azimuthal position
                    obj.var.psi(inB,t) = mod(obj.var.psi(inB,t-1) + obj.turb.omega * obj.sim.dt, 360);

                    % Update rotation matrices for this blade
                    obj.rot.updateAzimuthal(obj.var.psi(:,t));

                    for inBE = 1:obj.turb.nBE

                        % ------------------------------
                        % Blade element position (time last)
                        obj.var.rb_4(:,inB,inBE,t) = [obj.turb.Rb(inBE); 0; 0];
                        obj.var.rb_1(:,inB,inBE,t) = obj.rot.R14 * obj.var.rb_4(:,inB,inBE,t);

                        % Incoming wind
                        obj.var.V0_1(:,inB,inBE,t) = obj.wind.fgetWindSpeed(obj.var.rb_1(:,inB,inBE,t));
                        obj.var.V0_3(:,inB,inBE,t) = obj.rot.R13 * obj.var.V0_1(:,inB,inBE,t);
                        obj.var.V0_4(:,inB,inBE,t) = obj.rot.R14 * obj.var.V0_1(:,inB,inBE,t);

                        obj.var.V0_3(1,inB,inBE,t) = 0;
                        obj.var.V0_4(1,inB,inBE,t) = 0;

                        % Velocity seen by the blade
                        obj.var.Vrot_4(:,inB,inBE,t) = [0; obj.turb.omega * obj.turb.Rb(inBE)^2; 0];
                        obj.var.Velas_4(:,inB,inBE,t) = zeros(3,1);
                        obj.var.Vrel_4(:,inB,inBE,t) = obj.var.V0_4(:,inB,inBE,t) + ...
                                                       obj.var.Vrot_4(:,inB,inBE,t) + ...
                                                       obj.var.Velas_4(:,inB,inBE,t) + obj.var.W0(:,inB,inBE,t-1);

                        % Wind velocity in the wake (no fg)
                        Vprime = norm(obj.var.V0_4(:,inB,inBE,t) * obj.var.n * (obj.var.n * obj.var.W0(:,inB,inBE,t-1)));

                        obj.var.a(t,inB,inBE) = (norm(obj.var.V0_4(:,inB,inBE,t)) - Vprime) / norm(obj.var.V0_4(:,inB,inBE,t));

                        % Local tip-speed ratio
                        obj.var.lambda(t,inB,inBE) = -obj.turb.omega^2 * obj.turb.Rb(inBE) * ...
                            cosd(obj.rot.cone) / norm(obj.var.V0_3(:,inB,inBE,t));

                        obj.var.Re(t,inB,inBE) = norm(obj.var.Vrel_4(:,inB,inBE,t)) * ...
                                                 obj.turb.chord(inBE) / obj.fluid.kinVisc;

                        % Flow angle
                        obj.var.phi(t,inB,inBE) = 0.1; % error because atan2 cannot take nan

                        % Prandtl correction
                        Fp = obj.cor.fprandtlCorrection(obj.turb.nB, obj.turb.Rr, obj.turb.Rh, ... 
                                                       obj.turb.Rb(inBE), obj.var.phi(t,inB,inBE));

                        % Glauert correction
                        fg = obj.cor.fglauertCorrection(obj.var.a(t,inB,inBE));

                        % Wind velocity in the wake (fg)
                        Vprime = norm(obj.var.V0_4(:,inB,inBE,t) * fg * obj.var.n * (obj.var.n * obj.var.W0(:,inB,inBE,t-1)));

                        % Angle of attack
                        obj.var.alpha(t,inB,inBE) = obj.var.phi(t,inB,inBE) - ...
                            (obj.turb.twist(inBE) + obj.turb.pitch);

                        % Airfoil coefficients
                        [Cl, Cd] = obj.cor.fAeroCoeff(obj.var.alpha(t,inB,inBE), obj.var.Re(t,inB,inBE));

                        % Dynamic stall
                        Cl = obj.cor.fdynamicStall(obj.var.alpha(t,inB,inBE), Cl, obj.sim.dt, obj.turb.chord(inBE), obj.var.W0(:,inB,inBE,t));

                        L = 1 / 2 * obj.fluid.rho * norm(obj.var.Vrel_4(:,inB,inBE,t))^2 * Cl * obj.turb.chord(inBE);
                        D = 1 / 2 * obj.fluid.rho * norm(obj.var.Vrel_4(:,inB,inBE,t))^2 * Cd * obj.turb.chord(inBE);

                        py = L * sin(obj.var.phi(t,inB,inBE)) - D * cos(obj.var.phi(t,inB,inBE));
                        pz = L * cos(obj.var.phi(t,inB,inBE)) + D * sin(obj.var.phi(t,inB,inBE));

                        fy = py * obj.turb.dr(inBE);
                        fz = pz * obj.turb.dr(inBE);

                        % Quasi-steady induced velocities
                        obj.var.Wqs_y(t,inB,inBE) = - obj.turb.nB * L * sin(obj.var.phi(t,inB,inBE)) / ...
                            (4 * pi * obj.fluid.rho * obj.turb.Rb(inBE) * Fp * Vprime);
                        obj.var.Wqs_z(t,inB,inBE) = - obj.turb.nB * L * cos(obj.var.phi(t,inB,inBE)) / ...
                            (4 * pi * obj.fluid.rho * obj.turb.Rb(inBE) * Fp * Vprime);

                        obj.var.Wqs(:,inB,inBE,t) = [0; obj.var.Wqs_y(t,inB,inBE); obj.var.Wqs_z(t,inB,inBE)];

                        % Dynamic wake
                        if obj.cor.dynamicWake
                            obj.var.tau1(t,inB,inBE) = 1.1 / (1 - 1.3 * min(obj.var.a(t,inB,inBE), 0.5)) * ...
                                obj.turb.Rr / norm(obj.var.V0_4(:,inB,inBE,t));
                            obj.var.tau2(t,inB,inBE) = (0.39 - 0.26 * ...
                                (obj.turb.Rb(inBE) / obj.turb.Rr)^2) * obj.var.tau1(t,inB,inBE);

                            H = obj.var.Wqs(:,inB,inBE,t) + 0.6 * obj.var.tau1(t,inB,inBE) * ...
                                (obj.var.Wqs(:,inB,inBE,t) - obj.var.Wqs(:,inB,inBE,t-1)) / obj.sim.dt;
                            obj.var.Wint(:,inB,inBE,t) = H + ...
                                (obj.var.Wqs(:,inB,inBE,t-1) - H) * exp(obj.sim.dt / obj.var.tau1(t,inB,inBE));
                            obj.var.W0(:,inB,inBE,t) = obj.var.Wint(:,inB,inBE,t) + ...
                                (obj.var.W0(:,inB,inBE,t-1) - obj.var.Wint(:,inB,inBE,t)) * ...
                                exp(obj.sim.dt / obj.var.tau2(t,inB,inBE));
                        else
                            obj.var.W0(:,inB,inBE,t) = obj.var.Wqs(:,inB,inBE,t);
                        end

                        % Skewed wake 
                        gamma = obj.cor.fskewedWake(1);
                        obj.var.W0(:,inB,inBE,t) = gamma * obj.var.W0(:,inB,inBE,t);

                    end
                end
            end
        end


        function plotResults(obj, Plot)
            % Plot key variables from obj.var in a 3x3 subplot grid
            blade = Plot.blade;
            element = Plot.element;

            varsToPlot = {'rb_4','rb_1'};
            units = {' [m]',' [m]'};

            figure;
            t = (0:obj.sim.N-1) * obj.sim.dt;

            for iVar = 1:numel(varsToPlot)
                subplot(numel(varsToPlot),1,iVar);
                data = squeeze(obj.var.(varsToPlot{iVar})(:,blade,element,:)); % (xyz x time)
                plot(t, data,'LineWidth',1.2);
                ylabel([varsToPlot{iVar}, units{iVar}]);
                legend('x','y','z','Location','best');
                grid on;
                xlabel('Time [s]');
            end
            sgtitle(sprintf('Blade Element Positions — Blade %d, Element %d', blade, element));
        end
    end
end
