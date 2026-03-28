% Full postprocessing script for OET W2W model (including powers, losses
% and more)


%% Preprocessing
% projectRoot = fileparts(fileparts(fileparts(pwd)));
% 
% % Entering RM3 specific data
% filePath = {''};
% % deviceName = {'OpenHydraulics.Developed.Circuits.w2w_sens_control','w2w_sens_control'};
% deviceName = {'w2w_sens_control_none','w2w_sens_control_none'};
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
% time = outputData.time;
% 
% % close all
% 
% 
% %% Reading
% % Conversions
% paToBar = 1e-5;
% nToKN = 1e-3;
% kNToMN = 1e-3;
% kNToN = 1e3;
% mNToN = 1e6;
% nToMN = 1e-6;
% 
% % Ramp Time
% Tramp = 100;
% idx = time >= Tramp;
% t_idx = time(idx);
% % Body
% s = outputData.daq_sensor_bus_s;
% v = outputData.daq_sensor_bus_v;
% 
% % Pressures
% pA = outputData.daq_sensor_bus_pA*paToBar;
% pB = outputData.daq_sensor_bus_pB*paToBar;
% pHP = outputData.daq_sensor_bus_pHP*paToBar;
% pLP = outputData.daq_sensor_bus_pLP*paToBar;
% 
% % Mass flows
% mHP = outputData.daq_sensor_bus_mHP;
% mLP = outputData.daq_sensor_bus_mLP;
% mm = outputData.daq_sensor_bus_mm;
% %D = outputData.daq_D;
% 
% % Shaft
% omega = outputData.daq_sensor_bus_omega;
% T = outputData.daq_sensor_bus_T;
% 
% % Generator
% V = outputData.daq_sensor_bus_V;
% i = outputData.daq_sensor_bus_i;
% 
% % Wave
% eta = outputData.daq_eta;
% 
% % Hydro forces
% Fpto = outputData.daq_Fpto*nToKN;
% Fexc = outputData.daq_Fexc*nToKN;
% 
% % PTO force
% Fcyl_iner = outputData.daq_Finer;
% Fcyl_fric = outputData.daq_Ffric;
% 
% % Generator losses
% Pgen_fric = outputData.daq_Pgen_fric;
% Pgen_cop = outputData.daq_Pgen_cop;
% Pgen_elec = outputData.daq_Pelec;
% Pgen_mech = outputData.daq_Pgen_mech;

% % Energy stored in accumulators (not currently used)
% gamma = 1.4;
% Tmax = max(time);
% 
% VHP = outputData.hpAccumulator_liquidChamber_V;         
% pHP = outputData.hpAccumulator_liquidChamber_p_vol;
% VLP = outputData.lpAccumulator_liquidChamber_V;
% pLP = outputData.lpAccumulator_liquidChamber_p_vol;
% 
% EHP = (pHP .* VHP) / (gamma - 1);                      
% dEHP_t = EHP - EHP(1);                                 
% dpHP_t = gradient(EHP, time);                             
% dEHP  = EHP(end) - EHP(1);                              
% dpHP  = dEHP / Tmax;         
% 
% ELP = (pLP .* VLP) / (gamma - 1);                       
% dELP_t = ELP - ELP(1);                                  
% dpLP_t = gradient(ELP, time);                              
% dELP  = ELP(end) - ELP(1);                              
% dpLP  = dELP / Tmax;                                       
% 
% % Power (not saved in output data for some reason)
% %Pwav = outputData.environment_wave_P;
% Pwav = 57e3;
% Pcap = outputData.daq_Pcyl_mech;
% Ptrans = Pgen_mech;
% Pgen = Pgen_elec;
% 
% 
% Energy
% Ecap = outputData.daq_Ecyl_mech;
% Etrans = -outputData.daq_E_mech;
% Egen = -outputData.daq_Eelec;
% 
% Ecap  =  cumtrapz(t_idx, Pcap(idx));
% Etrans = cumtrapz(t_idx, Ptrans(idx));
% Egen  = cumtrapz(t_idx, Pgen(idx));
% 
% % Efficiency (this will have to be as a table)
% ncap = mean(Pcap(idx)) / mean(Pwav) * 100;
% ntrans = mean(Ptrans(idx))/ mean(Pcap(idx)) * 100;
% ngen = mean(Pgen(idx)) / mean(Ptrans(idx)) * 100;
% 
% npto = (ntrans * ngen) / 100;
% nw2w = ncap * npto /100;
% 
% clear outputdata

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
%plot(time, D, 'DisplayName','D')
%ylim([0 30])
xlim([200 250])
ylabel('Displacement (V^3)')
xlabel('Time (s)')
title('Motor Displacement')

%% Figure 3 - Shaft Dynamcis
figure('Name','Shaft Mechancis')
subplot(2,1,1)
plot(time, omega, 'DisplayName','\omega')
%ylim([160 161])
xlim([200 250])
ylabel('Angular Velocity (rad/s)')
xlabel('Time (s)')
title('Shaft Speed')

subplot(2,1,2)
plot(time, T, 'DisplayName','\tau')
%ylim([100 115])
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
%ylim([110 120])
xlim([200 250])
ylabel('RMS Current (A)')
xlabel('Time (s)')
title('Generator Current')

%% Figure 5 - PTO Force
figure('Name','PTO Force')

plot(time, Fpto, 'DisplayName','F_{pto}')
hold on
plot(time, Fcyl_iner * nToKN, 'DisplayName','F_{iner}')
plot(time, Fcyl_fric * nToKN, 'DisplayName','F_{fric}')

xlim([200 250])
ylabel('Force (kN)')
xlabel('Time (s)')
legend('Location','best')
title('PTO Force Components')
grid on
hold off

%% Figure 6 - Generator Losses
figure('Name','Generator Losses')

plot(time, Pgen_mech, 'DisplayName','P_{mech,in}')
hold on
plot(time, Pgen_elec, 'DisplayName','P_{elec,out}')
plot(time, Pgen_fric, 'DisplayName','P_{fric}')
plot(time, Pgen_cop, 'DisplayName','P_{copper}')

xlim([200 250])
ylabel('Power (W)')
xlabel('Time (s)')
legend('Location','best')
title('Generator Power & Losses')
grid on
hold off
%% Figure 7 - Power
figure('Name','Power Flow')

%plot(time, Pwav, 'DisplayName','P_{wav}')
plot(time, Pwav*ones(length(time),1), 'DisplayName','P_{wav}')
hold on
plot(time, Pcap, 'DisplayName','P_{cap}')
plot(time, Ptrans, 'DisplayName','P_{trans}')
plot(time, Pgen, 'DisplayName','P_{gen}')

xlim([200 250])
ylabel('Power (W)')
xlabel('Time (s)')
legend('Location','best')
title('Wave-to-Wire Power Flow')
grid on
hold off

%% Figure 8 - Energy
figure('Name','Energy')

plot(t_idx, Ecap, 'DisplayName','E_{cap}')
hold on
plot(t_idx, Etrans, 'DisplayName','E_{trans}')
plot(t_idx, Egen, 'DisplayName','E_{gen}')

xlim([200 250])
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
    ncap, ntrans, ngen, npto, nw2w, ...
    'VariableNames', {'Absorption','Transmission','Generation','PTO','W2W'} );

disp(EfficiencyTable)

