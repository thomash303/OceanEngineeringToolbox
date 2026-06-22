% projectRoot = fileparts(fileparts(fileparts(pwd)));
% 
% % Entering RM3 specific data
% filePath = {''};
% deviceName = {'OpenHydraulics.Developed.Circuits.MP_HIL','MP_HIL'};
% 
% currentPath = {pwd};
% 
% % Importing Modelica simulation data
% % File directory
% temp = tempdir;
% basePath = fullfile('OpenModelica', 'OMEdit');  % Path to default OMEdit result file
% fileName = fullfile([filePath{1} '' deviceName{1}], [deviceName{2} '_res.csv']);  % Path to current file                  
% %{
% The default result file and file name are shown in the output tab of the 
%  simulation setup as "Result File (optional) and File Name Prefix
%  (optional).
% %}
% 
% % Importing Modelica data
% filePath = fullfile(temp, basePath, fileName);
% outputData = readtable(filePath);
% 
% % Remove duplicate time records from OET output file
% time = outputData.time;
% [~, uidx] = unique(time, 'stable');
% outputData = outputData(uidx, :);


% % Pressure
% paBar = 1e5;
% 
% pA = outputData.doubleActingCylinder_cylinderChamberHead_p_vol/paBar;
% pB = outputData.doubleActingCylinder_cylinderChamberRod_p_vol/paBar;
% pHP = outputData.hpAccumulator_port_a_p/paBar;
% pLP = outputData.lpAccumulator_port_a_p/paBar;
% 
% figure('Name','Pressure')
% plot(time, pA, 'DisplayName','pA')
% hold on
% plot(time, pB, 'DisplayName','pB')
% plot(time, pHP, 'DisplayName','pHP')
% plot(time, pHP, 'DisplayName','pHP')
% ylim([-5 40])
% xlim([182 187])
% ylabel('Pressure (bar)')
% xlabel('Time (s)')
% legend('Location','best')
% title('Pressures')
% hold off

% Flow rates
mT = outputData.v4_3cc_jT_port_1__m_flow;
mP = outputData.v4_3cc_jP_port_1__m_flow;
mM = outputData.constantDisplacementPump_j1_port_1__m_flow;
mHP = outputData.hpAccumulator_port_a_m_flow;
mLP = outputData.lpAccumulator_port_a_m_flow;

figure('Name','Flow Rate')
plot(time, -mT, 'DisplayName','From piston')
hold on
plot(time, mM, 'DisplayName','Through motor')
plot(time, -mHP, 'DisplayName','HP Accumulator')
ylim([-0.05 0.25])
xlim([170 195])
ylabel('Mass flow rate (kg/s)')
xlabel('Time (s)')
legend('Location','best')
title('Flow Rate')
hold off

figure('Name','Mass Flow Accounting Top')
plot(time, mM, 'DisplayName','Through Motor')
hold on
plot(time, -mT - mHP, "+", 'DisplayName','From Piston and Accumulator')
ylim([-0.05 0.25])
xlim([170 195])
ylabel('Mass flow rate (kg/s)')
xlabel('Time (s)')
legend('Location','best')
title('Flow Rate')
hold off


figure('Name','Mass Flow Accounting Bottom')
plot(time, -mM, 'DisplayName','From Motor')
hold on
plot(time, -mP - mLP, "+", 'DisplayName','To Piston and Accumulator')
ylim([-0.25 -0.15])
xlim([170 195])
ylabel('Mass flow rate (kg/s)')
xlabel('Time (s)')
legend('Location','best')
title('Flow Rate')
hold off

% % Mechanics
% Fpto = outputData.Fpto;
% 
% figure('Name','Dynamics')
% plot(time, Fpto, 'DisplayName','Fpto')
% ylim([-3000 3000])
% xlim([170 195])
% ylabel('PTO Force (N)')
% xlabel('Time (s)')
% title('PTO Force')
% 
% 
% % Inputs
% x = outputData.doubleActingCylinder_piston_s;
% v = outputData.doubleActingCylinder_piston_v;
% N = outputData.constantDisplacementPump_fluidPower2MechRot_N;
% 
% figure('Name','Inputs')
% subplot(2,1,1)
% plot(time, x, 'DisplayName','x')
% hold on
% plot(time, v, 'DisplayName','v')
% hold off
% ylim([-0.5 0.5])
% xlim([170 195])
% ylabel('Pistion motion (m & m/s)')
% xlabel('Time (s)')
% legend('Location','best')
% title('Kinematics')
% 
% subplot(2,1,2)
% plot(time, N, 'DisplayName','N')
% ylim([180 215])
% xlim([170 195])
% ylabel('Rotational speed (rpm)')
% xlabel('Time (s)')
% title('Kinematics')