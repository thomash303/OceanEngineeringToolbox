%% Saving data to original structures

%% Saving data
% rm3 = struct();
% 

% Regular
% No B2B
% % WEC-Sim
% rm3.regular.ws.time = output.bodies(1).time;
% rm3.regular.ws.float.pos_heave = output.bodies(1).position(:,3);
% rm3.regular.ws.float.vel_heave = output.bodies(1).velocity(:,3);
% rm3.regular.ws.spar.pos_heave = output.bodies(2).position(:,3);
% rm3.regular.ws.spar.vel_heave = output.bodies(2).velocity(:,3);
% rm3.regular.ws.float.pos_pitch = output.bodies(1).position(:,5);
% rm3.regular.ws.float.vel_pitch = output.bodies(1).velocity(:,5);
% rm3.regular.ws.spar.pos_pitch = output.bodies(2).position(:,5);
% rm3.regular.ws.spar.vel_pitch = output.bodies(2).velocity(:,5);


% % OET
% rm3.regular.oet.time = body.time;
% rm3.regular.oet.float.pos_heave = body(1).position(:,3);
% rm3.regular.oet.float.vel_heave = body(1).velocity(:,3);
% rm3.regular.oet.spar.pos_heave = body(2).position(:,3);
% rm3.regular.oet.spar.vel_heave = body(2).velocity(:,3);
% rm3.regular.oet.float.pos_pitch = body(1).position(:,5);
% rm3.regular.oet.float.vel_pitch = body(1).velocity(:,5);
% rm3.regular.oet.spar.pos_pitch = body(2).position(:,5);
% rm3.regular.oet.spar.vel_pitch = body(2).velocity(:,5);

% B2B
% % WEC-Sim
% rm3.regular.ws.b2b.time = output.bodies(1).time;
% rm3.regular.ws.b2b.float.pos_heave = output.bodies(1).position(:,3);
% rm3.regular.ws.b2b.float.vel_heave = output.bodies(1).velocity(:,3);
% rm3.regular.ws.b2b.spar.pos_heave = output.bodies(2).position(:,3);
% rm3.regular.ws.b2b.spar.vel_heave = output.bodies(2).velocity(:,3);
% rm3.regular.ws.b2b.float.pos_pitch = output.bodies(1).position(:,5);
% rm3.regular.ws.b2b.float.vel_pitch = output.bodies(1).velocity(:,5);
% rm3.regular.ws.b2b.spar.pos_pitch = output.bodies(2).position(:,5);
% rm3.regular.ws.b2b.spar.vel_pitch = output.bodies(2).velocity(:,5);


% % OET
% rm3.regular.oet.b2b.time = body.time;
% rm3.regular.oet.b2b.float.pos_heave = body(1).position(:,3);
% rm3.regular.oet.b2b.float.vel_heave = body(1).velocity(:,3);
% rm3.regular.oet.b2b.spar.pos_heave = body(2).position(:,3);
% rm3.regular.oet.b2b.spar.vel_heave = body(2).velocity(:,3);
% rm3.regular.oet.b2b.float.pos_pitch = body(1).position(:,5);
% rm3.regular.oet.b2b.float.vel_pitch = body(1).velocity(:,5);
% rm3.regular.oet.b2b.spar.pos_pitch = body(2).position(:,5);
% rm3.regular.oet.b2b.spar.vel_pitch = body(2).velocity(:,5);

% % Irregular
% No B2B
% WEC-Sim
% rm3.irreglar.ws.time = output.bodies(1).time;
% rm3.irreglar.ws.float.pos_heave = output.bodies(1).position(:,3);
% rm3.irreglar.ws.float.vel_heave = output.bodies(1).velocity(:,3);
% rm3.irreglar.ws.spar.pos_heave = output.bodies(2).position(:,3);
% rm3.irreglar.ws.spar.vel_heave = output.bodies(2).velocity(:,3);
% rm3.irreglar.ws.float.pos_pitch = output.bodies(1).position(:,5);
% rm3.irreglar.ws.float.vel_pitch = output.bodies(1).velocity(:,5);
% rm3.irreglar.ws.spar.pos_pitch = output.bodies(2).position(:,5);
% rm3.irreglar.ws.spar.vel_pitch = output.bodies(2).velocity(:,5);


% % OET
% rm3.irreglar.oet.time = body.time;
% rm3.irreglar.oet.float.pos_heave = body(1).position(:,3);
% rm3.irreglar.oet.float.vel_heave = body(1).velocity(:,3);
% rm3.irreglar.oet.spar.pos_heave = body(2).position(:,3);
% rm3.irreglar.oet.spar.vel_heave = body(2).velocity(:,3);
% rm3.irreglar.oet.float.pos_pitch = body(1).position(:,5);
% rm3.irreglar.oet.float.vel_pitch = body(1).velocity(:,5);
% rm3.irreglar.oet.spar.pos_pitch = body(2).position(:,5);
% rm3.irreglar.oet.spar.vel_pitch = body(2).velocity(:,5);

% B2B
% % WEC-Sim
% rm3.irreglar.ws.b2b.time = output.bodies(1).time;
% rm3.irreglar.ws.b2b.float.pos_heave = output.bodies(1).position(:,3);
% rm3.irreglar.ws.b2b.float.vel_heave = output.bodies(1).velocity(:,3);
% rm3.irreglar.ws.b2b.spar.pos_heave = output.bodies(2).position(:,3);
% rm3.irreglar.ws.b2b.spar.vel_heave = output.bodies(2).velocity(:,3);
% rm3.irreglar.ws.b2b.float.pos_pitch = output.bodies(1).position(:,5);
% rm3.irreglar.ws.b2b.float.vel_pitch = output.bodies(1).velocity(:,5);
% rm3.irreglar.ws.b2b.spar.pos_pitch = output.bodies(2).position(:,5);
% rm3.irreglar.ws.b2b.spar.vel_pitch = output.bodies(2).velocity(:,5);


% OET
% rm3.irreglar.oet.b2b.time = body.time;
% rm3.irreglar.oet.b2b.float.pos_heave = body(1).position(:,3);
% rm3.irreglar.oet.b2b.float.vel_heave = body(1).velocity(:,3);
% rm3.irreglar.oet.b2b.spar.pos_heave = body(2).position(:,3);
% rm3.irreglar.oet.b2b.spar.vel_heave = body(2).velocity(:,3);
% rm3.irreglar.oet.b2b.float.pos_pitch = body(1).position(:,5);
% rm3.irreglar.oet.b2b.float.vel_pitch = body(1).velocity(:,5);
% rm3.irreglar.oet.b2b.spar.pos_pitch = body(2).position(:,5);
% rm3.irreglar.oet.b2b.spar.vel_pitch = body(2).velocity(:,5);

% Regular spar decay

% rm3.decay.oet.time = body.time;
% rm3.decy.oet.spar.pos_heave = body(2).position(:,3);
% 
% save('rm3_results.mat','rm3')



%% Load data
load('rm3_results.mat')

%% Default plot settings
Fsize = 12;
AxisLineWidth = 2;
LineWidth = 2;

%% Regular wave (B2B) -
figure('Name','Regular B2B - Float & Pitch A')

subplot(2,1,1)
plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.float.pos_heave, 'LineWidth', LineWidth); hold on
plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.float.pos_heave, '--', 'LineWidth', LineWidth)
plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.spar.pos_heave, 'LineWidth', LineWidth)
plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.spar.pos_heave, '--', 'LineWidth', LineWidth)

title('Heave Position','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
legend('WEC-Sim (float)','OET (float)','WEC-Sim (spar)','OET (spar)','Location','best','Interpreter','latex')
xlim([0 400])

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

subplot(2,1,2)
plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.float.vel_heave, 'LineWidth', LineWidth); hold on
plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.float.vel_heave, '--', 'LineWidth', LineWidth)
plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.spar.vel_heave, 'LineWidth', LineWidth)
plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.spar.vel_heave, '--', 'LineWidth', LineWidth)

title('Heave Velocity','Interpreter','latex')
ylabel('$v\;[m/s]$','Interpreter','latex')
legend('Float WS','Float OET','Spar WS','Spar OET','Location','best','Interpreter','latex')
xlim([0 400])

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off


figure('Name','Regular B2B - Float & Pitch B')

subplot(2,1,1)
plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.float.pos_pitch, 'LineWidth', LineWidth); hold on
plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.float.pos_pitch, '--', 'LineWidth', LineWidth)

title('Pitch Position (Float)','Interpreter','latex')
ylabel('$\theta$ [rad]','Interpreter','latex')
legend('WS','OET','Location','best','Interpreter','latex')
xlim([0 400])

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

subplot(2,1,2)
plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.float.vel_pitch, 'LineWidth', LineWidth); hold on
plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.float.vel_pitch, '--', 'LineWidth', LineWidth)

title('Pitch Velocity (Float)','Interpreter','latex')
ylabel('$\omega$ [rad/s]','Interpreter','latex')
xlabel('$t\;[s]$','Interpreter','latex')
legend('WS','OET','Location','best','Interpreter','latex')
xlim([0 400])
yticks(-0.02:0.01:0.02)
xlabel('t [s]','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

figure('Name', 'Regular - B2B - Float and spar Position')

subplot(2,1,1)
plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.float.pos_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.float.pos_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)

title('Float Heave','Interpreter','latex')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
xlim([100 200])
xticks(100:25:200)
legend('Location','best','Interpreter','latex')

set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

subplot(2,1,2)
plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.spar.pos_heave, ...
    'DisplayName', 'WEC-Sim', ...
    'LineWidth', LineWidth, ...
    'Color', [0.9290 0.6940 0.1250])
hold on
plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.spar.pos_heave, '--', ...
    'DisplayName', 'OET', ...
    'LineWidth', LineWidth, ...
    'Color', [0.4940 0.1840 0.5560])   
yline(-21.29, '-.', 'Color', [0.4660 0.6740 0.1880], ...
    'LineWidth', LineWidth, ...
    'DisplayName', 'Hydrostatic equilibrium (spar)')

title('Spar Heave','Interpreter','latex')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
xlim([250 350])
xticks(250:25:350)
ylim([-21.45 -21.05])
yticks(-21.45:0.2:-21.05)
legend('Location','best','Interpreter','latex')

set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

%% Irregular wave (B2B) -
figure('Name','Irregular B2B - Positions and Pitch A')

subplot(2,1,1)
plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.float.pos_heave, 'LineWidth', LineWidth); hold on
plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.float.pos_heave, '--', 'LineWidth', LineWidth)
plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.spar.pos_heave, 'LineWidth', LineWidth)
plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.spar.pos_heave, '--', 'LineWidth', LineWidth)

title('Heave Position','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')

legend('WEC-Sim (float)','OET (float)','WEC-Sim (spar)','OET (spar)','Location','best','Interpreter','latex')
xlim([0 400])

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

subplot(2,1,2)
plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.float.vel_heave, 'LineWidth', LineWidth); hold on
plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.float.vel_heave, '--', 'LineWidth', LineWidth)
plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.spar.vel_heave, 'LineWidth', LineWidth)
plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.spar.vel_heave, '--', 'LineWidth', LineWidth)

title('Heave Velocity','Interpreter','latex')
ylabel('$v\;[m/s]$','Interpreter','latex')

legend('Float WS','Float OET','Spar WS','Spar OET','Location','best','Interpreter','latex')
xlim([0 400])

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off


figure('Name','Irregular B2B - Positions and Pitch A')

subplot(2,1,1)
plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.float.pos_pitch, 'LineWidth', LineWidth); hold on
plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.float.pos_pitch, '--', 'LineWidth', LineWidth)

title('Pitch Position (Float)','Interpreter','latex')
ylabel('$\theta\;[rad]$','Interpreter','latex')

legend('WS','OET','Location','best','Interpreter','latex')
xlim([0 400])

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

subplot(2,1,2)
plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.float.vel_pitch, 'LineWidth', LineWidth); hold on
plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.float.vel_pitch, '--', 'LineWidth', LineWidth)

title('Pitch Velocity (Float)','Interpreter','latex')
ylabel('$\omega\;[rad/s]$','Interpreter','latex')
xlabel('$t\;[s]$','Interpreter','latex')

legend('WS','OET','Location','best','Interpreter','latex')
xlim([0 400])
xlabel('t [s]','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

%%
figure('Name', 'Irregular - B2B - Float and spar Position')

subplot(2,1,1)
plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.float.pos_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.float.pos_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)

title('Float Heave','Interpreter','latex')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
xlim([300 375])
xticks(300:25:375)
yticks(-2:1:1)

legend('Location','best','Interpreter','latex')

set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

subplot(2,1,2)
plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.spar.pos_heave, ...
    'DisplayName', 'WEC-Sim', ...
    'LineWidth', LineWidth, ...
    'Color', [0.9290 0.6940 0.1250])  
hold on
plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.spar.pos_heave, '--', ...
    'DisplayName', 'OET', ...
    'LineWidth', LineWidth, ...
    'Color', [0.4940 0.1840 0.5560])   

title('Spar Heave','Interpreter','latex')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
xlim([100 300])
xticks(100:50:300)
yticks(-21.5:0.25:-21)
ylim([-21.5 -21])

legend('Location','best','Interpreter','latex')

set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth);
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

%% Spar decay
figure('Name', 'Spar Decay')

subplot(2,1,1)
yline(-21.29, '-.', 'Color', [0.4660 0.6740 0.1880], ...
    'LineWidth', LineWidth, ...
    'DisplayName', 'Hydrostatic equilibrium (spar)')
hold on
plot(rm3.decay.oet.time, rm3.decy.oet.spar.pos_heave, '--', ...
    'DisplayName', 'OET', ...
    'LineWidth', LineWidth, ...
    'Color', [0.4940 0.1840 0.5560])

title('Spar Heave','Interpreter','latex')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
legend('Location','best','Interpreter','latex')

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend off


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %% Regular wave (No B2B)
% figure('Name', 'Regular - No B2B - Float Position')
% subplot(2,1,1)
% plot(rm3.regular.ws.time, rm3.regular.ws.float.pos_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.time, rm3.regular.oet.float.pos_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$z\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.regular.ws.time, rm3.regular.ws.float.pos_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.time, rm3.regular.oet.float.pos_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\theta\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% 
% figure('Name', 'Regular - No B2B - Spar Position')
% subplot(2,1,1)
% plot(rm3.regular.ws.time, rm3.regular.ws.spar.pos_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.time, rm3.regular.oet.spar.pos_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$z\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.regular.ws.time, rm3.regular.ws.spar.pos_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.time, rm3.regular.oet.spar.pos_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\theta\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% figure('Name', 'Regular - No B2B - Float Velocity')
% subplot(2,1,1)
% plot(rm3.regular.ws.time, rm3.regular.ws.float.vel_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.time, rm3.regular.oet.float.vel_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$v\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.regular.ws.time, rm3.regular.ws.float.vel_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.time, rm3.regular.oet.float.vel_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\omega\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% 
% figure('Name', 'Regular - No B2B - Spar Velocity')
% subplot(2,1,1)
% plot(rm3.regular.ws.time, rm3.regular.ws.spar.vel_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.time, rm3.regular.oet.spar.vel_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$v\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.regular.ws.time, rm3.regular.ws.spar.vel_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.time, rm3.regular.oet.spar.vel_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\omega\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% 
% %% Regular wave (B2B)
% figure('Name', 'Regular - B2B - Float Position')
% 
% subplot(2,1,1)
% plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.float.pos_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.float.pos_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$z\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.float.pos_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.float.pos_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\theta\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% 
% figure('Name', 'Regular - B2B - Spar Position')
% 
% subplot(2,1,1)
% plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.spar.pos_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.spar.pos_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$z\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.spar.pos_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.spar.pos_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\theta\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% 
% figure('Name', 'Regular - B2B - Float Velocity')
% 
% subplot(2,1,1)
% plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.float.vel_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.float.vel_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$v\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.float.vel_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.float.vel_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\omega\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% 
% figure('Name', 'Regular - B2B - Spar Velocity')
% 
% subplot(2,1,1)
% plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.spar.vel_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.spar.vel_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$v\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.spar.vel_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.spar.vel_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\omega\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% %% Irregular wave (No B2B)
% figure('Name', 'Irregular - No B2B - Float Position')
% 
% subplot(2,1,1)
% plot(rm3.irreglar.ws.time, rm3.irreglar.ws.float.pos_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.time, rm3.irreglar.oet.float.pos_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$z\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.irreglar.ws.time, rm3.irreglar.ws.float.pos_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.time, rm3.irreglar.oet.float.pos_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\theta\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% 
% figure('Name', 'Irregular - No B2B - Spar Position')
% 
% subplot(2,1,1)
% plot(rm3.irreglar.ws.time, rm3.irreglar.ws.spar.pos_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.time, rm3.irreglar.oet.spar.pos_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$z\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.irreglar.ws.time, rm3.irreglar.ws.spar.pos_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.time, rm3.irreglar.oet.spar.pos_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\theta\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% 
% figure('Name', 'Irregular - No B2B - Float Velocity')
% 
% subplot(2,1,1)
% plot(rm3.irreglar.ws.time, rm3.irreglar.ws.float.vel_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.time, rm3.irreglar.oet.float.vel_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$v\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.irreglar.ws.time, rm3.irreglar.ws.float.vel_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.time, rm3.irreglar.oet.float.vel_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\omega\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% 
% figure('Name', 'Irregular - No B2B - Spar Velocity')
% 
% subplot(2,1,1)
% plot(rm3.irreglar.ws.time, rm3.irreglar.ws.spar.vel_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.time, rm3.irreglar.oet.spar.vel_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$v\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.irreglar.ws.time, rm3.irreglar.ws.spar.vel_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.time, rm3.irreglar.oet.spar.vel_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\omega\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% 
% %% Irregular wave (B2B)
% figure('Name', 'Irregular - B2B - Float Position')
% 
% subplot(2,1,1)
% plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.float.pos_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.float.pos_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$z\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.float.pos_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.float.pos_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\theta\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% 
% figure('Name', 'Irregular - B2B - Spar Position')
% 
% subplot(2,1,1)
% plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.spar.pos_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.spar.pos_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$z\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.spar.pos_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.spar.pos_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\theta\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% 
% figure('Name', 'Irregular - B2B - Float Velocity')
% 
% subplot(2,1,1)
% plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.float.vel_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.float.vel_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$v\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.float.vel_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.float.vel_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Float Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\omega\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% 
% figure('Name', 'Irregular - B2B - Spar Velocity')
% 
% subplot(2,1,1)
% plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.spar.vel_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.spar.vel_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Heave')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$v\;[m]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff
% 
% subplot(2,1,2)
% plot(rm3.irreglar.ws.b2b.time, rm3.irreglar.ws.b2b.spar.vel_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
% hold on
% plot(rm3.irreglar.oet.b2b.time, rm3.irreglar.oet.b2b.spar.vel_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)
% 
% title('Spar Pitch')
% xlabel('$t\;[s]$','Interpreter','latex')
% ylabel('$\omega\;[rad]$','Interpreter','latex')
% xlim([0 400])
% legend('Location','best','Interpreter','latex')
% legend boxoff