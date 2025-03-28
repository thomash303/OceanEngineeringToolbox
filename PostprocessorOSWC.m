%% Loading data

% temp = tempdir;
% current = 'OpenModelica\OMEdit';
% file = '\OET.Example.multibodyWECSingleDoF\multibodyWECSingleDoF_res.csv';
% 
% filedir = [temp current file];
% 
% outputData = readtable(filedir);


%% Body
body = {};

DoF = 6;
modes = ["Surge", "Sway", "Heave", "Roll", "Pitch", "Yaw"];
bodies = 2;
bodyName = {'flap', 'base'};

%% Data Extraction

duration = size(outputData.time,1);

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
dynamicNames = {'excitationForce', 'radiationForce' 'hydrostaticForce', 'inertialForce'};

excitationForce = 'excitationRegularWave';
% excitationForce = 'excitationIrregularWave';
% excitationForce = 'spectrumImport';

dySourceName = {['_excitation_' excitationForce], '_radiation_radiationForce', '_hydrostatic_hydrostaticForce','_body_body'};
forces = {'_F_1_','_F_2_','_F_3_','_F_4_','_F_5_','_F_6_'};
nDy = size(dynamicNames,2); 


[~, uidx] = unique(outputData.time, 'stable');
outputData = outputData(uidx, :);

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
% 
% Mooring and PTO

% also need wave elevation



%% Plotting
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
            title([num2str(modes(k))]); 
            xlabel('Time (s)');
            ylabel([kinematicNames{j} ' (' kinUnits{j,k} ')']); 
            legend('OET','Location','best');
        end
    end


    for j = 1:nDy
    figure('Name', [bodyName{i} ' ' dynamicNames{j}]);
        for k = 1:DoF
            subplot(rows, cols, k); 

            plot(body(i).time,body(i).(dynamicNames{j})(:,k));
            title([num2str(modes(k))]); 
            xlabel('Time (s)');
            ylabel([dynamicNames{j} ' (' dyUnits{k} ')']); 
            legend('OET','Location','best');

        end
    end

end

% %% Wave
% wave = {};
% waves = 1;
% % waveSpectrumType = 'irregularWave';
% waveSpectrumType = 'regularWave';
% % waveSpectrumType = 'spectrumImport';
% spectrumComponent = {'omega', 'S', 'phi'};
% 
% 
% % Data extraction
% for i = 1:waves
%     wave(i).time = outputData.time;
%     wave(i).eta = outputData.environment_SSE;
%     if ~(strcmp(waveSpectrumType,'regularWave'))
%         for j = 1:10000
%             tempName = ['environment_' waveSpectrumType '_' spectrumComponent{1} '_' num2str(j) '_'];
%             try
%                 testLength = outputData.(temp)(1);
%             catch
%                 wave(i).nOmega = j - 1;
%                 break
%             end
%         end
% 
%         for j = 1:size(spectrumComponent,2)
%             for k = 1:nOmega
%                 tempName = ['environment_' waveSpectrumType '_' spectrumComponent{j} '_' num2str(k) '_'];
%                 wave(i).(spectrumComponent{j})(k) = outputData.(tempName)(1);
% 
%             end
%         end
%     end
% end
% 
% % % Plotting
% % col = 1;
% % for i = 1:waves
% %     figure('Name',['Wave' num2str(i)])
% %     if ~(strcmp(waveSpectrumType,'regularWave'))
% %         row = 2;
% %         subplot(row,col,2)
% %         plot(wave(i).omega,wave(i).S)
% %         title('Wave Spectrum')
% %         xlabel('Angular Frequency (rad/s)')
% %         ylabel('Spectral Density (m^2s/rad)')
% %         legend('OET','Location','best');
% %     else
% %         row = 1;
% %     end
% %     subplot(row,col,1)
% %     plot(wave(i).time,wave(i).eta)
% %     title('Wave Surface Elevation')
% %     xlabel('Time (s)')
% %     ylabel('Wave Elevation (m)')
% %     legend('OET','Location','best');
% % end
% 
% 
% 
% %% Mooring
% % Data extration
% mooring = {};
% moorings = 1;
% moorSourceName = {'linearMooring_linearMooringForce'};
% mooringNames = {'mooringForce'};
% 
% for i = 1:moorings
%     mooring(i).time = outputData.time;
% 
%     for j = 1:DoF
%         tempName = [moorSourceName{i} forces{j}];
%         mooring(i).(mooringNames{i})(:,j) = outputData.(tempName);
%     end
% 
% end
% 
% %% Plotting
% % rows = 2; % Number of rows
% % cols = 3; % Number of columns
% % for i = 1:moorings
% %     figure('Name', [mooringNames{i}]);
% % 
% %     for j = 1:DoF
% %         subplot(rows, cols, j);
% % 
% %         plot(mooring(i).time,mooring(i).(mooringNames{i})(:,j));
% %         title([num2str(modes(j))]);
% %         xlabel('Time (s)');
% %         ylabel(['Force' ' (' dyUnits{j} ')']);
% %         legend('OET','Location','best');
% %     end
% % 
% % end
% 
% %% PTO
% % Data extraction
% pto = {};
% ptos = 1;
% ptoSourceName = {'linearPTO_linearPTOForce'};
% ptoNames = {'ptoForce'};
% 
% for i = 1:ptos
%     pto(i).time = outputData.time;
% 
%     for j = 1:DoF
%         tempName = [ptoSourceName{i} forces{j}];
%         pto(i).(ptoNames{i})(:,j) = outputData.(tempName);
%     end
% 
% end
% 
% %% Plotting
% % rows = 2; % Number of rows
% % cols = 3; % Number of columns
% % for i = 1:ptos
% %     figure('Name', [ptoNames{i}]);
% % 
% %     for j = 1:DoF
% %         subplot(rows, cols, j);
% % 
% %         plot(pto(i).time,pto(i).(ptoNames{i})(:,j));
% %         title([num2str(modes(j))]);
% %         xlabel('Time (s)');
% %         % % % % % ylabel(['Force' ' (' dyUnits{j} ')']);
% %         legend('OET','Location','best');
% %     end
% % 
% % end

%% Save
% save('RM3Output.mat','body', 'wave','mooring','pto')


