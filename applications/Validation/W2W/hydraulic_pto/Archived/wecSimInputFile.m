%% Simulation Data
simu = simulationClass();               
% simu.simMechanicsFile = 'RM3_cHydraulic_PTO.slx'; %Location of Simulink Model File with PTO-Sim                 
simu.simMechanicsFile = 'float.slx';
simu.startTime = 0;                     
simu.rampTime = 100;                       
simu.endTime=400;   
simu.dt = 0.1;        
simu.explorer = 'off';                     % Turn SimMechanics Explorer (on/off)
simu.stateSpace = 1;
simu.solver = 'ode4';
simu.mode = 'normal';

%% Wave Information
% %Regular Waves
% waves = waveClass('regularCIC');
% waves.height = 2;
% waves.period = 15;

%Irregular Waves using PM Spectrum
waves = waveClass('irregular');
waves.height = 3;
waves.period = 8;
waves.spectrumType = 'PM';
waves.phaseSeed=1;

%% Body Data
% Float
body(1) = bodyClass('hydroData/rm3.h5');
%body(1).geometryFile = '../../../_Common_Input_Files/RM3/geometry/float.stl';
body(1).mass = 'equilibrium';
body(1).inertia = [20907301 21306090.66 37085481.11];
body(1).linearDamping = 1e5*ones(6);
% body(1).initial.displacement = [0,0,1];
% % Spar/Plate
% body(2) = bodyClass('hydroData/rm3.h5');
% %body(2).geometryFile = '../../../_Common_Input_Files/RM3/geometry/plate.stl';
% body(2).mass = 'equilibrium';
% body(2).inertia = [94419614.57 94407091.24 28542224.82];

%% PTO and Constraint Parameters
% Floating (3DOF) Joint
constraint(1) = constraintClass('Constraint1'); 
constraint(1).location = [0 0 0];                

% % Translational PTO
% pto(1) = ptoClass('PTO1');           	% Initialize PTO Class for PTO1
% pto(1).stiffness = 0;                           % PTO Stiffness [N/m]
% pto(1).damping = 0;                           % PTO Damping [N/(m/s)]
% pto(1).location = [0 0 0];                   % PTO Location [m]       

%% PTO new blocks

% %Hydraulic Cylinder
% ptoSim(1) = ptoSimClass('hydraulicCyl');
% ptoSim(1).hydPistonCompressible.xi_piston = 7; %10
% ptoSim(1).hydPistonCompressible.Ap_A = 0.0346;
% ptoSim(1).hydPistonCompressible.Ap_B = 0.0346;
% ptoSim(1).hydPistonCompressible.bulkModulus = 1.5e9;
% ptoSim(1).hydPistonCompressible.pistonStroke = 14; %20
% ptoSim(1).hydPistonCompressible.pAi = 2.5e7;
% ptoSim(1).hydPistonCompressible.pBi = 2.5e7;
% 
% %Rectifying Check Valve
% ptoSim(2) = ptoSimClass('rectCheckValve');
% ptoSim(2).rectifyingCheckValve.Cd = 0.5;
% ptoSim(2).rectifyingCheckValve.Amax = 0.001;
% ptoSim(2).rectifyingCheckValve.Amin = 1e-8;
% ptoSim(2).rectifyingCheckValve.pMax = 2.5e5;
% ptoSim(2).rectifyingCheckValve.pMin = 0e5;
% ptoSim(2).rectifyingCheckValve.rho = 850;
% ptoSim(2).rectifyingCheckValve.k1 = 200;
% ptoSim(2).rectifyingCheckValve.k2 = ...
%     atanh((ptoSim(2).rectifyingCheckValve.Amin-(ptoSim(2).rectifyingCheckValve.Amax-ptoSim(2).rectifyingCheckValve.Amin)/2)*...
%     2/(ptoSim(2).rectifyingCheckValve.Amax - ptoSim(2).rectifyingCheckValve.Amin))*...
%     1/(ptoSim(2).rectifyingCheckValve.pMin-(ptoSim(2).rectifyingCheckValve.pMax + ptoSim(2).rectifyingCheckValve.pMin)/2);

% %High Pressure Hydraulic Accumulator
% ptoSim(3) = ptoSimClass('hydraulicAcc');
% ptoSim(3).gasHydAccumulator.vI0 = 4;
% ptoSim(3).gasHydAccumulator.pIprecharge = 25e6;
% 
% %Low Pressure Hydraulic Accumulator
% ptoSim(4) = ptoSimClass('hydraulicAcc');
% ptoSim(4).gasHydAccumulator.vI0 = 3;
% ptoSim(4).gasHydAccumulator.pIprecharge = 10e5;
% 
% %Hydraulic Motor
% ptoSim(5) = ptoSimClass('hydraulicMotor');
% ptoSim(5).hydraulicMotor.effModel = 2;
% ptoSim(5).hydraulicMotor.displacement = 120;
% ptoSim(5).hydraulicMotor.effTableShaftSpeed = linspace(0,2500,20);
% ptoSim(5).hydraulicMotor.effTableDeltaP = linspace(0,200*1e5,20);
% ptoSim(5).hydraulicMotor.effTableVolEff = ones(20,20)*1;
% ptoSim(5).hydraulicMotor.effTableMechEff = ones(20,20)*1;
% 
% ptoSim(6) = ptoSimClass('electricGen');
% ptoSim(6).electricGeneratorEC.Ra = 0.1;
% ptoSim(6).electricGeneratorEC.La = 0.1;
% ptoSim(6).electricGeneratorEC.Ke = 0.1;
% ptoSim(6).electricGeneratorEC.Jem = 0.1;
% ptoSim(6).electricGeneratorEC.bShaft = 1;



% %Hydraulic Motor
% ptoSim(1) = ptoSimClass('hydraulicMotor');
% ptoSim(1).hydraulicMotor.effModel = 1;
% ptoSim(1).hydraulicMotor.displacement = 210;
% 
% % Leakage
% ptoSim(1).hydraulicMotor.visNominal = 0;
% ptoSim(1).hydraulicMotor.densityNominal = 850;
% ptoSim(1).hydraulicMotor.wNominal = 100;
% ptoSim(1).hydraulicMotor.effVolNom = 1;
% ptoSim(1).hydraulicMotor.rho = 850;
% ptoSim(1).hydraulicMotor.viscosity = 1e-6;
% ptoSim(1).hydraulicMotor.deltaPNominal = 1e5;
% ptoSim(1).hydraulicMotor.torqueNoLoad = 0;
% ptoSim(1).hydraulicMotor.torqueVsPressure = 0;

% ptoSim(1).hydraulicMotor.effTableShaftSpeed = linspace(0,2500,20);
% ptoSim(1).hydraulicMotor.effTableDeltaP = linspace(0,200*1e5,20);
% ptoSim(1).hydraulicMotor.effTableVolEff = ones(20,20)*1;
% ptoSim(1).hydraulicMotor.effTableMechEff = ones(20,20)*1;


% %High Pressure Hydraulic Accumulator
% ptoSim(1) = ptoSimClass('hydraulicAcc');
% ptoSim(1).gasHydAccumulator.vI0 = 1;
% ptoSim(1).gasHydAccumulator.pIprecharge = 25e6;
% 
% %Low Pressure Hydraulic Accumulator
% ptoSim(2) = ptoSimClass('hydraulicAcc');
% ptoSim(2).gasHydAccumulator.vI0 = 1;
% ptoSim(2).gasHydAccumulator.pIprecharge = 1e6;
% 
% %Hydraulic Motor
% ptoSim(3) = ptoSimClass('hydraulicMotor');
% ptoSim(3).hydraulicMotor.effModel = 1;
% ptoSim(3).hydraulicMotor.displacement = 210;
% 
% % Leakage
% ptoSim(3).hydraulicMotor.visNominal = 0;
% ptoSim(3).hydraulicMotor.densityNominal = 850;
% ptoSim(3).hydraulicMotor.wNominal = 100;
% ptoSim(3).hydraulicMotor.effVolNom = 1;
% ptoSim(3).hydraulicMotor.rho = 850;
% ptoSim(3).hydraulicMotor.viscosity = 1e-6;
% ptoSim(3).hydraulicMotor.deltaPNominal = 1e5;
% ptoSim(3).hydraulicMotor.torqueNoLoad = 0;
% ptoSim(3).hydraulicMotor.torqueVsPressure = 0;
% 
% %Rectifying Check Valve
% ptoSim(4) = ptoSimClass('rectCheckValve');
% ptoSim(4).rectifyingCheckValve.Cd = 0.5;
% ptoSim(4).rectifyingCheckValve.Amax = 0.001;
% ptoSim(4).rectifyingCheckValve.Amin = 1e-8;
% ptoSim(4).rectifyingCheckValve.pMax = 2.5e5;
% ptoSim(4).rectifyingCheckValve.pMin = 1e5;
% ptoSim(4).rectifyingCheckValve.rho = 850;
% ptoSim(4).rectifyingCheckValve.k1 = 200;
% ptoSim(4).rectifyingCheckValve.k2 = ...
%     atanh((ptoSim(4).rectifyingCheckValve.Amin-(ptoSim(4).rectifyingCheckValve.Amax-ptoSim(4).rectifyingCheckValve.Amin)/2)*...
%     2/(ptoSim(4).rectifyingCheckValve.Amax - ptoSim(4).rectifyingCheckValve.Amin))*...
%     1/(ptoSim(4).rectifyingCheckValve.pMin-(ptoSim(4).rectifyingCheckValve.pMax + ptoSim(4).rectifyingCheckValve.pMin)/2);
