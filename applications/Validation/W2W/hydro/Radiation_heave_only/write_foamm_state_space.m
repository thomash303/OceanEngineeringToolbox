%% Load FOAMM state-space into the h5 file
%
% Loads FOAMM state-space coefficients from a .mat file and applies them
% to the hydro struct:
%   - All radiation state-space entries are set to zero (order 1 approximation)
%   - The heave-heave (3,3) coupling is replaced with the FOAMM coefficients
%.

% clear; clc;

%% SECTION 1: Paths
hydroFile  = 'SPHERE_3480phydroCoeff.mat';          % hydro .mat file to modify
foammFile  = 'FOAMM_state_space.mat';          % FOAMM output saved as save('FOAMM_state_space.mat','FOAMM')
outputFile = 'SPHERE_3480phydroCoeff_FOAMM.mat';     % where to save the result

heave_dof  = 3; 

%% SECTION 2: Load files
 
tmp   = load(hydroFile);
hydro = tmp.hydro;
 
tmp2  = load(foammFile);
FOAMM = tmp2.FOAMM;
 
Nb   = hydro.bodies.Nb;
nDoF = hydro.bodies.nDoF;
dof1 = hydro.bodies.dof(1);
 
fprintf('Loaded hydro : %d bodies, %d total DoF\n', Nb, nDoF);
fprintf('FOAMM fields : %s\n', strjoin(fieldnames(FOAMM)', ', '));
 
%% SECTION 3: Extract FOAMM heave-heave coefficients
 
A_foamm = FOAMM.A_ss;       % [n x n]
B_foamm = FOAMM.B_ss(:);    % [n x 1] column
C_foamm = FOAMM.C_ss(:)';   % [1 x n] row
 
if isfield(FOAMM, 'D_ss')
    D_foamm = FOAMM.D_ss;
else
    D_foamm = 0;
end
 
n_foamm = size(A_foamm, 1);
fprintf('FOAMM heave-heave order: %d\n', n_foamm);
 
%% SECTION 4: Build state-space matrices for B2B and noB2B
 
configs(1).name      = 'B2B';
configs(1).nLocalDoF = nDoF;
 
configs(2).name      = 'noB2B';
configs(2).nLocalDoF = dof1;
 
for s = 1:numel(configs)
    ssType    = configs(s).name;
    nLocalDoF = configs(s).nLocalDoF;
 
    % Build order matrix for this ssType: 1 everywhere, n_foamm at (3,3)
    orders_s = ones(nDoF, nLocalDoF);
    if heave_dof <= nDoF && heave_dof <= nLocalDoF
        orders_s(heave_dof, heave_dof) = n_foamm;
    else
        warning('%s: heave_dof=%d exceeds nLocalDoF=%d — heave block NOT inserted', ...
            ssType, heave_dof, nLocalDoF);
    end
 
    N_total = sum(orders_s(:));
 
    % Pre-allocate
    A_new = zeros(N_total, N_total);
    B_new = zeros(N_total, nLocalDoF);
    C_new = zeros(nDoF,    N_total);
    D_new = zeros(nDoF,    nLocalDoF);
 
    % Fill block by block
    row_cursor = 0;
    for ii = 1:nDoF
        for jj = 1:nLocalDoF
            ord = orders_s(ii, jj);   % use scoped orders_s, not stale outer var
            idx = row_cursor + (1:ord);
 
            if ii == heave_dof && jj == heave_dof
                A_new(idx, idx) = A_foamm;          % [n_foamm x n_foamm]
                B_new(idx, jj)  = B_foamm;          % [n_foamm x 1]
                C_new(ii,  idx) = C_foamm;          % [1 x n_foamm]
                D_new(ii,  jj)  = D_foamm;          % scalar
            end
            % All other blocks stay zero (order-1 scalar zero system)
 
            row_cursor = row_cursor + ord;
        end
    end
 
    % Store per body
    for i = 1:Nb
        hydro.coefficients.radiation.stateSpace.(ssType).(sprintf('A%d',i)) = A_new;
        hydro.coefficients.radiation.stateSpace.(ssType).(sprintf('B%d',i)) = B_new;
        hydro.coefficients.radiation.stateSpace.(ssType).(sprintf('C%d',i)) = C_new;
        hydro.coefficients.radiation.stateSpace.(ssType).(sprintf('D%d',i)) = D_new;
    end
 
    % Store order matrix scoped to this ssType
    configs(s).orders = orders_s;
 
    fprintf('Built %s: A[%d x %d]  B[%d x %d]  C[%d x %d]  D[%d x %d]\n', ...
        ssType, size(A_new,1),size(A_new,2), size(B_new,1),size(B_new,2), ...
                size(C_new,1),size(C_new,2), size(D_new,1),size(D_new,2));
    fprintf('  orders_s(%d,%d) = %d  (should be %d)\n', ...
        heave_dof, heave_dof, orders_s(heave_dof,heave_dof), n_foamm);
end
 
% Save B2B order as the reference order matrix in the struct
hydro.coefficients.radiation.stateSpace.order = configs(1).orders;
 
fprintf('\nOrder matrix (B2B):\n'); disp(configs(1).orders);
 
%% SECTION 5: Save
save(outputFile, 'hydro');
fprintf('Saved to: %s\n', outputFile);
 
%% SECTION 6: Sanity check
 
fprintf('\n--- SANITY CHECK ---\n');
 
for s = 1:numel(configs)
    ssType    = configs(s).name;
    nLocalDoF = configs(s).nLocalDoF;
    orders_s  = configs(s).orders;
 
    A = hydro.coefficients.radiation.stateSpace.(ssType).A1;
    B = hydro.coefficients.radiation.stateSpace.(ssType).B1;
    C = hydro.coefficients.radiation.stateSpace.(ssType).C1;
    D = hydro.coefficients.radiation.stateSpace.(ssType).D1;
 
    fprintf('\n%s: A[%dx%d]  B[%dx%d]  C[%dx%d]  D[%dx%d]\n', ...
        ssType, size(A,1),size(A,2), size(B,1),size(B,2), ...
                size(C,1),size(C,2), size(D,1),size(D,2));
 
    % Locate and print heave-heave block
    cursor = 0;
    for ii = 1:nDoF
        for jj = 1:nLocalDoF
            ord = orders_s(ii, jj);
            if ii == heave_dof && jj == heave_dof
                idx = cursor + (1:ord);
                fprintf('  Heave-heave A block [%dx%d]:\n', ord, ord);
                disp(A(idx, idx));
                fprintf('  Heave-heave B col:  '); disp(B(idx, jj)');
                fprintf('  Heave-heave C row:  '); disp(C(ii,  idx));
                fprintf('  Heave-heave D entry: %g\n', D(ii, jj));
            end
            cursor = cursor + ord;
        end
    end
end