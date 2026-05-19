%% restore_radiation_C.m
% Selectively restores C matrix blocks from a backup .mat file into the
% working .mat file. All other data in the working file is untouched.
%
% Picks a specific body and mode (ii, jj) and restores that block in both
% B2B and noB2B C matrices from the backup.
%
% Edit the variables below then run.

backupFile  = 'Copy_of_F3OF_WhydroCoeff_TRIMMED.mat';
workingFile = 'F3OF_WhydroCoeff_TRIMMED.mat';
body_target = 3; % which body's C matrix to restore into
ii_target   = 3; % row DoF to restore
jj_target   = 3; % col DoF within body_target's own block to restore

%% Load both files
fprintf('Loading backup : %s\n', backupFile);
backup  = load(backupFile);
hydro_b = backup.hydro;

fprintf('Loading working: %s\n', workingFile);
working  = load(workingFile);
hydro_w  = working.hydro;

Nb    = hydro_w.bodies.Nb;
nDoF  = hydro_w.bodies.nDoF;
dof1  = hydro_w.bodies.dof(1);
order = hydro_w.coefficients.radiation.stateSpace.order;

% Global column index of body_target's jj_target
jj_global = hydro_w.bodies.dofStart(body_target) + jj_target - 1;

%% --- B2B ---
% Restore (ii_target, jj_global) block in ALL bodies' C matrices from backup
LDoF_B2B = Nb * dof1;

for i = 1:Nb
    radSSCName = sprintf('C%d', i);

    if isfield(hydro_b.coefficients.radiation.stateSpace.B2B, radSSCName)
        cursor = 0;
        for ii = 1:nDoF
            for jj = 1:LDoF_B2B
                blockSize = order(ii, jj);
                if ii == ii_target && jj == jj_global
                    ds = cursor + 1;
                    de = cursor + blockSize;
                    hydro_w.coefficients.radiation.stateSpace.B2B.(radSSCName)(ii, ds:de) = ...
                        hydro_b.coefficients.radiation.stateSpace.B2B.(radSSCName)(ii, ds:de);
                    fprintf('B2B  body %d: block (ii=%d, jj_global=%d) order=%d restored [diag %d:%d]\n', ...
                        i, ii_target, jj_global, blockSize, ds, de);
                end
                cursor = cursor + blockSize;
            end
        end
    end
end

%% --- noB2B ---
% Restore (ii_target, jj_target) block in body_target's own C matrix only
radSSCName = sprintf('C%d', body_target);

if isfield(hydro_b.coefficients.radiation.stateSpace.noB2B, radSSCName)
    LDoF_noB2B = dof1;
    colOffset  = hydro_w.bodies.dofStart(body_target) - 1;

    cursor = 0;
    for ii = 1:nDoF
        for jj = 1:LDoF_noB2B
            jjGlobal  = jj + colOffset;
            blockSize = order(ii, jjGlobal);
            if ii == ii_target && jj == jj_target
                ds = cursor + 1;
                de = cursor + blockSize;
                hydro_w.coefficients.radiation.stateSpace.noB2B.(radSSCName)(ii, ds:de) = ...
                    hydro_b.coefficients.radiation.stateSpace.noB2B.(radSSCName)(ii, ds:de);
                fprintf('noB2B body %d: block (ii=%d, jj=%d) order=%d restored [diag %d:%d]\n', ...
                    body_target, ii_target, jj_target, blockSize, ds, de);
            end
            cursor = cursor + blockSize;
        end
    end
end

%% Save back into working file
hydro = hydro_w;
save(workingFile, 'hydro');
fprintf('Saved to: %s\n', workingFile);