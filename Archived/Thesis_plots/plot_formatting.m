
%% Set default settings
Fsize = 12;
AxisLineWidth = 2;
LineWidth = 2;

%% Create the data
x = linspace(0,10,100);
y_sin = sin(x);
y_cos = cos(x);

%% Plot
plot(x, y_sin, 'LineWidth', LineWidth);
hold on;
plot(x, y_cos, 'LineWidth', LineWidth);

xlabel('Radians', 'Interpreter','latex');
ylabel('Value', 'Interpreter','latex');
title('Waves', 'Interpreter','latex');
legend('Sin', 'Cos','Interpreter','latex', 'location', 'southwest');

%% Format
grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off