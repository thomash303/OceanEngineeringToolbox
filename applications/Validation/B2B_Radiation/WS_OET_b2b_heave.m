%% Loading data

temp = tempdir;
%file = '\OET.Example.multibodyWECSingleDoF\multibodyWECSingleDoF_res.csv';
% file = '\OceanEngineeringToolbox.Tutorial.RM3\RM3_res.csv';
current = fullfile('OpenModelica', 'OMEdit');  % Path to default OMEdit result file
file = fullfile('waveTester', 'waveTester_res.csv');
filedir = fullfile(temp, current, file);

%outputData = readtable(filedir);

B2BData = load('WECSimHeaveB2B.mat');

%% Body
body = {};

DoF = 6;
modes = ["Surge", "Sway", "Heave", "Roll", "Pitch", "Yaw"];
bodyName = {'float','spar'};
bodies = size(bodyName,2);

%% Data Extraction

% duration = size(outputData.time,1);

% Kinematics
% Kinematic component names
kinematicNames = {'position', 'velocity' 'acceleration'};
displacements = {'r_1_', 'r_2_', 'r_3_', 'angles_1_', 'angles_2_', 'angles_3_'};
velocities = {'v_1_', 'v_2_', 'v_3_', 'w_1_', 'w_2_', 'w_3_'};
accelerations = {'a_1_', 'a_2_', 'a_3_', 'z_1_', 'z_2_', 'z_3_'};
kinQuantities = [displacements; velocities; accelerations];
units = {'m','m','m','rad','rad','rad';
    'm/s','m/s','m/s','rad/s','rad/s','rad/s';
    'm/s^2','m/s^2','m/s^2','rad/s^2','rad/s^2','rad/s^2'};
kinSourceName = '_body_absoluteSensor_';
nKin = size(kinematicNames,2);

% Dynamics
dynamicNames = {'radiationForce' 'addedMassForce'};

% excitationForce = 'excitationRegularWave';
excitationForce = 'excitationForceIrregularWaveEqualEnergy';
% excitationForce = 'spectrumImport';

dySourceName = {'_radiation_radiationForceB2B', '_radiation_addedMassForceB2B'};
forces = {'_F_1_','_F_2_','_F_3_','_F_4_','_F_5_','_F_6_'};
% nDy = size(dynamicNames,2); 
nDy = 1;

kinematics = {'position', 'velocity' 'acceleration'};

[~, uidx] = unique(outputData.time, 'stable');
outputData = outputData(uidx, :);


% Saving OET
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
        for k = 1:DoF
            tempName = [bodyName{i} dySourceName{j} forces{k}];
            body(i).(dynamicNames{j})(:,k) = outputData.(tempName);
        end
    end

end

%% Plotting OET and WEC-Sim
% dynamics = {'forceExcitation','forceRadiationDamping','forceRestoring'};
dynamics = {'forceRadiationDamping','forceAddedMass'};
rows = 2; % Number of rows
cols = 3; % Number of columns

% Kinematics
kinUnits = {'m','m','m','rad','rad','rad';
    'm/s','m/s','m/s','rad/s','rad/s','rad/s';
    'm/s^2','m/s^2','m/s^2','rad/s^2','rad/s^2','rad/s^2'};

% Dynamics
dyUnits = {'N','N','N','Nm','Nm','Nm'};

% Folder to save figures 
saveFolder = fullfile(pwd, 'Plots', 'Heave');
if ~exist(saveFolder, 'dir')
    mkdir(saveFolder);
end

% 
for i = 1:bodies
    for j = 1:nKin
        figure('Name', [bodyName{i} ' ' kinematicNames{j}]);
        for k = 3
            %subplot(rows, cols, k); 
            plot(body(i).time,body(i).(kinematicNames{j})(:,k));
            hold on
            tempNameWS = kinematics{j};
            plot(output.bodies(i).time, output.bodies(i).(kinematics{j})(:, k)); 
            title([num2str(modes(k))]); 
            xlabel('Time (s)');
            ylabel([kinematicNames{j} ' (' kinUnits{j,k} ')']); 
            legend('OET','WEC-Sim','Location','best');

            % Build save name
            baseName = sprintf('WS_OET_B2B_heave_%s_%s', bodyName{i}, lower(kinematicNames{j}));
            figFile = fullfile(saveFolder, [baseName '.fig']);
            pngFile = fullfile(saveFolder, [baseName '.png']);
    
            % Save both .fig and .png
            saveas(gcf, figFile);
            saveas(gcf, pngFile);
            close;

        end
    end

  for j = 1:nDy
    figure('Name', [bodyName{i} ' ' dynamicNames{j}]);
        for k = 3
            %subplot(rows, cols, k); 
            plot(body(i).time,body(i).(dynamicNames{j})(:,k));
            hold on
            tempNameWS = dynamics{j};
            plot(B2BData.output.bodies(i).time, B2BData.output.bodies(i).(tempNameWS)(:, k)); 
            title([num2str(modes(k))]); 
            xlabel('Time (s)');
            ylabel([dynamicNames{j} ' (' dyUnits{k} ')']); 
            legend('OET','WEC-Sim','Location','best');

            % Build save name
            baseName = sprintf('WS_OET_B2B_heave_%s_%s', bodyName{i}, lower(dynamicNames{j}));
            figFile = fullfile(saveFolder, [baseName '.fig']);
            pngFile = fullfile(saveFolder, [baseName '.png']);
    
            % Save both .fig and .png
            saveas(gcf, figFile);
            saveas(gcf, pngFile);
            close;

        end
   end
end


% 
% save('RM3SparValidation.mat','body','output')