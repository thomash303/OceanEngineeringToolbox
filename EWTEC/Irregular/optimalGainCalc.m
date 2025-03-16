% This script identifies the dynamics of the float in the respective wave 
% conditions and determines the optimal proportional gain value for a 
% passive controller (for regular waves)

% Inputs (from wecSimInputFile)
simu = simulationClass();
body(1) = bodyClass('../RM3/hydroData/rm3.h5');
waves.height = 2;
waves.period = 8;

% Load hydrodynamic data for float from BEM
hydro = readBEMIOH5(body.h5File{1}, 1, body.meanDrift);

% Define wave conditions
H = waves.height;
A = H/2;
T = waves.period;
omega = (1/T)*(2*pi);

% Define excitation force based on wave conditions
ampSpect = zeros(length(hydro.simulation_parameters.w),1);
[~,closestIndOmega] = min(abs(omega-hydro.simulation_parameters.w));
ampSpect(closestIndOmega) = A;
FeRao = squeeze(hydro.hydro_coeffs.excitation.re(3,:))'*simu.rho*simu.gravity + squeeze(hydro.hydro_coeffs.excitation.im(3,:))'*simu.rho*simu.gravity*1j;
Fexc = ampSpect.*FeRao;

% Define the intrinsic mechanical impedance for the device
mass = simu.rho*hydro.properties.volume;
addedMass = squeeze(hydro.hydro_coeffs.added_mass.all(3,3,:))*simu.rho;
radiationDamping = squeeze(hydro.hydro_coeffs.radiation_damping.all(3,3,:)).*squeeze(hydro.simulation_parameters.w')*simu.rho;
hydrostaticStiffness = hydro.hydro_coeffs.linear_restoring_stiffness(3,3)*simu.rho*simu.gravity;



% Calculate the maximum potential power
P_max = -sum(abs(Fexc).^2./(8*real(Zi)))

% Calculate optimal Kp and Ki gains for reactive control
KpOpt = radiationDamping(closestIndOmega)
KiOpt = -(-omega^2*(mass + addedMass(closestIndOmega)) + hydrostaticStiffness)

Zpto = KpOpt + KiOpt/(1j*omega);

