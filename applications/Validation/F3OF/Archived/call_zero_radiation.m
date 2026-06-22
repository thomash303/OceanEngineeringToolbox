%% call_zero_radiation.m
% Zeros out a specific (ii, jj) radiation state-space block for a chosen body.
% For B2B: zeros row ii_target of body_target's A matrix across ALL bodies'
%          column blocks (jj_target col of every body).
% For noB2B: zeros own-body (ii_target, jj_target) block of body_target only.
% Block size and order are unchanged — values are simply set to zero.
%
% Edit the variables below then run.

inputFile  = 'F3OF_WhydroCoeff_TRIMMED.mat';
outputFile = 'F3OF_WhydroCoeff_TRIMMED.mat';
ii_target  = 1; % row DoF (e.g. 3 = heave)
jj_target  = 1; % col DoF within own body block (e.g. 3 = heave)
body_target = 2; % which body's matrices to modify (1, 2, 3, ...)

%% Load
fprintf('Loading: %s\n', inputFile);
loaded = load(inputFile);
hydro  = loaded.hydro;

Nb    = hydro.bodies.Nb;
nDoF  = hydro.bodies.nDoF;
dof1  = hydro.bodies.dof(1);
order = hydro.coefficients.radiation.stateSpace.order;

% Global column index of body_target's jj_target — fixed for all B2B matrices
jj_global = hydro.bodies.dofStart(body_target) + jj_target - 1;

%% --- B2B ---
% Every body's A/B/C matrix has a column block for body_target.
% Zero (ii_target, jj_global) in ALL bodies' matrices.
LDoF_B2B = Nb * dof1;

for i = 1:Nb
    radSSAName = sprintf('A%d', i);
    radSSBName = sprintf('B%d', i);
    radSSCName = sprintf('C%d', i);

    if isfield(hydro.coefficients.radiation.stateSpace.B2B, radSSAName)
        cursor = 0;
        for ii = 1:nDoF
            for jj = 1:LDoF_B2B
                blockSize = order(ii, jj);
                if ii == ii_target && jj == jj_global
                    ds = cursor + 1;
                    de = cursor + blockSize;
                    hydro.coefficients.radiation.stateSpace.B2B.(radSSAName)(ds:de, ds:de) = 0;
                    hydro.coefficients.radiation.stateSpace.B2B.(radSSBName)(ds:de, jj)    = 0;
                    hydro.coefficients.radiation.stateSpace.B2B.(radSSCName)(ii, ds:de)    = 0;
                    fprintf('B2B  body %d: block (ii=%d, jj_global=%d) order=%d zeroed [diag %d:%d]\n', ...
                        i, ii_target, jj_global, blockSize, ds, de);
                end
                cursor = cursor + blockSize;
            end
        end
    end
end

%% --- noB2B ---
% Only body_target's own matrix has its own (ii_target, jj_target) block.
radSSAName = sprintf('A%d', body_target);
radSSBName = sprintf('B%d', body_target);
radSSCName = sprintf('C%d', body_target);

if isfield(hydro.coefficients.radiation.stateSpace.noB2B, radSSAName)
    LDoF_noB2B = dof1;
    colOffset  = hydro.bodies.dofStart(body_target) - 1;

    cursor = 0;
    for ii = 1:nDoF
        for jj = 1:LDoF_noB2B
            jjGlobal  = jj + colOffset;
            blockSize = order(ii, jjGlobal);
            if ii == ii_target && jj == jj_target
                ds = cursor + 1;
                de = cursor + blockSize;
                hydro.coefficients.radiation.stateSpace.noB2B.(radSSAName)(ds:de, ds:de) = 0;
                hydro.coefficients.radiation.stateSpace.noB2B.(radSSBName)(ds:de, jj)    = 0;
                hydro.coefficients.radiation.stateSpace.noB2B.(radSSCName)(ii, ds:de)    = 0;
                fprintf('noB2B body %d: block (ii=%d, jj=%d) order=%d zeroed [diag %d:%d]\n', ...
                    body_target, ii_target, jj_target, blockSize, ds, de);
            end
            cursor = cursor + blockSize;
        end
    end
end

%% Save
save(outputFile, 'hydro');
fprintf('Saved to: %s\n', outputFile);