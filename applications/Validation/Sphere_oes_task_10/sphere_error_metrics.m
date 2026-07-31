%% Load results
load('oes_sphere_results.mat')

%% Calculate RMSE and NRMSE (range normalized)
% Compare OET against WEC-Sim benchmark

oes_sphere_metrics = struct();

cases = {'decay_1m','decay_5m'};

for i = 1:length(cases)

    case_name = cases{i};

    % Extract WEC-Sim benchmark
    t_ws = oes_sphere.(case_name).time_ws_lin;
    y_ws = oes_sphere.(case_name).ws_lin;

    % Extract OET
    t_oet = oes_sphere.(case_name).time_oet_lin;
    y_oet = oes_sphere.(case_name).oet_lin;

    % Interpolate OET onto WEC-Sim time vector
    y_oet_interp = interp1(t_oet, y_oet, t_ws, 'linear');

    % Remove invalid points if time ranges differ
    valid = ~isnan(y_oet_interp);

    y_ws = y_ws(valid);
    y_oet_interp = y_oet_interp(valid);

    % RMSE
    rmse = sqrt(mean((y_ws - y_oet_interp).^2));

    % NRMSE normalized by displacement range
    nrmse = rmse / (max(y_ws)-min(y_ws));

    % Save metrics
    oes_sphere_metrics.(case_name).rmse_oet_lin = rmse;
    oes_sphere_metrics.(case_name).nrmse_oet_lin = nrmse;

end

% Display results
metrics_table = table( ...
    {'1 m decay'; '5 m decay'}, ...
    [oes_sphere_metrics.decay_1m.rmse_oet_lin; ...
     oes_sphere_metrics.decay_5m.rmse_oet_lin], ...
    [oes_sphere_metrics.decay_1m.nrmse_oet_lin*100; ...
     oes_sphere_metrics.decay_5m.nrmse_oet_lin*100], ...
    'VariableNames', {'Test', 'RMSE (m)', 'NRMSE (%)'});

disp(metrics_table)

%% Save metrics
save('oes_sphere_metrics.mat','oes_sphere_metrics')

%% Load and plot metrics
load('oes_sphere_metrics.mat')

% Display results
metrics_table = table( ...
    {'1 m decay'; '5 m decay'}, ...
    [oes_sphere_metrics.decay_1m.rmse_oet_lin; ...
     oes_sphere_metrics.decay_5m.rmse_oet_lin], ...
    [oes_sphere_metrics.decay_1m.nrmse_oet_lin*100; ...
     oes_sphere_metrics.decay_5m.nrmse_oet_lin*100], ...
    'VariableNames', {'Test', 'RMSE (m)', 'NRMSE (%)'});

disp(metrics_table)