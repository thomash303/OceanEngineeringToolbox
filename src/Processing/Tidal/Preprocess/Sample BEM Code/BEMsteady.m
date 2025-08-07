% --- Initializing Structures ---
Wind = {};
Sim = {};
WT = {};
Algo = {};

% --- Defining parameters ---
% Wind characteristics
Wind.V0 = 5;                 % Incoming wind [m/s]

% Simulation settings
Sim.rho = 1.225;             % Air density [kg/m^3]
Sim.KinVisc = 1.5e-5;        % Kinematic viscosity [m^2/s]
Sim.PITCH = 0.01;            % Pitch angle [rad]
Sim.RPM = 27.1;              % Rotor angular speed [rad/s]

% Rotor geometry
WT.Rotor.nB = 3;             % Number of blades
WT.Rotor.R = 20.5;           % Rotor radius [m]
WT.Rotor.r = [4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 ...
    12.5 13.5 14.5 15.5 16.5 17.5 18.5 19.5 20.3];              
                            % Radial positions [m] (1 x ne)
WT.Rotor.chord = [1.63 1.597 1.540 1.481 1.420 1.356 ...
    1.294 1.229 1.163 1.095 1.026 0.955 0.881 0.806 ...
    0.705 0.545 0.265];     % Chord distribution [m]
WT.Rotor.twist = [20.0 16.3 13.0 10.05 7.45 5.85 4.85 ...
    4.00 3.15 2.60 2.02 1.36 0.77 0.33 0.14 0.05 0.02]*pi/180;      
                            % Twist distribution [rad]

% Algorithm options
Algo.nbIt = 100;             % Max iterations
Algo.aTol = 1e-5;            % Axial induction tolerance
Algo.BEM.bTipLoss = true;    % Apply tip losses? (true/false)

% Executing algorithm
RES = fBEMsteady(WT, Sim, Wind, Algo);

% thrust then torque
plot(WT.Rotor.r,RES.Pn)
hold on
plot(WT.Rotor.r,RES.Pt)
title('Steady BEM Thrust and Torque Loads per Blade Element')
xlabel('Radial Position of Blade Element(m)')
ylabel('Aerodynamic Load per Unit Length (N/m)')
legend('Thrust', 'Torque', 'Location','best')


