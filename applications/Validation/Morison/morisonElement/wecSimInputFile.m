% Sample offshore wind monopile + tower simulation.
% Traditional Morison Element case - no WEC-Sim hydro bodies

%% Simulation Data
simu = simulationClass();                   % Initialize Simulation Class
simu.simMechanicsFile = 'monopile_1D_trans.slx';     % Specify Simulink Model File
simu.explorer = 'off';
simu.solver = 'ode4';
simu.rho = 1025;
simu.cicEndTime = 30;
simu.rampTime = 100;                        % Wave Ramp Time [s] 200
simu.endTime = 400;                         % Simulation End Time [s] 400
simu.dt = 0.01;
simu.stateSpace = 1;

%% Wave Cases
% % No wave
% waves = waveClass('noWaveCIC');
% waves.period = 5;

% % Regular Wave
waves = waveClass('regularCIC');
waves.height = 2.0;
waves.period = 8.0;
waves.current.option = 0;
waves.current.speed = 0;
waves.current.depth = 50;

% Irregular Waves
% waves = waveClass('irregular');             % Initialize Wave Class and Specify Type
% waves.height = 2.0;                         % Significant Wave Height [m]
% waves.period = 5.0;                         % Peak Period [s]
% waves.spectrumType = 'PM';                  % Specify Spectrum Type
% waves.phaseSeed = 5;                        % Set Random Phase Seed
% waves.direction = [0,30,90];                % Wave Directionality [deg]
% waves.spread = [0.1,0.2,0.7];               % Wave Directional Spreading [%}
% % 
waves.bem.range = [0.001 10]; % Must define wave frequency range without an .h5 / hydro body
waves.waterDepth = 50;    % Must define water depth without an .h5 / hydro body

%% Body Data
% Monopile - diameter 10m, height 30m
body(1) = bodyClass(''); % no h5 file required for drag body
body(1).geometryFile = '../geometry/monopile_1D_trans.stl';
body(1).name = 'monopile';
body(1).nonHydro = 2;                        % Drag body
body(1).mass = 'equilibrium'; % 1044536
body(1).inertia = [1.25 1.25 0.15]*1e9;
body(1).centerGravity = [0 0 -25];
body(1).centerBuoyancy = [0 0 -25];
body(1).volume = pi*10^2*30;

% Morison Element Implementation
body(1).morisonElement.option = 2;
body(1).morisonElement.cd = [1 1 0; 1 1 0];
body(1).morisonElement.ca = [1 1 0; 1 1 0];
body(1).morisonElement.area = [300 150 0; 300 150 0];
body(1).morisonElement.VME = [body(1).volume; body(1).volume];
body(1).morisonElement.rgME = [0 0 1; 0 0 -1]; % ME forces applied at CG
body(1).morisonElement.z = [0 0 1; 0 0 1]; % not used for Morison Element xyz method



%% Constraints & PTOs
% Fixed joint at seabed
constraint(1) = constraintClass('seabed');
constraint(1).location = [0 0 -75];
