function [body, wave, mooring, pto] = postprocess_WS(filePath, deviceName, ...
    bodyName, currentPath)
%% Ocean Engineering Toolbox - Post-Processing Function
%{
A post-processing function for the OET to post-process Modelica simulation data. 
The user must specify the result folder, result file, and the instantiated 
hydrodynamic body, wave, mooring, and PTO Modelica model name(cap 
sensitive). The WEC-Sim output file must be saved as 'output.mat' in the 
working directory.
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

% Importing WEC-Sim Data
output = load(fullfile(currentPath, 'output.mat'));

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
dynamics = {'forceExcitation','forceRadiationDamping','forceRestoring'}; % WEC-Sim specific

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


dySourceName = {['_excitation_' excitationForce], '_radiation_radiationForce', ...
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
        tempNameCheck = [bodyName{i} dySourceName{j} forces{1}];
        if ismember(tempNameCheck, outputData.Properties.VariableNames)
            for k = 1:DoF
                tempName = [bodyName{i} dySourceName{j} forces{k}];
                body(i).(dynamicNames{j})(:,k) = outputData.(tempName);
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
            hold on
            plot(output.bodies(i).time, output.bodies(i).(kinematicNames{j})(:, k)); 
            title([num2str(modes(k))]); 
            xlabel('Time (s)');
            ylabel([kinematicNames{j} ' (' kinUnits{j,k} ')']); 
           legend('OET','WEC-Sim','Location','best');
        end
    end

    for j = 1:nDy
        if isfield(body(i), dynamicNames{j}) && ~isempty(body(i).(dynamicNames{j}))
            figure('Name', [bodyName{i} ' ' dynamicNames{j}]);
            for k = 1:DoF
                subplot(rows, cols, k); 
                plot(body(i).time, body(i).(dynamicNames{j})(:,k));
                hold on
                plot(output.bodies(i).time, output.bodies(i).(dynamics{j})(:, k));
                title([num2str(modes(k))]); 
                xlabel('Time (s)');
                ylabel([forceTorque{k} ' (' dyUnits{k} ')']); 
                legend('OET','WEC-Sim','Location','best');
            end
        else
            fprintf('Skipping plot: %s not available for body %s.\n', dynamicNames{j}, bodyName{i});
        end
    end

end

end