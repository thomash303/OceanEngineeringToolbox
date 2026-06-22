% %% Parameter definition
% D_in = 180; % motor displacement (cc/rev)
% D = D_in / 1e6; % motor displacement (m^3/rev)
% x = 1; % motor dispalacement fraction [0-1]
% 
% dp_in = 50; % pressure difference across the motor (bar)
% dp = dp_in * 1e5; % pressure (Pa)
% 
% rho = 850; % fluid density (kg/m^3)
% 
% nu_in = 50; % kinematic viscosity of the oil (cst/ cm^2/s)
% nu = nu_in / 1e6;
% mu = nu * rho; % dynamic viscosity

%% Sample LLS for flow

% 
% % Example: fit T = a + b*N to torque data
% N_data = [0, 500, 1000, 1500, 2000, 2500, 3000];
% w_data = N_data * 2 * pi/60;
% q_data = [0, 100, 200, 275, 380, 425, 570];
% 
% q_mod = x * D * w_data / (2*pi);
% q_loss = q_mod - q_data/60000;
% 
% % Build regressor matrix [1, N] for affine fit T = a + b*N
% %A = [-ones(length(N_data), 1) * D * dp / mu, x*D*N_data'];
% 
% A = D * dp /mu * ones(length(w_data),1);
% 
% % Least squares solution
% coeffs = A \ q_loss';
% % 
% % a = coeffs(1);  % intercept
% % b = coeffs(2);  % slope
% 
% 
% a = coeffs(1);  % intercept
% 
% fprintf('q = %.2f + %.4f * N\n', -a * D * dp /mu*60000, x * D / (2*pi)*60000);
% 
% % Plot fit vs data
% N_fit = linspace(0, 3000, 100);
% w_fit = N_fit * 2*pi/60;
% q_fit = -a * D * dp /mu + x * D * w_fit / (2*pi);
% 
% figure;
% plot(N_data, q_data, 'ko', 'MarkerSize', 8, 'DisplayName', 'Data'); hold on;
% plot(N_fit,  q_fit*60000,  'r-', 'LineWidth', 2, 'DisplayName', 'LLS Fit');
% legend; grid on;
% xlabel('Speed (RPM)'); ylabel('Flow (LPM)');
% 
% N_data = [0, 500, 1000, 1500, 2000, 2500, 3000];
% w_data = N_data * 2 * pi/60;
% T_data = [430, 400, 371, 342, 313, 284, 255];
% 
% T_mod = x * D * dp / (2*pi);
% T_loss = T_mod - T_data;
% 
% 
% % Build regressor matrix [1, N] for affine fit T = a + b*N
% A = [ones(length(N_data), 1) * D * dp, D * mu * w_data'/ (2*pi)];
% 
% % Least squares solution
% coeffs = A \ T_loss';
% 
% Cf = coeffs(1);  % intercept
% Cv = coeffs(2);  % slope
% 
% fprintf('T = %.2f + %.4f * N\n', -Cf* D * dp + x * D * dp / (2*pi), - Cv * D * mu / (2 *pi));
% 
% % Plot fit vs data
% N_fit = linspace(0, 3000, 100);
% w_fit = N_fit * 2*pi/60;
% T_fit = x*D*dp/(2*pi) - Cf*D*dp - Cv*D*mu*w_fit/(2*pi);
% 
% figure;
% plot(N_data, T_data, 'ko', 'MarkerSize', 8, 'DisplayName', 'Data'); hold on;
% plot(N_fit,  T_fit,  'r-', 'LineWidth', 2, 'DisplayName', 'LLS Fit');
% legend; grid on;
% xlabel('Speed (RPM)'); ylabel('Torque (Nm)');

%% Motor parameters
D_in = 180;
D    = D_in / 1e6;       % m³/rev, always 180cc
rho  = 850;              % kg/m³
nu   = 50 / 1e6;         % m²/s
mu   = nu * rho;         % Pa.s

%% Lookup structures
x_vals = struct('D25',0.25, 'D50',0.50, 'D75',0.75, 'D100',1.00);
P_vals = struct('P50',50e5, 'P100',100e5);

D_list  = {'D25','D50','D75','D100'};
P_list  = {'P50','P100'};
markers = {'o','s'};
colors  = {'b','r'};

ylims_torque = struct('D25',[0 150],'D50',[0 250],'D75',[0 375],'D100',[0 500]);
ylims_flow   = struct('D25',[0 165],'D50',[0 310],'D75',[0 450],'D100',[0 600]);

%% Load data
load('Experimental_data\experimental_data.mat');  % loads exp_data

%% Fit and plot
fitted = struct();

for i = 1:numel(D_list)
    Dstr = D_list{i};
    x    = x_vals.(Dstr);

    figure('Name', Dstr, 'NumberTitle','off');

    %% ---- Torque subplot ----
    subplot(3,1,1); hold on; grid on;
    title(['Torque vs Speed - ', Dstr]);
    xlabel('Speed (rpm)'); ylabel('Torque (Nm)');
    ylim(ylims_torque.(Dstr));

    %% ---- Flow subplot ----
    subplot(3,1,2); hold on; grid on;
    title(['Flow vs Speed - ', Dstr]);
    xlabel('Speed (rpm)'); ylabel('Flow (L/min)');
    ylim(ylims_flow.(Dstr));

    for j = 1:numel(P_list)
        Pstr = P_list{j};
        dp   = P_vals.(Pstr);

        %% --- Torque fit ---
        if isfield(exp_data.torque, Dstr) && isfield(exp_data.torque.(Dstr), Pstr)
            N_raw = exp_data.torque.(Dstr).(Pstr).N(:);
            T_raw = exp_data.torque.(Dstr).(Pstr).T(:);
            
            mask   = ~isnan(N_raw) & ~isnan(T_raw);
            N_data = N_raw(mask);
            T_data = T_raw(mask);
            w_data = N_data * 2*pi/60;

            T_mod  = x * D * dp / (2*pi);          % theoretical torque, Nm
            T_loss = T_mod - T_data;                % torque loss

            A_T    = [D * dp * ones(length(w_data),1), ...
                      D * mu * w_data / (2*pi)];
            c_T    = A_T \ T_loss;
            Cf     = c_T(1);
            Cv     = c_T(2);

            fitted.(Dstr).(Pstr).Cf = Cf;
            fitted.(Dstr).(Pstr).Cv = Cv;

            N_fit  = linspace(min(N_data), max(N_data), 200)';
            w_fit  = N_fit * 2*pi/60;
            T_fit  = x*D*dp/(2*pi) - Cf*D*dp - Cv*D*mu*w_fit/(2*pi);

            subplot(3,1,1);
            plot(N_data, T_data, markers{j}, 'Color', colors{j}, ...
                 'MarkerSize', 6, 'DisplayName', [Pstr ' data']);
            plot(N_fit, T_fit, '-', 'Color', colors{j}, 'LineWidth', 1.5, ...
                 'DisplayName', [Pstr ' fit']);
        end

        %% --- Flow fit ---
        if isfield(exp_data.flow, Dstr) && isfield(exp_data.flow.(Dstr), Pstr)
            N_raw = exp_data.flow.(Dstr).(Pstr).N(:);
            q_raw = exp_data.flow.(Dstr).(Pstr).q(:);
            
            mask   = ~isnan(N_raw) & ~isnan(q_raw);
            N_data = N_raw(mask);
            q_data = q_raw(mask);
            w_data = N_data * 2*pi/60;

            q_mod  = x * D * w_data / (2*pi);          % theoretical flow, m³/s
            q_loss = q_mod - q_data/60000;              % flow loss, m³/s

            A_q    = D * dp / mu * ones(length(w_data), 1);
            Cs     = A_q \ q_loss;

            fitted.(Dstr).(Pstr).Cs = Cs;

            N_fit  = linspace(min(N_data), max(N_data), 200)';
            w_fit  = N_fit * 2*pi/60;
            q_fit  = (x*D*w_fit/(2*pi) - Cs*D*dp/mu) * 60000;  % back to LPM

            subplot(3,1,2);
            plot(N_data, q_data, markers{j}, 'Color', colors{j}, ...
                 'MarkerSize', 6, 'DisplayName', [Pstr ' data']);
            plot(N_fit, q_fit, '-', 'Color', colors{j}, 'LineWidth', 1.5, ...
                 'DisplayName', [Pstr ' fit']);
        end
    end

    subplot(3,1,1); legend('Location','best');
    subplot(3,1,2); legend('Location','best');

    %% ---- Coefficients table subplot ----
    subplot(3,1,3); axis off;
    txt = sprintf('%-10s  %12s  %12s  %12s\n', 'Pressure','Cs','Cf','Cv');
    txt = [txt, repmat('-',1,50), sprintf('\n')];
    for j = 1:numel(P_list)
        Pstr = P_list{j};
        if isfield(fitted.(Dstr), Pstr)
            f   = fitted.(Dstr).(Pstr);
            txt = [txt, sprintf('%-10s  %12.4e  %12.4f  %12.4f\n', ...
                   Pstr, f.Cs, f.Cf, f.Cv)];
        end
    end
    text(0.05, 0.6, txt, 'Units','normalized', 'FontSize',9, ...
         'FontName','Courier', 'VerticalAlignment','middle');
end

%% Save coefficients
save('Experimental_data\fitted_coefficients.mat', 'fitted');
disp('Done. Coefficients saved to fitted_coefficients.mat');