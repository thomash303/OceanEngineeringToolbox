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
% oes_sphere.decay_1m.mrn = decay_1m{:,4};
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
% oes_sphere.decay_5m.mrn = decay_5m{:,4};
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
% save('oes_sphere.mat','oes_sphere')


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


%% Load data
load('oes_sphere.mat')

%% Default plot settings
Fsize = 12;
AxisLineWidth = 2;
LineWidth = 2;

%% Plot 1m decay test (full)
figure('Name', 'Decay 1m (full)')

plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.pds, 'DisplayName', 'ProdeusDS (Lin)', 'LineWidth', LineWidth)
hold on
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.inw, 'DisplayName', 'InWave (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.mrn, 'DisplayName', 'Marin (Nlin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.nrel, 'DisplayName', 'NREL (CFD)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.wvec, 'DisplayName', 'WaveEC (Lin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.inwh, 'DisplayName', 'InWave-HOTINT (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time_hc, oes_sphere.decay_1m.hc+2, 'DisplayName', 'HydroChrono (Lin)', 'LineWidth', LineWidth)
% plot(oes_sphere.decay_1m.time_oet_lin, oes_sphere.decay_1m.oet_lin, 'DisplayName', 'OET (Lin)', 'LineWidth', LineWidth)
% plot(oes_sphere.decay_1m.time_oet_nlin, oes_sphere.decay_1m.oet_nlin, 'DisplayName', 'OET (NLin)', 'LineWidth', LineWidth)

title('1m Decay Test (full)')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
xlim([0 40])

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

plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.pds, 'DisplayName', 'ProdeusDS (Lin)', 'LineWidth', LineWidth)
hold on
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.inw, 'DisplayName', 'InWave (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.mrn, 'DisplayName', 'Marin (Nlin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.nrel, 'DisplayName', 'NREL (CFD)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.wvec, 'DisplayName', 'WaveEC (Lin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time, oes_sphere.decay_1m.inwh, 'DisplayName', 'InWave-HOTINT (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_1m.time_hc, oes_sphere.decay_1m.hc+2, 'DisplayName', 'HydroChrono (Lin)', 'LineWidth', LineWidth)

% plot(oes_sphere.decay_5m.time_oet_lin, oes_sphere.decay_5m.oet_lin, 'DisplayName', 'OET (Lin)', 'LineWidth', LineWidth)
% plot(oes_sphere.decay_5m.time_oet_nlin, oes_sphere.decay_5m.oet_nlin, 'DisplayName', 'OET (NLin)', 'LineWidth', LineWidth)

title('1m Decay Test (truncated)')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
xlim([30 40])
ylim([-0.025 0.025])
grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

%% Plot 5m decay test (full)
figure('Name', 'Decay 5m (full)')

plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.pds, 'DisplayName', 'ProdeusDS (Lin)', 'LineWidth', LineWidth)
hold on
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.inw, 'DisplayName', 'InWave (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.mrn, 'DisplayName', 'Marin (Nlin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.nrel, 'DisplayName', 'NREL (CFD)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.wvec, 'DisplayName', 'WaveEC (Lin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.inwh, 'DisplayName', 'InWave-HOTINT (Lin)','LineWidth', LineWidth)
% plot(oes_sphere.decay_5m.time_oet_lin, oes_sphere.decay_5m.oet_lin, 'DisplayName', 'OET (Lin)', 'LineWidth', LineWidth)
% plot(oes_sphere.decay_5m.time_oet_nlin, oes_sphere.decay_5m.oet_nlin, 'DisplayName', 'OET (NLin)', 'LineWidth', LineWidth)

title('5m Decay Test (full)')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
xlim([0 40])

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

plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.pds, 'DisplayName', 'ProdeusDS (Lin)', 'LineWidth', LineWidth)
hold on
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.inw, 'DisplayName', 'InWave (Lin)','LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.mrn, 'DisplayName', 'Marin (Nlin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.nrel, 'DisplayName', 'NREL (CFD)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.wvec, 'DisplayName', 'WaveEC (Lin)', 'LineWidth', LineWidth)
plot(oes_sphere.decay_5m.time, oes_sphere.decay_5m.inwh, 'DisplayName', 'InWave-HOTINT (Lin)','LineWidth', LineWidth)
% plot(oes_sphere.decay_5m.time_oet_lin, oes_sphere.decay_5m.oet_lin, 'DisplayName', 'OET (Lin)', 'LineWidth', LineWidth)
% plot(oes_sphere.decay_5m.time_oet_nlin, oes_sphere.decay_5m.oet_nlin, 'DisplayName', 'OET (NLin)', 'LineWidth', LineWidth)

title('5m Decay Test (truncated)')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
xlim([30 40])
ylim([-0.1 0.15])
grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off
