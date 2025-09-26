%% File to call and run BEMT algorithm class (which has yet to be made into a class)

%% Step 1: -- Initialize structures --
% Input
Sim = struct();
Fluid = struct();
Wind = struct();
Rot = struct();
Cor = struct();
Turb = struct();
Plot = struct();

%% Step 2: -- Defining input parameters -- 

% Simulation Settings
Sim.dt = 0.01;               % Time step size [s]
Sim.t_end = 30;              % End time [s]

% Fluid Properties
Fluid.rho = 1000;             % Air density [kg/m^3]
Fluid.kinVisc = 1.004e-6;        % Kinematic viscosity [m^2/s]

% Incoming Wind
Wind.windSpeed_nom = 1.4;               % Nominal (baseline) wind speed in frame 1 [m/s]
Wind.hhub_nom = 4;                   % Nominal height of the hub (where windspeed is defined) in frame 1 [m] (this needs to be higher than most negative value of rb_1 or else incoming wind power law has a negative sqrt)     
Wind.alphaPowerLaw = 1/5;             % Power law exponent
Wind.a = 2;                           % Tower radius [m]
Wind.towerShadow = false;              % Enable/disable tower shadow (bool)
% need to look at the offset I manually added to rb_1 to normalize tower
% shadow model

% Coordinate Transformation
Rot.yaw = 0;                % yaw angle (deg)
Rot.tilt = 0;               % tilt angle (deg)
Rot.cone = 5;               % cone angle (deg) (needs to be nonzero for tower shadow model)

% Aerodynamic Corrections
Cor.prandtlCorrection = true;               % Enable/disable Prandtl correction (bool)
Cor.prandtlTipLoss = true;                  % Enable/disable tip loss (bool)
Cor.prandtlHubLoss = true;                  % Enable/disable hub loss (bool)
Cor.glauertCorrection = true;               % Enable/disable Glauert correction (bool)
Cor.dynamicStall = false;                    % Enable/disable dynamic stall (bool)
Cor.dynamicWake = true;                     % Enable/disable dynamic wake (bool)
Cor.skewedWake = false;                      % Enable/disable skewed wake yaw model (bool)

Cor.ac = 1/3;                               % Critical Glauert value (default: 1/3)

% Airfoil data
Cor.airfoilFile = 'NACA_63215.txt';         % File storing airfoil coefficient data
Cor.linThresh = 0.85;                       % Linearity threshold for linear region of lift coefficient

% Wind Turbine

% Blade geometry
Turb.Rr = 0.75;               % Rotor radius [m]
Turb.Rh = 0.001;           % hub radius [m]
Turb.Rb = [0.72656 0.67969 0.63281 0.58594 0.53906 0.49219 0.44531 0.39844 0.35156 0.30469 0.25781 0.21094 0.16406 0.11719 0.07031 0.02344];  % Radial positions [m] (1 x nBE)
Turb.chord = [0.07420 0.08450 0.09454 0.11637 0.12260 0.12703 0.13016 0.13233 0.13380 0.13491 0.13570 0.13640 0.13717 0.13952 0.14050 0.14250]; % Chord distribution [m] (1 x nBE)
Turb.twist = [83.90487 83.53000 83.39358 82.89349 82.82024 82.65112 82.32417 81.88798 81.36263 80.63447 79.64462 78.37823 76.77522 72.14122 72.00560 71.56956]; % Twist distribution [deg] (1 x nBE)
Turb.pitch = 0.00;            % Pitch angle [rad]

        % Blade geometry
        % Turb.Rr = 20.5;                          % Rotor radius [m]
        % Turb.Rh = 3.5;                           % hub radius [m]
        % Turb.Rb = [4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 12.5 13.5 14.5 15.5 16.5 17.5 18.5 19.5 20.3];  % Radial positions [m] (1 x nBE)
        % Turb.chord = [1.63 1.597 1.540 1.481 1.420 1.356 1.294 1.229 1.163 1.095 1.026 0.955 0.881 0.806 0.705 0.545 0.265]; % Chord distribution [m] (1 x nBE)
        % Turb.twist = [20.0 16.3 13.0 10.05 7.45 5.85 4.85 4.00 3.15 2.60 2.02 1.36 0.77 0.33 0.14 0.05 0.02]; % Twist distribution [deg] (1 x nBE)
        % Turb.pitch = 0.01;                       % Pitch angle [rad]
        % 

% Rotor configuration
Turb.nB = 3;                 % Number of blades
Turb.nBE = 16;               % Number of blade elements
Turb.nDoF = 3;               % Translational DoF
Turb.n = [0, 0, -1];         % Rotor shaft axis unit vector

% Generator parameters
Turb.RPM = RPM;              % Rotor angular speed [rpm] (this is RPM so that the RPM can be changed in the batch simulation in the validation case. To run normally, replace RPM with the desired value)

%% Step 3: -- Call BEMT algorithm --
% This is a handle class, not a value class
bemt = unsteadyBEMTAlgorithm(Sim, Fluid, Wind, Rot, Cor, Turb);
bemt.runSimulation();

%% Step 4: -- Visulize Results --
% Plotting selection
Plot.blade = 1;
Plot.element = 1;

%bemt.plotResults(Plot);
