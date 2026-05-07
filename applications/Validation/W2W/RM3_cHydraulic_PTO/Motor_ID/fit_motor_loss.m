%% Script to fit the motor loss model to Cargo's experimental data
% Code to fit the motor loss model to the experimental data

%% Motor parameters
D_in = 180;
D    = D_in / 1e6;
rho  = 850;
nu   = 50 / 1e6;
mu   = nu * rho;

%% Model fitting

% Select motor loss model (list all available)
model = getMotorModel('mccandish'); 

x_vals = struct('D25',0.25, 'D50',0.50, 'D75',0.75, 'D100',1.00);
P_vals = struct('P50',50e5, 'P100',100e5);
% will need to make P_vals = struct('P50',50e5, 'P100',100e5, 'P150',150e5);

% Plotting parameters
D_list  = {'D25','D50','D75','D100'};
P_list  = {'P50','P100'};
markers = {'o','s'};
colors  = {'b','r'};
ylims_torque = struct('D25',[0 150],'D50',[0 250],'D75',[0 375],'D100',[0 500]);
ylims_flow   = struct('D25',[0 165],'D50',[0 310],'D75',[0 450],'D100',[0 600]);
ylims_eta = [0 100];

% Load experimental data
load('Experimental_data\experimental_data.mat');

fitted_mottor_coeff = struct();

% Loop of discrete motor displacements (25,50,75,100) %
for i = 1:numel(D_list)
    Dstr = D_list{i};
    x    = x_vals.(Dstr);

    % Generating plots
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

    % Stack pressures, one set of coefficients for all
    A_T = [];
    T_loss = [];
    A_q = [];
    q_loss = [];

    % Loop of discrete pressures (50, 100, 150) bar
    for j = 1:numel(P_list)
        Pstr = P_list{j};
        dp   = P_vals.(Pstr);

        % Torque
        if isfield(exp_data.torque, Dstr) && isfield(exp_data.torque.(Dstr), Pstr)
            % Experimental data
            N_raw = exp_data.torque.(Dstr).(Pstr).N(:);
            T_raw = exp_data.torque.(Dstr).(Pstr).T(:);

            % Removing nan
            mask  = ~isnan(N_raw) & ~isnan(T_raw);
            N_data = N_raw(mask);
            T_data = T_raw(mask);
            w_data = N_data * 2*pi/60;

            % Calling motor torque loss model
            [A_T_new, T_loss_new] = model.buildTorqueLS(D, dp, mu, w_data, x, T_data);
            
            % Stacking experimental data terms (for coefficients)
            A_T = [A_T; A_T_new];
            
            % Stacking loss residuals
            T_loss = [T_loss; T_loss_new];


        end

        % Flow
        if isfield(exp_data.flow, Dstr) && isfield(exp_data.flow.(Dstr), Pstr)
            % Experimental data
            N_raw = exp_data.flow.(Dstr).(Pstr).N(:);
            q_raw = exp_data.flow.(Dstr).(Pstr).q(:);

            % Removing nan
            mask  = ~isnan(N_raw) & ~isnan(q_raw);
            N_data = N_raw(mask);
            q_data = q_raw(mask);
            w_data = N_data * 2*pi/60;

            % Calling motor flow loss model
            [A_q_new, q_loss_new] = model.buildFlowLS(D, dp, mu, w_data, x, q_data);
            
            % Stacking experimental data terms (for coefficients)
            A_q = [A_q; A_q_new];
            
            % Stacking loss residuals
            q_loss = [q_loss; q_loss_new];

        end

        % Plotting experimental data for this pressure

        % Torque
        if isfield(exp_data.torque.(Dstr), Pstr)
            N_raw = exp_data.torque.(Dstr).(Pstr).N(:);
            T_raw = exp_data.torque.(Dstr).(Pstr).T(:);
            mask  = ~isnan(N_raw) & ~isnan(T_raw);
            subplot(3,1,1);
            plot(N_raw(mask), T_raw(mask), markers{j}, 'Color', colors{j}, ...
                 'MarkerSize', 4, 'DisplayName', [Pstr ' data']);
        end

        % Flow
        if isfield(exp_data.flow.(Dstr), Pstr)
            N_raw = exp_data.flow.(Dstr).(Pstr).N(:);
            q_raw = exp_data.flow.(Dstr).(Pstr).q(:);
            mask  = ~isnan(N_raw) & ~isnan(q_raw);
            subplot(3,1,2);
            plot(N_raw(mask), q_raw(mask), markers{j}, 'Color', colors{j}, ...
                 'MarkerSize', 4, 'DisplayName', [Pstr ' data']);
        end

        % Efficiency
        if isfield(exp_data.efficiency.(Dstr), Pstr)
            N_raw = exp_data.efficiency.(Dstr).(Pstr).N(:);
            eta_raw = exp_data.efficiency.(Dstr).(Pstr).ef(:);
            mask  = ~isnan(N_raw) & ~isnan(eta_raw);
            subplot(3,1,3);
            plot(N_raw(mask), eta_raw(mask), markers{j}, 'Color', colors{j}, ...
                 'MarkerSize', 4, 'DisplayName', [Pstr ' data']);
        end
    end

    % One set of cofficients per motor displacement fraction

    % Fitting torque loss coefficients
    % Unbounded
    c_T = A_T \ T_loss;


    % Fitting flow loss coefficients
    % Unbounded
    c_q  = A_q \ q_loss;

    % Saving fitted coefficients
    fitted_mottor_coeff.(Dstr) = model.unpack(c_T, c_q);

    fprintf('%s:  Cs = %.4e   Cf = %.4f   Cv = %.4f\n', Dstr, fitted_mottor_coeff.(Dstr).Cs, fitted_mottor_coeff.(Dstr).Cf, fitted_mottor_coeff.(Dstr).Cv);


    %% Plotting model fits and efficiency for each pressure
    N_fit = linspace(0, 3000, 300)';
    w_fit = N_fit * 2*pi/60;

    for j = 1:numel(P_list)
        Pstr = P_list{j};
        dp   = P_vals.(Pstr);

        % Evaluate model
        [T_fit, q_fit] = model.evaluate(fitted_mottor_coeff.(Dstr), D, dp, mu, w_fit, x);
        q_fit = q_fit * 60000;

        % Plotting fitted models
        subplot(3,1,1);
        plot(N_fit, T_fit, '-', 'Color', colors{j}, 'LineWidth', 1.5, ...
             'DisplayName', [Pstr ' fit']);

        subplot(3,1,2);
        plot(N_fit, q_fit, '-', 'Color', colors{j}, 'LineWidth', 1.5, ...
             'DisplayName', [Pstr ' fit']);

        % Model efficiency
        q_fit = q_fit / 60000; % Scaling to m^3/s
        eta = (T_fit .* w_fit) ./ (q_fit * dp) * 100;

        subplot(3,1,3);
        plot(N_fit, eta, '-', 'Color', colors{j}, 'LineWidth', 1.5, ...
             'DisplayName', [Pstr ' model']);


    end

    subplot(3,1,1); legend('Location','best');
    subplot(3,1,2); legend('Location','best');
    subplot(3,1,3); legend('Location','best');
end

% Saving coefficients
%save('Experimental_data\fitted_coefficients_pos.mat', 'fitted_mottor_coeff');
disp('Done. Coefficients saved.');

%% Plot coefficients
% Preallocate
Cf_vals = zeros(1, numel(D_list));
Cv_vals = zeros(1, numel(D_list));
Cs_vals = zeros(1, numel(D_list));
D_norm  = zeros(1, numel(D_list));

% Loop across motor displacements (25,50,75,100)
for i = 1:numel(D_list)
    Dstr = D_list{i};
    x    = x_vals.(Dstr);
    
    D_norm(i)  = x * 100;
    Cf_vals(i) = fitted_mottor_coeff.(Dstr).Cf;
    Cv_vals(i) = fitted_mottor_coeff.(Dstr).Cv;
    Cs_vals(i) = fitted_mottor_coeff.(Dstr).Cs;
end

figure('Name',"Motor loss coefficients");

% Cf 
subplot(3,1,1);
plot(D_norm, Cf_vals, 'o');
grid on;
xlabel('Displacement fraction (%)');
ylabel('C_f');
xlim([0,100])
xticks([0,25,50,75,100])
title('C_f vs Displacement');

% Cv
subplot(3,1,2);
plot(D_norm, Cv_vals, 'o');
grid on;
xlabel('Displacement fraction (%)');
ylabel('C_v');
xlim([0,100])
xticks([0,25,50,75,100])
title('C_v vs Displacement');

% Cs 
subplot(3,1,3);
plot(D_norm, Cs_vals, 'o');
grid on;
xlabel('Displacement fraction (%)');
ylabel('C_s');
xlim([0,100])
xticks([0,25,50,75,100])
title('C_s vs Displacement');

%% Thesis Combined plot
colors = {
    [0 0.4470 0.7410]
    [0.8500 0.3250 0.0980]
    };
figure('Name','D50 Combined');

Dstr = 'D50';
x = x_vals.(Dstr);
coeff = fitted_mottor_coeff.(Dstr);

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

    % Experimental
    if isfield(exp_data.torque, Dstr) && isfield(exp_data.torque.(Dstr), Pstr)
        N_raw = exp_data.torque.(Dstr).(Pstr).N(:);
        T_raw = exp_data.torque.(Dstr).(Pstr).T(:);
        mask = ~isnan(N_raw) & ~isnan(T_raw);

        plot(N_raw(mask), T_raw(mask), markers{j}, ...
            'Color', colors{j}, 'MarkerSize', 6, 'LineWidth', 0.8);

        leg{end+1} = [Pstr ' bar exp'];
    end

    % MODEL (consistent call)
    [T_fit, q_fit] = model.evaluate(coeff, D, dp, mu, w_fit, x);

    plot(N_fit, T_fit, '-', 'Color', colors{j}, 'LineWidth', 2);
    leg{end+1} = [Pstr ' bar model'];
end

legend(leg,'Location','best', 'Interpreter','latex')
set(gca,'TickDir','out','LineWidth',AxisLineWidth,'FontSize',Fsize)
box off
grid off
legend box off


% -------------------------
% FLOW
% -------------------------
subplot(3,1,2); hold on;

ylabel('$Q\;[L/min]$', 'Interpreter','latex');
xticks(0:1000:3000)
ylim([0 300])

for j = 1:numel(P_list)
    Pstr = P_list{j};
    dp = P_vals.(Pstr);

    if isfield(exp_data.flow, Dstr) && isfield(exp_data.flow.(Dstr), Pstr)
        N_raw = exp_data.flow.(Dstr).(Pstr).N(:);
        q_raw = exp_data.flow.(Dstr).(Pstr).q(:);
        mask = ~isnan(N_raw) & ~isnan(q_raw);

        plot(N_raw(mask), q_raw(mask), markers{j}, ...
            'Color', colors{j}, 'MarkerSize', 6, 'LineWidth', 0.8);
    end

    % MODEL
    [~, q_fit] = model.evaluate(coeff, D, dp, mu, w_fit, x);

    q_fit = q_fit * 60000; % m^3/s → L/min

    plot(N_fit, q_fit, '-', 'Color', colors{j}, 'LineWidth', 2);
end

set(gca,'TickDir','out','LineWidth',AxisLineWidth,'FontSize',Fsize)
box off
grid off


% -------------------------
% EFFICIENCY
% -------------------------
subplot(3,1,3); hold on;

xlabel('$N\;(rpm)$', 'Interpreter','latex');
ylabel('$\eta\;[\%]$', 'Interpreter','latex');
xticks(0:1000:3000)
ylim([0 100])

for j = 1:numel(P_list)
    Pstr = P_list{j};
    dp = P_vals.(Pstr);

    if isfield(exp_data.efficiency, Dstr) && isfield(exp_data.efficiency.(Dstr), Pstr)
        N_raw = exp_data.efficiency.(Dstr).(Pstr).N(:);
        eta_raw = exp_data.efficiency.(Dstr).(Pstr).ef(:);
        mask = ~isnan(N_raw) & ~isnan(eta_raw);

        plot(N_raw(mask), eta_raw(mask), markers{j}, ...
            'Color', colors{j}, 'MarkerSize', 6, 'LineWidth', 0.8);
    end

    % MODEL
    [T_fit, q_fit] = model.evaluate(coeff, D, dp, mu, w_fit, x);

    eta = (T_fit .* w_fit) ./ (q_fit * dp) * 100;
    eta(q_fit <= 0) = NaN;

    plot(N_fit, eta, '-', 'Color', colors{j}, 'LineWidth', 2);
end

set(gca,'TickDir','out','LineWidth',AxisLineWidth,'FontSize',Fsize)
box off
grid off


%%

%% Plot LOSS data vs LOSS model (standalone)

Dstr = 'D50';   % pick displacement
x     = x_vals.(Dstr);
coeff = fitted_mottor_coeff.(Dstr);

figure('Name','Loss comparison');

% -------------------------
% TORQUE LOSS
% -------------------------
subplot(2,1,1); hold on; grid on;
title(['Torque Loss - ', Dstr]);
xlabel('Speed (rpm)');
ylabel('Torque Loss (Nm)');

for j = 1:numel(P_list)
    Pstr = P_list{j};
    dp   = P_vals.(Pstr);

    if isfield(exp_data.torque.(Dstr), Pstr)

        N = exp_data.torque.(Dstr).(Pstr).N(:);
        T = exp_data.torque.(Dstr).(Pstr).T(:);

        mask = ~isnan(N) & ~isnan(T);
        N = N(mask);
        T = T(mask);

        w = N * 2*pi/60;

        % --- EXPERIMENTAL LOSS ---
        T_ideal = x * D * dp / (2*pi);
        T_loss_exp = T_ideal - T;

        % --- MODEL LOSS ---
        T_loss_model = coeff.Cf * D * dp ...
                     + coeff.Cv * D * mu .* w / (2*pi);

        % Plot
        plot(N, T_loss_exp, 'o', 'DisplayName',[Pstr ' exp']);
        plot(N, T_loss_model, '-', 'LineWidth',1.5, ...
             'DisplayName',[Pstr ' model']);
    end
end

legend('Location','best');


% -------------------------
% FLOW LOSS
% -------------------------
subplot(2,1,2); hold on; grid on;
title(['Flow Loss - ', Dstr]);
xlabel('Speed (rpm)');
ylabel('Flow Loss (L/min)');

for j = 1:numel(P_list)
    Pstr = P_list{j};
    dp   = P_vals.(Pstr);

    if isfield(exp_data.flow.(Dstr), Pstr)

        N = exp_data.flow.(Dstr).(Pstr).N(:);
        q = exp_data.flow.(Dstr).(Pstr).q(:);

        mask = ~isnan(N) & ~isnan(q);
        N = N(mask);
        q = q(mask);

        w = N * 2*pi/60;

        % Convert to m^3/s
        q_si = q / 60000;

        % --- EXPERIMENTAL LOSS ---
        q_ideal = x * D * w / (2*pi);
        q_loss_exp = q_si - q_ideal;

        % --- MODEL LOSS ---
        q_loss_model = coeff.Cs * D * dp / mu * ones(size(w));

        % Convert back to L/min
        q_loss_exp   = q_loss_exp * 60000;
        q_loss_model = q_loss_model * 60000;

        % Plot
        plot(N, q_loss_exp, 'o', 'DisplayName',[Pstr ' exp']);
        plot(N, q_loss_model, '-', 'LineWidth',1.5, ...
             'DisplayName',[Pstr ' model']);
    end
end

legend('Location','best');