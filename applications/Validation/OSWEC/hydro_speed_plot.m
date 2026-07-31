%% Plotting simulation times for each hydrodynamic case study
%% Set default settings
Fsize = 12;
AxisLineWidth = 2;
LineWidth = 2;


%% ============================================================
% OES Sphere
% =============================================================

labels = {'1 m decay','5 m decay'};

OET = [0.31901 0.31368];
WECSim = [21.3328 21.3080];

figure
bar([WECSim; OET]','grouped')
grid on
ylabel('Simulation Time [s]', 'Interpreter','latex')
xticklabels(labels)
set(gca,'TickLabelInterpreter','latex')
legend('WEC-Sim','OET','Interpreter','latex','Location','northwest')
% title('OES Sphere')
set(gca,'FontSize',Fsize);
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
grid off

%% ============================================================
%% OSWEC

labels = {'Decay','Monochromatic','Polychromatic'};

% Columns:
% WEC-Sim, OET (10 dir), OET (1 dir)

data = [
    19.2614   16.5469   9.08315;
    23.4646   16.734   9.21868;
    25.5216   17.2936   9.59603;
];

figure
bar(data,'grouped')

grid on
ylabel('Simulation Time [s]', 'Interpreter','latex')
xticklabels(labels)
set(gca,'TickLabelInterpreter','latex')

legend({'WEC-Sim', ...
        'OET (10 dir)', ...
        'OET (1 dir)'}, ...
        'Interpreter','latex', ...
        'Location','northwest')

% title('OSWEC')
set(gca,'FontSize',Fsize);
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
grid off


%% ============================================================
%% ============================================================
% RM3
% =============================================================

labels = {'Monochromatic','Polychromatic'};

% Columns:
% WEC-Sim (No B2B), OET (No B2B),
% WEC-Sim (B2B),    OET (B2B)

data = [
    19.5515   8.252   19.4066   18.6404;
    18.7537   10.4854  21.8465   19.3429;
];

figure
bar(data,'grouped')

grid on
ylabel('Simulation Time [s]', 'Interpreter','latex')
xticklabels(labels)
set(gca,'TickLabelInterpreter','latex')

legend({'WEC-Sim (No B2B)', ...
        'OET (No B2B)', ...
        'WEC-Sim (B2B)', ...
        'OET (B2B)'}, ...
        'Interpreter','latex', ...
        'Location','northwest')

% title('RM3')
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
grid off