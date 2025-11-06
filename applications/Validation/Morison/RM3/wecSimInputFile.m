%% Simulation Data
simu = simulationClass();                       % Initialize simulationClass
simu.simMechanicsFile = 'RM3.slx';              % Simulink Model File
simu.startTime = 0;                             % Simulation Start Time [s]
simu.rampTime = 100;                         	% Wave Ramp Time [s]
simu.endTime = 400;                               % Simulation End Time [s]
simu.dt = 0.01;                                  % Simulation time-step [s]
simu.b2b = 0;                                   % Radiation B2B interactions toggle
simu.stateSpace = 1;                            % Radiation state space calculation toggle

%% Wave Information  
% Regular Wave
waves = waveClass('regularCIC');
waves.height = 2.0;
waves.period = 8.0;
waves.current.option = 0;
waves.current.speed = 0;
waves.current.depth = 50;

%% Body Data
% Float
body(1) = bodyClass('hydroData/rm3.h5');        % Initialize bodyClass for Float
body(1).geometryFile = 'geometry/float.stl';    % Geometry File
body(1).mass = 'equilibrium';                   % Mass [kg]
body(1).inertia = [20907301 21306090.66 37085481.11];  % Moment of Inertia [kg*m^2]     

% Spar/Plate
body(2) = bodyClass('hydroData/rm3.h5');        % Initialize bodyClass for Spar
body(2).geometryFile = 'geometry/plate.stl';    % Geometry File
body(2).mass = 'equilibrium';                   % Mass [kg]
body(2).inertia = [94419614.57 94407091.24 28542224.82]; % Moment of Inertia [kg*m^2]

% Morison Element Implementation
body(2).morisonElement.option = 2;
body(2).morisonElement.cd = [1 1 0];
body(2).morisonElement.ca = [1 1 0];
body(2).morisonElement.area = [20 10 0];
body(2).morisonElement.VME = 50;
body(2).morisonElement.rgME = [0 0 0]; % ME forces applied at CG
body(2).morisonElement.z = [0 0 1]; % not used for Morison Element xyz method

%% PTO and Constraint Parameters
% Floating (3DOF) Joint
constraint(1) = constraintClass('Constraint1');  % Initialize constraintClass for Constraint1
constraint(1).location = [0 0 0];                % Constraint Location [m]

% Floating (3DOF) Joint
constraint(2) = constraintClass('Constraint2');  % Initialize constraintClass for Constraint1
constraint(2).location = [0 0 0];                % Constraint Location [m]