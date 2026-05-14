%% Reading WEC3 data for F-3OF

%% Orginal WEC3 Codes
tools = {'PDS','WDN','INW','WSM'};
dts   = {'DT1','DT2','DT3'};

motions_std = {'HEAVE','PITCH','SURGE'};
motions_dt3 = {'FLAP1','FLAP2'};

basePath = 'Reference_data';

F3OF_data = struct();

for t = 1:length(tools)

    tool = tools{t};

    for i = 1:length(dts)

        dt = dts{i};

        if strcmp(dt,'DT3')
            motions = motions_dt3;
        else
            motions = motions_std;
        end

        for j = 1:length(motions)

            motion = motions{j};

            fileName = fullfile(basePath, tool, 'DT1-3', ...
                sprintf('%s_F3OF_%s_%s.dat', tool, dt, motion));

            % skip first 5 header lines
            raw = readmatrix(fileName, ...
                'FileType','text', ...
                'NumHeaderLines',5);

            % keep only valid numeric rows
            raw = raw(~all(isnan(raw),2), :);

            time  = raw(:,1);
            value = raw(:,2);

            F3OF_data.(lower(dt)).(lower(tool)).(lower(motion)) = ...
                table(time, value);

        end
    end
end

%% HydroChrono data
%% HydroChrono data
hcPath = 'Reference_data\HC\';

hcFiles = { ...
    'CHRONO_F3OF_DT1_surge.txt', ...
    'CHRONO_F3OF_DT2_PITCH.txt', ...
    'CHRONO_F3OF_DT3_PITCH.txt'};

dts = {'DT1','DT2','DT3'};

for i = 1:length(dts)

    dt = dts{i};

    fileName = fullfile(hcPath, hcFiles{i});

    raw = readmatrix(fileName);
    raw = raw(~all(isnan(raw),2), :);

    time = raw(:,1);

    if strcmp(dt,'DT3')

        % DT3:
        % col 4 = flap fore
        % col 5 = flap aft

        flap1 = rad2deg(raw(:,4));
        flap2 = rad2deg(raw(:,5));

        F3OF_data.dt3.hc.flap1 = table(time, flap1, ...
            'VariableNames', {'time','value'});

        F3OF_data.dt3.hc.flap2 = table(time, flap2, ...
            'VariableNames', {'time','value'});

    else

        % DT1 / DT2:
        % col 2 = surge
        % col 3 = pitch

        surge = raw(:,2);
        pitch = rad2deg(raw(:,3));

        F3OF_data.(lower(dt)).hc.surge = table(time, surge, ...
            'VariableNames', {'time','value'});

        F3OF_data.(lower(dt)).hc.pitch = table(time, pitch, ...
            'VariableNames', {'time','value'});

    end
end

%% Saving
save('F3OF_data.mat','F3OF_data')