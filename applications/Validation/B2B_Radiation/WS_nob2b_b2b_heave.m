noB2BData = load('WECSimHeaveNoB2B.mat');
B2BData = load('WECSimHeaveB2B.mat');

DoF = 6;
modes = ["Surge", "Sway", "Heave", "Roll", "Pitch", "Yaw"];

% dynamics = {'forceExcitation','forceRadiationDamping','forceRestoring'};
dynamics = {'forceRadiationDamping','forceAddedMass'};
rows = 2; % Number of rows
cols = 3; % Number of columns
bodyName = {'float','spar'};
bodies = size(bodyName,2);

kinematics = {'position', 'velocity' 'acceleration'};
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
nDy = 2;

% Dynamics
dynamicNames = {'radiationForce' 'addedMassForce'};

% Kinematics
kinUnits = {'m','m','m','rad','rad','rad';
    'm/s','m/s','m/s','rad/s','rad/s','rad/s';
    'm/s^2','m/s^2','m/s^2','rad/s^2','rad/s^2','rad/s^2'};

% Dynamics
dyUnits = {'N','N','N','Nm','Nm','Nm'};

% Folder to save figures 
saveFolder = fullfile(pwd, 'Plots', 'Heave', 'NoB2B_B2B');
if ~exist(saveFolder, 'dir')
    mkdir(saveFolder);
end

for i = 1:bodies
%     for j = 1:nKin
%         figure('Name', [bodyName{i} ' ' kinematicNames{j}]);
%         for k = 1:DoF
%             subplot(rows, cols, k); 
%             plot(noB2BData.output.bodies(i).time, noB2BData.output.bodies(i).(kinematics{j})(:, k)); 
%             hold on
%             tempNameWS = kinematics{j};
%             plot(B2BData.output.bodies(i).time, B2BData.output.bodies(i).(kinematics{j})(:, k)); 
%             title([num2str(modes(k))]); 
%             xlabel('Time (s)');
%             ylabel([kinematicNames{j} ' (' kinUnits{j,k} ')']); 
%             legend('No B2B','B2B','Location','best');
%         end
%     end

  for j = 1:nDy
    figure('Name', [bodyName{i} ' ' dynamicNames{j}]);
        for k = 3
            %subplot(rows, cols, k);
            plot(noB2BData.output.bodies(i).time, noB2BData.output.bodies(i).(tempNameWS)(:, k)); 
            hold on
            tempNameWS = dynamics{j};
            plot(B2BData.output.bodies(i).time, B2BData.output.bodies(i).(tempNameWS)(:, k)); 
            title([num2str(modes(k))]); 
            xlabel('Time (s)');
            ylabel([dynamicNames{j} ' (' dyUnits{k} ')']); 
            legend('No B2B','B2B','Location','best');

            % Build save name
            baseName = sprintf('WS_NoB2B_B2B_heave_%s_%s', bodyName{i}, lower(dynamicNames{j}));
            figFile = fullfile(saveFolder, [baseName '.fig']);
            pngFile = fullfile(saveFolder, [baseName '.png']);
    
            % Save both .fig and .png
            saveas(gcf, figFile);
            saveas(gcf, pngFile);
            close;
        end
   end
end
