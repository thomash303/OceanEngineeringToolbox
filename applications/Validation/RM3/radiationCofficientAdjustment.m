
%% Modelica Hydrodynamic Data Adjustment
%{
BEMIO post-processes the hydrodynamic data from the WAMIT 
output file (rm3.out) and generates an HDF file (rm3.h5). The radiation
state-space matrices for the surge and sway modes cause numerical
instabilities in OET simulations, even though stable transfer functions are
produced. To avoid this issue, a new state-space realization is estimated
using the same radiation impulse response function. This script should be
executed after (if) BEMIO post-processes the WAMIT data and BEFORE the
hydrodynamic data is used to execute a simulation in the OET. This has
already been performed for the provided hydrodynamic data; therefore,
unless you are re-pre-processing the WAMIT data, there is no need to
execute this script.
%}

%% Generating a new state-space realization
% Importing hydrodynamic data
t = Data.t;
k = Data.k;

% Estimating state-space matrices
rho = 1000;

% Convert impulse response to Unit step response
% Unit step response=(running integral of impulse response) * step time
dt=t(2)-t(1);          % Extract sample time
u_op=cumsum(k(:))*dt;  % Unit step response from impluse response
u_ip=ones(size(u_op)); % Unit Step input, simply a dc signal of unit amplitude

data = iddata(u_op, u_ip,dt); % unit step response input and output passed to iddata
                                

order = 2;                  % Approximation order   
tf_est = tfest(data,order); % Fitting transfer function
ss_new = ss(tf_est);        % Estimating state-space matrices


k1 = permute(k,[3,1,2]);

% Plot both the newly estimated state-space matrices and the original IRF
figure('Name','IRF')
[y,t]=impulse(tf_est, t); hold on;
plot(t, y, 'b--', t, k1, 'r:', 'LineWidth', 1.5);
legend('Estimated State-Space Model', 'Original Impulse Response');
xlabel('Time (s)'); ylabel('Response');
title('Impulse Response Comparison');
grid on;

% Display the estimated state-space matrices
A = ss_new.A;
B = ss_new.B;
C = ss_new.C*rho;
D = ss_new.D;

disp('Newly estimated state-space matrices:');
disp('A = '), disp(A);
disp('B = '), disp(B);
disp('C = '), disp(C);
disp('D = '), disp(D);

%% Modifyiung the RM3HydroCoeff.mat structure to include the new state-space matrices
% Note: the IRFs are almost identical and produce like state-space matrices
% Surge
hydro.coefficients.radiation.stateSpace.noB2B.A1(1:2,1:2) = A;
hydro.coefficients.radiation.stateSpace.noB2B.B1(1:2,1) = B;
hydro.coefficients.radiation.stateSpace.noB2B.C1(1,1:2) = C*1000;

% Sway
hydro.coefficients.radiation.stateSpace.noB2B.A1(45:46,45:46) = A;
hydro.coefficients.radiation.stateSpace.noB2B.B1(45:46,2) = B;
hydro.coefficients.radiation.stateSpace.noB2B.C1(2,45:46) = C*1000;

save('RM3HydroCoeff.mat','hydro')