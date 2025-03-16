%% Loading data

temp = tempdir;
current = 'OpenModelica\OMEdit';
file = '\OET.Example.multibodyWECSingleDoF\multibodyWECSingleDoF_res.csv';

filedir = [temp current file];

outputData = readtable(filedir);


%% Body
body = {};

DoF = 6;
modes = ["Surge", "Sway", "Heave", "Roll", "Pitch", "Yaw"];
bodies = 2;
bodyName = {'float', 'spar'};

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
dynamicNames = {'excitationForce', 'radiationForce' 'hydrostaticForce'};

% excitationForce = 'excitationRegularWave';
excitationForce = 'excitationIrregularWave';
% excitationForce = 'spectrumImport';

dySourceName = {['_excitation_' excitationForce], '_radiation_radiationForce', '_hydrostatic_hydrostaticForce'};
forces = {'_F_1_','_F_2_','_F_3_','_F_4_','_F_5_','_F_6_'};
nDy = size(dynamicNames,2); 

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
dynamics = {'forceExcitation','forceRadiationDamping','forceRestoring'};
rows = 2; % Number of rows
cols = 3; % Number of columns

% Kinematics
kinUnits = {'m','m','m','rad','rad','rad';
    'm/s','m/s','m/s','rad/s','rad/s','rad/s';
    'm/s^2','m/s^2','m/s^2','rad/s^2','rad/s^2','rad/s^2'};

% Dynamics
dyUnits = {'N','N','N','Nm','Nm','Nm'};



for i = 1:bodies
    for j = 1:nKin
        figure('Name', [bodyName{i} ' ' kinematicNames{j}]);
        for k = 1:DoF
            subplot(rows, cols, k); 
            plot(body(i).time,body(i).(kinematicNames{j})(:,k));
            hold on
            tempNameWS = kinematics{j};
            plot(output.bodies(i).time, output.bodies(i).(kinematics{j})(:, k));
            title([num2str(modes(k))]); 
            xlabel('Time (s)');
            ylabel([kinematicNames{j} ' (' kinUnits{j,k} ')']); 
            legend('OET','WEC-Sim','Location','best');
        end
    end

  for j = 1:nDy
    figure('Name', [bodyName{i} ' ' dynamicNames{j}]);
        for k = 1:DoF
            subplot(rows, cols, k); 
            plot(body(i).time,body(i).(dynamicNames{j})(:,k));
            hold on
            tempNameWS = dynamics{j};
            plot(output.bodies(i).time, output.bodies(i).(tempNameWS)(:, k)); 
            title([num2str(modes(k))]); 
            xlabel('Time (s)');
            ylabel([dynamicNames{j} ' (' dyUnits{k} ')']); 
            legend('OET','WEC-Sim','Location','best');

        end
   end
end


% 
% save('RM3SparValidation.mat','body','output')