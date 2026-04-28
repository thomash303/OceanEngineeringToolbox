%% Simulation Data
simu = simulationClass();               % Initialize Simulation Class
simu.simMechanicsFile = 'sphere.slx';    % Specify Simulink Model File
simu.mode = 'normal';                   % Specify Simulation Mode ('normal','accelerator','rapid-accelerator')
simu.explorer = 'on';                   % Turn SimMechanics Explorer (on/off)
simu.startTime = 0;                     % Simulation Start Time [s]
simu.rampTime = 100;                    % Wave Ramp Time [s]
simu.endTime = 400;                     % Simulation End Time [s]        
simu.solver = 'ode4';                   % simu.solver = 'ode4' for fixed step & simu.solver = 'ode45' for variable step 
simu.dt = 0.1;                          % Simulation Time-Step [s]
simu.cicEndTime = 15;                   % Specify CI Time [s]

%% Wave Information
% % noWaveCIC, no waves with radiation CIC  
% waves = waveClass('noWaveCIC');       % Initialize Wave Class and Specify Type

% % Regular Waves 
% waves = waveClass('regular');           % Initialize Wave Class and Specify Type                                 
% waves.height = 2.5;                     % Wave Height [m]
% waves.period = 8;                       % Wave Period [s]

% % Irregular Waves using PM Spectrum with Directionality 
waves = waveClass('irregular');         % Initialize Wave Class and Specify Type
waves.height = 1.5;                     % Significant Wave Height [m]
waves.period = 8;                       % Peak Period [s]
waves.spectrumType = 'PM';              % Specify Spectrum Type

% % Irregular Waves with imported spectrum
% waves = waveClass('spectrumImport');      % Create the Wave Variable and Specify Type
% waves.spectrumFile = 'spectrumData.mat';  % Name of User-Defined Spectrum File [:,2] = [f, Sf]

% % Waves with imported wave elevation time-history  
% waves = waveClass('elevationImport');          % Create the Wave Variable and Specify Type
% waves.elevationFile = 'elevationData.mat';     % Name of User-Defined Time-Series File [:,2] = [time, eta]


%% Body Data
% Flap
body(1) = bodyClass('hydroData/sphere.h5');      % Initialize bodyClass for Flap
body(1).geometryFile = 'geometry/oes_task10_sphere.stl';     % Geometry File
body(1).mass = 261.8e3;                          % User-Defined mass [kg]
body(1).inertia = [1.85e6 1.85e6 1.85e6];       % Moment of Inertia [kg-m^2]


% Base


%% Constraint Parameters
% Fixed
constraint(1)= constraintClass('Constraint1');  % Initialize ConstraintClass for Constraint1

