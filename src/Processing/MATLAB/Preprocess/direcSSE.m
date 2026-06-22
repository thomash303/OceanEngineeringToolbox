clear; clc; close all;

%% -------------------- PARAMETERS --------------------
spreadingFunctionConstant = 5; % n
waveHeading = 0;               % mean wave heading (deg)
waveHeadingSpread = 30;        % +/- range for wave heading (deg)
waveHeadingSpreadBins = 10;    % number of bins

spreadWidth = 2*waveHeadingSpread / waveHeadingSpreadBins; % width of bins (deg)

% Bin edges and centers
spreadBinsEdge = linspace(-waveHeadingSpread + waveHeading, waveHeadingSpread + waveHeading, waveHeadingSpreadBins+1);
spreadBinCentre = (spreadBinsEdge(1:end-1) + spreadBinsEdge(2:end))/2;

% Directional spreading weights
k = gamma(spreadingFunctionConstant/2 + 1) / (sqrt(pi)*gamma(spreadingFunctionConstant/2 + 1/2)); 
D = k * cos(deg2rad(spreadBinCentre) - deg2rad(waveHeading)).^spreadingFunctionConstant;
Dnorm = D * deg2rad(spreadWidth) / sum(D * deg2rad(spreadWidth));  % normalized

%% Frequency spectrum
nSamples = 50;
omega = linspace(0, 5, nSamples);  % rad/s
S_omega = sin(omega).^2;           % example spectrum
domega = mean(diff(omega));        % frequency step

%% -------------------- AMPLITUDES --------------------
% Multidirectional amplitude matrix: A(n,m) = sqrt(2 * S * D * domega)
A_dir = sqrt(2 * (S_omega' * Dnorm) .* domega);  % size: nSamples x waveHeadingSpreadBins

% Sum of squared amplitudes over directions
A_dir_sum = sum(sqrt(sum(A_dir.^2, 2)))  % nSamples x 1, sqrt(sum(A_nm^2)) to conserve energy

% Unidirectional amplitude for the same S_omega
A_uni = sum(sqrt(2 * S_omega .* domega))  % nSamples x 1

%% -------------------- SEA SURFACE ELEVATION --------------------
% Spatial points (x,y)
x = 0;
y = 0;

% Random phase for each frequency and direction
phi = 2*pi*rand(nSamples, waveHeadingSpreadBins);

% Wave numbers (deep water, k = omega^2 / g)
g = 9.81;
k_n = omega.^2 / g;  % vector of length nSamples

% Time vector
t = linspace(0, 20, 500);  % seconds
eta = zeros(size(t));

% Compute eta(x,y,t)
for i = 1:length(t)
    cosArg = omega'*t(i) - k_n'*(x*cosd(spreadBinCentre) + y*sind(spreadBinCentre)) + phi;
    eta(i) = sum(sum(A_dir .* cos(cosArg)));
end

%% -------------------- PLOT --------------------
figure;
plot(t, eta, 'b', 'LineWidth', 1.5)
xlabel('Time [s]')
ylabel('\eta(x,y,t) [m]')
title('Sea Surface Elevation at (x,y)')
grid on
