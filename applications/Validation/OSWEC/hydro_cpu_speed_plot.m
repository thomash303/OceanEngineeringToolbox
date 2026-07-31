%% ============================================================
% Import Excel data and save MAT file
% ============================================================

clear; clc

filename = 'C:\Users\thogan1\OneDrive - University of New Brunswick\Masters\Thesis\Publications\Thesis\Figures\Hydrodynamic speeds\hydro_speed_master.xlsx';

data = readtable(filename);

% Split into individual datasets
oswec_1_dir.time  = data{:,1};
oswec_1_dir.cpuTime = data{:,2};

oswec_10_dir.time = data{:,3};
oswec_10_dir.cpuTime = data{:,4};

rm3_nob2b.time = data{:,5};
rm3_nob2b.cpuTime = data{:,6};

rm3_b2b.time = data{:,7};
rm3_b2b.cpuTime = data{:,8};

% Save
save('hydro_cpu_speed_master.mat', ...
    'oswec_1_dir', ...
    'oswec_10_dir', ...
    'rm3_nob2b', ...
    'rm3_b2b')


%% ============================================================
% Plot from imported structures
% ============================================================

clear; clc
load('hydro_cpu_speed_master.mat')

%% Set default settings
Fsize = 12;
AxisLineWidth = 2;
LineWidth = 2;


%% OSWEC

figure
plot(oswec_1_dir.time, oswec_1_dir.cpuTime, 'LineWidth',1.5)
hold on
plot(oswec_10_dir.time, oswec_10_dir.cpuTime, 'LineWidth',1.5)

grid on
xticks(0:100:400)
yticks(5:5:20)
ylim([5,20])
xlabel('Simulation Time [s]', 'Interpreter','latex')
ylabel('CPU Time [s]', 'Interpreter','latex')
legend('OET (1 dir)', ...
       'OET (10 dir)', ...
       'Interpreter','latex',...
       'Location','northwest')

set(gca,'FontSize',Fsize);
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
grid off
legend box off
box on


%% RM3

figure
plot(rm3_nob2b.time, rm3_nob2b.cpuTime, 'LineWidth',1.5)
hold on
plot(rm3_b2b.time, rm3_b2b.cpuTime, 'LineWidth',1.5)

grid on
xticks(0:100:400)
yticks(5:5:20)
ylim([5,20])
xlabel('Simulation Time [s]', 'Interpreter','latex')
ylabel('CPU Time [s]', 'Interpreter','latex')
legend('OET (No B2B)', ...
       'OET (B2B)', ...
       'Location','northwest')
set(gca,'FontSize',Fsize);
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
grid off
legend box off
box on