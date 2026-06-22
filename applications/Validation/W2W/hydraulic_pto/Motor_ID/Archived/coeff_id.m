



% subplot(2,1,1)
% plot(N_exp_D100_P50,q_exp_D100_P50)
% subplot(2,1,2)



% omega = N_exp *2 * pi/ 60;
D_in = 180; % motor displacement (cc/rev)
D = D_in / 1e6;
x = 1; % motor dispalacement fraction [0-1]

dp_in = 50; % pressure difference across the motor (bar)
dp = dp_in * 1e5;

rho = 850; % fluid density (kg/m^3)

nu_in = 50; % kinematic viscosity of the oil (cst/ cm^2/s)
nu = nu_in / 1e6;
mu = nu * rho;

Cs = 1.2375e-08; % slip coefficient
Cv = 2e5; % coefficient of viscous friction
Cf = 0.01; % coulomb friction coefficient

Cs = 1.14e-8 + (1.53e-8 - 1.14e-8) * ((omega - 52.36) / (261.8 - 52.36));
Cv = 1.98e5 + (3.12e5 - 1.98e5) * ((omega - 52.36) / (261.8 - 52.36));



q_ls = Cs * D * dp / mu;


q_mod = x * D * omega / (2 * pi) - q_ls;

T_ls = Cv * D * mu .* omega / (2 *pi) + Cf * D * dp;

T_mod = x * D * dp / (2*pi) - T_ls;

% subplot(2,1,1)
% plot(N_exp, q_mod*60000)
% subplot(2,1,2)
% plot(N_exp, T_mod)


% Experimental data parameters
N = linspace(0, 3000, 30);

% D100
q_exp_D100_P50  = 0.18 * N;
q_exp_D100_P100 = 0.18 * N;
T_exp_D100_P50  = 140 - 0.058 * N;
T_exp_D100_P100 = 290 - 0.058 * N;

% D75
q_exp_D75_P50  = 0.15 * N;
q_exp_D75_P100 = 0.15 * N;
T_exp_D75_P50  = 0.75 * 140 - 0.75 * 0.058 * N;
T_exp_D75_P100 = 0.75 * 290 - 0.75 * 0.058 * N;

% D50
q_exp_D50_P50  = 0.1 * N;
q_exp_D50_P100 = 0.1 * N;
T_exp_D50_P50  = 0.50 * 140 - 0.5 * 0.058 * N;
T_exp_D50_P100 = 0.50 * 290 - 0.5 * 0.058 * N;

% D25
q_exp_D25_P50  = 0.05 * N;
q_exp_D25_P100 = 0.05 * N;
T_exp_D25_P50  = 0.25 * 140 - 0.25 * 0.058 * N;
T_exp_D25_P100 = 0.25 * 290 - 0.25 * 0.058 * N;

% Colors
c50  = [0.20 0.45 0.75];
c100 = [0.85 0.20 0.20];

displacements = {100, 75, 50, 25};
q_P50  = {q_exp_D100_P50,  q_exp_D75_P50,  q_exp_D50_P50,  q_exp_D25_P50};
q_P100 = {q_exp_D100_P100, q_exp_D75_P100, q_exp_D50_P100, q_exp_D25_P100};
T_P50  = {T_exp_D100_P50,  T_exp_D75_P50,  T_exp_D50_P50,  T_exp_D25_P50};
T_P100 = {T_exp_D100_P100, T_exp_D75_P100, T_exp_D50_P100, T_exp_D25_P100};

for i = 1:4
    D = displacements{i};
    figure('Name', sprintf('D = %d%%', D), 'Position', [100+i*50, 100, 700, 500]);
    
    % Flow subplot
    subplot(2,1,1)
    plot(N, q_P50{i},  '-',  'Color', c50,  'LineWidth', 2); hold on;
    plot(N, q_P100{i}, '--', 'Color', c100, 'LineWidth', 2);
    ylabel('Flow (L/min)', 'FontSize', 11)
    title(sprintf('Motor Performance — Displacement %d%%', D), 'FontSize', 13)
    legend('50 bar', '100 bar', 'Location', 'northwest', 'FontSize', 10)
    grid on; box on;
    xlim([0 3000]); ylim([0 max(q_P100{i})*1.2]);
    set(gca, 'FontSize', 10)
    
    % Torque subplot
    subplot(2,1,2)
    plot(N, T_P50{i},  '-',  'Color', c50,  'LineWidth', 2); hold on;
    plot(N, T_P100{i}, '--', 'Color', c100, 'LineWidth', 2);
    xlabel('Speed (RPM)', 'FontSize', 11)
    ylabel('Torque (Nm)',  'FontSize', 11)
    legend('50 bar', '100 bar', 'Location', 'northeast', 'FontSize', 10)
    grid on; box on;
    xlim([0 3000]); ylim([0 max(T_P100{i})*1.2]);
    set(gca, 'FontSize', 10)
end