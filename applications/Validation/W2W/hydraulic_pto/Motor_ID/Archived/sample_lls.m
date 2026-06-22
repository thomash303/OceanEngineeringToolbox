% Example: fit T = a + b*N to torque data
N_data = [0, 500, 1000, 1500, 2000, 2500, 3000];
T_data = [430, 400, 371, 342, 313, 284, 255];

% Build regressor matrix [1, N] for affine fit T = a + b*N
A = [ones(length(N_data), 1), N_data'];

% Least squares solution
coeffs = A \ T_data';

a = coeffs(1);  % intercept
b = coeffs(2);  % slope

fprintf('T = %.2f + %.4f * N\n', a, b);

% Plot fit vs data
N_fit = linspace(0, 3000, 100);
T_fit = a + b * N_fit;

figure;
plot(N_data, T_data, 'ko', 'MarkerSize', 8, 'DisplayName', 'Data'); hold on;
plot(N_fit,  T_fit,  'r-', 'LineWidth', 2, 'DisplayName', 'LLS Fit');
legend; grid on;
xlabel('Speed (RPM)'); ylabel('Torque (Nm)');

%% 
% Parameters (pick representative values)
cf   = 0.05;
dp   = 1e7;        % Pa
Dmax = 1e-4;       % m^3/rad
b    = 1e-3;       % viscous coeff

tau_c = cf * dp * Dmax;   % Coulomb level

% Speed range
w = linspace(-10,10,1000);

% Smoothed (tanh)
tau_smooth = tau_c * tanh(w/0.01) + b*w;

% Ideal Coulomb + viscous
tau_coulomb = tau_c * sign(w) + b*w;

% Plot
figure; hold on; grid on;
plot(w, tau_smooth, 'LineWidth', 2);
plot(w, tau_coulomb, '--', 'LineWidth', 2);

xlabel('\omega (rad/s)');
ylabel('\tau (Nm)');
legend('tanh smooth','Coulomb sign');
title('Friction model comparison');
xlim([-1 1])