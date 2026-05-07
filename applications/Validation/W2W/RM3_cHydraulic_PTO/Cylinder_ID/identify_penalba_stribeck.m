%% Identify Penalba's Stribeck coefficients
%% fit_penalba.m
% Fits Stribeck model coefficients from Penalba normalized data

load('penalba_stribeck.mat');
d = penalba_stribeck_raw;

% Masks to remove nan
valid = @(v,f) ~isnan(v) & ~isnan(f);
m1 = valid(d.v_fric,  d.F_fric);
m2 = valid(d.v_coul,  d.F_coul);
m3 = valid(d.v_strib, d.F_strib);
m4 = valid(d.v_visc,  d.F_visc);

% Coulomb
Fc_norm = median(d.F_coul(m2));
fprintf('Fc  (norm) = %.4f\n', Fc_norm);

% Viscous
Fv_norm = d.v_visc(m4) \ d.F_visc(m4);
fprintf('Fv  (norm, per m/s) = %.4f\n', Fv_norm);

% Stribeck
Fst0   = max(abs(d.F_strib(m3)));
vst0   = 0.05;
delta0 = 1.0;
p0     = [Fst0, vst0, delta0];
lb     = [0,    1e-4,  0.5];
ub     = [2,    0.5,   3.0];

stribeckFun = @(p,v) p(1) .* exp(-(abs(v) ./ p(2)).^p(3));
opts = optimoptions('lsqcurvefit', 'Display', 'off', 'TolFun', 1e-10, 'TolX', 1e-10);

p_fit     = lsqcurvefit(stribeckFun, p0, d.v_strib(m3), d.F_strib(m3), lb, ub, opts);
Fst_norm  = p_fit(1);
vst_fit   = p_fit(2);
delta_fit = p_fit(3);

fprintf('Fst (norm) = %.4f\n', Fst_norm);
fprintf('vst (m/s)  = %.4f\n', vst_fit);
fprintf('delta      = %.4f\n', delta_fit);

%% Denormalize
F_ref = 200; % Need to sort this one out
V_ref = 1;

penalba_stribeck_fit = struct();
penalba_stribeck_fit.Fc    = Fc_norm  * F_ref;
penalba_stribeck_fit.Fst   = Fst_norm * F_ref;
penalba_stribeck_fit.Fv    = Fv_norm  * F_ref / V_ref;
penalba_stribeck_fit.vst   = vst_fit  * V_ref;
penalba_stribeck_fit.delta = delta_fit;

fprintf('\n--- Physical Coefficients ---\n');
fprintf('Fc    = %.4f N\n',      penalba_stribeck_fit.Fc);
fprintf('Fst   = %.4f N\n',      penalba_stribeck_fit.Fst);
fprintf('Fv    = %.4f N.s/m\n',  penalba_stribeck_fit.Fv);
fprintf('vst   = %.4f m/s\n',    penalba_stribeck_fit.vst);
fprintf('delta = %.4f\n',        penalba_stribeck_fit.delta);

save('penalba_stribeck_fit.mat', 'penalba_stribeck_fit');

%% Plot
v_plot  = linspace(0, max(d.v_fric(m1)), 500);

% Full model
F_model    = Fc_norm ...
           + Fst_norm .* exp(-(abs(v_plot) ./ vst_fit).^delta_fit) ...
           + Fv_norm  .* abs(v_plot);

% Individual components
F_coul_model  = Fc_norm  .* ones(size(v_plot));
F_strib_model = Fst_norm .* exp(-(abs(v_plot) ./ vst_fit).^delta_fit);
F_visc_model  = Fv_norm  .* abs(v_plot);

figure; hold on; grid on;

% Data scatter
scatter(d.v_fric(m1),  d.F_fric(m1),  20, 'k', 'filled', 'DisplayName', 'F_{fric} data');
scatter(d.v_coul(m2),  d.F_coul(m2),  20, 'b', 'filled', 'DisplayName', 'F_{coulomb} data');
scatter(d.v_strib(m3), d.F_strib(m3), 20, 'r', 'filled', 'DisplayName', 'F_{stribeck} data');
scatter(d.v_visc(m4),  d.F_visc(m4),  20, 'g', 'filled', 'DisplayName', 'F_{viscous} data');

% Model lines
plot(v_plot, F_model,       'k-',  'LineWidth', 2.0, 'DisplayName', 'Total model');
plot(v_plot, F_coul_model,  'b--', 'LineWidth', 1.5, 'DisplayName', 'Coulomb model');
plot(v_plot, F_strib_model, 'r--', 'LineWidth', 1.5, 'DisplayName', 'Stribeck model');
plot(v_plot, F_visc_model,  'g--', 'LineWidth', 1.5, 'DisplayName', 'Viscous model');

xlabel('Velocity (m/s)'); ylabel('Normalised Force (-)');
legend('Location', 'best'); box off; set(gca, 'TickDir', 'out');
title('Penalba Stribeck fit');