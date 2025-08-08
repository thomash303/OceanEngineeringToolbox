%% File to call and run BEMT algorithm class (which has yet to be made into a class)

%% Step 1: -- Initialize structures --
% Input
Sim = {};
Fluid = {};
Wind = {};
Rot = {};
Cor = {};
Turb = {};
Plot = {};

%% Step 2: -- Defining input parameters -- 

% Simulation Settings
Sim.dt = 0.01;               % Time step size [s]
Sim.t_end = 10;              % End time [s]


% Fluid Properties
Fluid.rho = 1.225;             % Air density [kg/m^3]
Fluid.kinVisc = 1.5e-5;        % Kinematic viscosity [m^2/s]

% Incoming Wind
Wind.windSpeed_nom = 2;       % Nominal (baseline) wind speed [m/s]

% Coordinate Transformation
Rot.yaw = 8;                % yaw angle (deg)
Rot.tilt = 7;               % tilt angle (deg)
Rot.wing = 6;               % wing angle (deg)
Rot.cone = 5;               % cone angle (deg)

% Aerodynamic Corrections
Cor.tipLoss = true;          % Enable/disable tip loss (bool)
Cor.thrustCorrection = true; % Enable/disable thrust correction (bool)
Cor.hubLoss = true;          % Enable/disable hub loss (bool)
Cor.dynamicStall = true;     % Enable/disable dynamic stall (bool)
Cor.dynamicWake = true;      % Enable/disable dynamic wake (bool)
Cor.yawModel = true;         % Enable/disable yaw model (bool)

% Wind Turbine

% Blade geometry
Turb.R = 20.5;           % Rotor radius [m]
Turb.r = [4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 12.5 13.5 14.5 15.5 16.5 17.5 18.5 19.5 20.3];  % Radial positions [m] (1 x nBE)
Turb.chord = [1.63 1.597 1.540 1.481 1.420 1.356 1.294 1.229 1.163 1.095 1.026 0.955 0.881 0.806 0.705 0.545 0.265]; % Chord distribution [m] (1 x nBE)
Turb.twist = [20.0 16.3 13.0 10.05 7.45 5.85 4.85 4.00 3.15 2.60 2.02 1.36 0.77 0.33 0.14 0.05 0.02]; % Twist distribution [deg] (1 x nBE)
Turb.pitch = 0.01;            % Pitch angle [rad]

% Rotor configuration
Turb.nB = 3;                 % Number of blades
Turb.nBE = 17;               % Number of blade elements
Turb.nDoF = 3;               % Translational DoF
Turb.n = [0, 0, -1];         % Rotor shaft axis unit vector

% Generator parameters
Turb.RPM = 6;             % Rotor angular speed [rpm]

% Airfoil data
Turb.airfoilFile = 'NACA_63415.txt'; % File storing airfoil coefficient data


%% Step 3: -- Call BEMT algorithm --
% This is a handle class, not a value class
bemt = unsteadyBEMTAlgorithm(Sim, Fluid, Wind, Rot, Cor, Turb);
bemt.runSimulation();

%% Step 4: -- Visulize Results --
% Plotting selection
Plot.blade = 1;
Plot.element = 1;

bemt.plotResults(Plot);
