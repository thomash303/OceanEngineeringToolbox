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

length = size(outputData.time,1);

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

excitationForce = 'excitationRegularWave';
% excitationForce = 'excitationIrregularWave';
% excitationForce = 'spectrumImport';

dySourceName = {['_excitation_' excitationForce], '_radiation_radiationForce', '_hydrostatic_hydrostaticForce'};
forces = {'_F_1_','_F_2_','_F_3_','_F_4_','_F_5_','_F_6_'};
nDy = size(dynamicNames,2); 


for i = 1:bodies
    body(i).body = bodyName{i};
    body(i).time = outputData.time;
    for j = 1:nKin
        for k = 1:DoF
            tempName = [bodyName{i} kinSourceName kinQuantities{j,k}];
            body(i).(kinematicNames{j})(:,k) = outputData.(tempName);
        end
    end

end

for i = 1:bodies
    for j = 1:nKin
        figure('Name', [bodyName{i} ' ' kinematicNames{j}]);
        for k = 1:DoF
            subplot(rows, cols, k); 
            plot(body(i).time,body(i).(kinematicNames{j})(:,k));
            hold on
            title([num2str(modes(k))]); 
            xlabel('Time (s)');
            ylabel([kinematicNames{j} ' (' kinUnits{j,k} ')']); 
            legend('OET','Location','best');
        end
    end

end

% General Plotting Initialization
%fileName = {'TestResults1'};
rows = 2; % Number of rows
cols = 3; % Number of columns
n = 3;
DoF = min(rows * cols, size(output.bodies.velocity, 2));
modes = ["Surge", "Sway", "Heave", "Roll", "Pitch", "Yaw"];
OETData = 8004;
bodies = 1;
bodyName = {'float', 'spar'};

%% Kinematic Results
% Kinematic component names
kinematics = {'position', 'velocity' 'acceleration'};
displacements = {'r1', 'r2', 'r3', 'angles1', 'angles2', 'angles3'};
velocities = {'v1', 'v2', 'v3', 'w1', 'w2', 'w3'};
accelerations = {'a1', 'a2', 'a3', 'z1', 'z2', 'z3'};
kinQuantities = [displacements; velocities; accelerations];
units = {'m','m','m','rad','rad','rad';
    'm/s','m/s','m/s','rad/s','rad/s','rad/s';
    'm/s^2','m/s^2','m/s^2','rad/s^2','rad/s^2','rad/s^2'};

sourceName = 'absoluteSensor';
for i = 1:bodies
    for j = 1:n
        figure('Name', [bodyName{i} ' ' kinematics{j}]);
        for k = 1:DoF
            subplot(rows, cols, k); 
            tempNameWS = [kinematics{j}];
            plot(output.bodies.time, output.bodies.(tempNameWS)(:, k)); 
        end
    end
end

save('RM3SparValidation.mat','body','output')