function trimRadiationStateSpace(matFilePath)
%% trimRadiationStateSpace
% Post-processing script to trim radiation state-space matrices in a
% preprocessed hydro .mat file.
%
% Keeps body modes 1, 3, 5 (surge, heave, pitch) as-is.
% Replaces all blocks where ii or jj corresponds to modes 2, 4, 6
% (per body) with trivial 1x1 zero blocks, and sets their order to 1.
% Rebuilds the full block-diagonal A, B, C, D matrices accordingly.
%
% Operates on both B2B and noB2B state-space structures.
%
% Input:
%   matFilePath : full path to the .mat file to modify (will be overwritten)

fprintf('Loading: %s\n', matFilePath);
loaded = load(matFilePath);
hydro = loaded.hydro;

nDoF  = hydro.bodies.nDoF;   % 6
Nb    = hydro.bodies.Nb;
dof1  = hydro.bodies.dof(1); % DoF per body

trivialModes = [2, 4, 6];

% Save original order before any modification so we know original block
% sizes when extracting from the old matrices
originalOrder = hydro.coefficients.radiation.stateSpace.order;
newOrder      = originalOrder;

for i = 1:Nb

    radSSAName = sprintf('A%d', i);
    radSSBName = sprintf('B%d', i);
    radSSCName = sprintf('C%d', i);
    radSSDName = sprintf('D%d', i);

    dofStart = hydro.bodies.dofStart(i);
    dofEnd   = hydro.bodies.dofEnd(i);

    %% --- B2B ---
    if isfield(hydro.coefficients.radiation.stateSpace.B2B, radSSAName)

        LDoF_B2B = Nb * dof1;

        % Trivial global col indices: modes 2,4,6 for every body
        trivialColsB2B = [];
        for b = 1:Nb
            bodyOffset     = (b-1) * dof1;
            trivialColsB2B = [trivialColsB2B, bodyOffset + trivialModes]; %#ok<AGROW>
        end
        trivialRows = trivialModes;

        % Mark trivial blocks in newOrder
        for ii = 1:nDoF
            for jj = 1:LDoF_B2B
                if ismember(ii, trivialRows) || ismember(jj, trivialColsB2B)
                    newOrder(ii, jj) = 1;
                end
            end
        end

        [Af, Bf, Cf] = rebuildSS( ...
            originalOrder, newOrder, nDoF, LDoF_B2B, ...
            trivialRows, trivialColsB2B, ...
            hydro.coefficients.radiation.stateSpace.B2B.(radSSAName), ...
            hydro.coefficients.radiation.stateSpace.B2B.(radSSBName), ...
            hydro.coefficients.radiation.stateSpace.B2B.(radSSCName), ...
            0);

        hydro.coefficients.radiation.stateSpace.B2B.(radSSAName) = Af;
        hydro.coefficients.radiation.stateSpace.B2B.(radSSBName) = Bf;
        hydro.coefficients.radiation.stateSpace.B2B.(radSSCName) = Cf;
        hydro.coefficients.radiation.stateSpace.B2B.(radSSDName) = zeros(nDoF, LDoF_B2B);

        fprintf('B2B state-space trimmed for body %d.\n', i);
    end

    %% --- noB2B ---
    if isfield(hydro.coefficients.radiation.stateSpace.noB2B, radSSAName)

        LDoF_noB2B = dof1;
        colOffset  = dofStart - 1; % maps local jj (1:6) to global order col

        trivialCols = trivialModes;
        trivialRows = trivialModes;

        % Mark trivial blocks in newOrder for this body's column slice
        for ii = 1:nDoF
            for jj = 1:LDoF_noB2B
                jjGlobal = jj + colOffset;
                if ismember(ii, trivialRows) || ismember(jj, trivialCols)
                    newOrder(ii, jjGlobal) = 1;
                end
            end
        end

        [Af, Bf, Cf] = rebuildSS( ...
            originalOrder, newOrder, nDoF, LDoF_noB2B, ...
            trivialRows, trivialCols, ...
            hydro.coefficients.radiation.stateSpace.noB2B.(radSSAName), ...
            hydro.coefficients.radiation.stateSpace.noB2B.(radSSBName), ...
            hydro.coefficients.radiation.stateSpace.noB2B.(radSSCName), ...
            colOffset);

        hydro.coefficients.radiation.stateSpace.noB2B.(radSSAName) = Af;
        hydro.coefficients.radiation.stateSpace.noB2B.(radSSBName) = Bf;
        hydro.coefficients.radiation.stateSpace.noB2B.(radSSCName) = Cf;
        hydro.coefficients.radiation.stateSpace.noB2B.(radSSDName) = zeros(nDoF, LDoF_noB2B);

        fprintf('noB2B state-space trimmed for body %d.\n', i);
    end

end

% Commit updated order
hydro.coefficients.radiation.stateSpace.order = newOrder;

save(matFilePath, 'hydro');
fprintf('Saved trimmed hydro to: %s\n', matFilePath);

end


%% =========================================================================
function [Af, Bf, Cf] = rebuildSS( ...
    originalOrder, newOrder, nDoF, LDoF, ...
    trivialRows, trivialCols, ...
    oldA, oldB, oldC, colOffset)
%% rebuildSS
% Rebuilds block-diagonal A, B, C by walking (ii, jj) in the same order
% as preprocess.m.
%
% Uses originalOrder to locate blocks in the old matrices (via pre-computed
% diagonal offsets), and newOrder for the sizes of the rebuilt blocks.
%
% colOffset: added to jj to get the global column index in order matrices.
%            Pass 0 for B2B. Pass dofStart-1 for noB2B.

    % Pre-compute diagonal start index of each (ii,jj) block in oldA.
    % preprocess.m walks ii=1:nDoF, jj=1:LDoF and appends each block
    % to the block diagonal in that order.
    blockDiagStart = zeros(nDoF, LDoF);
    cursor = 0;
    for ii = 1:nDoF
        for jj = 1:LDoF
            jjGlobal = jj + colOffset;
            blockDiagStart(ii, jj) = cursor;
            cursor = cursor + originalOrder(ii, jjGlobal);
        end
    end
    % Total old diagonal size = cursor

    % Now rebuild the new block-diagonal matrices
    newCursor = 0;
    totalNewSize = sum(newOrder(:, (1:LDoF) + colOffset), 'all');
    Af = zeros(totalNewSize, totalNewSize);
    Bf = zeros(totalNewSize, LDoF);
    Cf = zeros(nDoF, totalNewSize);

    for ii = 1:nDoF
        for jj = 1:LDoF
            jjGlobal  = jj + colOffset;
            oldN      = originalOrder(ii, jjGlobal);
            newN      = newOrder(ii, jjGlobal);
            isTrivial = ismember(ii, trivialRows) || ismember(jj, trivialCols);

            ns = newCursor + 1;
            ne = newCursor + newN;

            if ~isTrivial
                % Extract block from old matrices using pre-computed offset
                ds = blockDiagStart(ii, jj) + 1;
                de = ds + oldN - 1;
                Af(ns:ne, ns:ne) = oldA(ds:de, ds:de);
                Bf(ns:ne, jj)    = oldB(ds:de, jj);
                Cf(ii, ns:ne)    = oldC(ii, ds:de);
                % trivial blocks remain zero (already initialised to 0)
            end

            newCursor = ne;
        end
    end

end