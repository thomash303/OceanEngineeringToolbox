classdef unsteadyBEMTSystemAlgorithm < handle
    % unsteadyBEMT
    % Class wrapper for the Unsteady BEMT System Algorithm
    % Developed by Thomas Hogan, 22/08/2025

    properties

        % Objects
        sim         % Simulation settings object
        fluid       % Fluid properties object
        wind        % Incoming wind object
        rot         % Coordinate transformation object
        cor         % Aerodynamic corrections object
        turb        % Wind turbine object

        % Ouputs
        Fz          % Thrust force
        Fy          % Tangential force
        Ty          % Torque
        Py          % Power

    end

    properties (Access = private)

        % Internal states
        psi_prev;
        Wprev;
        Wqs_prev;
        Wint_prev;

    end

    methods
        function obj = unsteadyBEMTSystemAlgorithm(Sim, Fluid, Wind, Rot, Cor, Turb)
            % Constructor - initialises all sub-components

            % Simulation settings
            obj.sim = simulationSettings(Sim.dt);

            % Fluid properties
            obj.fluid = fluidProperties(Fluid.rho, Fluid.kinVisc);

            % Incoming wind
            obj.wind = incomingWind(Wind.windSpeed_nom, Wind.hhub_nom, Wind.alphaPowerLaw, Wind.betaBedRoughness, Wind.a, Wind.towerShadow);

            % Coordinate transformation
            obj.rot = coordTransformations(Rot.yaw, Rot.tilt, Rot.cone);

            % Wind turbine
            obj.turb = windTurbine(Turb.Rr, Turb.Rh, Turb.Rb,Turb.chord, Turb.twist, Turb.pitch, ...
                                   Turb.nB, Turb.nBE, Turb.nDoF, Turb.n);

            % Aerodynamic corrections
            obj.cor = aeroCorrections(Cor.prandtlCorrection, Cor.prandtlTipLoss, ...
                                      Cor.prandtlHubLoss, Cor.glauertCorrection, ...
                                      Cor.dynamicStall, ...
                                      Cor.dynamicWake, Cor.skewedWake, Cor.ac , Cor.polarData, Cor.linThresh, obj.wind, obj.rot, obj.turb);

            % Variable initializations

            % Start all blades evenly spaced
            obj.psi_prev = zeros(1, obj.turb.nB); 
            spacing = 2*pi / obj.turb.nB;   % radians
            for i = 2:obj.turb.nB
                obj.psi_prev(i) = obj.psi_prev(i-1) + spacing;
            end

            % Induced velocity
            obj.Wqs_prev = zeros(Turb.nDoF, Turb.nB, Turb.nBE);
            obj.Wint_prev = zeros(Turb.nDoF, Turb.nB, Turb.nBE);
            obj.Wprev = zeros(Turb.nDoF, Turb.nB, Turb.nBE);

        end


        function stepSimulation(obj)
            % Main unsteady BEMT time-stepping loop

             % Reset outputs for this step
            obj.Fz = 0;
            obj.Fy = 0;
            obj.Ty = 0;
            obj.Py = 0;

            % Loop over blades
            for inB = 1:obj.turb.nB

                % Update azimuthal position
                psi = mod(obj.psi_prev(inB) + obj.turb.omega * obj.sim.dt, 2*pi);
      
                % Update rotation matrices for this blade
                obj.rot.updateAzimuthal(psi);

                % Loop over blade elements
                for inBE = 1:obj.turb.nBE

                    % Blade element position
                    rb_4 = [obj.turb.Rb(inBE); 0; 10]; % assume blade offset from hub if tower shadow
                    rb_1 = obj.rot.R14 * rb_4;

                    % Incoming wind
                    V0_1 = obj.wind.fgetWindSpeed(rb_1);
                    V0_3 = obj.rot.R13 * V0_1;
                    V0_4 = obj.rot.R14 * V0_1;

                    V0_3 = [0; V0_3(2); V0_3(3)];
                    V0_4 = [0; V0_4(2); V0_4(3)];

                    % Induced velocity in frame 3
                    Wprev_3 = obj.rot.R34' * obj.Wprev(:, inB, inBE);

                    % Velocity seen by the blade
                    Vrot_4 = [0; -obj.turb.omega * obj.turb.Rb(inBE) * cosd(obj.rot.cone); 0];
                    % should i add Rh here
                    Velas_4 = [0; 0; 0];
                    Vrel_4 = V0_4 + Vrot_4 + Velas_4 + obj.Wprev(:, inB, inBE);

                    % Wind velocity in the wake
                    Vprime = V0_3 + obj.turb.n * (obj.turb.n * Wprev_3);

                    a = min((norm(V0_3) - norm(Vprime)) / norm(V0_3), 0.5);

                    % Local tip-speed ratio
                    lambda = -obj.turb.omega^2 * obj.turb.Rb(inBE) * cosd(obj.rot.cone) / norm(V0_3);

                    Re = norm(Vrel_4) * obj.turb.chord(inBE) / obj.fluid.kinVisc;

                    % Flow angle
                    phi = atan2(Vrel_4(3), -Vrel_4(2));
                    if imag(phi) ~= 0
                        fprintf('Algorithm failed: r=%.2f\n', obj.turb.Rb(inBE));
                        break;
                    end

                    % Prandtl correction
                    Fp = obj.cor.fprandtlCorrection(obj.turb.nB, obj.turb.Rr, obj.turb.Rh, obj.turb.Rb(inBE), phi);

                    % Glauert correction
                    fg = obj.cor.fglauertCorrection(a);
                    
                    % Wind velocity in the wake (fg)
                    Vprime_fg = V0_3 + fg * obj.turb.n * (obj.turb.n * Wprev_3);
        
                    % Angle of attack
                    alpha = phi - (obj.turb.twist(inBE) + obj.turb.pitch);

                    % Airfoil coefficients
                    [Cl, Cd] = obj.cor.fAeroCoeff(alpha, Re);

                    % Dynamic stall
                    Cl = obj.cor.fdynamicStall(alpha, Cl, obj.sim.dt, obj.turb.chord(inBE), Vrel_4);

                    L = 1 / 2 * obj.fluid.rho * norm(Vrel_4)^2 * Cl * obj.turb.chord(inBE);
                    D = 1 / 2 * obj.fluid.rho * norm(Vrel_4)^2 * Cd * obj.turb.chord(inBE);
                    
                    % Tangential
                    py = L * sin(phi) - D * cos(phi);
                    % Normal (thrust)
                    pz = L * cos(phi) + D * sin(phi);

                    % Local tangential  
                    Fy = py * obj.turb.dr(inBE);
                    % Local normal (thrust)
                    Fz = pz * obj.turb.dr(inBE);
                    
                    % Global tangential  
                    obj.Fy = obj.Fy + Fy;
                    % Global normal (thrust)
                    obj.Fz = obj.Fz + Fz;

                    % Local torque
                    Ty = Fy * obj.turb.Rb(inBE);
                    % should i add Rh here
                    % Local power 
                    Py = Ty * obj.turb.omega;

                    % Global torque
                    obj.Ty = obj.Ty + Ty;
                    % Global power 
                    obj.Py = obj.Py + Py;

                    % Quasi-steady induced velocities
                    Wqs_y = - obj.turb.nB * L * sin(phi) / (4 * pi * obj.fluid.rho * obj.turb.Rb(inBE) * Fp * norm(Vprime_fg));
                    Wqs_z = - obj.turb.nB * L * cos(phi) / (4 * pi * obj.fluid.rho * obj.turb.Rb(inBE) * Fp * norm(Vprime_fg));
                    Wqs = [0; Wqs_y; Wqs_z];

                    % Dynamic wake
                    [W, Wint] = obj.cor.fdynamicWake(V0_4, Wqs, obj.Wqs_prev(:, inB, inBE), obj.Wint_prev(:, inB, inBE), obj.Wprev(:, inB, inBE), a, obj.turb.Rr, obj.turb.Rb(inBE), obj.sim.dt);
                    
                    % Skewed wake 
                    gamma = obj.cor.fskewedWake(psi, obj.Wprev(:, inB, inBE), inB, inBE);
                    W = gamma * W;
                
                % Save for the next blade element at the next step
                obj.Wqs_prev(:, inB, inBE) = Wqs;
                obj.Wint_prev(:, inB, inBE) = Wint;
                obj.Wprev(:, inB, inBE) = W;
                end

                % Save for next blade at the next step
                obj.psi_prev(inB) = psi;
            end

        end

    end
end
