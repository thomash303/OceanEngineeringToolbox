

%% Data to include (all for each body)
% translational position 3x1
% angular position 3x1
% translational velocity 3x1
% angular velocity 3x1
% translational acceleration 3x1
% angular acceleration 3x1
% excitation force 6x1
% hydrostatic force 6x1
% radiation force 6x1

% General Plotting Initialization
%fileName = {'TestResults1'};
rows = 2; % Number of rows
cols = 3; % Number of columns
n = 3;
DoF = min(rows * cols, size(output.bodies(1).velocity, 2));
modes = ["Surge", "Sway", "Heave", "Roll", "Pitch", "Yaw"];
OETData = 8004;
bodies = 2;
bodyName = {'float', 'spar'};

%% Kinematic Results
% Kinematic component names
kinematics = {'position', 'velocity' 'acceleration'};
displacements = {'r1', 'r2', 'r3', 'angles1', 'angles2', 'angles3'};
velocities = {'v1', 'v2', 'v3', 'w1', 'w2', 'w3'};
accelerations = {'a1', 'a2', 'a3', 'z1', 'z2', 'z3'};
kinQuantities = [displacements; velocities; accelerations];
units = {'m','m','m','deg','deg','deg';
    'm/s','m/s','m/s','deg/s','deg/s','deg/s';
    'm/s^2','m/s^2','m/s^2','deg/s^2','deg/s^2','deg/s^2'};

sourceName = 'absoluteSensor';
for i = 1:bodies
    for j = 1:n
        figure('Name', [bodyName{i} ' ' kinematics{j}]);
        for k = 1:DoF
            subplot(rows, cols, k); 
            tempNameWS = [kinematics{j}];
            plot(output.bodies(i).time, output.bodies(i).(tempNameWS)(:, k)); 
            hold on
            tempNameOET = [bodyName{i} sourceName kinQuantities{j,k}];
            plot(TestResults1.time(1:OETData),-1*TestResults1.(tempNameOET)(1:OETData));
            title([num2str(modes(k))]); 
            xlabel('Time (s)');
            ylabel([kinematics{j} ' (' units{j,k} ')']); 
            legend('WEC-Sim', 'OET','Location','best');
        end
    end
end


%% Dynamic Results
n = 2;
dynamics = {'forceExcitation', 'forceRestoring'};
units = {'N','N','N','Nm','Nm','Nm'};
forces = {'F1', 'F2', 'F3', 'F4', 'F5', 'F6'};
sourceName = {'excitationexcitationRegularWave', 'hydrostatichydrostaticForce'};

for i = 1:bodies
    for j = 1:n + 1
         if j > n
            figure("Name",[bodyName{i} ' ' 'radiation'])
            for k = 1:DoF
                subplot(rows, cols, k); 
                plot(output.bodies(i).time, (output.bodies(i).forceRadiationDamping(:, k) ...
                    + output.bodies(i).forceAddedMass(:, k))); 
                hold on
                tempNameOET = [bodyName{i} 'radiationradiationForce' forces{k}];
                plot(TestResults1.time(1:OETData),TestResults1.(tempNameOET)(1:OETData));
                title([num2str(modes(k))]); 
                xlabel('Time (s)');
                ylabel(['forceRadiation' ' (' units{k} ')']); 
                legend('WEC-Sim', 'OET','Location','best');
            end
         else
            figure('Name', [bodyName{i} ' ' dynamics{j}]);
            for k = 1:DoF
                subplot(rows, cols, k); 
                tempNameWS = [dynamics{j}];
                plot(output.bodies(i).time, output.bodies(i).(tempNameWS)(:, k)); 
                hold on
                tempNameOET = [bodyName{i} sourceName{j} forces{k}];
                plot(TestResults1.time(1:OETData),TestResults1.(tempNameOET)(1:OETData));
                title([num2str(modes(k))]); 
                xlabel('Time (s)');
                ylabel([dynamics{j} ' (' units{k} ')']); 
                legend('WEC-Sim', 'OET','Location','best');
            end
         end
    end
end