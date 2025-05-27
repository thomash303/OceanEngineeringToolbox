% %% Loading data
% 
% temp = tempdir;
% current = 'OpenModelica\OMEdit';
% file = '\OET.Example.multibodyWECSingleDoF\multibodyWECSingleDoF_res.csv';
% 
% filedir = [temp current file];
% 
% outputData = readtable(filedir);
% 
% 
% %% Body
% body = {};
% 
% DoF = 6;
% modes = ["Surge", "Sway", "Heave", "Roll", "Pitch", "Yaw"];
% bodies = 2;
% bodyName = {'float', 'spar'};
% 
% %% Data Extraction
% 
% % duration = size(outputData.time,1);
% 
% % Kinematics
% % Kinematic component names
% kinematicNames = {'position', 'velocity' 'acceleration'};
% displacements = {'r_1_', 'r_2_', 'r_3_', 'angles_1_', 'angles_2_', 'angles_3_'};
% velocities = {'v_1_', 'v_2_', 'v_3_', 'w_1_', 'w_2_', 'w_3_'};
% accelerations = {'a_1_', 'a_2_', 'a_3_', 'z_1_', 'z_2_', 'z_3_'};
% kinQuantities = [displacements; velocities; accelerations];
% units = {'m','m','m','rad','rad','rad';
%     'm/s','m/s','m/s','rad/s','rad/s','rad/s';
%     'm/s^2','m/s^2','m/s^2','rad/s^2','rad/s^2','rad/s^2'};
% kinSourceName = '_body_absoluteSensor_';
% nKin = size(kinematicNames,2);
% 
% % Dynamics
% dynamicNames = {'excitationForce', 'radiationForce' 'hydrostaticForce'};
% 
% excitationForce = 'excitationIrregularWave';
% 
% 
% dySourceName = {['_excitation_' excitationForce], '_radiation_radiationForce', '_hydrostatic_hydrostaticForce'};
% forces = {'_F_1_','_F_2_','_F_3_','_F_4_','_F_5_','_F_6_'};
% nDy = size(dynamicNames,2); 
% 
% kinematics = {'position', 'velocity' 'acceleration'};
% 
% % Saving OET
% for i = 1:bodies
%     body(i).body = bodyName{i};
%     body(i).time = outputData.time;
%     for j = 1:nKin
%         for k = 1:DoF
%             tempName = [bodyName{i} kinSourceName kinQuantities{j,k}];
%             body(i).(kinematicNames{j})(:,k) = outputData.(tempName);
%         end
%     end
% 
%     for j = 1:nDy
%         for k = 1:DoF
%             tempName = [bodyName{i} dySourceName{j} forces{k}];
%             body(i).(dynamicNames{j})(:,k) = outputData.(tempName);
%         end
%     end
% 
% end
% 
% 
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
% 
% save('RM3_Regular_validation.mat','body','pto')

%% Plotting OET and WEC-Sim
dynamics = {'forceExcitation','forceRadiationDamping','forceRestoring'};
rows = 2; % Number of rows
cols = 3; % Number of columns
Fsize = 12;
AxisLineWidth = 2;
LineWidth = 2;
blue = [0 0.4470 0.7410];
orange = [0.8500 0.3250 0.0980];


% Kinematics
kinUnits = {'m','m','m','rad','rad','rad';
    'm/s','m/s','m/s','rad/s','rad/s','rad/s';
    'm/s^2','m/s^2','m/s^2','rad/s^2','rad/s^2','rad/s^2'};

% Dynamics
dyUnits = {'N','N','N','Nm','Nm','Nm'};

%% Plot
% Surge velocity (need to change back to 1, only did 3 for visual)
figure('Name','Surge velocity response')
plot(body(1).time(1:2000), body(1).velocity(1:2000,1), 'LineWidth', LineWidth, 'Color' ...
    ,blue);
hold on
plot(output.bodies(1).time(1:2000), output.bodies(1).velocity(1:2000,1), 'LineWidth', LineWidth, 'Color' ...
    ,orange);


xlabel('Time (s)', 'Interpreter','latex');
ylabel('Velocity (m/s)', 'Interpreter','latex');
title('RM3 Surge Velocity Response in Irregular Wave Excitation', 'Interpreter','latex');
legend('OET', 'WEC-Sim', 'Interpreter'...
    ,'latex', 'location', 'best');

% Heave velocity
figure('Name','Heave velocity response')
plot(body(1).time(1000:1500), body(1).velocity(1000:1500,3), 'LineWidth', LineWidth, 'Color' ...
    ,blue);
hold on
plot(output.bodies(1).time(1000:1500), output.bodies(1).velocity(1000:1500,3), 'LineWidth', LineWidth, 'Color' ...
    ,orange);
hold on;
plot(body(2).time(1000:1500), body(2).velocity(1000:1500,3), '--', 'LineWidth', LineWidth, 'Color' ...
    ,blue);
hold on
plot(output.bodies(2).time(1000:1500), output.bodies(2).velocity(1000:1500,3), '--', 'LineWidth', LineWidth, 'Color' ...
    ,orange);

xlabel('Time (s)', 'Interpreter','latex');
ylabel('Velocity (m/s)', 'Interpreter','latex');
title('RM3 Heave Velocity Response in Irregular Wave Excitation', 'Interpreter','latex');
legend('OET', 'WEC-Sim', 'Interpreter'...
    ,'latex', 'location', 'best');

% Power
figure('Name','Power Capture')
power = (body(2).velocity(1:2000,3) - body(1).velocity(1:2000,3)) .* pto.ptoForce(1:2000,3);
plot(pto(1).time(1:2000), power, 'LineWidth', LineWidth, 'Color' ...
    ,blue);
hold on
plot(output.bodies(1).time(1:2000), output.ptos.forceTotal(1:2000,3), 'LineWidth', LineWidth, 'Color' ...
    ,orange);


xlabel('Time (s)', 'Interpreter','latex');
ylabel('Power (W)', 'Interpreter','latex');
title('RM3 Power Capture in Irregular Wave Excitation', 'Interpreter','latex');
legend('OET', 'WEC-Sim', 'Interpreter'...
    ,'latex', 'location', 'best');
