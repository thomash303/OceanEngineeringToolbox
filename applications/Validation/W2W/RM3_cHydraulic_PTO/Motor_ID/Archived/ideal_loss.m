
%% Comparing my fit to Cargo
load('Experimental_data\fitted_coefficients.mat');
load('Experimental_data\experimental_data.mat');

Dstr = 'D100';
x    = x_vals.(Dstr);
Cf = fitted.(Dstr).Cf;
Cv_const = fitted.(Dstr).Cv;
Cs_const = fitted.(Dstr).Cs;

figure('Name','D100 - Full Comparison');
subplot(2,1,1); hold on; grid on;
title('Torque - D100');
xlabel('Speed (rpm)');
ylabel('Torque (Nm)');

subplot(2,1,2); hold on; grid on;
title('Flow - D100');
xlabel('Speed (rpm)');
ylabel('Flow (L/min)');

N_model = linspace(0, 3000, 300)';
w_model = N_model * 2*pi/60;

for j = 1:numel(P_list)
    Pstr = P_list{j};
    dp   = P_vals.(Pstr);

    % -------------------------
    % DATA — separate reads like the main script
    % -------------------------
    if isfield(exp_data.torque, Dstr) && isfield(exp_data.torque.(Dstr), Pstr)
        N_raw = exp_data.torque.(Dstr).(Pstr).N(:);
        T_raw = exp_data.torque.(Dstr).(Pstr).T(:);
        maskT = ~isnan(N_raw) & ~isnan(T_raw);
        NlocT = N_raw(maskT);
        Texp  = T_raw(maskT);
    else
        NlocT = []; Texp = [];
    end

    if isfield(exp_data.flow, Dstr) && isfield(exp_data.flow.(Dstr), Pstr)
        N_raw = exp_data.flow.(Dstr).(Pstr).N(:);
        q_raw = exp_data.flow.(Dstr).(Pstr).q(:);
        maskQ = ~isnan(N_raw) & ~isnan(q_raw);
        NlocQ = N_raw(maskQ);
        qexp  = q_raw(maskQ);
    else
        NlocQ = []; qexp = [];
    end

    % -------------------------
    % IDEAL
    % -------------------------
    T_ideal = x * D * dp / (2*pi);
    q_ideal = x * D * w_model / (2*pi);

    % -------------------------
    % CONSTANT LOSS MODEL
    % -------------------------
    T_loss_const = T_ideal ...
                 - Cf * D * dp ...
                 - Cv_const * D * mu .* w_model / (2*pi);
    q_loss_const = q_ideal ...
                 - Cs_const * D * dp / mu;

    % -------------------------
    % SPEED DEPENDENT MODEL
    % -------------------------
    Cs_w = 1.14e-8 + (1.53e-8 - 1.14e-8) .* ((N_model - 500) / (2500 - 500));
    Cv_w = 1.98e5  + (3.12e5  - 1.98e5)  .* ((N_model - 500) / (2500 - 500));
    Cs_w = max(min(Cs_w, 1.53e-8), 1.14e-8);
    Cv_w = max(min(Cv_w, 3.12e5),  1.98e5);

    T_loss_w = T_ideal ...
             - Cf * D * dp ...
             - Cv_w .* D * mu .* w_model / (2*pi);
    q_loss_w = q_ideal ...
             - Cs_w .* D * dp / mu;

    % =========================
    % TORQUE PLOT
    % =========================
    subplot(2,1,1)
    plot(NlocT, Texp, markers{j}, 'Color', colors{j}, ...
        'MarkerSize', 5, 'LineWidth', 1, ...
        'DisplayName', [Pstr ' exp']);
    plot(N_model, T_ideal*ones(size(N_model)), '--', 'Color', colors{j}, ...
        'DisplayName', [Pstr ' ideal']);
    plot(N_model, T_loss_const, '-', 'Color', colors{j}, ...
        'LineWidth', 1.5, ...
        'DisplayName', [Pstr ' loss (const)']);
    plot(N_model, T_loss_w, ':', 'Color', colors{j}, ...
        'LineWidth', 2, ...
        'DisplayName', [Pstr ' loss (ω)']);

    % =========================
    % FLOW PLOT
    % =========================
    subplot(2,1,2)
    plot(NlocQ, qexp, markers{j}, 'Color', colors{j}, ...
        'MarkerSize', 5, 'LineWidth', 1, ...
        'DisplayName', [Pstr ' exp']);
    plot(N_model, q_ideal*60000, '--', 'Color', colors{j}, ...
        'DisplayName', [Pstr ' ideal']);
    plot(N_model, q_loss_const*60000, '-', 'Color', colors{j}, ...
        'LineWidth', 1.5, ...
        'DisplayName', [Pstr ' loss (const)']);
    plot(N_model, q_loss_w*60000, ':', 'Color', colors{j}, ...
        'LineWidth', 2, ...
        'DisplayName', [Pstr ' loss (ω)']);
end

subplot(2,1,1); legend('Location','best');
subplot(2,1,2); legend('Location','best');