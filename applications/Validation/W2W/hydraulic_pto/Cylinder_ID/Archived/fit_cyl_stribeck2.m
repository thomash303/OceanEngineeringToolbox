%% Script to fit the cylinder Stribeck friction model to efficiency curves

% Cylinder parameters
D = 40/1000;
A  = D^2*pi/4;          % bore area (m^2) e.g. pi/4 * 0.08^2 for 80mm bore

% Load data
load('efficiency_curve_data.mat');
curveEfficiencies = [67, 74.5, 78, 81.5, 85, 88.5, 90, 92.5, 95];

%% ------------------------------------------------
% Step 1: reconstruct F_fric from all efficiency curves
%
% The cylinder is driven by an external force. The hydraulic
% pressure is the output. So:
%   eta = F_hydraulic / F_external = (p*A) / F_ext
%   F_ext = p*A / eta
%   F_fric = F_ext - p*A = p*A * (1/eta - 1) = p*A * (1-eta)/eta
%
% Each iso-efficiency curve gives (v, p) pairs at fixed eta.
% At each point, p tells us what pressure was needed to achieve
% that efficiency at that velocity. So F_fric = p*A*(1-eta)/eta
% gives friction as a function of velocity across the full
% speed range covered by all curves combined.
%% ------------------------------------------------

fields = fieldnames(cyl_eff);

v     = [];
Ffric = [];

for k = 1:numel(fields)
    key = fields{k};
    eta = curveEfficiencies(k) / 100;

    v_raw = cyl_eff.(key).v;
    p = cyl_eff.(key).p * 1e5;   % bar to Pa

    F_fric = p .* A .* (1 - eta) / eta;

    v = [v;     v_raw];
    Ffric = [Ffric; F_fric];
end

%% ------------------------------------------------
% Step 2: initial guess for [Fv, Fc, Fst, vst]
%
% We need physically motivated starting values because lsqnonlin
% is iterative — it cannot solve this analytically. A bad guess
% leads to a wrong local minimum.
%
% Fv  (viscous): at high velocity the exponential term vanishes
%     and friction grows linearly. Estimate the slope of F_fric
%     vs v at the highest velocities.
%
% Fc  (Coulomb): the baseline friction that persists at all speeds.
%     Estimate as the minimum F_fric in the dataset, which occurs
%     where the Stribeck peak has fully decayed and viscous rise
%     has not yet dominated.
%
% Fst (Stribeck excess): the extra friction at very low speed
%     above Coulomb. Estimate as the difference between the
%     maximum F_fric (at lowest speed) and the Coulomb estimate.
%
% vst (Stribeck velocity): the speed at which the exponential
%     has decayed to 1/e of its peak. Typically 0.01-0.05 m/s
%     for hydraulic cylinders. Use a small fraction of the
%     median velocity as a starting point.
%% ------------------------------------------------

% High-speed points: top 20% of velocity range
v_thresh   = min(v_all) + 0.8 * (max(v_all) - min(v_all));
mask_high  = v_all >= v_thresh;
Fv_guess   = mean(diff(Ffric_all(mask_high))) / mean(diff(v_all(mask_high)));
Fv_guess   = max(Fv_guess, 1);   % ensure positive if data is noisy

Fc_guess   = min(Ffric_all);
Fst_guess  = max(Ffric_all) - Fc_guess;
vst_guess  = 0.2;   % m/s — typical Stribeck velocity for hydraulic cylinder

p0 = [Fv_guess, Fc_guess, Fst_guess, vst_guess];

fprintf('Initial guess:  Fv=%.2f  Fc=%.2f  Fst=%.2f  vst=%.4f\n', ...
    p0(1), p0(2), p0(3), p0(4));

%% ------------------------------------------------
% Step 3: fit using lsqnonlin
%
% lsqnonlin minimises sum of squared residuals:
%   min  sum[ (F_model(v_i, params) - F_fric_i)^2 ]
%
% It uses the trust-region-reflective algorithm which handles
% bound constraints naturally — this is why we use it over
% fminsearch (no bounds) or fmincon (heavier, designed for
% general nonlinear constraints rather than least squares).
%
% The model evaluated at each data point is:
%   F_model = Fv*v + Fc + Fst*exp(-v/vst)
% params = [Fv, Fc, Fst, vst], all constrained >= 0
%% ------------------------------------------------

lb = [0, 0, 0, 0];
ub = [Inf, Inf, Inf, Inf];

opts = optimset('Display','iter','TolFun',1e-10,'TolX',1e-10,'MaxIter',2000);

[p_fit, resnorm] = lsqnonlin(@stribeckResidual, p0, lb, ub, opts, v_all, Ffric_all);

Fv  = p_fit(1);
Fc  = p_fit(2);
Fst = p_fit(3);
vst = p_fit(4);

fprintf('\n--- Stribeck Fit Results ---\n');
fprintf('Fv  = %.4f  N·s/m   (viscous damping)\n',    Fv);
fprintf('Fc  = %.4f  N       (Coulomb friction)\n',   Fc);
fprintf('Fst = %.4f  N       (Stribeck excess)\n',    Fst);
fprintf('vst = %.4f  m/s     (Stribeck velocity)\n',  vst);
fprintf('RMS residual = %.4f N\n', sqrt(resnorm / numel(v_all)));

%% ------------------------------------------------
% Step 4: plots
%% ------------------------------------------------
cmap = parula(numel(curveEfficiencies));

% --- Plot A: original efficiency curves in (v, p) space ---
figure; hold on;
for k = 1:numel(fields)
    key   = fields{k};
    v_raw = cyl_eff.(key).v;
    p_raw = cyl_eff.(key).p;
    plot(v_raw, p_raw, 'Color', cmap(k,:), 'LineWidth', 1.5, ...
        'DisplayName', sprintf('\\eta = %.1f%%', curveEfficiencies(k)));
end
xlabel('Piston velocity (m/s)');
ylabel('Pressure (bar)');
title('Iso-efficiency curves');
legend('Location','best');
grid on; box off;
set(gca,'TickDir','out');

% --- Plot B: reconstructed friction force and Stribeck fit ---
v_plot = linspace(min(v_all), max(v_all), 500)';
F_plot = stribeckModel(p_fit, v_plot);

figure; hold on;
for k = 1:numel(fields)
    key    = fields{k};
    eta    = curveEfficiencies(k) / 100;
    v_raw  = cyl_eff.(key).v;
    p_Pa   = cyl_eff.(key).p * 1e5;
    F_fric = p_Pa .* A .* (1 - eta) / eta;
    scatter(v_raw, F_fric, 20, cmap(k,:), 'filled', ...
        'DisplayName', sprintf('\\eta = %.1f%%', curveEfficiencies(k)));
end
plot(v_plot, F_plot, 'k-', 'LineWidth', 2.5, 'DisplayName', 'Stribeck fit');
xlabel('Piston velocity (m/s)');
ylabel('Friction force (N)');
title(sprintf('Stribeck fit:  Fc=%.1f N  Fv=%.1f Ns/m  Fst=%.1f N  vst=%.4f m/s', ...
    Fc, Fv, Fst, vst));
legend('Location','best');
grid on; box off;
set(gca,'TickDir','out');


%%
%% =================================================
% Single efficiency curve: force decomposition check
%% =================================================
%% =================================================
% 3-case decomposition: low / mid / high efficiency
%% =================================================

% Sort curves by efficiency
[eta_sorted, idx] = sort(curveEfficiencies, 'ascend');

lowID  = idx(1);
midID  = idx(round(end/2));
highID = idx(end);

selIDs = [lowID, midID, highID];
labels = {'Lowest efficiency', 'Mid efficiency', 'Highest efficiency'};

figure;

for i = 1:3

    subplot(3,1,i); hold on; grid on;

    curveID = selIDs(i);
    key = fields{curveID};
    eta = curveEfficiencies(curveID) / 100;

    v_raw = cyl_eff.(key).v;
    p_bar = cyl_eff.(key).p;
    p_Pa  = p_bar * 1e5;

    % Forces
    F_hyd = p_Pa .* A;
    F_ext = F_hyd ./ eta;
    F_loss = F_ext - F_hyd;

    % Model prediction
    F_model = stribeckModel(p_fit, v_raw);

    % Plot components
    plot(v_raw, F_hyd, '--', 'LineWidth', 1.2);
    plot(v_raw, F_ext, '-', 'LineWidth', 1.2);
    scatter(v_raw, F_loss, 20, 'filled');
    plot(v_raw, F_model, 'k-', 'LineWidth', 2.0);

    xlabel('Velocity (m/s)');
    ylabel('Force (N)');
    title(sprintf('%s (\\eta = %.1f%%)', labels{i}, curveEfficiencies(curveID)));

    if i == 1
        legend({'Hydraulic force pA', ...
                'External force from efficiency', ...
                'Reconstructed loss', ...
                'Stribeck model'}, ...
                'Location','best');
    end

    set(gca,'TickDir','out');
    box off;
end

%% ================================================
% Named functions (no anonymous functions)
%% ================================================

function F = stribeckModel(params, v)
% Evaluates the Stribeck friction model
% params = [Fv, Fc, Fst, vst]
% F = Fv*v + Fc + Fst*exp(-v/vst)
    Fv  = params(1);
    Fc  = params(2);
    Fst = params(3);
    vst = params(4);
    F   = Fv .* v + Fc + Fst .* exp(-v ./ vst);
end

function res = stribeckResidual(params, v_all, Ffric_all)
% Residual vector for lsqnonlin
% lsqnonlin minimises sum(res.^2)
    res = stribeckModel(params, v_all) - Ffric_all;
end