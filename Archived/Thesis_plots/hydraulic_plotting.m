%% Cylinder Stribeck friction
% Velocity axis
v = linspace(-0.5, 0.5, 500);   % adjust

% --- Parameters (sample values, replace with my actual model values) ---
F_c = 1.0;      % Coulomb friction
F_v = 0.5;      % viscous coefficient
F_s = 0.8;      % Stribeck amplitude
v_s = 0.1;      % Stribeck decay rate

% --- Components ---
F_coulomb = F_c * sign(v);
F_viscous = F_v * v;
F_stribeck = F_s * exp(-(v./v_s).^2) .* sign(v);

% --- Total friction ---
F_total = F_coulomb + F_viscous + F_stribeck;

F_scale = max(abs(F_total)); % consider removing normalization

F_total   = F_total   / F_scale;
F_coulomb = F_coulomb / F_scale;
F_viscous = F_viscous / F_scale;
F_stribeck= F_stribeck/ F_scale;

% --- Plot ---
figure('Name','Stribeck Friction Curve')
plot(v, F_total, 'k', 'LineWidth', 2, 'DisplayName','Total'); 
hold on
plot(v, F_stribeck, 'Color', [0 0.2 0.5], 'LineWidth', 1.5, 'DisplayName','Stribeck')
plot(v, F_coulomb, '--', 'Color', [0.85 0.33 0.1], 'LineWidth', 1.5, 'DisplayName','Coulomb')
plot(v, F_viscous, '-.', 'Color', [0.2 0.6 0.2], 'LineWidth', 1.5, 'DisplayName','Viscous')
xlabel('$v\;[m/s]$', 'Interpreter','latex')
ylabel('Normalized $F_{fric}$', 'Interpreter','latex')
legend('Interpreter','latex', 'Location', 'best');
hold off

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend box off

%% Valve opening  

p = linspace(0, 100, 1000);

p_crack = 20;
p_open  = 80;   

A_open = (p - p_crack) / (p_open - p_crack);
A_open = min(max(A_open, 0), 1);

figure('Name','Valve Opening')
plot(p, A_open, 'LineWidth', 2)
xlabel('$P\;[bar] $', 'Interpreter','latex')
ylabel('Valve Opening Fraction', 'Interpreter','latex')
set(gca, 'TickLabelInterpreter', 'latex')
ylim([-0.2 1.2])
xlim([0 max(p)])
xticks(20:60:80)
xticklabels({'$p_{\mathrm{crack}}$', '$p_{\mathrm{open}}$'})
yticks([0 1])
yticklabels({'Closed', 'Open'})

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend off