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