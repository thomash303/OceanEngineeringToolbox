% Plot general CC and OET data for the hydraulic PTO

%% Preprocessing
projectRoot = fileparts(fileparts(fileparts(pwd)));

% Entering RM3 specific data
filePath = {''};
deviceName = {'OpenHydraulics.Developed.Circuits.CC_HIL_sens','CC_HIL_sens'};

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

% Pressure
paBar = 1e5;

p1 = outputData.daq_p1/paBar;
p2 = outputData.daq_p2/paBar;
p3 = outputData.daq_p3/paBar;
p4 = outputData.daq_p4/paBar;
p5 = outputData.daq_p5/paBar;
p6 = outputData.daq_p6/paBar;

f1 = outputData.daq_qL1;
f2 = outputData.daq_qL2;

fpto = outputData.Fpto;

s = outputData.doubleActingCylinder_piston_s;

%% Figure 1
figure('Name','Flow and Displacement')
subplot(2,1,1)
plot(time, f1, 'DisplayName','f1')
hold on
plot(time, f2, 'DisplayName','f2')
ylim([-2 10])
xlim([160 170])
yticks(-2:2:10)
grid on
ylabel('Flow (lpm)')
xlabel('Time (s)')
legend('Location','best')
title('Volumetric Flow Rate')
hold off

s_offset = 0.15;

subplot(2,1,2)
plot(time, s - s_offset, 'DisplayName','s')
ylim([-0.2 0.15])
xlim([160 170])
yticks(-0.2:0.05:0.15)
grid on
ylabel('Displacement (m)')
xlabel('Time (s)')
legend('Location','best')
title('Displacement')

%% Figure 2
figure('Name','Piston Cylinder Pressure and Force')
subplot(2,1,1)
plot(time, p1, 'DisplayName','p1')
hold on
plot(time, p2, 'DisplayName','p2')
ylim([-5 35])
xlim([160 170])
yticks(-5:5:35)
grid on
ylabel('Pressure (bar)')
xlabel('Time (s)')
legend('Location','best')
title('Pressure')
hold off

subplot(2,1,2)
plot(time, fpto, 'DisplayName','Fpto')
ylim([-3000 3000])
xlim([160 170])
yticks(-3000:1000:3000)
grid on
ylabel('Force (N)')
xlabel('Time (s)')
legend('Location','best')
title('PTO Force')

%% Figure 3
figure('Name','HP Pressures')
subplot(2,1,1)
plot(time, p3, 'DisplayName','p3')
hold on
plot(time, p4, 'DisplayName','p4')
ylim([27 30])
xlim([160 170])
yticks(27:0.5:30)
grid on
ylabel('Pressure (bar)')
xlabel('Time (s)')
legend('Location','best')
title('HP and LP Pressures')
hold off

subplot(2,1,2)
plot(time, p5, 'DisplayName','p5')
hold on
plot(time, p6, 'DisplayName','p6')
ylim([0 30])
xlim([160 170])
yticks(0:5:30)
grid on
ylabel('Pressure (bar)')
xlabel('Time (s)')
legend('Location','best')
title('HP Pressures')
hold off