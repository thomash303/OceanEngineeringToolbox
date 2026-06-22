%% Code to plot OET and WEC-Sim results for the OSWEC in irregular waves

%% Load saved data
% OET
% load('oswec_results_oet.mat')

% WEC-Sim
load('oswec_results_ws.mat')

%% Default plot settings
Fsize = 12;
AxisLineWidth = 2;
LineWidth = 2;

%% Plot wave elevation
% Elevation
figure('Name','Wave elevation')
plot(output.wave.time, output.wave.elevation, 'LineWidth', LineWidth);


xlabel('$t\;[s]$', 'Interpreter','latex');
ylabel('$\eta\;[m]$', 'Interpreter','latex');
title('Wave Elevation', 'Interpreter','latex');
legend('Interpreter','latex', 'location', 'best');
ylim([-1.5 1.5])
grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend off

%% Plot pitch position (full)
% Pitch position from start
figure('Name','Pitch position (full)')
plot(output.bodies(1).time, output.bodies(1).position(:,5), 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth);
hold on;
% plot(body(1).time(1:11252), body(1).position(1:11252,5), 'DisplayName', 'OET','--', 'LineWidth', LineWidth);

xlabel('$t\;[s]$', 'Interpreter','latex');
ylabel('$\theta\;[rad]$', 'Interpreter','latex');
ylim([-0.025,0.025])
title('Pitch Position', 'Interpreter','latex');
legend('Interpreter','latex', 'location', 'northwest');
grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend off

%% Plot pitch velocity (full)

% Pitch velocity
figure('Name','Pitch velocity (full)')
plot(output.bodies(1).time, output.bodies(1).velocity(:,5), 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth);
hold on;
% plot(body(1).time, body(1).velocity(:,5), 'DisplayName', 'OET', 'LineWidth', LineWidth);

xlabel('$t\;[s]$', 'Interpreter','latex');
ylabel('$\omega\;[rad/s]$', 'Interpreter','latex');
title('RM3 Pitch Velocity Response', 'Interpreter','latex');
legend('Interpreter','latex', 'location', 'best');
grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend off



%% Plot pitch velocity (truncated)

% Pitch position from middle
figure('Name','Pitch velocity (truncated)')
plot(output.bodies(1).time(1501:2501), output.bodies(1).velocity(1501:2501,5), 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth);
hold on;
% plot(body(1).time(11252:18752), body(1).velocity(11252:18752,5), 'DisplayName', 'OET','--', 'LineWidth', LineWidth);

xlabel('$t\;[s]$', 'Interpreter','latex');
ylabel('$\omega\;[rad/s]$', 'Interpreter','latex');
xlim([150,250])
title('Pitch velocity (truncated)', 'Interpreter','latex');
legend('Interpreter','latex', 'location', 'best');
grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend off