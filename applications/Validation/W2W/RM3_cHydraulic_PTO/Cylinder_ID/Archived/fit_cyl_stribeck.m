%% ================================================
% Stribeck friction fitting from efficiency curves
%% ================================================

%% Cylinder parameters — fill in your value
D = 40/1000;
A  = D^2*pi/4;          % bore area (m^2) e.g. pi/4 * 0.08^2 for 80mm bore

%% Load efficiency curve data
load('Penalba_data/efficiency_curve_data.mat');   % loads cyl_eff struct

curveEfficiencies = [67, 74.5, 78, 81.5, 85, 88.5, 90, 92.5, 95];

%% ------------------------------------------------
% Step 1: reconstruct F_fric from all curves
%% ------------------------------------------------
v_all     = [];
Ffric_all = [];

fields = fieldnames(cyl_eff);

for k = 1:numel(fields)
    key = fields{k};
    eta = curveEfficiencies(k) / 100;   % e.g. 0.67

    v_raw = cyl_eff.(key).v;
    p_raw = cyl_eff.(key).p;   % bar

    % Convert to SI
    p_Pa = p_raw * 1e5;

    % Hydraulic force and friction force
    F_hyd   = p_Pa * A;
    F_fric  = F_hyd * (1 - eta);

    % Only keep positive velocity points (model is for v > 0)
    mask = v_raw > 0;
    v_all     = [v_all;     v_raw(mask)];
    Ffric_all = [Ffric_all; F_fric(mask)];
end

% Sort by velocity for plotting
[v_all, sortIdx] = sort(v_all);
Ffric_all = Ffric_all(sortIdx);

%% ------------------------------------------------
% Step 2: define Stribeck model
%% ------------------------------------------------
% params = [Fv, Fc, Fst, vst]
stribeck = @(params, v) ...
    params(1) .* v + ...                          % viscous
    params(3) + ...                               % Coulomb
    params(4) .* exp(-(v ./ params(2)));          % Stribeck exponential

% Reordered for clarity: params = [vst, Fv, Fc, Fst]
% Let's keep a clean order: [Fv, vst, Fc, Fst]
stribeck = @(params, v) ...
    params(1) .* v + ...                          % Fv * v
    params(3) + ...                               % Fc
    params(4) .* exp(-(v ./ params(2)));          % Fst * exp(-v/vst)

% Residual function for lsqnonlin
residual = @(params) stribeck(params, v_all) - Ffric_all;

%% ------------------------------------------------
% Step 3: initial guess and bounds
%% ------------------------------------------------
% Estimate from data
Fc_guess  = min(Ffric_all);                        % friction at low speed ~ Coulomb
Fv_guess  = (max(Ffric_all) - min(Ffric_all)) ...
            / (max(v_all)   - min(v_all));         % rough slope
Fst_guess = max(Ffric_all) - Fc_guess;            % excess at low speed
vst_guess = median(v_all) / 3;                    % rough inflection speed

p0 = [Fv_guess, vst_guess, Fc_guess, Fst_guess];

% All parameters must be positive
lb = [0,    0,    0,    0   ];
ub = [Inf,  Inf,  Inf,  Inf ];

opts = optimset('Display','iter','TolFun',1e-9,'TolX',1e-9,'MaxIter',2000);

%% ------------------------------------------------
% Step 4: fit
%% ------------------------------------------------
[p_fit, resnorm, residuals] = lsqnonlin(residual, p0, lb, ub, opts);

Fv  = p_fit(1);
vst = p_fit(2);
Fc  = p_fit(3);
Fst = p_fit(4);

fprintf('\n--- Stribeck Fit Results ---\n');
fprintf('Fv  = %.4f  N/(m/s)  (viscous)\n',   Fv);
fprintf('vst = %.4f  m/s      (Stribeck velocity)\n', vst);
fprintf('Fc  = %.4f  N        (Coulomb)\n',    Fc);
fprintf('Fst = %.4f  N        (Stribeck excess)\n', Fst);
fprintf('RMS residual = %.4f N\n', sqrt(resnorm/numel(v_all)));

%% ------------------------------------------------
% Step 5: plot
%% ------------------------------------------------
v_plot    = linspace(min(v_all)*0.5, max(v_all), 500)';
F_fit_plot = stribeck(p_fit, v_plot);

figure; hold on;

% Scatter of reconstructed data, coloured by efficiency level
cmap = parula(numel(curveEfficiencies));
k_plot = 1;
for k = 1:numel(fields)
    key = fields{k};
    eta = curveEfficiencies(k) / 100;
    v_raw = cyl_eff.(key).v;
    p_raw = cyl_eff.(key).p * 1e5;
    F_fric = p_raw * A * (1 - eta);
    mask = v_raw > 0;
    scatter(v_raw(mask), F_fric(mask), 20, cmap(k,:), 'filled', ...
        'DisplayName', sprintf('\\eta = %.1f%%', curveEfficiencies(k)));
    k_plot = k_plot + 1;
end

% Fitted model
plot(v_plot, F_fit_plot, 'k-', 'LineWidth', 2.5, 'DisplayName', 'Stribeck fit');

xlabel('Piston velocity (m/s)');
ylabel('Friction force (N)');
legend('Location','best');
grid on; box off;
set(gca,'TickDir','out');

title(sprintf('Stribeck: Fc=%.1fN  Fv=%.1f N·s/m  Fst=%.1fN  vst=%.4f m/s', ...
    Fc, Fv, Fst, vst));