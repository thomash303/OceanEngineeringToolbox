%% Verifying FOAMM State-Space
%% Load hydro structure
% load('SPHEREhydroCoeff_FOAMM.mat')
% load('SPHERE_BEMIOhydroCoeff.mat')
%% Select body
body = 1;

%% Dynamic field names
Aname = sprintf('A%d', body);
Bname = sprintf('B%d', body);
Cname = sprintf('C%d', body);
Dname = sprintf('D%d', body);

%% Get full state-space matrices
A = hydro.coefficients.radiation.stateSpace.noB2B.(Aname);
B = hydro.coefficients.radiation.stateSpace.noB2B.(Bname);
C = hydro.coefficients.radiation.stateSpace.noB2B.(Cname);
D = hydro.coefficients.radiation.stateSpace.noB2B.(Dname);

%% Extract heave-heave (3,3) subsystem
%
% Need the state order matrix to determine the state indices
%

order = hydro.coefficients.radiation.stateSpace.order;

ii = 3; % force DOF (heave)
jj = 3; % velocity DOF (heave)

%% Determine state indices
stateStart = 1;

for i = 1:size(order,1)
    for j = 1:size(order,2)

        n = order(i,j);

        if i == ii && j == jj
            stateInd = stateStart:(stateStart+n-1);
            break
        end

        stateStart = stateStart + n;
    end
end

%% Extract subsystem
A_33 = A(stateInd, stateInd);

% Column jj corresponds to input DOF
B_33 = B(stateInd, jj);

% Row ii corresponds to output DOF
C_33 = C(ii, stateInd);

D_33 = D(ii, jj);

%% FOAMM
% ssm.foamm.A_33 = A_33;
% ssm.foamm.B_33 = B_33;
% ssm.foamm.C_33 = C_33;
% ssm.foamm.D_33 = D_33;

%% WEC-Sim
% ssm.ws.A_33 = A_33;
% ssm.ws.B_33 = B_33;
% ssm.ws.C_33 = C_33;
% ssm.ws.D_33 = D_33;

%% Plotting responses
sys_foamm = ss( ...
    ssm.foamm.A_33, ...
    ssm.foamm.B_33, ...
    ssm.foamm.C_33, ...
    ssm.foamm.D_33);

sys_ws = ss( ...
    ssm.ws.A_33, ...
    ssm.ws.B_33, ...
    ssm.ws.C_33, ...
    ssm.ws.D_33);

% Time vector
t = linspace(0, 100, 5000);

% Impulse responses
[y_foamm, t] = impulse(sys_foamm, t);
[y_ws, ~] = impulse(sys_ws, t);

% Plot
figure
plot(t, y_foamm, 'LineWidth', 1.5)
hold on
plot(t, y_ws, '--', 'LineWidth', 1.5)

grid on

xlabel('Time [s]')
ylabel('Radiation IRF')

legend('FOAMM', 'WEC-Sim')

title('(3,3) Radiation State-Space Impulse Response Comparison')