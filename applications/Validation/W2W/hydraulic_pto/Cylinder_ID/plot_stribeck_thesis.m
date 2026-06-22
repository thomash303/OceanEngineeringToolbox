%% Cylinder Stribeck friction
% Velocity axis
v = linspace(-0.15, 0.15, 500);   % adjust

% --- Parameters (sample values, replace with my actual model values) ---
F_c = 75;      % Coulomb friction
F_v = 100;      % viscous coefficient
F_s = 50;      % Stribeck amplitude
v_s = 0.05;      % Stribeck decay rate

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
yticks(-1:0.5:1)
xticks(-0.15:0.075:0.15)

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