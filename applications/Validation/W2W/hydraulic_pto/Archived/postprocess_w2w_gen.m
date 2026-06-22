% Full postprocessing script for OET W2W model


%% Preprocessing
projectRoot = fileparts(fileparts(fileparts(pwd)));

% Entering RM3 specific data
filePath = {''};
deviceName = {'OpenHydraulics.Developed.Circuits.w2w_sens','w2w_sens'};

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

% Conversions
paToBar = 1e-5;
nToKN = 1e-3;
kNToMN = 1e-3;
kNToN = 1e3;
mNToN = 1e6;
nToMN = 1e-6;

s = outputData.daq_sensor_bus_s;
v = outputData.daq_sensor_bus_v;

pA = outputData.daq_sensor_bus_pA*paToBar;
pB = outputData.daq_sensor_bus_pB*paToBar;
pHP = outputData.daq_sensor_bus_pHP*paToBar;
pLP = outputData.daq_sensor_bus_pLP*paToBar;

mHP = outputData.daq_sensor_bus_mHP;
mLP = outputData.daq_sensor_bus_mLP;
mm = outputData.daq_sensor_bus_mm;

omega = outputData.daq_sensor_bus_omega;
T = outputData.daq_sensor_bus_T;

V = outputData.daq_sensor_bus_V;
i = outputData.daq_sensor_bus_i;

eta = outputData.daq_eta;
Fpto = outputData.daq_Fpto*nToKN;
Fexc = outputData.daq_Fexc*nToKN;
% D = outputData.daq_D;


%% Figure 1 - Multibody Dynamics
s_offset = 0.72;

figure('Name','Multibody Dynamics')
subplot(2,1,1)
yyaxis left
plot(time, s + s_offset, 'DisplayName','s')
ylabel('Displacement (m)')
ylim([-1.5 1.5])
yyaxis right
plot(time, v, 'DisplayName','v')
ylabel('Velocity (m/s)')
ylim([-0.75 0.75])
xlim([200 250])
xlabel('Time (s)')
title('Kinematics')
legend('Location','best')

subplot(2,1,2)
plot(time, Fexc, 'DisplayName','F_{exc}')
hold on
plot(time, Fpto, 'DisplayName','F_{pto}')
ylim([-2500 2500])
xlim([200 250])
grid on
ylabel('Force (kN)')
xlabel('Time (s)')
legend('Location','best')
title('Dynamics')
hold off

%% Figure 2 - Hydraulic Dynamics
figure('Name','Hydraulic Dynamics')
subplot(3,1,1)
plot(time, pA, 'DisplayName','p_A')
hold on
plot(time, pB, 'DisplayName','p_B')
plot(time, pHP, 'DisplayName','p_{HP}')
plot(time, pLP, 'DisplayName','p_{LP}')
ylim([0 60])
xlim([200 250])
ylabel('Pressure (bar)')
xlabel('Time (s)')
legend('Location','best')
title('Hydraulic pressures')
hold off

subplot(3,1,2)
plot(time, mHP, 'DisplayName','m_{HP}')
hold on
plot(time, mLP, 'DisplayName','m_{LP}')
plot(time, mm, 'DisplayName','m_{m}')
ylim([0 10])
xlim([200 250])
yticks(0:5:30)
grid on
ylabel('Pressure (bar)')
xlabel('Time (s)')
legend('Location','best')
title('HP Pressures')
hold off

subplot(3,1,3)
% plot(time, D, 'DisplayName','D')
ylim([0 30])
xlim([200 250])
ylabel('Displacement (V^3)')
xlabel('Time (s)')
title('Motor Displacement')

%% Figure 3 - Shaft Dynamcis
figure('Name','Shaft Mechancis')
subplot(2,1,1)
plot(time, omega, 'DisplayName','\omega')
ylim([160 161])
xlim([200 250])
ylabel('Angular Velocity (rad/s)')
xlabel('Time (s)')
title('Shaft Speed')

subplot(2,1,2)
plot(time, T, 'DisplayName','\tau')
ylim([100 115])
xlim([200 250])
ylabel('Torque (N)')
xlabel('Time (s)')
title('Shaft Torque')

%% Figure 4 - Generator Dynamics
figure('Name','Generator Dynamics')
subplot(2,1,1)
plot(time, V, 'DisplayName','V')
ylim([57 59])
xlim([200 250])
ylabel('RMS Voltage (V)')
xlabel('Time (s)')
title('Generator Voltage')

subplot(2,1,2)
plot(time, i, 'DisplayName','i')
ylim([110 120])
xlim([200 250])
ylabel('RMS Current (A)')
xlabel('Time (s)')
title('Generator Current')

