% Code to fit the motor loss model to the experimental data
% Non-negative least squares version — column-scaled for numerical conditioning

%% Motor parameters
D_in = 180;
D    = D_in / 1e6;
rho  = 850;
nu   = 50 / 1e6;
mu   = nu * rho;

%% Lookup structures
x_vals = struct('D25',0.25, 'D50',0.50, 'D75',0.75, 'D100',1.00);
P_vals = struct('P50',50e5, 'P100',100e5);

D_list  = {'D25','D50','D75','D100'};
P_list  = {'P50','P100'};
markers = {'o','s'};
colors  = {'b','r'};

ylims_torque = struct('D25',[0 150],'D50',[0 250],'D75',[0 375],'D100',[0 500]);
ylims_flow   = struct('D25',[0 165],'D50',[0 310],'D75',[0 450],'D100',[0 600]);
ylims_eta = [0 100];

load('Experimental_data\experimental_data.mat');

fitted = struct();

for i = 1:numel(D_list)
    Dstr = D_list{i};
    x    = x_vals.(Dstr);

    figure('Name', Dstr, 'NumberTitle','off');

    subplot(3,1,1); hold on; grid on;
    title(['Torque vs Speed - ', Dstr]);
    xlabel('Speed (rpm)'); ylabel('Torque (Nm)');
    ylim(ylims_torque.(Dstr));

    subplot(3,1,2); hold on; grid on;
    title(['Flow vs Speed - ', Dstr]);
    xlabel('Speed (rpm)'); ylabel('Flow (L/min)');
    ylim(ylims_flow.(Dstr));

    subplot(3,1,3); hold on; grid on;
    title(['Efficiency vs Speed - ', Dstr]);
    xlabel('Speed (rpm)'); ylabel('Efficiency (%)');
    ylim(ylims_eta);

    %% --- Stack both pressures for joint LLS ---
    A_T_all = [];
    T_loss_all = [];
    A_q_all = [];
    q_loss_all = [];

    for j = 1:numel(P_list)
        Pstr = P_list{j};
        dp   = P_vals.(Pstr);

        %% Torque: accumulate rows
        if isfield(exp_data.torque, Dstr) && isfield(exp_data.torque.(Dstr), Pstr)
            N_raw = exp_data.torque.(Dstr).(Pstr).N(:);
            T_raw = exp_data.torque.(Dstr).(Pstr).T(:);
            mask  = ~isnan(N_raw) & ~isnan(T_raw);
            N_data = N_raw(mask);
            T_data = T_raw(mask);
            w_data = N_data * 2*pi/60;

            T_mod  = x * D * dp / (2*pi);
            T_loss = T_mod - T_data;

            A_T_all    = [A_T_all;    D*dp*ones(length(w_data),1),  D*mu*w_data/(2*pi)];
            T_loss_all = [T_loss_all; T_loss];
        end

        %% Flow: accumulate rows
        if isfield(exp_data.flow, Dstr) && isfield(exp_data.flow.(Dstr), Pstr)
            N_raw = exp_data.flow.(Dstr).(Pstr).N(:);
            q_raw = exp_data.flow.(Dstr).(Pstr).q(:);
            mask  = ~isnan(N_raw) & ~isnan(q_raw);
            N_data = N_raw(mask);
            q_data = q_raw(mask);
            w_data = N_data * 2*pi/60;

            q_mod  = x * D * w_data / (2*pi);
            q_loss = q_mod - q_data/60000;

            A_q_all    = [A_q_all;    D*dp/mu * ones(length(w_data),1)];
            q_loss_all = [q_loss_all; q_loss];
        end

        %% Plot raw data for this pressure
        if isfield(exp_data.torque.(Dstr), Pstr)
            N_raw = exp_data.torque.(Dstr).(Pstr).N(:);
            T_raw = exp_data.torque.(Dstr).(Pstr).T(:);
            mask  = ~isnan(N_raw) & ~isnan(T_raw);
            subplot(3,1,1);
            plot(N_raw(mask), T_raw(mask), markers{j}, 'Color', colors{j}, ...
                 'MarkerSize', 4, 'DisplayName', [Pstr ' data']);
        end

        if isfield(exp_data.flow.(Dstr), Pstr)
            N_raw = exp_data.flow.(Dstr).(Pstr).N(:);
            q_raw = exp_data.flow.(Dstr).(Pstr).q(:);
            mask  = ~isnan(N_raw) & ~isnan(q_raw);
            subplot(3,1,2);
            plot(N_raw(mask), q_raw(mask), markers{j}, 'Color', colors{j}, ...
                 'MarkerSize', 4, 'DisplayName', [Pstr ' data']);
        end

        if isfield(exp_data.efficiency.(Dstr), Pstr)
            N_raw = exp_data.efficiency.(Dstr).(Pstr).N(:);
            eta_raw = exp_data.efficiency.(Dstr).(Pstr).ef(:);
            mask  = ~isnan(N_raw) & ~isnan(eta_raw);
            subplot(3,1,3);
            plot(N_raw(mask), eta_raw(mask), markers{j}, 'Color', colors{j}, ...
                 'MarkerSize', 4, 'DisplayName', [Pstr ' data']);
        end
    end

    %% --- Solve once per displacement (column-scaled non-negative least squares) ---
    % option A) to solve non-negative LLS
    scale_T    = vecnorm(A_T_all);                          % normalise columns
    c_T_scaled = lsqnonneg(A_T_all ./ scale_T, T_loss_all);
    c_T        = c_T_scaled ./ scale_T';                    % back-scale
    Cf  = c_T(1);
    Cv  = c_T(2);

    scale_q    = vecnorm(A_q_all);
    c_q_scaled = lsqnonneg(A_q_all ./ scale_q, q_loss_all);
    Cs         = c_q_scaled ./ scale_q';

    % option B) to solve non-negative LLS
    % % Torque: [Cw, Cc] >= 0
    % c_T = lsqlin(A_T_all, T_loss_all, [], [], [], [], zeros(2,1), [], []);
    % Cw  = c_T(1);
    % Cc  = c_T(2);
    % 
    % % Flow: Cs >= 0
    % Cs = lsqlin(A_q_all, q_loss_all, [], [], [], [], 0, [], []);
    % Cf  = c_T(1);
    % Cv  = c_T(2);

    fitted.(Dstr).Cf = Cf;
    fitted.(Dstr).Cv = Cv;
    fitted.(Dstr).Cs = Cs;

    fprintf('%s:  Cs = %.4e   Cf = %.4f   Cv = %.4f\n', Dstr, Cs, Cf, Cv);

    %% --- Plot model fits and efficiency for each pressure ---
    N_fit = linspace(0, 3000, 300)';
    w_fit = N_fit * 2*pi/60;

    for j = 1:numel(P_list)
        Pstr = P_list{j};
        dp   = P_vals.(Pstr);

        T_fit = x*D*dp/(2*pi) - Cf*D*dp - Cv*D*mu*w_fit/(2*pi);
        q_fit = (x*D*w_fit/(2*pi) - Cs*D*dp/mu) * 60000;

        subplot(3,1,1);
        plot(N_fit, T_fit, '-', 'Color', colors{j}, 'LineWidth', 1.5, ...
             'DisplayName', [Pstr ' fit']);

        subplot(3,1,2);
        plot(N_fit, q_fit, '-', 'Color', colors{j}, 'LineWidth', 1.5, ...
             'DisplayName', [Pstr ' fit']);
    end

    subplot(3,1,1); legend('Location','best');
    subplot(3,1,2); legend('Location','best');

    %% --- Efficiency subplot ---
    subplot(3,1,3); hold on; grid on;
    title(['Model Efficiency vs Speed - ', Dstr]);
    xlabel('Speed (rpm)'); ylabel('Efficiency (%)');
    xlim([0 3000]); ylim([0 100]);

    for j = 1:numel(P_list)
        Pstr = P_list{j};
        dp   = P_vals.(Pstr);

        T_fit = x*D*dp/(2*pi) - Cf*D*dp - Cv*D*mu*w_fit/(2*pi);
        q_fit = x*D*w_fit/(2*pi) - Cs*D*dp/mu;

        eta = (T_fit .* w_fit) ./ (q_fit * dp) * 100;
        eta(q_fit <= 0) = NaN;
        eta(eta > 100)  = NaN;   % <-- mask unphysical blow-up at low speed

        plot(N_fit, eta, '-', 'Color', colors{j}, 'LineWidth', 1.5, ...
             'DisplayName', [Pstr ' model']);
    end
    legend('Location','best');
end

save('Experimental_data\fitted_coefficients_nonneg.mat', 'fitted');
disp('Done. Coefficients saved.');

%% Plot coefficients
Cf_vals = zeros(1, numel(D_list));
Cv_vals = zeros(1, numel(D_list));
Cs_vals = zeros(1, numel(D_list));
D_norm  = zeros(1, numel(D_list));

for i = 1:numel(D_list)
    Dstr = D_list{i};
    x    = x_vals.(Dstr);

    D_norm(i)  = x;
    Cf_vals(i) = fitted.(Dstr).Cf;
    Cv_vals(i) = fitted.(Dstr).Cv;
    Cs_vals(i) = fitted.(Dstr).Cs;
end

figure;

subplot(3,1,1);
plot(D_norm, Cf_vals, 'o');
grid on;
xlabel('Normalized Displacement (-)');
ylabel('C_f');
title('C_f vs Displacement');

subplot(3,1,2);
plot(D_norm, Cv_vals, 'o');
grid on;
xlabel('Normalized Displacement (-)');
ylabel('C_v');
title('C_v vs Displacement');

subplot(3,1,3);
plot(D_norm, Cs_vals, 'o');
grid on;
xlabel('Normalized Displacement (-)');
ylabel('C_s');
title('C_s vs Displacement');


%% =========================
% Thesis-quality plots (D50 only)
colors = {
    [0 0.4470 0.7410]
    [0.8500 0.3250 0.0980]
    };

Dstr = 'D50';
x = x_vals.(Dstr);

Cf = fitted.(Dstr).Cf;
Cv = fitted.(Dstr).Cv;
Cs = fitted.(Dstr).Cs;

N_fit = linspace(0,3000,300)';
w_fit = N_fit * 2*pi/60;

% TORQUE
figure('Name','Torque D50'); hold on;

xlabel('Speed (rpm)');
ylabel('Torque (Nm)');
xticks(0:1000:3000)
ylim([0 150])

leg = {};

for j = 1:numel(P_list)
    Pstr = P_list{j};

    if isfield(exp_data.torque, Dstr) && isfield(exp_data.torque.(Dstr), Pstr)
        N_raw = exp_data.torque.(Dstr).(Pstr).N(:);
        T_raw = exp_data.torque.(Dstr).(Pstr).T(:);
        mask = ~isnan(N_raw) & ~isnan(T_raw);

        plot(N_raw(mask), T_raw(mask), markers{j}, ...
            'Color', colors{j}, 'MarkerSize', 6, 'LineWidth', 0.8);

        leg{end+1} = [Pstr ' data'];
    end

    dp = P_vals.(Pstr);
    T_fit = x*D*dp/(2*pi) - Cf*D*dp - Cv*D*mu*w_fit/(2*pi);

    plot(N_fit, T_fit, '-', 'Color', colors{j}, 'LineWidth', 2);
    leg{end+1} = [Pstr ' model'];
end

legend(leg,'Location','best')
set(gca,'TickDir','out','LineWidth',AxisLineWidth,'FontSize',Fsize)
box off
grid off


% FLOW
figure('Name','Flow D50'); hold on;

xlabel('Speed (rpm)');
ylabel('Flow (L/min)');
xticks(0:1000:3000)
ylim(ylims_flow.(Dstr))

leg = {};

for j = 1:numel(P_list)
    Pstr = P_list{j};

    if isfield(exp_data.flow, Dstr) && isfield(exp_data.flow.(Dstr), Pstr)
        N_raw = exp_data.flow.(Dstr).(Pstr).N(:);
        q_raw = exp_data.flow.(Dstr).(Pstr).q(:);
        mask = ~isnan(N_raw) & ~isnan(q_raw);

        plot(N_raw(mask), q_raw(mask), markers{j}, ...
            'Color', colors{j}, 'MarkerSize', 6, 'LineWidth', 0.8);

        leg{end+1} = [Pstr ' data'];
    end

    dp = P_vals.(Pstr);
    q_fit = (x*D*w_fit/(2*pi) - Cs*D*dp/mu) * 60000;

    plot(N_fit, q_fit, '-', 'Color', colors{j}, 'LineWidth', 2);
    leg{end+1} = [Pstr ' model'];
end

legend(leg,'Location','best')
set(gca,'TickDir','out','LineWidth',AxisLineWidth,'FontSize',Fsize)
box off
grid off


% EFFICIENCY
figure('Name','Efficiency D50'); hold on;

xlabel('Speed (rpm)');
ylabel('Efficiency (%)');
xticks(0:1000:3000)
ylim([0 100])

leg = {};

for j = 1:numel(P_list)
    Pstr = P_list{j};
    dp = P_vals.(Pstr);

    if isfield(exp_data.efficiency, Dstr) && isfield(exp_data.efficiency.(Dstr), Pstr)
        N_raw = exp_data.efficiency.(Dstr).(Pstr).N(:);
        eta_raw = exp_data.efficiency.(Dstr).(Pstr).ef(:);
        mask = ~isnan(N_raw) & ~isnan(eta_raw);

        plot(N_raw(mask), eta_raw(mask), markers{j}, ...
            'Color', colors{j}, 'MarkerSize', 6, 'LineWidth', 0.8);

        leg{end+1} = [Pstr ' data'];
    end

    T_fit = x*D*dp/(2*pi) - Cf*D*dp - Cv*D*mu*w_fit/(2*pi);
    q_fit = x*D*w_fit/(2*pi) - Cs*D*dp/mu;

    eta = (T_fit .* w_fit) ./ (q_fit * dp) * 100;
    eta(q_fit <= 0) = NaN;
    eta(eta > 100)  = NaN;   % <-- mask unphysical blow-up at low speed

    plot(N_fit, eta, '-', 'Color', colors{j}, 'LineWidth', 2);
    leg{end+1} = [Pstr ' model'];
end

legend(leg,'Location','best')
set(gca,'TickDir','out','LineWidth',AxisLineWidth,'FontSize',Fsize)
box off
grid off

%% Combined plot (to be used)
figure('Name','D50 Combined');

Dstr = 'D50';
x = x_vals.(Dstr);

Cf = fitted.(Dstr).Cf;
Cv = fitted.(Dstr).Cv;
Cs = fitted.(Dstr).Cs;

N_fit = linspace(0,3000,300)';
w_fit = N_fit * 2*pi/60;

% -------------------------
% TORQUE
% -------------------------
subplot(3,1,1); hold on;

ylabel('$T\;[Nm]$', 'Interpreter','latex');
xticks(0:1000:3000)
ylim([0 150])

leg = {};

for j = 1:numel(P_list)
    Pstr = P_list{j};
    dp = P_vals.(Pstr);

    if isfield(exp_data.torque, Dstr) && isfield(exp_data.torque.(Dstr), Pstr)
        N_raw = exp_data.torque.(Dstr).(Pstr).N(:);
        T_raw = exp_data.torque.(Dstr).(Pstr).T(:);
        mask = ~isnan(N_raw) & ~isnan(T_raw);

        plot(N_raw(mask), T_raw(mask), markers{j}, ...
            'Color', colors{j}, 'MarkerSize', 6, 'LineWidth', 0.8);

        leg{end+1} = [Pstr ' bar exp'];
    end

    T_fit = x*D*dp/(2*pi) - Cf*D*dp - Cv*D*mu*w_fit/(2*pi);

    plot(N_fit, T_fit, '-', 'Color', colors{j}, 'LineWidth', 2);
    leg{end+1} = [Pstr ' bar model'];
end

legend(leg,'Location','best', 'Interpreter','latex')
set(gca,'TickDir','out','LineWidth',AxisLineWidth,'FontSize',Fsize)
box off; grid off; legend box off

% -------------------------
% FLOW
% -------------------------
subplot(3,1,2); hold on;

ylabel('$Q\;[L/min]$', 'Interpreter','latex');
xticks(0:1000:3000)
ylim([0 300])

leg = {};

for j = 1:numel(P_list)
    Pstr = P_list{j};
    dp = P_vals.(Pstr);

    if isfield(exp_data.flow, Dstr) && isfield(exp_data.flow.(Dstr), Pstr)
        N_raw = exp_data.flow.(Dstr).(Pstr).N(:);
        q_raw = exp_data.flow.(Dstr).(Pstr).q(:);
        mask = ~isnan(N_raw) & ~isnan(q_raw);

        plot(N_raw(mask), q_raw(mask), markers{j}, ...
            'Color', colors{j}, 'MarkerSize', 6, 'LineWidth', 0.8);

        leg{end+1} = [Pstr ' data'];
    end

    q_fit = (x*D*w_fit/(2*pi) - Cs*D*dp/mu) * 60000;

    plot(N_fit, q_fit, '-', 'Color', colors{j}, 'LineWidth', 2);
    leg{end+1} = [Pstr ' model'];
end

set(gca,'TickDir','out','LineWidth',AxisLineWidth,'FontSize',Fsize)
box off; grid off; legend off

% -------------------------
% EFFICIENCY
% -------------------------
subplot(3,1,3); hold on;

xlabel('$N\;(rpm)$', 'Interpreter','latex');
ylabel('$\eta\;[\%]$', 'Interpreter','latex');
xticks(0:1000:3000)
ylim([0 100])

leg = {};

for j = 1:numel(P_list)
    Pstr = P_list{j};
    dp = P_vals.(Pstr);

    if isfield(exp_data.efficiency, Dstr) && isfield(exp_data.efficiency.(Dstr), Pstr)
        N_raw = exp_data.efficiency.(Dstr).(Pstr).N(:);
        eta_raw = exp_data.efficiency.(Dstr).(Pstr).ef(:);
        mask = ~isnan(N_raw) & ~isnan(eta_raw);

        plot(N_raw(mask), eta_raw(mask), markers{j}, ...
            'Color', colors{j}, 'MarkerSize', 6, 'LineWidth', 0.8);

        leg{end+1} = [Pstr ' data'];
    end

    T_fit = x*D*dp/(2*pi) - Cf*D*dp - Cv*D*mu*w_fit/(2*pi);
    q_fit = x*D*w_fit/(2*pi) - Cs*D*dp/mu;

    eta = (T_fit .* w_fit) ./ (q_fit * dp) * 100;
    eta(q_fit <= 0) = NaN;
    eta(eta > 100)  = NaN;   % <-- mask unphysical blow-up at low speed

    plot(N_fit, eta, '-', 'Color', colors{j}, 'LineWidth', 2);
    leg{end+1} = [Pstr ' model'];
end

set(gca,'TickDir','out','LineWidth',AxisLineWidth,'FontSize',Fsize)
box off; grid off; legend off