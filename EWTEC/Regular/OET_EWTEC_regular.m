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
% bodies = 2;
% bodyName = {'float', 'spar'};
bodies = 1;
bodyName = {'float'};


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
dynamicNames = {'excitationForce', 'radiationForce' 'hydrostaticForce'};

% excitationForce = 'excitationRegularWave';

excitationForce = 'excitationIrregularWave';

dySourceName = {['_excitation_' excitationForce], '_radiation_radiationForce', '_hydrostatic_hydrostaticForce'};
forces = {'_F_1_','_F_2_','_F_3_','_F_4_','_F_5_','_F_6_'};
nDy = size(dynamicNames,2); 

kinematics = {'position', 'velocity' 'acceleration'};


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

% % PTO
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

% save('RM3_Regular_validation.mat','body')fff

%% Plotting OET and WEC-Sim
% dynamics = {'forceExcitation','forceRadiationDamping','forceRestoring'};
rows = 2; % Number of rows
cols = 3; % Number of columns
%% Set default settings
Fsize = 12;
AxisLineWidth = 2;
LineWidth = 2;
blue = [0 0.4470 0.7410];
orange = [0.8500 0.3250 0.0980];
green = [0.4660 0.6740 0.1880];
red = [0.8, 0.1, 0.1];

% Kinematics
kinUnits = {'m','m','m','rad','rad','rad';
    'm/s','m/s','m/s','rad/s','rad/s','rad/s';
    'm/s^2','m/s^2','m/s^2','rad/s^2','rad/s^2','rad/s^2'};

% Dynamics
dyUnits = {'N','N','N','Nm','Nm','Nm'};



% for i = 1:bodies
%     for j = 1:nKin
%         figure('Name', [bodyName{i} ' ' kinematicNames{j}]);
%         for k = 1:DoF
%             subplot(rows, cols, k); 
%             plot(body(i).time,body(i).(kinematicNames{j})(:,k));
%             hold on
%             tempNameWS = kinematics{j};
%             % plot(output.bodies(i).time, output.bodies(i).(kinematics{j})(:, k));
%             title([num2str(modes(k))]); 
%             xlabel('Time (s)');
%             ylabel([kinematicNames{j} ' (' kinUnits{j,k} ')']); 
%             % legend('OET','WEC-Sim','Location','best');
%         end
%     end

%   for j = 1:nDy
%     figure('Name', [bodyName{i} ' ' dynamicNames{j}]);
%         for k = 1:DoF
%             subplot(rows, cols, k); 
%             plot(body(i).time,body(i).(dynamicNames{j})(:,k));
%             hold on
%             tempNameWS = dynamics{j};
%             % plot(output.bodies(i).time, output.bodies(i).(tempNameWS)(:, k)); 
%             title([num2str(modes(k))]); 
%             xlabel('Time (s)');
%             ylabel([dynamicNames{j} ' (' dyUnits{k} ')']); 
%             % legend('OET','WEC-Sim','Location','best');
% 
%         end
%     end
% end


%% Plot
% % Surge velocity (need to change back to 1, only did 3 for visual)
% figure('Name','Surge velocity response')
% plot(body(1).time, body(1).velocity(:,1), 'LineWidth', LineWidth, 'Color' ...
%     ,blue);
% hold on
% plot(output.bodies(1).time, output.bodies(1).velocity(:,1), 'LineWidth', LineWidth, 'Color' ...
%     ,orange);

% 
% xlabel('Time (s)', 'Interpreter','latex');
% ylabel('Velocity (m/s)', 'Interpreter','latex');
% title('RM3 Surge Velocity Response', 'Interpreter','latex');
% legend('OET', 'WEC-Sim', 'Interpreter'...
%     ,'latex', 'location', 'best');



% % Pitch position from start
% figure('Name','Pitch position response')
% plot(output.bodies(1).time(1:1501), output.bodies(1).position(1:1501,5), 'LineWidth', LineWidth, 'Color' ...
%     ,orange);
% hold on;
% plot(body(1).time(1:11252), body(1).position(1:11252,5),'--', 'LineWidth', LineWidth, 'Color' ...
%     ,blue);
% 
% xlabel('Time (s)', 'Interpreter','latex');
% ylabel('Position (rad)', 'Interpreter','latex');
% ylim([-0.025,0.025])
% title('RM3 Pitch Position Response', 'Interpreter','latex');
% legend('WEC-Sim', 'OET', 'Interpreter','latex', 'location', 'northwest');
% 
% 
% % Heave velocity from start
% figure('Name','Heave velocity response')
% 
% hold on
% plot(output.bodies(1).time(1:1501), output.bodies(1).velocity(1:1501,3), 'LineWidth', LineWidth, 'Color' ...
%     ,orange);
% 
% plot(body(1).time(1:11252), body(1).velocity(1:11252,3), '--', 'LineWidth', LineWidth, 'Color' ...
%     ,blue);
% 
% plot(output.bodies(2).time(1:1501), output.bodies(2).velocity(1:1501,3),  'LineWidth', LineWidth, 'Color' ...
%     ,red);
% 
% plot(body(2).time(1:11252), body(2).velocity(1:11252,3), '--', 'LineWidth', LineWidth, 'Color' ...
%     ,green);
% 
% xlabel('Time (s)', 'Interpreter','latex');
% ylabel('Velocity (m/s)', 'Interpreter','latex');
% ylim([-0.7,1])
% title('RM3 Heave Velocity Response', 'Interpreter','latex');
% legend('WEC-Sim (float)', 'OET (float)', 'WEC-Sim (spar)', 'OET (spar)', 'Interpreter'...
%     ,'latex', 'location', 'northwest');



% Pitch position from middle
figure('Name','Pitch position response')
plot(output.bodies(1).time(1501:2501), output.bodies(1).position(1501:2501,5), 'LineWidth', LineWidth, 'Color' ...
    ,orange);
hold on;
plot(body(1).time(11252:18752), body(1).position(11252:18752,5),'--', 'LineWidth', LineWidth, 'Color' ...
    ,blue);

xlabel('Time (s)', 'Interpreter','latex');
ylabel('Position (rad)', 'Interpreter','latex');
xlim([150,250])
title('RM3 (float only) Pitch Position Response', 'Interpreter','latex');
legend('WEC-Sim', 'OET', 'Interpreter','latex', 'location', 'northwest');

% % Pitch velocity
% figure('Name','Pitch velocity response')
% plot(body(1).time, body(1).velocity(:,5), 'LineWidth', LineWidth, 'Color' ...
%     ,blue);
% hold on;
% plot(output.bodies(1).time, output.bodies(1).velocity(:,5), 'LineWidth', LineWidth, 'Color' ...
%     ,orange);
% 
% xlabel('Time (s)', 'Interpreter','latex');
% ylabel('Velocity (rad/s)', 'Interpreter','latex');
% title('RM3 Pitch Velocity Response', 'Interpreter','latex');
% legend('OET', 'WEC-Sim', 'Interpreter','latex', 'location', 'best');

% Heave velocity from middle
figure('Name','Heave velocity response')

hold on
plot(output.bodies(1).time(1501:2501), output.bodies(1).velocity(1501:2501,3), 'LineWidth', LineWidth, 'Color' ...
    ,orange);

plot(body(1).time(11252:18752), body(1).velocity(11252:18752,3), '--', 'LineWidth', LineWidth, 'Color' ...
    ,blue);

% plot(output.bodies(2).time(1501:2501), output.bodies(2).velocity(1501:2501,3),  'LineWidth', LineWidth, 'Color' ...
%     ,red);
% 
% plot(body(2).time(11252:18752), body(2).velocity(11252:18752,3), '--', 'LineWidth', LineWidth, 'Color' ...
%     ,green);

xlabel('Time (s)', 'Interpreter','latex');
ylabel('Velocity (m/s)', 'Interpreter','latex');
xlim([150,250])
title('RM3 (float only)  Heave Velocity Response', 'Interpreter','latex');
% legend('WEC-Sim (float)', 'OET (float)', 'WEC-Sim (spar)', 'OET (spar)', 'Interpreter'...
%     ,'latex', 'location', 'northwest');
legend('WEC-Sim', 'OET', 'Interpreter','latex', 'location', 'northwest');
box on  % Ensure the box around the plot is visible

% % Heave velocity Truncated
% figure('Name','Heave velocity response')
% plot(body(1).time(11252:13127), body(1).velocity(11252:13127,3), 'LineWidth', LineWidth, 'Color' ...
%     ,blue);
% hold on
% plot(output.bodies(1).time(1501:1751), output.bodies(1).velocity(1501:1751,3), 'LineWidth', LineWidth, 'Color' ...
%     ,orange);
% hold on;
% plot(body(2).time(11252:13127), body(2).velocity(11252:13127,3), '--', 'LineWidth', LineWidth, 'Color' ...
%     ,blue);
% hold on
% plot(output.bodies(2).time(1501:1751), output.bodies(2).velocity(1501:1751,3), '--', 'LineWidth', LineWidth, 'Color' ...
%     ,orange);
% 
% xlabel('Time (s)', 'Interpreter','latex');
% ylabel('Velocity (m/s)', 'Interpreter','latex');
% title('RM3 (float only) Heave Velocity Response', 'Interpreter','latex');
% legend('OET', 'WEC-Sim', 'Interpreter'...
%     ,'latex', 'location', 'best');


% % Format
% grid off;
% box off;
% set(gca,'FontSize',Fsize);
% set(gca,'TickDir','out');
% set(gca,'linewidth',AxisLineWidth)
% set(get(gca,'XLabel'),'FontSize',Fsize);
% set(get(gca,'YLabel'),'FontSize',Fsize);
% legend box off