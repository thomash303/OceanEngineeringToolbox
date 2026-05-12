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


% OET
% rm3.regular.oet.time = body.time;
% rm3.regular.oet.float.pos_heave = body(1).position(:,3);
% rm3.regular.oet.float.vel_heave = body(1).velocity(:,3);
% rm3.regular.oet.spar.pos_heave = body(2).poheavesition(:,3);
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


% OET
% rm3.regular.oet.b2b.time = body.time;
% rm3.regular.oet.b2b.float.pos_heave = body(1).position(:,3);
% rm3.regular.oet.b2b.float.vel_heave = body(1).velocity(:,3);
% rm3.regular.oet.b2b.spar.pos_heave = body(2).poheavesition(:,3);
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


% OET
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

% 
save('rm3_results.mat','rm3')



%% Load data
load('rm3_results.mat')

%% Default plot settings
Fsize = 12;
AxisLineWidth = 2;
LineWidth = 2;

%% Regular wave (No B2B)
figure('Name', 'Regular - No B2B (heave)')
subplot(2,1,1)
plot(rm3.regular.ws.time, rm3.regular.ws.float.pos_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
%plot(rm3.regular.oet.time, rm3.regular.oet.float.pos_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)

title('Float Heave')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
xlim([0 400])
legend('Location','best','Interpreter','latex')
legend boxoff

subplot(2,1,2)
plot(rm3.regular.ws.time, rm3.regular.ws.float.pos_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
%plot(rm3.regular.oet.time, rm3.regular.oet.float.pos_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)

title('Float Pitch')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$\theta\;[rad]$','Interpreter','latex')
xlim([0 400])
legend('Location','best','Interpreter','latex')
legend boxoff



subplot(2,1,2)
plot(rm3.regular.ws.time, rm3.regular.ws.spar.pos_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
%plot(rm3.regular.oet.time, rm3.regular.oet.spar.pos_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)

title('Spar Heave')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
xlim([0 400])
legend('Location','best','Interpreter','latex')
legend boxoff

subplot(2,1,2)
plot(rm3.regular.ws.time, rm3.regular.ws.spar.pos_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
%plot(rm3.regular.oet.time, rm3.regular.oet.spar.pos_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)

title('Spar Pitch')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$\theta\;[rad]$','Interpreter','latex')
xlim([0 400])
legend('Location','best','Interpreter','latex')
legend boxoff


%% Regular wave (B2B)
figure('Name', 'Regular - B2B')

subplot(2,2,1)
plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.float.pos_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
%plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.float.pos_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)

title('Float Heave')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
xlim([0 400])
legend('Location','best','Interpreter','latex')
legend boxoff

subplot(2,2,2)
plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.float.pos_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
%plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.float.pos_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)

title('Float Pitch')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$\theta\;[rad]$','Interpreter','latex')
xlim([0 400])
legend('Location','best','Interpreter','latex')
legend boxoff

subplot(2,2,3)
plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.spar.pos_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
%plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.spar.pos_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)

title('Spar Heave')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
xlim([0 400])
legend('Location','best','Interpreter','latex')
legend boxoff

subplot(2,2,4)
plot(rm3.regular.ws.b2b.time, rm3.regular.ws.b2b.spar.pos_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
%plot(rm3.regular.oet.b2b.time, rm3.regular.oet.b2b.spar.pos_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)

title('Spar Pitch')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$\theta\;[rad]$','Interpreter','latex')
xlim([0 400])
legend('Location','best','Interpreter','latex')
legend boxoff


%% Irregular wave (No B2B)
figure('Name', 'Irregular - No B2B')

subplot(2,2,1)
plot(rm3.irreglar.ws.time, rm3.irreglar.ws.float.pos_heave, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
%plot(rm3.irreglar.oet.time, rm3.irreglar.oet.float.pos_heave, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)

title('Float Heave')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$z\;[m]$','Interpreter','latex')
xlim([0 400])
legend('Location','best','Interpreter','latex')
legend boxoff

subplot(2,2,2)
plot(rm3.irreglar.ws.time, rm3.irreglar.ws.float.pos_pitch, 'DisplayName', 'WEC-Sim', 'LineWidth', LineWidth)
hold on
%plot(rm3.irreglar.oet.time, rm3.irreglar.oet.float.pos_pitch, '--', 'DisplayName', 'OET', 'LineWidth', LineWidth)

title('Float Pitch')
xlabel('$t\;[s]$','Interpreter','latex')
ylabel('$\theta\;[rad]$','Interpreter','latex')
xlim([0 400])
legend('Location','best','Interpreter','latex')
legend box off