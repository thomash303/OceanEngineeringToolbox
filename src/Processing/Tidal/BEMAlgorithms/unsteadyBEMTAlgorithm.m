%% Unsteady BEM Algorithm
% Developed by Thomas Hogan 05/08/2025

% Defining inputs, but will eventually just be inputs to a BEMT class

%% Simulation Settings

dt = Sim.dt;                            % Time step size [s]
t_end = Sim.t_end;                      % End time [s]

sim = simulationSettings(dt, t_end);

%% Fluid Properties

rho = Fluid.rho;                         % Air density [kg/m^3]
kinVisc = Fluid.kinVisc;                 % Kinematic viscosity [m^2/s]

fluid = fluidProperties(rho, kinVisc);

%% Incoming Wind
% Need to create power law formulation and stochastic aspect (I don't
% currently account for blade height).

windSpeed_nom = Wind.windSpeed_nom;      % Nominal (baseline) wind speed [m/s]

wind = incomingWind(windSpeed_nom);

%% Coordinate Transformation
% Ideally should alter the rotation sequence to be same as the default in
% Modelica (intrinsic xyz) instead of (intrinsic zyx), but is not the end
% of the world if not. For somem reason, the current rotation matrix is
% the inverse of that in Modelica, suggesting it is converting the other
% way. Further, the coordinate system definition is inconsistent with
% Modelica, this HAS to be corrected.

yaw = Rot.yaw;                           % yaw angle (deg)
tilt = Rot.tilt;                         % tilt angle (deg)
wing = Rot.wing;                         % wing angle (deg)
cone = Rot.cone;                         % cone angle (deg)

rot = coordTransformations(yaw, tilt, wing, cone);

%% Aerodynamic Corrections
% I don't actually have like any of these corrections built yet.

tipLoss = Cor.tipLoss;                  % Enable/disable tip loss (bool)
thrustCorrection = Cor.thrustCorrection;% Enable/disable thrust correction (bool)
hubLoss = Cor.hubLoss;                  % Enable/disable hub loss (bool)
dynamicWake = Cor.dynamicWake;          % Enable/disable dynamic wake (bool)
yawModel = Cor.yawModel;                % Enable/disable yaw model (bool)

cor = aeroCorrections(tipLoss, thrustCorrection, hubLoss, dynamicWake, yawModel);



%% Wind Turbine
% Note about Re in aerodynamic coefficients
% Should be more consistant with angular units (deg vs rad)

% Blade geometry
R = Turb.R;                             % Rotor radius [m]
r = Turb.r;                             % Radial positions [m] (1 x nBE)
chord = Turb.chord;                     % Chord distribution [m] (1 x nBE)
twist = Turb.twist;                     % Twist distribution [deg] (1 x nBE)
pitch = Turb.pitch;                     % Pitch angle [rad]

% Rotor configuration
nB = Turb.nB;                           % Number of blades
nBE = Turb.nBE;                         % Number of blade elements
nDoF = Turb.nDoF;                       % Translational DoF

% Generator parameters
RPM = Turb.RPM;                         % Rotor angular speed [rpm]

% Airfoil data
airfoilFile = Turb.airfoilFile;         % File storing airfoil coefficient data

turb = windTurbine(R, r, chord, twist, pitch, nB, nBE, nDoF, RPM, airfoilFile);

%% Initializing Variables
% I just did this quickly to initialize all variables in that class to
% clean up the main algorithm. I can also reduce the sizes of these
% matrices but not saving element, blade, or time history for each by
% writing over it at each time-step.

var = variablesBEMT(sim.N, turb.nB, turb.nBE, turb.nDoF);

 
n = [0, 0, -1];

% Time-stepping loop
for t = 2:sim.N-1

% WARNING: this should be made into a class unsteadBEMAlgorithm

    % Blade loop
    for inB = 1:turb.nB

        % Blade element loop
        for inBE = 1:turb.nBE
            
            % Blade element position
            var.rb_4(t, :, inB, inBE) = [turb.r(inBE); 0; 0];
            var.rb_1(t, :, inB, inBE) = (rot.R14') * var.rb_4(t, :, inB, inBE)';
            % WARNING: For some reason MATLAB is converting col vector rb_4 into a
            % row vector, so I had to manually convert back

            % Incoming wind
            var.V0_1(t, :, inB, inBE) = wind.getWindSpeed(var.rb_1(t, :, inB, inBE));
            var.V0_3(t, :, inB, inBE) = rot.R13 * var.V0_1(t, :, inB, inBE)';
            var.V0_4(t, :, inB, inBE) = rot.R14 * var.V0_1(t, :, inB, inBE)';
            % WARNING: For some reason MATLAB is converting col vector
            % V0_3/4 into a row vector, so I had to manually convert back
            
            var.V0_3(t, :, inB, inBE) = [0 ; var.V0_3(t, 2, inB, inBE) ; var.V0_3(t, 3, inB, inBE)]; % no x (unsure why done explicitly)
            var.V0_4(t, :, inB, inBE) = [0 ; var.V0_4(t, 2, inB, inBE) ; var.V0_4(t, 3, inB, inBE)]; % no x (unsure why done explicitly)


            % Velocity seen by the blade
            var.Vrot_4(t, :, inB, inBE) = [0 ; turb.omega * turb.r(inBE) ; 0]; % rotation
            var.Velas_4(t, :, inB, inBE) = [0 ; 0 ; 0]; % no elasticity
            var.Vrel_4(t, :, inB, inBE) = var.V0_4(t, inB, inBE) + var.Vrot_4(t, :, inB, inBE)...
                + var.Velas_4(t, :, inB, inBE) + var.W0(t, :, inB, inBE); % relative speed (need to update if more DoF)

            % lambda term here, I think is local tip-speed ratio
            var.lambda(t, inB, inBE) = -WT.Generator.omega * WT.Generator.omega...
                * WT.Blade.r(inBE) * cosd(rot.cone) /...
                norm(var.V0_3(t, :, inB, inBE));
            % WARNING: is this cw or ccw rotor??


            % Steady BEM-esque code section

            % Step 1: Velocity components at blade element

            % WARNING: I think this is how is done for unsteady, but unsure
            % I think z is normal and y is tangential

            var.Ut(t, inB, inBE) = var.Vrel_4(t, 2, inB, inBE);
            var.Un(t, inB, inBE) = var.Vrel_4(t, 3, inB, inBE);

            var.Vrel_s_norm(t, inB, inBE) = sqrt(var.Un(t, inB, inBE)^2 + var.Ut(t, inB, inBE)^2);
            var.Re(t, inB, inBE) = var.Vrel_s_norm(t, inB, inBE) * turb.chord(inBE) / fluid.kinVisc; % Reynolds number
            
            % Step 2: Flow angle
            var.phi(t, inB, inBE) = atan2(var.Un(t, inB, inBE), var.Ut(t, inB, inBE)); % radians
            if imag(var.phi(t, inB, inBE)) ~= 0
                fprintf('Algorithm failed: r=%.2f\n', turb.r(inBE));
                break;
            end

            % Step 3: Tip loss correction
            F = cor.fTipLoss(turb.nB, turb.r(inBE),...
                turb.R, var.phi(t, inB, inBE));
            
            % Step 4: Angle of attack
            var.alpha(t, inB, inBE) = var.phi(t, inB, inBE) - ...
                (turb.twist(inBE) + turb.pitch);
            
            % Step 5: Airfoil coefficients
            [Cl, Cd] = turb.fAeroCoeff(var.alpha(t, inB, inBE), var.Re(t, inB, inBE));

            % MISSING: apply dynamic stall model here

            % Step 6: Normal and tangential force coefficients
            var.cn(t, inB, inBE) = Cl * cosd(var.phi(t, inB, inBE)) + Cd * sind(var.phi(t, inB, inBE));
            var.ct(t, inB, inBE) = Cl * sind(var.phi(t, inB, inBE)) + Cd * cosd(var.phi(t, inB, inBE));
        
            % Local thrust and torque coefficients
            var.Ct(t, inB, inBE) = (var.Vrel_s_norm(t, inB, inBE)^2 / 1^2)...
                * turb.sigma(inBE) * var.cn(t, inB, inBE);
            var.Cq(t, inB, inBE) = (var.Vrel_s_norm(t, inB, inBE)^2 / 1^2)...
                * turb.sigma(inBE) * var.ct(t, inB, inBE);
            % WARNING:The denominator is 100% incorrect, text is unclear

            % End of steady BEM steps

            % consider changing this to more direct Hansen steps

            var.Wn_4(t, :, inB, inBE) = [0 ; 0 ; 1 + W0(t-1, 3, inB, inBE)];
            % induced velocity from the LAST time-step
            var.Wn_3(t, :, inB, inBE) = WT.Rotation.R34'*Wn_4(t, :, inB, inBE)';
            % Transpose R34 so -> R43
            % same weird transpose of Wn_4

            var.nnW_3(t, :, inB, inBE) = n*(n'*var.Wn_3(t, :, inB, inBE));
            % ERROR: I have no idea what they are doing here. I am assuming
            % n = {0, 0, -1}, but they never explicitly say. Further, they
            % have it originally as a element wise multiplication which
            % results in a 3x3. 


            var.v_prime_indiction_3(t, :, inB, inBE) = var.V0_3(t, :, inB, inBE) +...
                var.nnW_3(t, :, inB, inBE);
            % I am still a bit lost, but assuming wind (V0) + induced (NNW)
            % velocities in frame 3 as a way to compute the current
            % induction factors

            sign = -1; % this should be 1, not -1

            if var.v_prime_indiction_3(t, 3, inB, inBE) < 0
                sign = -1; 
            end
            % this seems like a lazy way to compensate direction, no
            % smoothing or anything.

            var.a(t, inB, inBE) = (norm(var.V0_3(t, :, inB, inBE)) - sign *...
                norm(var.v_prime_indiction_3(t, :, inB, inBE))) / norm(var.V0_3(t, :, inB, inBE));
            % This is standard

            % Step 6: Induction coefficients from BEM
            % where corrections and such are performed

            var.ap(t, inB, inBE) = var.Cq(t, inB, inBE) / (4 * F *...
                (1 - var.a(t, inB, inBE)) * var.lambda(t, inB, inBE));

            % Step 7: Dynamic wake model
            var.Wqs_y(t, inB, inBE) = turb.omega*turb.r(inBE) * var.ap(t, inB, inBE);
            var.Wqs_z(t, inB, inBE) = - norm(var.V0_3(t, :, inB, inBE)) * var.a(t, inB, inBE);
            var.Wqs(t, :, inB, inBE) = [0 ; var.Wqs_y(t, inB, inBE); var.Wqs_z(t, inB, inBE)];

            % Enable/disable dynamic wake
            if cor.dynamicWake

                % Standard analytic formulation with varying time constants
                var.tau1(t, inB, inBE) = 1.1 / (1-1.3*min(var.a(t, inB, inBE),0.5))...
                    * turb.R / norm(var.V0_4(t, :, inB, inBE));
                var.tau2(t, inB, inBE) = (0.39 - 0.26 * ...
                    (turb.r(inBE) / turb.R)^2) * var.tau1(t, inB, inBE);

                H = var.Wqs(t, :, inB, inBE) + 0.6 * var.tau1(t, inB, inBE) * ...
                    (var.Wqs(t, :, inB, inBE) - var.Wqs(t-1, :, inB, inBE)) / sim.dt;
                var.Wint(t, :, inB, inBE) = H + (var.Wqs(t-1, :, inB, inBE) - H)...
                    * exp(sim.dt / var.tau1(t, inB, inBE));
                var.W0(t, :, inB, inBE) = var.Wint(t, :, inB, inBE) + (var.W0(t-1, :, inB, inBE)...
                    - var.Wint(t, :, inB, inBE)) * exp(sim.dt / var.tau2(t, inB, inBE));


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
                var.W0(t, :, inB, inBE) = var.Wqs(t, :, inB, inBE); 
            end
    
            % Step 8: Yaw model
            % ERROR: MISSING yaw model
        end
       
    
    end
end