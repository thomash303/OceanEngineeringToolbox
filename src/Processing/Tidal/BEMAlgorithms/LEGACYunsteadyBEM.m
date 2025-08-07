%% Unsteady BEM Algorithm
% Developed by Thomas Hogan 05/08/2025

% Insteady of representing quantities as intermediate variables, I am
% saving the time history of everything. Ideally this should make the
% eventually debugging slightly less miserable.

% It is running quite slow right now, I assume saving everything doesn't
% help

%% Simulation Settings
% --- Initializing Structures ---
Sim = {};
WT = {};

% Algorithm
% (dt. t_end, dynamicWake)
algo = simulationSettings(0.01, 10, true); 

% Fluid and turbine
Sim.Fluid.rho = 1.225;             % Air density [kg/m^3]
Sim.Fluid.kinVisc = 1.5e-5;        % Kinematic viscosity [m^2/s]

% Generator
WT.Generator.RPM = 27.1;              % Rotor angular speed [rpm]
WT.Generator.omega = WT.Generator.RPM * 2*pi / 60; % Rotor anglular velocity [rad/s]

% Rotor geometry
WT.Blade.pitch = 0.01;            % Pitch angle [rad]
WT.Rotor.nB = 3;             % Number of blades
WT.Rotor.nBE = 17;           % Number of blade elements
WT.Rotor.nDoF = 3;           % Translational DoF
WT.Rotor.R = 20.5;           % Rotor radius [m]
WT.Blade.r = [4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 ...
    12.5 13.5 14.5 15.5 16.5 17.5 18.5 19.5 20.3];              
                            % Radial positions [m] (1 x ne)
WT.Blade.chord = [1.63 1.597 1.540 1.481 1.420 1.356 ...
    1.294 1.229 1.163 1.095 1.026 0.955 0.881 0.806 ...
    0.705 0.545 0.265];     % Chord distribution [m]
WT.Blade.twist = [20.0 16.3 13.0 10.05 7.45 5.85 4.85 ...
    4.00 3.15 2.60 2.02 1.36 0.77 0.33 0.14 0.05 0.02]*pi/180;      
                            % Twist distribution [rad]

% Derived
sigma = WT.Blade.chord .* WT.Rotor.nB ./ (2 * pi * WT.Blade.r); % Solidity

% Correction factors
WT.Corrections.bTipLoss = true; % Enable/disable tip loss correction

% Airfoil data
polarData = parseXFoilPolar('NACA_63415.txt');
WT.Airfoil.alpha = polarData.dataTable.alpha; % angle of attack
WT.Airfoil.liftCoef = polarData.dataTable.CL; % lift coefficients
WT.Airfoil.dragCoef = polarData.dataTable.CD; % drag coefficients

aeroCorrects = aeroCorrect(WT.Airfoil.alpha, WT.Airfoil.liftCoef, WT.Airfoil.dragCoef);

% Initializing BEMT parameters
% (time, blade, blade element)
a = zeros(algo.N,WT.Rotor.nB, WT.Rotor.nBE);      % Axial induction factor
ap = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);      % Tangential induction factor
phi = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);     % Flow angle [rad]
Cn = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);      % Normal force coeff
Ct = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);      % Tangential force coeff

% Steady BEMT
Ut = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);          % Normal relative velocity
Un = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);          % Tangential relative velocity
Vrel_s_norm = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE); % Steady BEMT norm of Vrel
Re = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);          % Reynolds number
alpha = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);       % Angle of attack
cn = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);          % local drag coefficient in normal direction
ct = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);          % local drag coefficient in tangential direction
Ct = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);          % local thrust coefficient
Cq = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);          % local torque coefficient         

% Unsteady BEMT
% (time, nDoF, blade element)
rb_4 = zeros(algo.N, WT.Rotor.nDoF, WT.Rotor.nB,WT.Rotor.nBE);    % Element radius in frame 4 [m]
rb_1 = zeros(algo.N, WT.Rotor.nDoF, WT.Rotor.nB,WT.Rotor.nBE);    % Element radius in frame 1 [m]
Wqs_y = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);   % Quasi-static y induced velocity [m/s]
Wqs_z = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);   % Quasi-static z induced velocity [m/s]
Wqs = zeros(algo.N,WT.Rotor.nDoF,  WT.Rotor.nB,WT.Rotor.nBE);   % Quasi-static induced velocity vector [m/s]
W0 = zeros(algo.N, WT.Rotor.nDoF, WT.Rotor.nB,WT.Rotor.nBE);      % Unsteady induced velocity (no yaw) [m/s]
V0_1 = zeros(algo.N, WT.Rotor.nDoF, WT.Rotor.nB,WT.Rotor.nBE);    % Incoming wind in frame 1 [m/s]
V0_3 = zeros(algo.N, WT.Rotor.nDoF, WT.Rotor.nB,WT.Rotor.nBE);    % Incoming wind in frame 3 [m/s]
V0_4 = zeros(algo.N, WT.Rotor.nDoF, WT.Rotor.nB,WT.Rotor.nBE);    % Incoming wind in frame 4 [m/s]
Vrot_4 = zeros(algo.N, WT.Rotor.nDoF, WT.Rotor.nB,WT.Rotor.nBE);  % Velocity due to rotation in frame 4 [m/s]
Velas_4 = zeros(algo.N, WT.Rotor.nDoF, WT.Rotor.nB,WT.Rotor.nBE); % Velocity due to elasticity in frame 4 [m/s]
Vrel_4 = zeros(algo.N, WT.Rotor.nDoF, WT.Rotor.nB,WT.Rotor.nBE);  % Blade relative velocity in frame 4 [m/s]
lambda_r = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);                % Local tip-speed ratio

Wn_3 = zeros(algo.N, WT.Rotor.nDoF,  WT.Rotor.nDoF, WT.Rotor.nB,WT.Rotor.nBE); % W from last time-step only in z in frame 3 [m/s]
Wn_4 = zeros(algo.N, WT.Rotor.nDoF,  WT.Rotor.nDoF, WT.Rotor.nB,WT.Rotor.nBE); % W from last time-step only in z in frame 4 [m/s]
nnW_3 = zeros(algo.N, WT.Rotor.nDoF,  WT.Rotor.nDoF, WT.Rotor.nB,WT.Rotor.nBE); % I have no idea
n = [0 ; 0 ; -1];                                                   % Unit vector in z-axis
v_prime_indiction_3 = zeros(algo.N, WT.Rotor.nDoF,  WT.Rotor.nDoF, WT.Rotor.nB,WT.Rotor.nBE); % I have no idea
Wint = zeros(algo.N, WT.Rotor.nDoF, WT.Rotor.nB,WT.Rotor.nBE); % Intermediate induced velocity [m/s]

D = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);       % Drag load
L = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);       % Lift load


% Constant time constant (OpenFast)
% tau1 = 0.2 * WT.Rotor.R;                                    % Time constant 1 (constant)
% tau2 = (0.39 - 0.26 * (WT.Blade.r / WT.Rotor.R).^2) * tau1; % Time constant 2 (constant)

% Varying time constant (Hansen)
tau1 = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);       % Time constant 1 (varying)
tau2 = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);       % Time constant 2 (varying)

fy = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);      % Aerodynamic load in y
fz = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);      % Aerodynamic load in z

fthrust = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE); % Aerodynamic thrust
torque = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);  % Aerodynamic torque
power = zeros(algo.N, WT.Rotor.nB,WT.Rotor.nBE);   % Aerodynamic power 

% Wind characteristics
wind = incomingWind(2);

% Rotation matrices (in deg)
% MAJOR WARNING: rotation sequence difference with Hansen (I think OrcaFlex
% does intrinsic xyz (which is ideal), rotation matix transpose difference
% with Modelica, coordinate frame reference difference then Modelica (this
% would have to be modified to bring into the OET)
% 1 -> 2
WT.Rotation.yaw = 45;
WT.Rotation.tilt = 45;
WT.Rotation.R12 = coordTrans.zyxIntrin(WT.Rotation.yaw, WT.Rotation.tilt, 0);
% 2 -> 3
WT.Rotation.wing = 10;
WT.Rotation.R23 = coordTrans.zyxIntrin(0, 0, WT.Rotation.wing);
% 3 -> 4
WT.Rotation.cone = 5;
WT.Rotation.R34 = coordTrans.zyxIntrin(0, WT.Rotation.cone, 0);

% 1 -> 3
WT.Rotation.R13 = WT.Rotation.R23*WT.Rotation.R12;
% 1 -> 4
WT.Rotation.R14 = WT.Rotation.R34*WT.Rotation.R23*WT.Rotation.R12;

 

% Time-stepping loop
for t = 2:algo.N-1

% WARNING: this should be made into a class unsteadBEMAlgorithm
% WARNING: this means all of the struct calls will be different, but all
% initializations can be performed in the constructor


    % Blade loop
    for inB = 1:WT.Rotor.nB

        % Blade element loop
        for inBE = 1:WT.Rotor.nBE
            
            % Blade element position
            rb_4(t, :, inB, inBE) = [WT.Blade.r(inBE); 0; 0];
            rb_1(t, :, inB, inBE) = (WT.Rotation.R14') * rb_4(t, :, inB, inBE)';
            % WARNING: For some reason MATLAB is converting col vector rb_4 into a
            % row vector, so I had to manually convert back

            % Incoming wind
            V0_1(t, :, inB, inBE) = wind.getWindSpeed(rb_1(t, :, inB, inBE));
            V0_3(t, :, inB, inBE) = WT.Rotation.R13 * V0_1(t, :, inB, inBE)';
            V0_4(t, :, inB, inBE) = WT.Rotation.R14 * V0_1(t, :, inB, inBE)';
            % WARNING: For some reason MATLAB is converting col vector
            % V0_3/4 into a row vector, so I had to manually convert back
            
            V0_3(t, :, inB, inBE) = [0 ; V0_3(t, 2, inB, inBE) ; V0_3(t, 3, inB, inBE)]; % no x (unsure why done explicitly)
            V0_4(t, :, inB, inBE) = [0 ; V0_4(t, 2, inB, inBE) ; V0_4(t, 3, inB, inBE)]; % no x (unsure why done explicitly)


            % Velocity seen by the blade
            Vrot_4(t, :, inB, inBE) = [0 ; WT.Generator.omega*WT.Blade.r(inBE) ; 0]; % rotation
            Velas_4(t, :, inB, inBE) = [0 ; 0 ; 0]; % no elasticity
            Vrel_4(t, :, inB, inBE) = V0_4(t, inB, inBE) + Vrot_4(t, :, inB, inBE)...
                + Velas_4(t, :, inB, inBE) + W0(t, :, inB, inBE); % relative speed (need to update if more DoF)

            % lambda term here, I think is local tip-speed ratio
            lambda_r(t, inB, inBE) = -WT.Generator.omega * WT.Generator.omega...
                * WT.Blade.r(inBE) * cosd(WT.Rotation.cone) /...
                norm(V0_3(t, :, inB, inBE));
            % WARNING: is this cw or ccw rotor??


            % Steady BEM-esque code section

            % Step 1: Velocity components at blade element

            % WARNING: I think this is how is done for unsteady, but unsure
            % I think z is normal and y is tangential

            Ut(t, inB, inBE) = Vrel_4(t, 2, inB, inBE);
            Un(t, inB, inBE) = Vrel_4(t, 3, inB, inBE);

            Vrel_s_norm(t, inB, inBE) = sqrt(Un(t, inB, inBE)^2 + Ut(t, inB, inBE)^2);
            Re = Vrel_s_norm * WT.Blade.chord(inBE) / Sim.Fluid.kinVisc; % Reynolds number
            
            % Step 2: Flow angle
            phi(t, inB, inBE) = atan2(Un(t, inB, inBE), Ut(t, inB, inBE)); % radians
            if imag(phi(t, inB, inBE)) ~= 0
                fprintf('Algorithm failed: r=%.2f\n', WT.Blade.r(inBE));
                break;
            end

            % Step 3: Tip loss correction
            F = aeroCorrects.fTipLoss(WT.Rotor.nB, WT.Blade.r(inBE),...
                WT.Rotor.R, phi(t, inB, inBE), WT.Corrections.bTipLoss);
            
            % Step 4: Angle of attack
            alpha(t, inB, inBE) = phi(t, inB, inBE) - ...
                (WT.Blade.twist(inBE) + WT.Blade.pitch);
            
            % Step 5: Airfoil coefficients
            [Cl, Cd] = aeroCorrects.fAeroCoeff(alpha(t, inB, inBE), Re(t, inB, inBE));

            % MISSING: apply dynamic stall model here

            % Step 6: Normal and tangential force coefficients
            cn(t, inB, inBE) = Cl * cosd(phi(t, inB, inBE)) + Cd * sind(phi(t, inB, inBE));
            ct(t, inB, inBE) = Cl * sind(phi(t, inB, inBE)) + Cd * cosd(phi(t, inB, inBE));
        
            % Local thrust and torque coefficients
            Ct(t, inB, inBE) = (Vrel_s_norm(t, inB, inBE)^2 / 1^2)...
                * sigma(inBE) * cn(t, inB, inBE);
            Cq(t, inB, inBE) = (Vrel_s_norm(t, inB, inBE)^2 / 1^2)...
                * sigma(inBE) * ct(t, inB, inBE);
            % WARNING:The denominator is 100% incorrect, text is unclear

            % End of steady BEM steps

            % consider changing this to more direct Hansen steps

            Wn_4(t, :, inB, inBE) = [0 ; 0 ; W0(t-1, 3, inB, inBE)];
            % induced velocity from the LAST time-step
            Wn_3(t, :, inB, inBE) = WT.Rotation.R34'*Wn_4(t, :, inB, inBE)';
            % Transpose R34 so -> R43
            % same weird transpose of Wn_4

            nnW_3(t, :, inB, inBE) = n'.*(n'.*Wn_3(t, :, inB, inBE));
            % ERROR: I have no idea what they are doing here. I am assuming
            % n = {0, 0, -1}, but they never explicitly say. Further, they
            % have it originally as a element wise multiplication which
            % results in a 3x3. 


            v_prime_indiction_3(t, :, inB, inBE) = V0_3(t, :, inB, inBE) +...
                nnW_3(t, :, inB, inBE);
            % I am still a bit lost, but assuming wind (V0) + induced (NNW)
            % velocities in frame 3 as a way to compute the current
            % induction factors

            sign = 1;

            if v_prime_indiction_3(t, 3, inB, inBE) < 0
                sign = -1;
            end
            % this seems like a lazy way to compensate direction, no
            % smoothing or anything.

            a(t, inB, inBE) = (norm(V0_3(t, :, inB, inBE)) - sign *...
                norm(v_prime_indiction_3(t, :, inB, inBE))) / norm(V0_3(t, :, inB, inBE));
            % This is standard

            % Step 6: Induction coefficients from BEM
            % where corrections and such are performed

            ap(t, inB, inBE) = Cq(t, inB, inBE) / (4 * F *...
                (1 - a(t, inB, inBE)) * lambda_r(t, inB, inBE));

            % Step 7: Dynamic wake model
            Wqs_y(t, inB, inBE) = WT.Generator.omega*WT.Blade.r(inBE) * ap(t, inB, inBE);
            Wqs_z(t, inB, inBE) = - norm(V0_3(t, :, inB, inBE)) * a(t, inB, inBE);
            Wqs(t, :, inB, inBE) = [0 ; Wqs_y(t, inB, inBE); Wqs_z(t, inB, inBE)];

            % Enable/disable dynamic wake
            if algo.dynamicWake

                % Standard analytic formulation with varying time constants
                tau1(t, inB, inBE) = 1.1 / (1-1.3*min(a(t, inB, inBE),0.5))...
                    * WT.Rotor.R / norm(V0_4(t, :, inB, inBE));
                tau2(t, inB, inBE) = (0.39 - 0.26 * ...
                    (WT.Blade.r(inBE) / WT.Rotor.R)^2) * tau1(t, inB, inBE);

                H = Wqs(t, :, inB, inBE) + 0.6 * tau1(t, inB, inBE) * ...
                    (Wqs(t, :, inB, inBE) - Wqs(t-1, :, inB, inBE)) / algo.dt;
                Wint(t, :, inB, inBE) = H + (Wqs(t-1, :, inB, inBE) - H)...
                    * exp(algo.dt / tau1(t, inB, inBE));
                W0(t, :, inB, inBE) = Wint(t, :, inB, inBE) + (W0(t-1, :, inB, inBE)...
                    - Wint(t, :, inB, inBE)) * exp(algo.dt / tau2(t, inB, inBE));


                % OpenFast state-space formulation (sample code - not
                % built) with constant time constants
                % for i = 2:4
                %     dW_red = ( (1 - k)/tau1 * W_qs(:,i-1) - (1/tau1) * W_red(:,i-1) );
                %     dW     = ( (1/tau2) * (W_red(:,i-1) + k * W_qs(:,i-1) - W(:,i-1)) );
                % 
                %     W_red(:,i) = W_red(:,i-1) + dt * dW_red;
                %     W(:,i)     = W(:,i-1)     + dt * dW;
                %     W_int(:,i) = W(:,i) - W_red(:,i);  % definition
                % end
                % 

            else
                W0(t, :, inB, inBE) = Wqs(t, :, inB, inBE); 
            end
    
            % Step 8: Yaw model
            % ERROR: MISSING yaw model
        end
       
    
    end
end

% classdef coordTransformations
%  %{This code is based off of the derivation in Hansen - Aerodynamics of Wind
% %Turbines. The global coordinate frame defines the x-axis to be in the
% %veritcally updwards direction and the z-axis in the rotor direction. I do
% %not yet fully understand the coordinate frame definition, especially with
% %different tools using different approaches. I will likely have to modify.
% % Molica's simple rotations are the inverse of these here, but they have 
% % the same as R_rel in the Modelica response.}%
%     methods (Static)
%         function [Rx] = xSimple(alpha)
%             Rx = [1, 0, 0; 0, cosd(alpha), -sind(alpha); 0, sind(alpha),...
%                 cosd(alpha)];
% 
%         end
% 
%         function [Ry] = ySimple(beta)
%             Ry = [cosd(beta), 0, sind(beta); 0, 1, 0; -sind(beta), 0,...
%                 cosd(beta)];
% 
%         end
% 
%         function [Rz] = zSimple(gamma)
%             Rz = [cosd(gamma), -sind(gamma), 0; sind(gamma), cosd(gamma), 0;... 
%                 0, 0, 1];
% 
%        end
% 
% 
%        function [R] = zyxIntrin( alpha, beta, gamma)
%             % RPY or ZYX Intrinsic (or XYZ extrinsic) is R = RxRyRz
%             R = coordTrans.zSimple(gamma)* coordTrans.ySimple(beta)...
%                 *coordTrans.xSimple(alpha);
% 
%             % r2 = R*r1; this gets same as online
%             %r2 = R'*r1; % this gets the same as Modelica (which is taking
%             %transpose R12 -> R21)
% 
% 
%             % Since the transpose is the difference, they do represent the
%             % same matrix, they just go in the opposite direction. Since
%             % Modelica is intrinsic xyz, and I had to invert the rotation
%             % sequence to zyx to match rotation here implies intrinsic xyz.
%             % Further, Hansen does RzRyRz which is intrinsic zyx. I think
%             % OrcaFlex does intrinsic xyz, so should be possible
% 
% 
%        end
%     end
% end

