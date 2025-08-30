% Extract signals
RPM     = squeeze(out.RPM(1,1,:));       % rpm
angVelocity = RPM * ones(size(time)) * 2*pi/60;
Thrust  = squeeze(out.Thrust(1,1,:));    % N
Torque  = squeeze(out.Torque(1,1,:));    % Nm
Power   = squeeze(out.Power(1,1,:));     % W
time    = squeeze(out.tout(:,1));        % s

% Create figure
figure('Color','w','Position',[100 100 900 800]);

% --------- Subplot 1: RPM ----------
subplot(4,1,1);
plot(time, angVelocity, 'm', 'LineWidth', 1.5);
xlabel('Time [s]');
ylabel('RPM');
grid on;
title('Turbine RPM vs Time');

% --------- Subplot 2: Thrust ----------
subplot(4,1,2);
plot(time, Thrust, 'b', 'LineWidth', 1.5);
xlabel('Time [s]');
ylabel('Thrust [N]');
grid on;
title('Turbine Thrust vs Time');

% --------- Subplot 3: Torque ----------
subplot(4,1,3);
plot(time, Torque, 'r', 'LineWidth', 1.5);
xlabel('Time [s]');
ylabel('Torque [Nm]');
grid on;
title('Turbine Torque vs Time');

% --------- Subplot 4: Power ----------
subplot(4,1,4);
plot(time, Power, 'k', 'LineWidth', 1.5);
xlabel('Time [s]');
ylabel('Power [W]');
grid on;
title('Turbine Power vs Time');

% Optional: overall title
sgtitle('Turbine Performance Metrics');
