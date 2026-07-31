%% Load results
load('rm3_results.mat')

%% Calculate RMSE and NRMSE (range normalized)
% OET compared against WEC-Sim benchmark

rm3_metrics = struct();

cases = {
    'regular.b2b'
    'irreglar.b2b'
};

for i = 1:length(cases)

    case_name = cases{i};
    
    % Convert string to structure indexing
    parts = split(case_name,'.');
    wave_case = parts{1};
    config = parts{2};

    %% Extract WEC-Sim data
    t_ws = rm3.(wave_case).ws.(config).time;

    ws_float_vel = rm3.(wave_case).ws.(config).float.vel_heave;
    ws_spar_vel  = rm3.(wave_case).ws.(config).spar.vel_heave;
    ws_rel_vel   = ws_float_vel - ws_spar_vel;

    ws_pitch = rm3.(wave_case).ws.(config).float.pos_pitch;


    %% Extract OET data
    t_oet = rm3.(wave_case).oet.(config).time;

    oet_float_vel = rm3.(wave_case).oet.(config).float.vel_heave;
    oet_spar_vel  = rm3.(wave_case).oet.(config).spar.vel_heave;
    oet_rel_vel   = oet_float_vel - oet_spar_vel;

    oet_pitch = rm3.(wave_case).oet.(config).float.pos_pitch;


    %% Interpolate OET onto WEC-Sim time vector

    oet_float_vel = interp1(t_oet,oet_float_vel,t_ws,'linear');
    oet_spar_vel  = interp1(t_oet,oet_spar_vel,t_ws,'linear');
    oet_rel_vel   = interp1(t_oet,oet_rel_vel,t_ws,'linear');
    oet_pitch     = interp1(t_oet,oet_pitch,t_ws,'linear');


    %% Remove NaN values
    % Start error calculation after 100 s for irregular case only
    
    if strcmp(wave_case,'irreglar')
        valid = (t_ws >= 100) & ...
                ~isnan(oet_float_vel) & ...
                ~isnan(oet_spar_vel) & ...
                ~isnan(oet_rel_vel) & ...
                ~isnan(oet_pitch);
    else
        valid = ~isnan(oet_float_vel) & ...
                ~isnan(oet_spar_vel) & ...
                ~isnan(oet_rel_vel) & ...
                ~isnan(oet_pitch);
    end


    %% Calculate metrics

    metrics = struct();

    % Float heave velocity
    metrics.float_vel.rmse = sqrt(mean((ws_float_vel(valid)-oet_float_vel(valid)).^2));
    metrics.float_vel.nrmse = metrics.float_vel.rmse / ...
        (max(ws_float_vel(valid))-min(ws_float_vel(valid)));


    % Spar heave velocity
    metrics.spar_vel.rmse = sqrt(mean((ws_spar_vel(valid)-oet_spar_vel(valid)).^2));
    metrics.spar_vel.nrmse = metrics.spar_vel.rmse / ...
        (max(ws_spar_vel(valid))-min(ws_spar_vel(valid)));


    % Relative heave velocity
    metrics.rel_vel.rmse = sqrt(mean((ws_rel_vel(valid)-oet_rel_vel(valid)).^2));
    metrics.rel_vel.nrmse = metrics.rel_vel.rmse / ...
        (max(ws_rel_vel(valid))-min(ws_rel_vel(valid)));


    % Float pitch position
    metrics.pitch.rmse = sqrt(mean((ws_pitch(valid)-oet_pitch(valid)).^2));
    metrics.pitch.nrmse = metrics.pitch.rmse / ...
        (max(ws_pitch(valid))-min(ws_pitch(valid)));


    %% Save

    rm3_metrics.(wave_case).(config) = metrics;

end


%% Display table

Test = {};
RMSE = [];
NRMSE = [];
Variable = {};

idx = 1;

for i = 1:length(cases)

    parts = split(cases{i},'.');
    wave_case = parts{1};
    config = parts{2};

    names = {'float_vel','spar_vel','rel_vel','pitch'};

    for j = 1:length(names)

        Test{idx,1} = [wave_case ' ' config];
        Variable{idx,1} = names{j};

        RMSE(idx,1) = rm3_metrics.(wave_case).(config).(names{j}).rmse;
        NRMSE(idx,1) = rm3_metrics.(wave_case).(config).(names{j}).nrmse*100;

        idx = idx + 1;

    end

end


metrics_table = table(Test,Variable,RMSE,NRMSE);

disp(metrics_table)


%% Save metrics

save('rm3_metrics.mat','rm3_metrics','metrics_table')

%% Load and display saved metrics

load('rm3_metrics.mat')

disp(metrics_table)