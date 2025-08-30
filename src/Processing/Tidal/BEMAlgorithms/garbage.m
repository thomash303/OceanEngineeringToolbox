% % Number of time steps
% Nt = size(bemt.var.fz,1);
% 
% % Number of blade elements
% NbE = size(bemt.var.fz,3);
% 
% % Preallocate time-averaged vectors over elements
% Thrust_avg = zeros(1,NbE);
% Torque_avg = zeros(1,NbE);
% Power_avg  = zeros(1,NbE);
% 
% % Loop over blade elements
% for k = 1:NbE - 1
%     % Time average for element k
%     Thrust_avg(k) = mean(bemt.var.fz(:,2,k));   % first blade
%     Torque_avg(k) = mean(bemt.var.Ty(:,2,k));
%     Power_avg(k)  = mean(bemt.var.Py(:,2,k));
% end
% 
% Thrust_total = mean(Thrust_avg);
% Torque_total = mean(Torque_avg);
% Power_total  = mean(Power_avg);
% 
% fprintf('Time- and element-averaged Thrust: %.2f N\n', Thrust_total);
% fprintf('Time- and element-averaged Torque: %.2f Nm\n', Torque_total);
% fprintf('Time- and element-averaged Power: %.2f W\n', Power_total);
% 
% figure('Color','w','Position',[100 100 800 500]);
% 
% blade_elements = 1:NbE; % element index along blade
% 
% plot(blade_elements, Thrust_avg, 'b-o', 'LineWidth',1.5); hold on;
% plot(blade_elements, Torque_avg, 'r-s', 'LineWidth',1.5);
% plot(blade_elements, Power_avg, 'k-^', 'LineWidth',1.5);
% 
% xlabel('Blade Element');
% ylabel('Time-Averaged Value');
% grid on;
% legend('Thrust [N]','Torque [Nm]','Power [W]');
% title('Time-Averaged Forces and Power Along Blade');

% % Number of time steps, blades, elements
% Nt  = size(bemt.var.fz,1);
% Nb  = size(bemt.var.fz,2);
% NbE = size(bemt.var.fz,3);
% 
% % Preallocate
% Thrust_total_time  = zeros(Nt,1);
% Torque_total_time  = zeros(Nt,1);
% Power_total_time   = zeros(Nt,1);
% 
% for t = 1:Nt
%     % Sum over elements first (per blade)
%     Thrust_per_blade = sum(bemt.var.fz(t,:,:),3);   % 1 x Nb
%     Torque_per_blade = sum(bemt.var.Ty(t,:,:),3);
%     Power_per_blade  = sum(bemt.var.Py(t,:,:),3);
% 
%     % Then sum over blades
%     Thrust_total_time(t) = sum(Thrust_per_blade);
%     Torque_total_time(t) = sum(Torque_per_blade);
%     Power_total_time(t)  = sum(Power_per_blade);
% end
% 
% % Time average
% Thrust_avg  = mean(Thrust_total_time);
% Torque_avg  = mean(Torque_total_time);
% Power_avg   = mean(Power_total_time);
% 
% fprintf('Time-averaged Total Thrust: %.2f N\n', Thrust_avg);
% fprintf('Time-averaged Total Torque: %.2f Nm\n', Torque_avg);
% fprintf('Time-averaged Total Power: %.2f W\n', Power_avg);

% Number of time steps
Nt = size(bemt.var.fz,1);

% Number of blade elements
NbE = size(bemt.var.fz,3);

% Number of blades
Nb = size(bemt.var.fz,2);

% Preallocate time-averaged vectors over elements for all blades
Thrust_avg = zeros(Nb, NbE);
Torque_avg = zeros(Nb, NbE);
Power_avg  = zeros(Nb, NbE);

% Loop over blades and blade elements
for b = 1:Nb
    for k = 1:NbE - 1

        % Time average for element k of blade b
        Thrust_avg(b,k) = mean(bemt.var.fz(:,b,k));
        Torque_avg(b,k) = mean(bemt.var.Ty(:,b,k));
        Power_avg(b,k)  = mean(bemt.var.Py(:,b,k));

    end
end

% Compute overall averages across all blades and elements (optional)
Thrust_total = sum(Thrust_avg(:));
Torque_total = sum(Torque_avg(:));
Power_total  = sum(Power_avg(:));

fprintf('Time- and element-averaged Thrust: %.2f N\n', Thrust_total);
fprintf('Time- and element-averaged Torque: %.2f Nm\n', Torque_total);
fprintf('Time- and element-averaged Power: %.2f W\n', Power_total);

% Plot all blades superimposed
figure('Color','w','Position',[100 100 800 500]);
blade_elements = 1:NbE; % element index along blade

colors = {'b','r','k'}; % color per blade
markers = {'o','s','^'}; 

for b = 1:Nb
    plot(blade_elements, Thrust_avg(b,:), [colors{b} '-' markers{b}], 'LineWidth',1.5); hold on;
    plot(blade_elements, Torque_avg(b,:), [colors{b} '--' markers{b}], 'LineWidth',1.5);
    plot(blade_elements, Power_avg(b,:), [colors{b} ':' markers{b}], 'LineWidth',1.5);
end

xlabel('Blade Element');
ylabel('Time-Averaged Value');
grid on;
legend('Blade 1 Thrust','Blade 1 Torque','Blade 1 Power', ...
       'Blade 2 Thrust','Blade 2 Torque','Blade 2 Power', ...
       'Blade 3 Thrust','Blade 3 Torque','Blade 3 Power', ...
       'Location','best');
title('Time-Averaged Forces and Power Along Blade');
