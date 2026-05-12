%% Saving data to original structures

%% Saving data
% oswec = struct();
% 
% Decay
% % WEC-Sim
% oswec.decay_10d.time_ws = output.bodies(1).time;
% oswec.decay_10d.ws_pos = output.bodies(1).position(:,5);
% 
% % OET
% decay_10d_oet = load('OSWECOutput.mat');
% oswec.decay_10d.time_oet = body.time;
% oswec.decay_10d.oet_pos = body.position(:,5);
% 

% Regular
% WEC-Sim
% oswec.regular.time_ws = output.bodies(1).time;
% oswec.regular.ws_pos = output.bodies(1).position(:,5);
% oswec.regular.ws_vel = output.bodies(1).velocity(:,5);

% OET
% oswec.regular.time_oet2 = body.time;
% oswec.regular.oet_pos2 = body.position(:,5);
% oswec.regular.oet_vel2 = body.velocity(:,5);

% % Irregular
% WEC-Sim
% oswec.irregular.time_ws = output.bodies(1).time;
% oswec.irregular.ws_pos = output.bodies(1).position(:,5);
% oswec.irregular.ws_vel = output.bodies(1).velocity(:,5);

% OET
% oswec.irregular.time_oet2 = body.time;
% oswec.irregular.oet_pos2 = body.position(:,5);
% oswec.irregular.oet_vel2 = body.velocity(:,5);
% 
% save('oswec_results.mat','oswec')



%% Load data
load('oswec_results.mat')

%% Default plot settings
Fsize = 12;
AxisLineWidth = 2;
LineWidth = 2;
cog = -2;
colors = get(groot,'defaultAxesColorOrder');
blue = colors(1,:);
orange = colors(2,:);

%% Plot 10deg decay test (full)
figure('Name', 'Decay 10deg (full)')

plot(oswec.decay_10d.time_ws, oswec.decay_10d.ws_pos, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
plot(oswec.decay_10d.time_oet, oswec.decay_10d.oet_pos, '--', 'DisplayName', 'OET','LineWidth', LineWidth)
title('10deg Decay Test (full)')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$\theta\;[rad]$','Interpreter','latex')
xlim([0 400])
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

%% Plot 10deg decay test (truncated)
figure('Name', 'Decay 10deg (truncated)')

plot(oswec.decay_10d.time_ws, oswec.decay_10d.ws_pos, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
plot(oswec.decay_10d.time_oet, oswec.decay_10d.oet_pos, '--', 'DisplayName', 'OET','LineWidth', LineWidth)

title('10deg Decay Test (truncated)')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$\theta\;[rad]$','Interpreter','latex')
xlim([300 350])
yticks(-0.08:0.04:0.08)
xticks(300:25:350)

legend('Location','best','Interpreter','latex')

grid off;
% box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

%% Plot regular wave
figure('Name', 'Regular')

subplot(2,1,1)
plot(oswec.regular.time_ws, oswec.regular.ws_pos, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
plot(oswec.regular.time_oet2, oswec.regular.oet_pos2, '--', 'DisplayName', 'OET','LineWidth', LineWidth)
title('Regular')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$\theta\;[rad]$','Interpreter','latex')
xlim([0 400])
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

subplot(2,1,2)
plot(oswec.regular.time_ws, oswec.regular.ws_vel, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
plot(oswec.regular.time_oet2, oswec.regular.oet_vel2, '--', 'DisplayName', 'OET','LineWidth', LineWidth)
title('Regular')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$\omega\;[rad]$','Interpreter','latex')
xlim([0 400])
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

%% 
figure('Name', 'Regular heave')

subplot(2,1,1)
plot(oswec.regular.time_ws, output.bodies(1).position(:,3), 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
plot(oswec.regular.time_oet, body.position(:,3), 'DisplayName', 'OET','LineWidth', LineWidth)
title('Regular')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$\theta\;[rad]$','Interpreter','latex')
xlim([0 400])

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

%% Irregular wave
figure('Name', 'Irregular')

subplot(2,1,1)
plot(oswec.irregular.time_ws, oswec.irregular.ws_pos, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
plot(oswec.irregular.time_oet2, oswec.irregular.oet_pos2, '--', 'DisplayName', 'OET','LineWidth', LineWidth)
title('Irregular')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$\theta\;[rad]$','Interpreter','latex')
xlim([0 400])
legend('Location','best','Interpreter','latex')


grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

subplot(2,1,2)
plot(oswec.irregular.time_ws, oswec.irregular.ws_vel, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
plot(oswec.irregular.time_oet2, oswec.irregular.oet_vel2, '--', 'DisplayName', 'OET','LineWidth', LineWidth)
title('Irregular')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$\omega\;[rad]$','Interpreter','latex')
xlim([0 400])
legend('Location','best','Interpreter','latex')


grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off