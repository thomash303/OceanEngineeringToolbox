%% Extract and save simulation data
% Extract from output file
% plotting = {};
% 
% rho = 1000;
% g = 9.81;
% 
% plotting.RIRF.t = body.hydroData.hydro_coeffs.radiation_damping.impulse_response_fun.t; % s
% plotting.RIRF.K = permute(body.hydroData.hydro_coeffs.radiation_damping.impulse_response_fun.K(3,3,:),[3,1,2]) * rho; % N/m
% 
% plotting.EIRF.t = body.hydroData.hydro_coeffs.excitation.impulse_response_fun.t; % s
% plotting.EIRF.f = permute(body.hydroData.hydro_coeffs.excitation.impulse_response_fun.f(3,1,:),[3,1,2]) * rho * g; % N/(ms)
% 
% plotting.Wave.S = waves.spectrum; % m^2 s/rad
% plotting.Wave.omega = waves.omega; % rad/s
% 
% plotting.Wave.t = output.wave.time; % s
% plotting.Wave.eta = output.wave.elevation; % m

% ---- Only for visual ----
% % plotting.Wave.omegaVis = waves.omega; % rad/s

% % Save to struct
% save("plottingData.mat",'plotting')


% Extract from struct
load("plottingData.mat")
tr = plotting.RIRF.t;
Kr = plotting.RIRF.K;

te = plotting.EIRF.t; 
fe = plotting.EIRF.f;

S = plotting.Wave.S;
omega = plotting.Wave.omega;

tn = plotting.Wave.t;
eta = plotting.Wave.eta;

omegaVis = plotting.Wave.omegaVis;

%% Plotting
% Set default settings
Fsize = 12;
AxisLineWidth = 2;
LineWidth = 2;

%% RIRF
figure('Name','RIRF')
plot(tr, Kr/1000, 'LineWidth', LineWidth);
ylabel('$h_r\;[kN/m]$', 'Interpreter','latex')
xlabel('$t\;[s]$', 'Interpreter','latex')
yticks(-50:25:100)

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend off

%% EIRF
figure('Name','EIRF')
plot(te, fe/1000, 'LineWidth', LineWidth);
ylabel('$h_e\;[\mathrm{kN/(m\,s)}]$', 'Interpreter', 'latex')
xlabel('$t\;[s]$', 'Interpreter','latex')
xlim([-62.5,62.5])
xticks(-60:30:60)

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend off

%% Wave spectrum
Tp = 8;
omega_p = 2*pi/Tp;
S_p = interp1(omega, S, omega_p);

figure('Name','Spectrum')
plot(omega, S, 'LineWidth', LineWidth);
hold on
% Colour under curve
fill([omega; flipud(omega)], ...
     [S; zeros(size(S))], ...
     [0.6 0.85 0.95], ...
     'FaceAlpha', 0.3, ...
     'EdgeColor', 'none')

% Equal-energy bins
S_vis = interp1(omega, S, omegaVis);  % interpolate S at those points

for i = 1:length(omegaVis)
    if i == 3
        % Tp
        plot([omegaVis(i) omegaVis(i)], [0 S_vis(i)], '--k','Color', [0.75 0.3 0.0], 'LineWidth', 1.5)
    else
        % Bins
        plot([omegaVis(i) omegaVis(i)], [0 S_vis(i)], '--k', 'LineWidth', 1)
    end
end

ylabel('$S\;[m^2 s/rad]$', 'Interpreter', 'latex')
xlabel('$\omega\;[rad/s]$', 'Interpreter','latex')
xlim([0 3])
hold off

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend off

%% Wave elevation
figure('Name','Elevation')
plot(tn, eta, 'LineWidth', LineWidth);
ylabel('$\eta\;[m]$', 'Interpreter', 'latex')
xlabel('$t\;[s]$', 'Interpreter','latex')
xlim([225 300])
xticks(225:25:300)

grid off;
box off;
set(gca,'FontSize',Fsize);
set(gca,'TickDir','out');
set(gca,'linewidth',AxisLineWidth)
set(get(gca,'XLabel'),'FontSize',Fsize);
set(get(gca,'YLabel'),'FontSize',Fsize);
legend off
