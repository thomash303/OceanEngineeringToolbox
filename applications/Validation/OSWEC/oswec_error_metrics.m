%% Load results
load('oswec_results.mat')

%% Calculate RMSE and NRMSE (range normalized)
% OET compared against WEC-Sim benchmark

oswec_metrics = struct();

%% Define cases

cases = {
    'decay_10d'
    'regular'
    'irregular'
};

for i = 1:length(cases)

    case_name = cases{i};

    %% Extract data

    if strcmp(case_name,'decay_10d')

        % Decay only has position
        t_ws = oswec.decay_10d.time_ws;
        ws_pos = oswec.decay_10d.ws_pos;

        t_oet = oswec.decay_10d.time_oet;
        oet_pos = oswec.decay_10d.oet_pos;

    else

        % Regular / irregular have position and velocity
        t_ws = oswec.(case_name).time_ws;

        ws_pos = oswec.(case_name).ws_pos;
        ws_vel = oswec.(case_name).ws_vel;

        t_oet = oswec.(case_name).time_oet2;

        oet_pos = oswec.(case_name).oet_pos2;
        oet_vel = oswec.(case_name).oet_vel2;

    end

    %% Interpolate OET onto WEC-Sim time vector

    oet_pos_interp = interp1(t_oet, oet_pos, t_ws, 'linear');

    %% Remove invalid points
    % Start metrics after 100 s for irregular case only

    if strcmp(case_name,'irregular')
        valid = (t_ws >= 100) & ~isnan(oet_pos_interp);
    else
        valid = ~isnan(oet_pos_interp);
    end

    ws_pos_valid = ws_pos(valid);
    oet_pos_valid = oet_pos_interp(valid);

    %% Initialize metrics structure

    metrics = struct();

    %% Pitch position metrics

    metrics.pitch_pos.rmse = sqrt(mean((ws_pos_valid - oet_pos_valid).^2));

    metrics.pitch_pos.nrmse = metrics.pitch_pos.rmse / ...
        (max(ws_pos_valid) - min(ws_pos_valid));

    %% Pitch velocity metrics (regular/irregular only)

    if ~strcmp(case_name,'decay_10d')

        oet_vel_interp = interp1(t_oet, oet_vel, t_ws, 'linear');

        if strcmp(case_name,'irregular')
            valid_vel = (t_ws >= 100) & ~isnan(oet_vel_interp);
        else
            valid_vel = ~isnan(oet_vel_interp);
        end

        ws_vel_valid = ws_vel(valid_vel);
        oet_vel_valid = oet_vel_interp(valid_vel);

        metrics.pitch_vel.rmse = ...
            sqrt(mean((ws_vel_valid - oet_vel_valid).^2));

        metrics.pitch_vel.nrmse = ...
            metrics.pitch_vel.rmse / ...
            (max(ws_vel_valid) - min(ws_vel_valid));

    end

    %% Save

    oswec_metrics.(case_name) = metrics;

    %% Display number of samples used (optional)

    fprintf('%s: Position starts at %.1f s (%d samples)\n', ...
        case_name, t_ws(find(valid,1)), nnz(valid));

    if ~strcmp(case_name,'decay_10d')
        fprintf('%s: Velocity starts at %.1f s (%d samples)\n', ...
            case_name, t_ws(find(valid_vel,1)), nnz(valid_vel));
    end

end

%% Create results table

Test = {};
Variable = {};
RMSE = [];
NRMSE = [];

idx = 1;

for i = 1:length(cases)

    case_name = cases{i};

    % Pitch position
    Test{idx,1} = case_name;
    Variable{idx,1} = 'Pitch position';

    RMSE(idx,1) = oswec_metrics.(case_name).pitch_pos.rmse;
    NRMSE(idx,1) = 100 * oswec_metrics.(case_name).pitch_pos.nrmse;

    idx = idx + 1;

    % Pitch velocity (regular/irregular only)
    if isfield(oswec_metrics.(case_name),'pitch_vel')

        Test{idx,1} = case_name;
        Variable{idx,1} = 'Pitch velocity';

        RMSE(idx,1) = oswec_metrics.(case_name).pitch_vel.rmse;
        NRMSE(idx,1) = 100 * oswec_metrics.(case_name).pitch_vel.nrmse;

        idx = idx + 1;

    end

end

metrics_table = table(Test, Variable, RMSE, NRMSE);

disp(metrics_table)

%% Save metrics

save('oswec_metrics.mat','oswec_metrics','metrics_table')

%% Load and display saved metrics

load('oswec_metrics.mat')

disp(metrics_table)