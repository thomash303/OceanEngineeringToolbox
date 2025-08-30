

% Number of time steps
Nt = 0:0.01:30;

% Number of blade elements
NbE = 16;

% Number of blades
Nb = 3;

% Preallocate time-averaged vectors over elements for all blades
Thrust_avg = zeros(Nb, NbE);
Torque_avg = zeros(Nb, NbE);
Power_avg  = zeros(Nb, NbE);

load('RPM.mat')
RPMs = RPM.RPM; % These are all actually in rad/s
N = length(RPMs);

for i = 1:N
    RPM = RPMs(i)  * 60 / (2 * pi);
    unsteadyBEMTm

    % Preallocate per case
    Thrust_avg = zeros(Nb, NbE);
    Torque_avg = zeros(Nb, NbE);
    Power_avg  = zeros(Nb, NbE);

    % Loop over blades and blade elements
    for b = 1:Nb
        for k = 1:NbE - 1
            % Time average for element k of blade b
            Thrust_avg(b,k) = mean(bemt.var.fz(:,b,k));
            Torque_avg(b,k) = mean(bemt.var.Ty(:,b,k));
            Power_avg(b,k)  = mean(bemt.var.Py(:,b,k));
        end
    end

    % Totals for this RPM case
    Thrust_total(i) = sum(Thrust_avg(:));
    Torque_total(i) = sum(Torque_avg(:));
    Power_total(i)  = sum(Power_avg(:));
end

%% Plotting
figure;


% Subplot #1 - Angular velocity
subplot(4,1,1)
plot(omega,'x')
xlabel('Test Case #')
ylabel('Angular Velocity (rad/s)')

% Subplot #2 - Thrust force
subplot(4,1,2)
plot(Thrust_total,'x')
xlabel('Test Case #')
ylabel('Thrust Force (N)')

% Subplot #3 - Torque
subplot(4,1,3)
plot(Torque_total,'x')
xlabel('Test Case #')
ylabel('Torque (N·m)')

% Subplot #4 - Mechanical power
subplot(4,1,4)
plot(Power_total,'x')
xlabel('Test Case #')
ylabel('Mechanical Power (W)')

sgtitle('BEMT Results for 1.4 m/s flow speed')