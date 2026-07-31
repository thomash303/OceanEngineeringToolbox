%% Loading data from spreadsheet and text file
% oes_sphere = struct();
% 
% % Excel
% filename = 'Reference_data\sphere_decay_comparison.xlsx';
% 
% % Sheet 1 = 1 m
% decay_1m = readtable(filename, 'Sheet', 1);
% 
% % Saving 1m decay
% oes_sphere.decay_1m.time = decay_1m{:,1};
% oes_sphere.decay_1m.pds = decay_1m{:,2};
% oes_sphere.decay_1m.inw = decay_1m{:,3};
% oes_sphere.decay_1m.ans = decay_1m{:,4};
% oes_sphere.decay_1m.nrel = decay_1m{:,5};
% oes_sphere.decay_1m.wvec = decay_1m{:,6};
% oes_sphere.decay_1m.inwh = decay_1m{:,7};
% 
% % Sheet 2 = 5 m
% decay_5m = readtable(filename, 'Sheet', 2);
% 
% % Saving 5m decay
% oes_sphere.decay_5m.time = decay_5m{:,1};
% oes_sphere.decay_5m.pds = decay_5m{:,2};
% oes_sphere.decay_5m.inw = decay_5m{:,3};
% oes_sphere.decay_5m.ans = decay_5m{:,4};
% oes_sphere.decay_5m.nrel = decay_5m{:,5};
% oes_sphere.decay_5m.wvec = decay_5m{:,6};
% oes_sphere.decay_5m.inwh = decay_5m{:,7};
% 
% 
% % Text (HydroChrono only)
% decay_1m_hc = readtable('Reference_data\sphere_decay_hc_data.txt');
% 
% % Saving 1m decay (HydroChrono)
% oes_sphere.decay_1m.time_hc = decay_1m_hc{:,1};
% oes_sphere.decay_1m.hc = decay_1m_hc{:,2};
% 
% 
% % MAT (OET linear and partially nonlinear)
% % 1m
% % Linear
% load('oesT10_sphere_decay_1mOutput.mat')
% oes_sphere.decay_1m.time_oet_lin = body.time;
% oes_sphere.decay_1m.oet_lin = body.position(:,3);
% 
% % Nonlinear
% % load('oesT10_sphere_decay_1m_nlOutput.mat')
% 
% % 5m
% %Linear
% load('oesT10_sphere_decay_5mOutput.mat')
% oes_sphere.decay_5m.time_oet_lin = body.time;
% oes_sphere.decay_5m.oet_lin = body.position(:,3);
% 
% % Nonlinear
% % load('oesT10_sphere_decay_5m_nlOutput.mat')
% 
% 
% save('oes_sphere_results.mat','oes_sphere')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Add OET data import above

% OET .mat

% Saving 1m decay (OET Linear)
% decay_1m_oet = readtable('Reference_data\________');
% oes_sphere.decay_1m.time_oet_lin = decay_1m_oet{:,1};
% oes_sphere.decay_1m.oet_lin = decay_1m_oet{:,2};

% Saving 5m decay (OET Linear)
% decay_5m_oet = readtable('Reference_data\________');
% oes_sphere.decay_5m.time_oet_lin = decay_5m_oet{:,1};
% oes_sphere.decay_5m.oet_lin = decay_5m_oet{:,2};

% Saving 1m decay (OET Nonlinear)
% decay_1m_oet = readtable('Reference_data\________');
% oes_sphere.decay_1m.time_oet_nlin = decay_1m_oet{:,1};
% oes_sphere.decay_1m.oet_nlin = decay_1m_oet{:,2};

% Saving 5m decay (OET Nonlinear)
% decay_5m_oet = readtable('Reference_data\________');
% oes_sphere.decay_5m.time_oet_nlin = decay_5m_oet{:,1};
% oes_sphere.decay_5m.oet_nlin = decay_5m_oet{:,2};



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% Add WEC-Sim data import above

% % Saving 1m decay (WS Linear)
% oes_sphere.decay_1m.time_ws_lin = ws_time;
% oes_sphere.decay_1m.ws_lin = ws_pos;
% 
% % Saving 5m decay (WS Linear)
% oes_sphere.decay_5m.time_ws_lin = ws_time5m;
% oes_sphere.decay_5m.ws_lin = ws_pos5m;


%% Load data
load('oes_sphere_results.mat')

%% Default plot settings
Fsize = 12;
AxisLineWidth = 2;
LineWidth = 2;
cog = -2;

%% Plot 1m decay test (full)
figure('Name', 'Decay 1m (full)')

plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.pds, 'DisplayName', 'ProteusDS (Lin)', 'LineWidth', LineWidth)
hold on
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.inw, 'DisplayName', 'InWave (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.ans, '-.', 'DisplayName', 'aNySIM (Nlin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.nrel, '-.', 'DisplayName', 'NREL (CFD)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.wvec, 'DisplayName', 'WaveEC (Lin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time_ws_lin,oes_sphere.decay_1m.ws_lin-cog,'DisplayName','WEC-Sim (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.inwh, 'DisplayName', 'InWave-HOTINT (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time_oet_lin, oes_sphere.decay_1m.oet_lin-cog, '--', 'DisplayName', '\textbf{OET (Lin)}', 'LineWidth', LineWidth, 'Color', [0.0000 0.000 0.0000])
% plot(oes_sphere.decay_1m.time_oet_nlin, oes_sphere.decay_1m.oet_nlin-cog, 'DisplayName', 'OET (NLin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time_hc, oes_sphere.decay_1m.hc-cog, 'DisplayName', 'HydroChrono (Lin)', 'LineWidth', LineWidth, 'Color', [0.0000 0.5000 0.0000])


title('1m Decay Test (full)')
xlabel('Time $[s]$','Interpreter','latex')
ylabel('Heave Position $[m]$','Interpreter','latex')
xlim([0 40])
xticks(0:10:40)
yticks(-1:0.25:1)
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

%% Plot 1m decay test (truncated)
figure('Name', 'Decay 1m (truncated)')

plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.pds, 'DisplayName', 'ProteusDS (Lin)', 'LineWidth', LineWidth)
hold on
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.inw, 'DisplayName', 'InWave (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.ans, '-.', 'DisplayName', 'aNySIM (Nlin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.nrel, '-.', 'DisplayName', 'NREL (CFD)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.wvec, 'DisplayName', 'WaveEC (Lin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time_ws_lin,oes_sphere.decay_1m.ws_lin-cog,'DisplayName','$\textbf{WEC-Sim (Lin)}$','LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.inwh, 'DisplayName', 'InWave-HOTINT (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time_oet_lin, oes_sphere.decay_1m.oet_lin-cog, '--', 'DisplayName', 'OET (Lin)', 'LineWidth', LineWidth, 'Color', [0.0000 0.000 0.0000])
% plot(oes_sphere.decay_1m.time_oet_nlin, oes_sphere.decay_1m.oet_nlin-cog, 'DisplayName', 'OET (NLin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time_hc, oes_sphere.decay_1m.hc-cog, 'DisplayName', 'HydroChrono (Lin)', 'LineWidth', LineWidth, 'Color', [0.0000 0.5000 0.0000])


legend('Location','best','Interpreter','latex')


title('1m Decay Test (truncated)')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
xlim([30 40])
ylim([-0.025 0.025])
xticks(30:5:40)
yticks(-0.025:0.0125:0.025)
% xlim([5 15])
% ylim([-0.6 0.4])
grid off;
% box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend off

%% Plot 5m decay test (full)
figure('Name', 'Decay 5m (full)')

plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.pds, 'DisplayName', 'ProteusDS (Lin)', 'LineWidth', LineWidth)
hold on
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.inw, 'DisplayName', 'InWave (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.ans, '-.', 'DisplayName', 'aNySIM (Nlin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.nrel, '-.', 'DisplayName', 'NREL (CFD)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.wvec, 'DisplayName', 'WaveEC (Lin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time_ws_lin,oes_sphere.decay_5m.ws_lin-cog,'DisplayName','WEC-Sim (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.inwh, 'DisplayName', 'InWave-HOTINT (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time_oet_lin, oes_sphere.decay_5m.oet_lin-cog, '--', 'DisplayName', '\textbf{OET (Lin)}', 'LineWidth', LineWidth, 'Color', [0.0000 0.000 0.0000])
% plot(oes_sphere.decay_5m.time_oet_nlin, oes_sphere.decay_5m.oet_nlin-cog, 'DisplayName', 'OET (NLin)', 'LineWidth', LineWidth)

title('5m Decay Test (full)')
xlabel('Time $[s]$','Interpreter','latex')
ylabel('Heave Position $[m]$','Interpreter','latex')
xlim([0 40])
xticks(0:10:40)
yticks(-5:1:5)
legend('Location','best','Interpreter','latex')


grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

%% Plot 5m decay test (truncated)
figure('Name', 'Decay 5m (truncated)')

plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.pds, 'DisplayName', 'ProteusDS (Lin)', 'LineWidth', LineWidth)
hold on
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.inw, 'DisplayName', 'InWave (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.ans, '-.', 'DisplayName', 'aNySIM (Nlin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.nrel, '-.', 'DisplayName', 'NREL (CFD)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.wvec, 'DisplayName', 'WaveEC (Lin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time_ws_lin,oes_sphere.decay_5m.ws_lin-cog,'DisplayName','$\textbf{WEC-Sim (Lin)}$','LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.inwh, 'DisplayName', 'InWave-HOTINT (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time_oet_lin, oes_sphere.decay_5m.oet_lin-cog, '--', 'DisplayName', 'OET (Lin)', 'LineWidth', LineWidth, 'Color', [0.0000 0.000 0.0000])
% plot(oes_sphere.decay_5m.time_oet_nlin, oes_sphere.decay_5m.oet_nlin-cog, 'DisplayName', 'OET (NLin)', 'LineWidth', LineWidth)


legend('Location','best','Interpreter','latex')


title('5m Decay Test (truncated)')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
xlim([30 40])
ylim([-0.1 0.15])
xticks(30:5:40)
% xlim([5 15])
% ylim([-3 3])
grid off;
% box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend off
