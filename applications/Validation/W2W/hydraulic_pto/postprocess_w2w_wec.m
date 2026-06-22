%% Full postprocessing script for OET W2W model (final)


%% Preprocessing
% projectRoot = fileparts(fileparts(fileparts(pwd)));
% 
% % Entering RM3 specific data
% filePath = {''};
% % deviceName = {'OpenHydraulics.Developed.Circuits.w2w_sens_control','w2w_sens_control'};
% % deviceName = {'w2w_sens_control_none','w2w_sens_control_none'};
% deviceName = {'OpenHydraulics.Developed.Circuits.w2w_wec','w2w_wec'};
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

% close all


%% Reading
% % Conversions
% paToBar = 1e-5;
% nToKN = 1e-3;
% kNToMN = 1e-3;
% kNToN = 1e3;
% mNToN = 1e6;
% nToMN = 1e-6;
% 
% % Body parameters
% diameter = 5;
% 
% % Ramp Time
% Tramp = 100;
% idx = time >= Tramp;
% w2w.t_idx = time(idx);
% w2w.time = time;
% % Body
% w2w.s = outputData.daq_sensor_bus_s;
% w2w.v = outputData.daq_sensor_bus_v;
% 
% % Pressures
% w2w.pA = outputData.daq_sensor_bus_pA*paToBar;
% w2w.pB = outputData.daq_sensor_bus_pB*paToBar;
% w2w.pHP = outputData.daq_sensor_bus_pHP*paToBar;
% w2w.pLP = outputData.daq_sensor_bus_pLP*paToBar;
% 
% % Mass flows
% w2w.mHP = outputData.daq_sensor_bus_mHP;
% w2w.mLP = outputData.daq_sensor_bus_mLP;
% w2w.mm = outputData.daq_sensor_bus_mm;
% w2w.D = outputData.daq_D * mNToN;
% 
% % Shaft
% w2w.omega = outputData.daq_sensor_bus_omega;
% w2w.T = outputData.daq_sensor_bus_T;
% w2w.Tm = outputData.variableDisplacementMotor_fluidPower2MechRot_tau;
% w2w.Te = outputData.SCIG_tauElectrical;
% 
% % Generator
% w2w.V = outputData.daq_sensor_bus_V;
% w2w.i = outputData.daq_sensor_bus_i;
% 
% % Wave
% w2w.eta = outputData.daq_eta;
% 
% % Hydro forces
% w2w.Fpto = outputData.daq_Fpto*nToKN;
% w2w.Fexc = outputData.daq_Fexc*nToKN;
% 
% % PTO force
% w2w.Fcyl_iner = outputData.daq_Finer;
% w2w.Fcyl_fric = outputData.daq_Ffric;
% 
% % Generator losses
% w2w.Pgen_fric = outputData.daq_Pgen_fric;
% w2w.Pgen_cop = outputData.daq_Pgen_cop;
% w2w.Pgen_elec = -outputData.daq_Pelec;
% w2w.Pgen_mech = -outputData.daq_Pgen_mech;
% 
% % Energy stored in accumulators (not currently used)
% w2w.gamma = 1.4;
% w2w.Tmax = max(w2w.time);
% 
% w2w.VHP = outputData.hpAccumulator_liquidChamber_V;         
% w2w.pHP = outputData.hpAccumulator_liquidChamber_p_vol;
% w2w.VLP = outputData.lpAccumulator_liquidChamber_V;
% w2w.pLP = outputData.lpAccumulator_liquidChamber_p_vol;
% 
% w2w.EHP = (w2w.pHP .* w2w.VHP) / (w2w.gamma - 1);                      
% w2w.dEHP_t = w2w.EHP - w2w.EHP(1);                                 
% w2w.dpHP_t = gradient(w2w.EHP, w2w.time);                             
% w2w.dEHP  = w2w.EHP(end) - w2w.EHP(1);                              
% w2w.dpHP  = w2w.dEHP / w2w.Tmax;         
% 
% w2w.ELP = (w2w.pLP .* w2w.VLP) / (w2w.gamma - 1);                       
% w2w.dELP_t = w2w.ELP - w2w.ELP(1);                                  
% w2w.dpLP_t = gradient(w2w.ELP, w2w.time);                              
% w2w.dELP  = w2w.ELP(end) - w2w.ELP(1);                              
% w2w.dpLP  = w2w.dELP / w2w.Tmax;                                       
% 
% % Power (not saved in output data for some reason)
% w2w.Pwav = outputData.environment_wave_P * diameter * kNToMN;
% w2w.Pcap = outputData.daq_Pcyl_mech * kNToMN;
% w2w.Ptrans = w2w.Pgen_mech * kNToMN;
% w2w.Pgen = w2w.Pgen_elec * kNToMN;
% 
% % Energy
% 
% w2w.Ecap  =  cumtrapz(w2w.t_idx, w2w.Pcap(idx));
% w2w.Etrans = cumtrapz(w2w.t_idx, w2w.Ptrans(idx));
% w2w.Egen  = cumtrapz(w2w.t_idx, w2w.Pgen(idx));
% 
% Power (this will have to be as a table)
% w2w.Pwav_mean = mean(w2w.Pwav(idx));
% w2w.Pcap_mean = mean(w2w.Pcap(idx));
% w2w.Ptrans_mean = mean(w2w.Ptrans(idx));
% w2w.Pgen_mean = mean(w2w.Pgen(idx));
% % Efficiency (this will have to be as a table)
% w2w.ncap = mean(w2w.Pcap(idx)) / mean(w2w.Pwav) * 100;
% w2w.ntrans = mean(w2w.Ptrans(idx))/ mean(w2w.Pcap(idx)) * 100;
% w2w.ngen = mean(w2w.Pgen(idx)) / mean(w2w.Ptrans(idx)) * 100;
% 
% w2w.npto = (w2w.ntrans * w2w.ngen) / 100;
% w2w.nw2w = w2w.ncap * w2w.npto /100;

% clear outputdata
% save('w2w_wec.mat','w2w')

%% Load Data
load('w2w_wec.mat')

%% Plotting Parameters
lb = 100;
ub = 200;
b = [lb ub];

Fsize = 12;
AxisLineWidth = 2;
LineWidth = 2;
colors = get(groot,'defaultAxesColorOrder');
blue = colors(1,:);
orange = colors(2,:);

%% Plotting (Figure 1)
figure('Name','Figure 1');

t = tiledlayout(3,2,'TileSpacing','compact','Padding','compact');

% =========================
% 1. Wave elevation and displacement
% =========================
nexttile;

plot(w2w.time, w2w.eta, 'DisplayName','$\eta$', 'LineWidth', LineWidth) 
hold on
plot(w2w.time, w2w.s, 'DisplayName','$s$', 'LineWidth', LineWidth)
hold off

ylim([-2 2]) 
xlim([lb ub]) 
yticks(-2:1:2)

ylabel('Displcement $[m]$','Interpreter','latex')
title('Displacement','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;

% =========================
% 4. Pressure
% =========================
nexttile;

plot(w2w.time, w2w.pA, 'DisplayName','$p_A$', 'LineWidth', LineWidth) 
hold on
plot(w2w.time, w2w.pB, 'DisplayName','$p_B$', 'LineWidth', LineWidth)
plot(w2w.time, w2w.pHP, 'DisplayName','$p_{HP}$', 'LineWidth', LineWidth)
plot(w2w.time, w2w.pLP, 'DisplayName','$p_{LP}$', 'LineWidth', LineWidth)
hold off

ylim([0 60]) 
xlim([lb ub]) 
% yticks(-2:1:2)

ylabel('Pressure $[bar]$','Interpreter','latex')
title('Pressure','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;

% =========================
% 2. Velocity
% =========================
nexttile;

plot(w2w.time, w2w.v, 'DisplayName','$v$', 'LineWidth', LineWidth) 

ylim([-1.5 2]) 
xlim([lb ub]) 
yticks([-1.5 -1 0 1 2])

ylabel('Velocity $[m/s]$','Interpreter','latex')
title('Velocity','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;

% =========================
% 5. Mass flow
% =========================
nexttile;

plot(w2w.time, w2w.mHP, 'DisplayName','$\dot{m}_{HP}$', 'LineWidth', LineWidth)
hold on
plot(w2w.time, w2w.mLP, 'DisplayName','$\dot{m}_{LP}$', 'LineWidth', LineWidth)
plot(w2w.time, w2w.mm, 'DisplayName','$\dot{m}_{m}$', 'LineWidth', LineWidth)
hold off

ylim([0 50]) 
xlim([lb ub]) 
% yticks(-2:1:2)

ylabel('Mass Flow $[kg/s]$','Interpreter','latex')
title('Mass Flow','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;
xlabel('$t\;[s]$','Interpreter','latex')

% =========================
% 3. Excitation and PTO forces
% =========================
nexttile;

plot(w2w.time, w2w.Fexc, 'DisplayName','$F_{exc}$', 'LineWidth', LineWidth) 
hold on
plot(w2w.time, w2w.Fpto, 'DisplayName','$F_{pto}$', 'LineWidth', LineWidth)
hold off

ylim([-250 250]) 
xlim([lb ub]) 
yticks(-250:125:250)

ylabel('Force $[kN]$','Interpreter','latex')
title('Force','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;

%% Plotting (Figure 2)
figure('Name','Figure 2');

t = tiledlayout(3,2,'TileSpacing','compact','Padding','compact');

% =========================
% 6. Motor Displacement
% =========================
nexttile;

plot(w2w.time, w2w.D, 'DisplayName','$x_mD_m$', 'LineWidth', LineWidth) 

%
xlim([lb ub]) 
% yticks(-2:1:2)

ylabel('Motor Displcement $[cc/rev]$','Interpreter','latex')
title('Motor displacement','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;

% =========================
% 9. Power
% =========================
nexttile;

plot(w2w.time, w2w.Pwav, 'DisplayName','$\bar{P}_{wav}$', 'LineWidth', LineWidth)
hold on
plot(w2w.time, w2w.Pcap, 'DisplayName','$P_{cap}$', 'LineWidth', LineWidth)
plot(w2w.time, w2w.Ptrans, 'DisplayName','$P_{trans}$', 'LineWidth', LineWidth)
plot(w2w.time, w2w.Pgen, 'DisplayName','$P_{gen}$', 'LineWidth', LineWidth)
hold off

ylim([0 250]) 
xlim([lb ub]) 
yticks(0:50:250)

ylabel('Power $[kW]$','Interpreter','latex')
title('Power','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;

% =========================
% 7. Shaft speed
% =========================
nexttile;

yline(157.5, '--', 'DisplayName','$r_c$', 'LineWidth', LineWidth)
hold on
plot(w2w.time, w2w.omega, 'DisplayName','$\omega_r$', 'LineWidth', LineWidth) 
hold off

ylim([157.25 157.75]) 
xlim([lb ub]) 
yticks(157.25:0.25:157.75)

ylabel('Generator Speed $[rad/s]$','Interpreter','latex')
title('Generator Speed','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;

% =========================
% 10. Energy
% =========================
nexttile;

plot(w2w.t_idx, w2w.Ecap, 'DisplayName','$E_{cap}$', 'LineWidth', LineWidth)
hold on
plot(w2w.t_idx, w2w.Etrans, 'DisplayName','$E_{trans}$', 'LineWidth', LineWidth)
plot(w2w.t_idx, w2w.Egen, 'DisplayName','$E_{gen}$', 'LineWidth', LineWidth)
hold off

ylim([0 1500]) 
xlim([lb ub]) 
yticks(0:375:1500)

ylabel('Energy $[kJ]$','Interpreter','latex')
title('Energy','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;
xlabel('$t\;[s]$','Interpreter','latex')

% =========================
% 8. Generator Torque
% =========================
nexttile;

plot(w2w.time, w2w.Tm, 'DisplayName','$T_m$', 'LineWidth', LineWidth) 
hold on
plot(w2w.time, w2w.Te, 'DisplayName','$T_{elec}$', 'LineWidth', LineWidth) 
hold off

ylim([-80 -30]) 
xlim([lb ub]) 
yticks(-80:10:-30)

ylabel('Torque $[Nm]$','Interpreter','latex')
title('Torque','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;

%% Plotting (magnified)
% =========================
% 9. Power (magnified)
% =========================
figure('Name','Figure 3');
nexttile;

plot(w2w.time, w2w.Pwav, 'DisplayName','$\bar{P}_{wav}$', 'LineWidth', LineWidth)
hold on
plot(w2w.time, w2w.Pcap, 'DisplayName','$P_{cap}$', 'LineWidth', LineWidth)
plot(w2w.time, w2w.Ptrans, 'DisplayName','$P_{trans}$', 'LineWidth', LineWidth)
plot(w2w.time, w2w.Pgen, 'DisplayName','$P_{gen}$', 'LineWidth', LineWidth)
hold off

ylim([2.5 12.5]) 
xlim([120 150]) 
yticks(2.5:5:12.5)
xticks(120:15:150)

ylabel('Power $[kW]$','Interpreter','latex')
title('Power','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'LineWidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize,'Interpreter','latex');
set(get(gca,'YLabel'),'FontSize',Fsize,'Interpreter','latex');
legend box off;

%% Table
% Efficiency (this will have to be as a table)
% abs, trans, gen 
% pto, w2w

EfficiencyTable = table( ...
    w2w.ncap, w2w.ntrans, w2w.ngen, w2w.npto, w2w.nw2w, ...
    'VariableNames', {'Absorption','Transmission','Generation','PTO','W2W'} );

disp(EfficiencyTable)
