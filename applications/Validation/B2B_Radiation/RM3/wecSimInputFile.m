%% Simulation Data
simu = simulationClass();               % Initialize Simulation Class
% simu.simMechanicsFile = 'RM3_heave.slx';      % Specify Simulink Model File
simu.simMechanicsFile = 'RM3_heave.slx';      % Specify Simulink Model File
simu.mode = 'normal';                   % Specify Simulation Mode ('normal','accelerator','rapid-accelerator')
simu.explorer = 'off';                   % Turn SimMechanics Explorer (on/off)
simu.startTime = 0;                     % Simulation Start Time [s]
simu.rampTime = 100;                    % Wave Ramp Time [s]
simu.endTime = 400;                     % Simulation End Time [s]
simu.solver = 'ode4';                   % simu.solver = 'ode4' for fixed step & simu.solver = 'ode45' for variable step 
simu.dt = 0.1; 							% Simulation time-step [s]
simu.b2b = 1;
simu.stateSpace = 1;                      % Turn on State Space

%% Wave Information 
% % noWaveCIC, no waves with radiation CIC  
% waves = waveClass('noWaveCIC');       % Initialize Wave Class and Specify Type  

% % % Regular Waves  
% waves = waveClass('regular');           % Initialize Wave Class and Specify Type                                 
% waves.height = 2;                     % Wave Height [m]
% waves.period = 8;                       % Wave Period [s]

% % Regular Waves with CIC
waves = waveClass('regularCIC');          % Initialize Wave Class and Specify Type                                 
waves.height = 2;                       % Wave Height [m]
waves.period = 8;                         % Wave Period [s]

% % Irregular Waves using PM Spectrum 
%  waves = waveClass('irregular');           % Initialize Wave Class and Specify Type
%  waves.height = 2.5;                       % Significant Wave Height [m]
%  waves.period = 8;                         % Peak Period [s]
%  waves.spectrumType = 'PM';                % Specify Wave Spectrum Type
%  waves.direction=[0];

% % Irregular Waves using JS Spectrum with Equal Energy and Seeded Phase
% waves = waveClass('irregular');           % Initialize Wave Class and Specify Type
% waves.height = 2.5;                       % Significant Wave Height [m]
% waves.period = 8;                         % Peak Period [s]
% waves.spectrumType = 'JS';                % Specify Wave Spectrum Type
% waves.bem.option = 'EqualEnergy';         % Uses 'EqualEnergy' bins (default) 
% waves.phaseSeed = 1;                      % Phase is seeded so eta is the same


%% Body Data
% Float
body(1) = bodyClass('hydroData/rm3.h5');      
    % Create the body(1) Variable, Set Location of Hydrodynamic Data File 
    % and Body Number Within this File.   
body(1).geometryFile = 'geometry/float.stl';    % Location of Geomtry File
body(1).mass = 'equilibrium';                   
    % Body Mass. The 'equilibrium' Option Sets it to the Displaced Water 
    % Weight.
body(1).inertia = [20907301 21306090.66 37085481.11];  % Moment of Inertia [kg*m^2]     

% Spar/Plate
body(2) = bodyClass('hydroData/rm3.h5'); 
body(2).geometryFile = 'geometry/plate.stl'; 
body(2).mass = 'equilibrium';                   
body(2).inertia = [94419614.57 94407091.24 28542224.82];

%% PTO and Constraint Parameters
% Translational Joint
constraint(1) = constraintClass('Constraint1'); % Initialize Constraint Class for Constraint1
constraint(1).location = [0 0 0];               % Constraint Location [m]

%Translational Joint
constraint(2) = constraintClass('Constraint2'); % Initialize Constraint Class for Constraint2
constraint(2).location = [0 0 0];               % Constraint Location [m]
