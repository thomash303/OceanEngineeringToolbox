function zeroRadiationBlock(matFilePath, ii_target, jj_target, outputFilePath)
%% zeroRadiationBlock
% Zeros out a specific (ii, jj) radiation state-space block for each
% body's own diagonal in both B2B and noB2B matrices.
%
% For each body, the target block is where:
%   - row ii = ii_target
%   - col jj = local jj_target within that body's own column range
%     (i.e. global jj = dofStart(body) + jj_target - 1)
%
% The block is replaced with a 1x1 zero block and its order set to 1.
% Cross-body terms are untouched.
%
% Inputs:
%   matFilePath    : path to the input .mat file (never modified)
%   ii_target      : row DoF to zero (1-6, e.g. 3 = heave)
%   jj_target      : col DoF to zero within own body block (1-6, e.g. 3 = heave)
%   outputFilePath : path to save the modified .mat file
%
% Example:
%   zeroRadiationBlock('RM3hydroCoeff.mat', 3, 3, 'RM3hydroCoeff_heaveZero.mat')

fprintf('Loading: %s\n', matFilePath);
loaded = load(matFilePath);
hydro  = loaded.hydro;

Nb   = hydro.bodies.Nb;
nDoF = hydro.bodies.nDoF;
dof1 = hydro.bodies.dof(1);

% Save original order before modification
originalOrder = hydro.coefficients.radiation.stateSpace.order;
newOrder      = originalOrder;

for i = 1:Nb

    radSSAName = sprintf('A%d', i);
    radSSBName = sprintf('B%d', i);
    radSSCName = sprintf('C%d', i);
    radSSDName = sprintf('D%d', i);

    dofStart = hydro.bodies.dofStart(i);

    % Global column index of this body's jj_target
    jj_global = dofStart + jj_target - 1;

    %% --- B2B ---
    if isfield(hydro.coefficients.radiation.stateSpace.B2B, radSSAName)

        LDoF_B2B = Nb * dof1;

        % Local column index within B2B (global = jj_global)
        jj_local_B2B = jj_global;

        % Update order for just this one block
        newOrder(ii_target, jj_global) = 1;

        [Af, Bf, Cf] = zeroBlock( ...
            originalOrder, newOrder, nDoF, LDoF_B2B, ...
            ii_target, jj_local_B2B, ...
            hydro.coefficients.radiation.stateSpace.B2B.(radSSAName), ...
            hydro.coefficients.radiation.stateSpace.B2B.(radSSBName), ...
            hydro.coefficients.radiation.stateSpace.B2B.(radSSCName), ...
            0);

        hydro.coefficients.radiation.stateSpace.B2B.(radSSAName) = Af;
        hydro.coefficients.radiation.stateSpace.B2B.(radSSBName) = Bf;
        hydro.coefficients.radiation.stateSpace.B2B.(radSSCName) = Cf;
        hydro.coefficients.radiation.stateSpace.B2B.(radSSDName) = zeros(nDoF, LDoF_B2B);

        fprintf('B2B  body %d: block (%d,%d) [global col %d] zeroed.\n', ...
            i, ii_target, jj_target, jj_global);
    end

    %% --- noB2B ---
    if isfield(hydro.coefficients.radiation.stateSpace.noB2B, radSSAName)

        LDoF_noB2B = dof1;
        colOffset  = dofStart - 1;

        % Local column index within noB2B is just jj_target
        jj_local_noB2B = jj_target;

        % Update order — global col for order matrix
        newOrder(ii_target, jj_global) = 1;

        [Af, Bf, Cf] = zeroBlock( ...
            originalOrder, newOrder, nDoF, LDoF_noB2B, ...
            ii_target, jj_local_noB2B, ...
            hydro.coefficients.radiation.stateSpace.noB2B.(radSSAName), ...
            hydro.coefficients.radiation.stateSpace.noB2B.(radSSBName), ...
            hydro.coefficients.radiation.stateSpace.noB2B.(radSSCName), ...
            colOffset);

        hydro.coefficients.radiation.stateSpace.noB2B.(radSSAName) = Af;
        hydro.coefficients.radiation.stateSpace.noB2B.(radSSBName) = Bf;
        hydro.coefficients.radiation.stateSpace.noB2B.(radSSCName) = Cf;
        hydro.coefficients.radiation.stateSpace.noB2B.(radSSDName) = zeros(nDoF, LDoF_noB2B);

        fprintf('noB2B body %d: block (%d,%d) [local col %d] zeroed.\n', ...
            i, ii_target, jj_target, jj_local_noB2B);
    end

end

% Commit updated order
hydro.coefficients.radiation.stateSpace.order = newOrder;

save(outputFilePath, 'hydro');
fprintf('Saved to: %s\n', outputFilePath);

end


%% =========================================================================
function [Af, Bf, Cf] = zeroBlock( ...
    originalOrder, newOrder, nDoF, LDoF, ...
    ii_target, jj_target_local, ...
    oldA, oldB, oldC, colOffset)
%% zeroBlock
% Rebuilds block-diagonal A, B, C replacing only the (ii_target,
% jj_target_local) block with a 1x1 zero. All other blocks are copied
% from the original matrices unchanged.
%
% colOffset: dofStart-1 for noB2B, 0 for B2B.

    % Pre-compute diagonal start of each (ii,jj) block in oldA
    blockDiagStart = zeros(nDoF, LDoF);
    cursor = 0;
    for ii = 1:nDoF
        for jj = 1:LDoF
            jjGlobal = jj + colOffset;
            blockDiagStart(ii, jj) = cursor;
            cursor = cursor + originalOrder(ii, jjGlobal);
        end
    end

    % Compute total size of new matrix
    totalNewSize = 0;
    for ii = 1:nDoF
        for jj = 1:LDoF
            jjGlobal = jj + colOffset;
            totalNewSize = totalNewSize + newOrder(ii, jjGlobal);
        end
    end

    Af = zeros(totalNewSize, totalNewSize);
    Bf = zeros(totalNewSize, LDoF);
    Cf = zeros(nDoF, totalNewSize);

    newCursor = 0;
    for ii = 1:nDoF
        for jj = 1:LDoF
            jjGlobal  = jj + colOffset;
            oldN      = originalOrder(ii, jjGlobal);
            newN      = newOrder(ii, jjGlobal);
            isTarget  = (ii == ii_target) && (jj == jj_target_local);

            ns = newCursor + 1;
            ne = newCursor + newN;

            if ~isTarget
                % Copy block from old matrices
                ds = blockDiagStart(ii, jj) + 1;
                de = ds + oldN - 1;
                Af(ns:ne, ns:ne) = oldA(ds:de, ds:de);
                Bf(ns:ne, jj)    = oldB(ds:de, jj);
                Cf(ii, ns:ne)    = oldC(ii, ds:de);
                % target block stays zero (pre-initialised)
            end

            newCursor = ne;
        end
    end

end