%% Blade positions
% % Time vector
% t = (0:bemt.sim.N-1) * bemt.sim.dt;
% 
% element = 1;  % Element index
% 
% % Extract rb_4 for blade 1
% rb4 = squeeze(bemt.var.rb_4(:, :, 1, element));  % rotor frame
% 
% % Extract rb_1 for all blades
% rb1_blade1 = squeeze(bemt.var.rb_1(:, :, 1, element));
% rb1_blade2 = squeeze(bemt.var.rb_1(:, :, 2, element));
% rb1_blade3 = squeeze(bemt.var.rb_1(:, :, 3, element));
% 
% % Create figure
% figure;
% 
% % --- Subplot 1: azimuthal position for blade 1 ---
% subplot(5,1,1);
% plot(t, bemt.var.psi(:,1)*180/pi, 'LineWidth', 1.5);
% grid on;
% xlabel('Time [s]');
% ylabel('\psi [deg]');
% title('Azimuthal position (\psi) — Blade 1');
% 
% % --- Subplot 2: rb_4 positions for blade 1 ---
% subplot(5,1,2);
% plot(t, rb4(:,1), 'r', t, rb4(:,2), 'g', t, rb4(:,3), 'b', 'LineWidth', 1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('rb_4 [m]');
% title(sprintf('Blade 1, Element %d — Rotor frame positions', element));
% legend('x','y','z','Location','best');
% 
% % --- Subplot 3: rb_1 positions for blade 1 ---
% subplot(5,1,3);
% plot(t, rb1_blade1(:,1), 'r', t, rb1_blade1(:,2), 'g', t, rb1_blade1(:,3), 'b', 'LineWidth', 1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('rb_1 [m]');
% title(sprintf('Blade 1, Element %d — Blade frame positions', element));
% legend('x','y','z','Location','best');
% 
% % --- Subplot 4: rb_1 positions for blade 2 ---
% subplot(5,1,4);
% plot(t, rb1_blade2(:,1), 'r', t, rb1_blade2(:,2), 'g', t, rb1_blade2(:,3), 'b', 'LineWidth', 1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('rb_1 [m]');
% title(sprintf('Blade 2, Element %d — Blade frame positions', element));
% legend('x','y','z','Location','best');
% 
% % --- Subplot 5: rb_1 positions for blade 3 ---
% subplot(5,1,5);
% plot(t, rb1_blade3(:,1), 'r', t, rb1_blade3(:,2), 'g', t, rb1_blade3(:,3), 'b', 'LineWidth', 1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('rb_1 [m]');
% title(sprintf('Blade 3, Element %d — Blade frame positions', element));
% legend('x','y','z','Location','best');
% 
% sgtitle(sprintf('Element %d — Azimuth & Blade Positions', element));

%% Incoming wind
% % Incoming wind with rb_1 over time
% % Time vector
% t = (0:bemt.sim.N-1) * bemt.sim.dt;
% element = 5;  % Blade element index
% 
% % Extract wind velocities
% V0_1_blade1 = squeeze(bemt.var.V0_1(:, :, 1, element));
% V0_1_blade2 = squeeze(bemt.var.V0_1(:, :, 2, element));
% V0_1_blade3 = squeeze(bemt.var.V0_1(:, :, 3, element));
% 
% V0_4_blade1 = squeeze(bemt.var.V0_4(:, :, 1, element));
% V0_4_blade2 = squeeze(bemt.var.V0_4(:, :, 2, element));
% V0_4_blade3 = squeeze(bemt.var.V0_4(:, :, 3, element));
% 
% % Extract rb_1 for blade 1
% rb1 = squeeze(bemt.var.rb_1(:, :, 1, element));  % Blade 1
% 
% % Create figure
% figure;
% 
% % --- Subplot 1: V0_1 for all blades ---
% subplot(4,1,1);
% plot(t, V0_1_blade1(:,1), 'r', t, V0_1_blade1(:,2), 'g', t, V0_1_blade1(:,3), 'b', 'LineWidth', 1.2); hold on;
% plot(t, V0_1_blade2(:,1), '--r', t, V0_1_blade2(:,2), '--g', t, V0_1_blade2(:,3), '--b', 'LineWidth', 1.2);
% plot(t, V0_1_blade3(:,1), ':r', t, V0_1_blade3(:,2), ':g', t, V0_1_blade3(:,3), ':b', 'LineWidth', 1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('V0_1 [m/s]');
% title(sprintf('Incoming Wind — Local Blade Frame (V0_1), Element %d', element));
% legend('Blade1 x','y','z','Blade2 x','y','z','Blade3 x','y','z','Location','best');
% 
% % --- Subplot 2: V0_4 for all blades ---
% subplot(4,1,2);
% plot(t, V0_4_blade1(:,1), 'r', t, V0_4_blade1(:,2), 'g', t, V0_4_blade1(:,3), 'b', 'LineWidth', 1.2); hold on;
% plot(t, V0_4_blade2(:,1), '--r', t, V0_4_blade2(:,2), '--g', t, V0_4_blade2(:,3), '--b', 'LineWidth', 1.2);
% plot(t, V0_4_blade3(:,1), ':r', t, V0_4_blade3(:,2), ':g', t, V0_4_blade3(:,3), ':b', 'LineWidth', 1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('V0_4 [m/s]');
% title(sprintf('Incoming Wind — Rotor Frame (V0_4), Element %d', element));
% legend('Blade1 x','y','z','Blade2 x','y','z','Blade3 x','y','z','Location','best');
% 
% % --- Subplot 3: V0_1,z vs rb_1,x for Blade 1 ---
% subplot(4,1,3);
% plot(rb1(:,1), V0_1_blade1(:,3), 'b', 'LineWidth', 1.2);
% grid on;
% xlabel('rb_1,x [m]');
% ylabel('V0_1,z [m/s]');
% title(sprintf('Blade 1, Element %d — V0_1,z vs rb_1,x', element));
% 
% % --- Subplot 4: rb_1 positions over time for Blade 1 ---
% subplot(4,1,4);
% plot(t, rb1(:,1), 'r', t, rb1(:,2), 'g', t, rb1(:,3), 'b', 'LineWidth', 1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('rb_1 [m]');
% title(sprintf('Blade 1, Element %d — Blade Position rb_1 over time', element));
% legend('x','y','z','Location','best');
% 
% sgtitle(sprintf('Element %d — Incoming Wind and Blade Position', element));

%% Relative Velocity

% %Velocity Plots for Blade Element
% t = (0:bemt.sim.N-1) * bemt.sim.dt;
% blade = 3;    % Blade index
% element = 15;  % Blade element index
% 
% % Extract velocities
% Vrot = squeeze(bemt.var.Vrot_4(:, :, blade, element));   % rotor velocity
% V0   = squeeze(bemt.var.V0_4(:, :, blade, element));     % incoming wind
% W   = squeeze(bemt.var.W(:, :, blade, element));       % induced velocity
% Vrel = squeeze(bemt.var.Vrel_4(:, :, blade, element));   % relative velocity
% 
% % Create figure
% figure;
% 
% % --- Subplot 1: Rotor-induced velocity ---
% subplot(4,1,1);
% plot(t, Vrot(:,1), 'r', t, Vrot(:,2), 'g', t, Vrot(:,3), 'b', 'LineWidth', 1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('Vrot [m/s]');
% title(sprintf('Blade %d, Element %d — Rotation velocity', blade, element));
% legend('x','y','z','Location','best');
% 
% % --- Subplot 2: Incoming wind ---
% subplot(4,1,2);
% plot(t, V0(:,1), 'r', t, V0(:,2), 'g', t, V0(:,3), 'b', 'LineWidth', 1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('V0 [m/s]');
% title(sprintf('Blade %d, Element %d — Incoming wind', blade, element));
% legend('x','y','z','Location','best');
% 
% % --- Subplot 3: Induced velocity ---
% subplot(4,1,3);
% plot(t, W(:,1), 'r', t, W(:,2), 'g', t, W(:,3), 'b', 'LineWidth', 1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('W [m/s]');
% title(sprintf('Blade %d, Element %d — Induced velocity', blade, element));
% legend('x','y','z','Location','best');
% 
% % --- Subplot 4: Relative velocity ---
% subplot(4,1,4);
% plot(t, Vrel(:,1), 'r', t, Vrel(:,2), 'g', t, Vrel(:,3), 'b', 'LineWidth', 1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('Vrel [m/s]');
% title(sprintf('Blade %d, Element %d — Relative velocity', blade, element));
% legend('x','y','z','Location','best');
% 
% sgtitle(sprintf('Blade %d, Element %d — Velocities', blade, element));

%% Induction factor
% 
% % Time vector
% tVec = (0:bemt.sim.N-1) * bemt.sim.dt;
% 
% blade = 1;
% element = 1;
% 
% % Extract variables
% a       = squeeze(bemt.var.a(:, blade, element));
% lambda  = squeeze(bemt.var.lambda(:, blade, element));
% Re      = squeeze(bemt.var.Re(:, blade, element));
% phi     = squeeze(bemt.var.phi(:, blade, element));
% 
% % Create figure with 4 subplots
% figure;
% 
% % --- Subplot 1: Axial induction ---
% subplot(4,1,1);
% plot(tVec, a, 'LineWidth', 1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('a');
% title('Axial induction (a)');
% 
% % --- Subplot 2: Tip-speed ratio ---
% subplot(4,1,2);
% plot(tVec, lambda, 'LineWidth', 1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('\lambda');
% title('Local tip-speed ratio (\lambda)');
% 
% % --- Subplot 3: Reynolds number ---
% subplot(4,1,3);
% plot(tVec, Re, 'LineWidth', 1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('Re');
% title('Reynolds number (Re)');
% 
% % --- Subplot 4: Flow angle ---
% subplot(4,1,4);
% plot(tVec, rad2deg(phi), 'LineWidth', 1.2); % convert to degrees for clarity
% grid on;
% xlabel('Time [s]');
% ylabel('\phi [deg]');
% title('Flow angle (\phi)');
% 
% sgtitle(sprintf('Blade %d, Element %d — BEMT Parameters over Time', blade, element));

%% Angle of attack and quasi-static induced velocity
% % Time vector
% tVec = (0:bemt.sim.N-1) * bemt.sim.dt;
% blade = 1;
% element = 1;
% 
% % Extract variables
% Wqs     = squeeze(bemt.var.Wqs(:, :, blade, element));      % (time, xyz)
% Vrel_4  = squeeze(bemt.var.Vrel_4(:, :, blade, element));   % (time, xyz)
% Vrel_4_norm = sqrt(sum(Vrel_4.^2, 2));                     % magnitude of Vrel_4
% alpha   = squeeze(bemt.var.alpha(:, blade, element));       % (time,)
% 
% % Extract lift and drag coefficients
% Cl = squeeze(bemt.var.Cl(:, blade, element));
% Cd = squeeze(bemt.var.Cd(:, blade, element));
% 
% figure;
% 
% % --- Subplot 1: Wqs x, y, z ---
% subplot(4,1,1);
% plot(tVec, Wqs(:,1),'r', tVec, Wqs(:,2),'g', tVec, Wqs(:,3),'b','LineWidth',1.2);
% grid on; xlabel('Time [s]'); ylabel('Wqs [m/s]');
% title(sprintf('Blade %d, Element %d — Quasi-Steady Induced Velocity', blade, element));
% legend('x','y','z','Location','best');
% 
% % --- Subplot 2: Vrel_4 x, y, z and magnitude ---
% subplot(4,1,2);
% plot(tVec, Vrel_4(:,1),'r', tVec, Vrel_4(:,2),'g', tVec, Vrel_4(:,3),'b', tVec, Vrel_4_norm,'k--','LineWidth',1.2);
% grid on; xlabel('Time [s]'); ylabel('Vrel_4 [m/s]');
% title(sprintf('Blade %d, Element %d — Relative Velocity (Rotor Frame)', blade, element));
% legend('x','y','z','|Vrel_4|','Location','best');
% 
% % --- Subplot 3: Angle of Attack ---
% subplot(4,1,3);
% plot(tVec, rad2deg(alpha),'k','LineWidth',1.5); % convert from rad to deg
% grid on; xlabel('Time [s]'); ylabel('\alpha [deg]');
% title(sprintf('Blade %d, Element %d — Angle of Attack', blade, element));
% 
% % --- Subplot 4: Airfoil coefficients ---
% subplot(4,1,4);
% plot(tVec, Cl, 'r', 'LineWidth', 1.2); hold on;
% plot(tVec, Cd, 'b', 'LineWidth', 1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('Coefficient');
% title(sprintf('Blade %d, Element %d — Airfoil Coefficients', blade, element));
% legend('Cl','Cd','Location','best');
% 
% sgtitle(sprintf('Blade %d, Element %d — Wqs, Vrel_4 & Alpha', blade, element));

%% Quasi-static induced velocity and induced velocity
% % Time vector
% tVec = (0:bemt.sim.N-1) * bemt.sim.dt;
% blade   = 1;
% element = 1;
% 
% % Extract variables
% Wqs   = squeeze(bemt.var.Wqs(:, :, blade, element));   % (time, xyz)
% W     = squeeze(bemt.var.W(:, :, blade, element));     % (time, xyz)
% gamma = squeeze(bemt.var.gamma(:, blade, element));    % (time,)
% 
% figure;
% 
% % --- Subplot 1: Wqs x, y, z ---
% subplot(3,1,1);
% plot(tVec, Wqs(:,1),'r', ...
%      tVec, Wqs(:,2),'g', ...
%      tVec, Wqs(:,3),'b','LineWidth',1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('Wqs [m/s]');
% title(sprintf('Blade %d, Element %d — Quasi-Steady Induced Velocity (Wqs)', blade, element));
% legend('x','y','z','Location','best');
% 
% % --- Subplot 2: W x, y, z ---
% subplot(3,1,2);
% plot(tVec, W(:,1),'r', ...
%      tVec, W(:,2),'g', ...
%      tVec, W(:,3),'b','LineWidth',1.2);
% grid on;
% xlabel('Time [s]');
% ylabel('W [m/s]');
% title(sprintf('Blade %d, Element %d — Induced Velocity (W)', blade, element));
% legend('x','y','z','Location','best');
% 
% % --- Subplot 3: gamma ---
% subplot(3,1,3);
% plot(tVec, gamma,'k','LineWidth',1.5);
% grid on;
% xlabel('Time [s]');
% ylabel('\gamma');
% title(sprintf('Blade %d, Element %d — Skewed Wake Correction (gamma)', blade, element));
% 
% sgtitle(sprintf('Blade %d, Element %d — Wqs, W & Gamma', blade, element));

%% Aerodynamic loads
% Time vector
tVec = (0:bemt.sim.N-1) * bemt.sim.dt;
blade   = 1;
element = 1;

% Extract variables
py = squeeze(bemt.var.py(:, blade, element));
pz = squeeze(bemt.var.pz(:, blade, element));
Ty = squeeze(bemt.var.Ty(:, blade, element));

figure;

% --- Subplot 1: py ---
subplot(3,1,1);
plot(tVec, py, 'LineWidth', 1.2);
grid on;
xlabel('Time [s]');
ylabel('p_y [N/m]');
title(sprintf('Blade %d, Element %d — Tangential Force per Unit Span (p_y)', blade, element));

% --- Subplot 2: pz ---
subplot(3,1,2);
plot(tVec, pz, 'LineWidth', 1.2);
grid on;
xlabel('Time [s]');
ylabel('p_z [N/m]');
title(sprintf('Blade %d, Element %d — Normal Force per Unit Span (p_z)', blade, element));

% --- Subplot 3: Ty ---
subplot(3,1,3);
plot(tVec, Ty, 'LineWidth', 1.2);
grid on;
xlabel('Time [s]');
ylabel('T_y [Nm]');
title(sprintf('Blade %d, Element %d — Torque (T_y)', blade, element));

sgtitle(sprintf('Blade %d, Element %d — py, pz, Ty', blade, element));