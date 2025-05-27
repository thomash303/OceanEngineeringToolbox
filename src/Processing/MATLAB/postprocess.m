function [body, wave, mooring, pto] = postprocess(filePath, deviceName, bodyName,...
    waveName, mooringName, ptoName)
%% Ocean Engineering Toolbox - Post-Processing Function
%{
A post-processing function for the OET to post-process Modelica simulation data. 
The user must specify the result folder, result file, and the instantiated 
hydrodynamic body, wave, mooring, and PTO Modelica model name(cap 
sensitive).
%}

% Importing Modelica simulation data
% File directory
temp = tempdir;
basePath = fullfile('OpenModelica', 'OMEdit');  % Path to default OMEdit result file
fileName = fullfile([filePath{1} '.' deviceName{1}], [deviceName{1} '_res.csv']);  % Path to current file                  
%{
The default result file and file name are shown in the output tab of the 
 simulation setup as "Result File (optional) and File Name Prefix
 (optional).
%}

% Importing Modelica data
filePath = fullfile(temp, basePath, fileName);
outputData = readtable(filePath);

% Remove duplicate time records from OET output file
[~, uidx] = unique(outputData.time, 'stable');
outputData = outputData(uidx, :);

%% Hydrodynamic Data
% Body Parameters
body = {};
bodies = numel(bodyName);

% Data Extraction
DoF = 6;
modes = ["Surge", "Sway", "Heave", "Roll", "Pitch", "Yaw"];

% Kinematics
% Kinematic component names
kinematicNames = {'position', 'velocity' 'acceleration'};
displacements = {'r_1_', 'r_2_', 'r_3_', 'angles_1_', 'angles_2_', 'angles_3_'};
velocities = {'v_1_', 'v_2_', 'v_3_', 'w_1_', 'w_2_', 'w_3_'};
accelerations = {'a_1_', 'a_2_', 'a_3_', 'z_1_', 'z_2_', 'z_3_'};
kinQuantities = [displacements; velocities; accelerations];
kinSourceName = '_body_absoluteSensor_';
nKin = size(kinematicNames,2);

% Dynamics
dynamicNames = {'excitationForce', 'radiationForce', ...
    'hydrostaticForce', 'inertialForce'};
forceTorque = {'Force', 'Force', 'Force', 'Moment', 'Moment', 'Moment'};

% Account for different excitation options
excitationForceOptions = {...
    'excitationForceRegularWave', ...
    'excitationForceIrregularWaveEqualEnergy', ...
    'excitationForceIrregularWaveRandom', ...
    'excitationForcespectrumImport'};

excitationForce = '';

for i = 1:length(excitationForceOptions)
    keyword = excitationForceOptions{i};
    % Check if any variable name contains the excitation force keyword
    matches = contains(outputData.Properties.VariableNames, keyword);
    if any(matches)
        excitationForce = keyword;
        break
    end
end

% If no excitation force is present, set to a default so code can proceed
if isempty(excitationForce)
    excitationForce = 'excitationForceRegularWave';
end


dySourceName = {['_excitation_' excitationForce], '_radiation_radiationForceNoB2B', ...
    '_hydrostatic_hydrostaticForce','_body_body'};
forces = {'_F_1_','_F_2_','_F_3_','_F_4_','_F_5_','_F_6_'};
nDy = size(dynamicNames,2); 

% Looping to extract data from the table and save it in a structure
for i = 1:bodies
    body(i).body = bodyName{i};
    body(i).time = outputData.time;
    for j = 1:nKin
        for k = 1:DoF
            tempName = [bodyName{i} kinSourceName kinQuantities{j,k}];
            body(i).(kinematicNames{j})(:,k) = outputData.(tempName);
        end
    end

    for j = 1:nDy
        % Check if force is present
        forcePresentCheck = [bodyName{i} dySourceName{j} forces{1}];
        if ismember(forcePresentCheck, outputData.Properties.VariableNames)
            for k = 1:DoF
                tempName = [bodyName{i} dySourceName{j} forces{k}];
                body(i).(dynamicNames{j})(:,k) = outputData.(tempName);
            end
            % Adding buoyancy force to hydrostatic force
            if strcmp(dynamicNames{j}, 'hydrostaticForce')
                for k = 1:DoF
                    tempName = [bodyName{i} '_hydrostatic_buoyancyForce' forces{k}];
                    body(i).(dynamicNames{j})(:,k) = ...
                        body(i).(dynamicNames{j})(:,k) + ...
                        outputData.(tempName);
                end
            end

        else
            fprintf('Warning: %s%s not found in outputData. Skipping.\n', ...
                bodyName{i}, dySourceName{j});
        end

    end

end

% Plotting
rows = 2; % Number of rows
cols = 3; % Number of columns

% Kinematics
kinUnits = {'m','m','m','rad','rad','rad';
    'm/s','m/s','m/s','rad/s','rad/s','rad/s';
    'm/s^2','m/s^2','m/s^2','rad/s^2','rad/s^2','rad/s^2'};

% Dynamics
dyUnits = {'N','N','N','Nm','Nm','Nm'};


% Looping to extract data from the structure and plot it
for i = 1:bodies
    for j = 1:nKin
        figure('Name', [bodyName{i} ' ' kinematicNames{j}]);
        for k = 1:DoF
            subplot(rows, cols, k); 
            plot(body(i).time,body(i).(kinematicNames{j})(:,k));
            title([num2str(modes(k))]); 
            xlabel('Time (s)');
            ylabel([kinematicNames{j} ' (' kinUnits{j,k} ')']); 
            legend('OET','Location','best');
        end
    end

    for j = 1:nDy
        if isfield(body(i), dynamicNames{j}) && ~isempty(body(i).(dynamicNames{j}))
            figure('Name', [bodyName{i} ' ' dynamicNames{j}]);
            for k = 1:DoF
                subplot(rows, cols, k); 
                plot(body(i).time, body(i).(dynamicNames{j})(:,k));
                title([num2str(modes(k))]); 
                xlabel('Time (s)');
                ylabel([forceTorque{k} ' (' dyUnits{k} ')']); 
                legend('OET','Location','best');
            end
        else
            fprintf('Skipping plot: %s not available for body %s.\n', dynamicNames{j}, bodyName{i});
        end
    end

end

%% Wave Data
% Wave Parameters
wave = {};
waves = numel(waveName);

% Looping to extract data from the table and save it in a structure
for i = 1:waves
    wave(i).time = outputData.time;

    tempName = waveName{1};
    wave(i).eta = outputData.(tempName);
end

% Looping to extract data from the structure and plot it
for i = 1:waves
    figure('Name',['Wave Surface Elevation' ' ' num2str(i)])
    plot(wave(i).time,wave(i).eta)
    title('Wave Surface Elevation')
    xlabel('Time (s)')
    ylabel('Wave Elevation (m)')
    legend('OET','Location','best');
end



%% Mooring Data
% Mooring Parameters
mooring = {};
moorings = numel(mooringName);

% Data extration
moorSourceName = {'linearMooring_'};
mooringNames = {'mooringForce'};

% Looping to extract data from the table and save it in a structure
for i = 1:moorings
    mooring(i).mooring = mooringName{i};
    mooring(i).time = outputData.time;

    for j = 1:DoF
        tempName = [moorSourceName{i} mooringName{i} forces{j}];
        mooring(i).(mooringNames{i})(:,j) = outputData.(tempName);
    end

end

% Looping to extract data from the structure and plot it
for i = 1:moorings
    figure('Name', [mooringName{i} ' ' mooringNames{i}]);

    for j = 1:DoF
        subplot(rows, cols, j);

        plot(mooring(i).time,mooring(i).(mooringNames{i})(:,j));
        title([num2str(modes(j))]);
        xlabel('Time (s)');
        ylabel([forceTorque{j} ' (' dyUnits{j} ')']);
        legend('OET','Location','best');
    end

end

%% PTO Data
% Data extraction
pto = {};
ptos = numel(ptoName);
ptoNames = {'ptoForce'};

% Looping to extract data from the table and save it in a structure
for i = 1:ptos
    pto(i).pto = ptoName{i};
    pto(i).time = outputData.time;

    tempName = ptoName{i};

    % Prismatic or revolute joint type
    if ismember([ptoName{i} '_prismatic_f'], outputData.Properties.VariableNames)
        pto(i).jointType = 'prismatic';
    
    elseif ismember([ptoName{i} '_revolute_tau'], outputData.Properties.VariableNames)
        pto(i).jointType = 'revolute';
    else
        fprintf('Warning: PTO %s has neither prismatic nor revolute fields. Skipping.\n', ...
            ptoName{i});
    end

    pto(i).power = outputData.([tempName '_P']);

    if pto(i).jointType == 'prismatic'
        pto(i).velocity = outputData.([ptoName{i} '_prismatic_v']);
        pto(i).force    = outputData.([ptoName{i} '_prismatic_f']);
    elseif pto(i).jointType == 'revolute'
        pto(i).velocity = outputData.([ptoName{i} '_revolute_w']);
        pto(i).force    = outputData.([ptoName{i} '_revolute_tau']);
    end
end

% Looping to extract data from the structure and plot it
for i = 1:ptos
    figure('Name', [ptoName{i} ' ' ptoNames{i}]);

    if ismember(pto(i).jointType, {'prismatic', 'revolute'})
        subplot(3, 2, j);

        if pto(i).jointType == 'prismatic'
            z = 1;
        elseif pto(i).jointType == 'revolute'
            z = 6;
        end

        % Subplot 1: Velocity
        subplot(3,1,1);
        plot(pto(i).time, pto(i).velocity);
        title('PTO Velocity');
        xlabel('Time (s)');
        ylabel([kinematicNames{2} ' (' kinUnits{2,z} ')']);
        legend('OET','Location','best');
    
        % Subplot 2: Force/Torque
        subplot(3,1,2);
        plot(pto(i).time, pto(i).force);
        title('PTO Force/Torque');
        xlabel('Time (s)');
        ylabel([forceTorque{z} ' (' dyUnits{z} ')']);
        legend('OET','Location','best');
    
        % Subplot 3: Power
        subplot(3,1,3);
        plot(pto(i).time, pto(i).power);
        title('PTO Power');
        xlabel('Time (s)');
        ylabel('Power (W)');
        legend('OET','Location','best');
    end

end

%% Save
save([deviceName{1} 'Output.mat'],'body', 'wave','mooring','pto')
fprintf('Saved post-processed data to:\n  %s\n', [deviceName{1} 'Output.mat']);


end