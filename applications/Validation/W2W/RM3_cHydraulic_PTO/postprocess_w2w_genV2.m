% Full postprocessing script for OET W2W model (including powers, losses
% and more)


%% Preprocessing
projectRoot = fileparts(fileparts(fileparts(pwd)));

% Entering RM3 specific data
filePath = {''};
% deviceName = {'OpenHydraulics.Developed.Circuits.w2w_sens_control','w2w_sens_control'};
% deviceName = {'w2w_sens_control_none','w2w_sens_control_none'};
deviceName = {'OpenHydraulics.Developed.Circuits.w2w_wec','w2w_wec'};
currentPath = {pwd};

% Importing Modelica simulation data
% File directory
temp = tempdir;
basePath = fullfile('OpenModelica', 'OMEdit');  % Path to default OMEdit result file
fileName = fullfile([filePath{1} '' deviceName{1}], [deviceName{2} '_res.csv']);  % Path to current file                  
%{
The default result file and file name are shown in the output tab of the 
 simulation setup as "Result File (optional) and File Name Prefix
 (optional).
%}

% Importing Modelica data
filePath = fullfile(temp, basePath, fileName);
outputData = readtable(filePath);

% Remove duplicate time records from OET output file
time = outputData.time;
[~, uidx] = unique(time, 'stable');
outputData = outputData(uidx, :);
time = outputData.time;

% close all


%% Reading
% Conversions
paToBar = 1e-5;
nToKN = 1e-3;
kNToMN = 1e-3;
kNToN = 1e3;
mNToN = 1e6;
nToMN = 1e-6;

% Body parameters
diameter = 5;

% Ramp Time
Tramp = 100;
idx = time >= Tramp;
w2w.t_idx = time(idx);
w2w.time = time;
% Body
w2w.s = outputData.daq_sensor_bus_s;
w2w.v = outputData.daq_sensor_bus_v;

% Pressures
w2w.pA = outputData.daq_sensor_bus_pA*paToBar;
w2w.pB = outputData.daq_sensor_bus_pB*paToBar;
w2w.pHP = outputData.daq_sensor_bus_pHP*paToBar;
w2w.pLP = outputData.daq_sensor_bus_pLP*paToBar;

% Mass flows
w2w.mHP = outputData.daq_sensor_bus_mHP;
w2w.mLP = outputData.daq_sensor_bus_mLP;
w2w.mm = outputData.daq_sensor_bus_mm;
w2w.D = outputData.daq_D;

% Shaft
w2w.omega = outputData.daq_sensor_bus_omega;
w2w.T = outputData.daq_sensor_bus_T;

% Generator
w2w.V = outputData.daq_sensor_bus_V;
w2w.i = outputData.daq_sensor_bus_i;

% Wave
w2w.eta = outputData.daq_eta;

% Hydro forces
w2w.Fpto = outputData.daq_Fpto*nToKN;
w2w.Fexc = outputData.daq_Fexc*nToKN;

% PTO force
w2w.Fcyl_iner = outputData.daq_Finer;
w2w.Fcyl_fric = outputData.daq_Ffric;

% Generator losses
w2w.Pgen_fric = outputData.daq_Pgen_fric;
w2w.Pgen_cop = outputData.daq_Pgen_cop;
w2w.Pgen_elec = -outputData.daq_Pelec;
w2w.Pgen_mech = -outputData.daq_Pgen_mech;

% Energy stored in accumulators (not currently used)
w2w.gamma = 1.4;
w2w.Tmax = max(w2w.time);

w2w.VHP = outputData.hpAccumulator_liquidChamber_V;         
w2w.pHP = outputData.hpAccumulator_liquidChamber_p_vol;
w2w.VLP = outputData.lpAccumulator_liquidChamber_V;
w2w.pLP = outputData.lpAccumulator_liquidChamber_p_vol;

w2w.EHP = (w2w.pHP .* w2w.VHP) / (w2w.gamma - 1);                      
w2w.dEHP_t = w2w.EHP - w2w.EHP(1);                                 
w2w.dpHP_t = gradient(w2w.EHP, w2w.time);                             
w2w.dEHP  = w2w.EHP(end) - w2w.EHP(1);                              
w2w.dpHP  = w2w.dEHP / w2w.Tmax;         

w2w.ELP = (w2w.pLP .* w2w.VLP) / (w2w.gamma - 1);                       
w2w.dELP_t = w2w.ELP - w2w.ELP(1);                                  
w2w.dpLP_t = gradient(w2w.ELP, w2w.time);                              
w2w.dELP  = w2w.ELP(end) - w2w.ELP(1);                              
w2w.dpLP  = w2w.dELP / w2w.Tmax;                                       

% Power (not saved in output data for some reason)
w2w.Pwav = outputData.environment_wave_P * diameter;
% w2w.Pwav = 6e3 * diameter;
w2w.Pcap = outputData.daq_Pcyl_mech;
w2w.Ptrans = w2w.Pgen_mech;
w2w.Pgen = w2w.Pgen_elec;

% Energy
% w2w.Ecap = outputData.daq_Ecyl_mech;
% w2w.Etrans = outputData.daq_E_mech;
% w2w.Egen = outputData.daq_Eelec;

w2w.Ecap  =  cumtrapz(w2w.t_idx, w2w.Pcap(idx));
w2w.Etrans = cumtrapz(w2w.t_idx, w2w.Ptrans(idx));
w2w.Egen  = cumtrapz(w2w.t_idx, w2w.Pgen(idx));

% Efficiency (this will have to be as a table)
w2w.ncap = mean(w2w.Pcap(idx)) / mean(w2w.Pwav) * 100;
w2w.ntrans = mean(w2w.Ptrans(idx))/ mean(w2w.Pcap(idx)) * 100;
w2w.ngen = mean(w2w.Pgen(idx)) / mean(w2w.Ptrans(idx)) * 100;

w2w.npto = (w2w.ntrans * w2w.ngen) / 100;
w2w.nw2w = w2w.ncap * w2w.npto /100;
% 
% clear outputdata
save('w2w_wec.mat','w2w')

%% Plotting Parameters
lb = 10;
ub = 250;
b = [lb ub];

%% Figure 0 - Wave Elevation
figure('Name','Wave elevation')
subplot(2,1,1)
plot(w2w.time, w2w.eta, 'DisplayName','eta')
ylabel('Wave Elevation (m)')
ylim([-1.5 1.5])
xlim(b)
xlabel('Time (s)')
title('Wave Elevation')
legend('Location','best')

%% Figure 1 - Multibody Dynamics
s_offset = 0;

figure('Name','Multibody Dynamics')
subplot(2,1,1)
yyaxis left
plot(w2w.time, w2w.s + s_offset, 'DisplayName','s')
ylabel('Displacement (m)')
ylim([-1.5 1.5])
yyaxis right
%plot(w2w.time, w2w.v, 'DisplayName','v')
%ylabel('Velocity (m/s)')
%ylim([-0.75 0.75])
xlim(b)
xlabel('Time (s)')
title('Kinematics')
legend('Location','best')

subplot(2,1,2)
plot(w2w.time, w2w.Fexc, 'DisplayName','F_{exc}')
hold on
plot(w2w.time, w2w.Fpto, 'DisplayName','F_{pto}')
ylim([-250 250])
xlim(b)
grid on
ylabel('Force (kN)')
xlabel('Time (s)')
legend('Location','best')
title('Dynamics')
hold off

%% Figure 2 - Hydraulic Dynamics
figure('Name','Hydraulic Dynamics')
subplot(3,1,1)
plot(w2w.time, w2w.pA, 'DisplayName','p_A')
hold on
plot(w2w.time, w2w.pB, 'DisplayName','p_B')
plot(w2w.time, w2w.pHP, 'DisplayName','p_{HP}')
plot(w2w.time, w2w.pLP, 'DisplayName','p_{LP}')
ylim([0 60])
xlim(b)
ylabel('Pressure (bar)')
xlabel('Time (s)')
legend('Location','best')
title('Hydraulic pressures')
hold off

subplot(3,1,2)
plot(w2w.time, w2w.mHP, 'DisplayName','m_{HP}')
hold on
plot(w2w.time, w2w.mLP, 'DisplayName','m_{LP}')
plot(w2w.time, w2w.mm, 'DisplayName','m_{m}')
ylim([0 25])
xlim(b)
yticks(0:5:30)
grid on
ylabel('Mass flow (kg/s)')
xlabel('Time (s)')
legend('Location','best')
title('HP Pressures')
hold off

subplot(3,1,3)
plot(w2w.time, w2w.D, 'DisplayName','D')
ylim([0 30e-5])
xlim(b)
ylabel('Displacement (V^3)')
xlabel('Time (s)')
title('Motor Displacement')

%% Figure 3 - Shaft Dynamcis
figure('Name','Shaft Mechancis')
subplot(2,1,1)
plot(w2w.time, w2w.omega, 'DisplayName','\omega')
ylim([157 158])
xlim(b)
ylabel('Angular Velocity (rad/s)')
xlabel('Time (s)')
title('Shaft Speed')

subplot(2,1,2)
plot(w2w.time, w2w.T, 'DisplayName','\tau')
%ylim([100 115])
xlim(b)
ylabel('Torque (N)')
xlabel('Time (s)')
title('Shaft Torque')

%% Figure 4 - Generator Dynamics
figure('Name','Generator Dynamics')
subplot(2,1,1)
plot(w2w.time, w2w.V, 'DisplayName','V')
ylim([57 59])
xlim(b)
ylabel('RMS Voltage (V)')
xlabel('Time (s)')
title('Generator Voltage')

subplot(2,1,2)
plot(w2w.time, w2w.i, 'DisplayName','i')
%ylim([110 120])
xlim(b)
ylabel('RMS Current (A)')
xlabel('Time (s)')
title('Generator Current')

%% Figure 5 - PTO Force
figure('Name','PTO Force')

plot(w2w.time, w2w.Fpto, 'DisplayName','F_{pto}')
hold on
plot(w2w.time, w2w.Fcyl_iner * nToKN, 'DisplayName','F_{iner}')
plot(w2w.time, w2w.Fcyl_fric * nToKN, 'DisplayName','F_{fric}')

xlim(b)
ylabel('Force (kN)')
xlabel('Time (s)')
legend('Location','best')
title('PTO Force Components')
grid on
hold off

%% Figure 6 - Generator Losses
figure('Name','Generator Losses')

plot(w2w.time, w2w.Pgen_mech, 'DisplayName','P_{mech,in}')
hold on
plot(w2w.time, w2w.Pgen_elec, 'DisplayName','P_{elec,out}')
plot(w2w.time, w2w.Pgen_fric, 'DisplayName','P_{fric}')
plot(w2w.time, w2w.Pgen_cop, 'DisplayName','P_{copper}')

xlim(b)
ylabel('Power (W)')
xlabel('Time (s)')
legend('Location','best')
title('Generator Power & Losses')
grid on
hold off
%% Figure 7 - Power
figure('Name','Power Flow')

%plot(time, Pwav, 'DisplayName','P_{wav}')
plot(w2w.time, w2w.Pwav, 'DisplayName','P_{wav}')
hold on
plot(w2w.time, w2w.Pcap, 'DisplayName','P_{cap}')
plot(w2w.time, w2w.Ptrans, 'DisplayName','P_{trans}')
plot(w2w.time, w2w.Pgen, 'DisplayName','P_{gen}')

xlim(b)
ylabel('Power (W)')
xlabel('Time (s)')
legend('Location','best')
title('Wave-to-Wire Power Flow')
grid on
hold off

%% Figure 8 - Energy
figure('Name','Energy')

plot(w2w.t_idx, w2w.Ecap, 'DisplayName','E_{cap}')
hold on
plot(w2w.t_idx, w2w.Etrans, 'DisplayName','E_{trans}')
plot(w2w.t_idx, w2w.Egen, 'DisplayName','E_{gen}')

xlim(b)
ylabel('Energy (J)')
xlabel('Time (s)')
legend('Location','best')
title('Energy Conversion')
grid on
hold off


%% Figure 9 - Efficiency
% Efficiency (this will have to be as a table)
% abs, trans, gen 
% pto, w2w

EfficiencyTable = table( ...
    w2w.ncap, w2w.ntrans, w2w.ngen, w2w.npto, w2w.nw2w, ...
    'VariableNames', {'Absorption','Transmission','Generation','PTO','W2W'} );

disp(EfficiencyTable)


