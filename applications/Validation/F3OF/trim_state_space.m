%% testTrimRadiation.m
% Test script for trimRadiationStateSpace.
%
% Reads the original .mat file, runs the trim on a COPY, then prints
% detailed diagnostics so you can verify correctness before trusting the
% output.
%
% USAGE: Run this script section by section (Ctrl+Enter per section in
%        MATLAB) so you can inspect each stage.

clear; clc;

%% =========================================================================
%% SECTION 1: Paths — edit these
%% =========================================================================

originalFile = 'C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/F3OF/F3OF_WhydroCoeff.mat';
trimmedFile  = 'C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/F3OF/F3OF_WhydroCoeff_TRIMMED.mat';

% Copy original to trimmed path — trim operates in-place on this copy
copyfile(originalFile, trimmedFile);
fprintf('Copied original to: %s\n', trimmedFile);

%% =========================================================================
%% SECTION 2: Load original for reference (never touched after this)
%% =========================================================================
 
orig       = load(originalFile);
hydro_orig = orig.hydro;
 
Nb   = hydro_orig.bodies.Nb;
nDoF = hydro_orig.bodies.nDoF;
dof1 = hydro_orig.bodies.dof(1);
 
fprintf('\n--- ORIGINAL FILE ---\n');
fprintf('Number of bodies : %d\n', Nb);
fprintf('nDoF per body    : %d\n', dof1);
fprintf('Total nDoF       : %d\n', nDoF);
 
% Print all stateSpace field names so we know what exists
fprintf('\nstateSpace.B2B fields:\n');
disp(fieldnames(hydro_orig.coefficients.radiation.stateSpace.B2B));
fprintf('stateSpace.noB2B fields:\n');
disp(fieldnames(hydro_orig.coefficients.radiation.stateSpace.noB2B));
 
% Print sizes for all bodies
for i = 1:Nb
    fprintf('\n  Body %d:\n', i);
 
    % B2B — check each expected field name
    for prefix = {'A','B','C','D'}
        fname = sprintf('%s%d', prefix{1}, i);
        if isfield(hydro_orig.coefficients.radiation.stateSpace.B2B, fname)
            val = hydro_orig.coefficients.radiation.stateSpace.B2B.(fname);
            fprintf('    B2B.%s  : [%d x %d]\n', fname, size(val,1), size(val,2));
        end
    end
 
    % noB2B
    for prefix = {'A','B','C','D'}
        fname = sprintf('%s%d', prefix{1}, i);
        if isfield(hydro_orig.coefficients.radiation.stateSpace.noB2B, fname)
            val = hydro_orig.coefficients.radiation.stateSpace.noB2B.(fname);
            fprintf('    noB2B.%s : [%d x %d]\n', fname, size(val,1), size(val,2));
        end
    end
end
 
% Print order matrix if it exists
if isfield(hydro_orig.coefficients.radiation.stateSpace, 'order')
    fprintf('\n  Order matrix (original):\n');
    disp(hydro_orig.coefficients.radiation.stateSpace.order);
else
    fprintf('\n  NOTE: No "order" field found in stateSpace.\n');
end
 
%% =========================================================================
%% SECTION 3: Run the trim on the copy
%% =========================================================================
 
fprintf('\n--- RUNNING TRIM ---\n');
trimRadiationStateSpace(trimmedFile);
 
%% =========================================================================
%% SECTION 4: Load trimmed and compare sizes
%% =========================================================================
 
trimmed    = load(trimmedFile);
hydro_trim = trimmed.hydro;
 
fprintf('\n--- TRIMMED FILE ---\n');
 
if isfield(hydro_trim.coefficients.radiation.stateSpace, 'order')
    fprintf('\n  Order matrix (trimmed):\n');
    disp(hydro_trim.coefficients.radiation.stateSpace.order);
    fprintf('\n  Order matrix diff (trimmed - original):\n');
    disp(hydro_trim.coefficients.radiation.stateSpace.order - ...
         hydro_orig.coefficients.radiation.stateSpace.order);
end
 
for i = 1:Nb
    fprintf('\n  Body %d:\n', i);
 
    % B2B size comparison — all fields that exist
    b2bFields = fieldnames(hydro_orig.coefficients.radiation.stateSpace.B2B);
    for k = 1:numel(b2bFields)
        fname = b2bFields{k};
        % Only show fields belonging to this body (end with body index)
        if endsWith(fname, num2str(i))
            v_o = hydro_orig.coefficients.radiation.stateSpace.B2B.(fname);
            if isfield(hydro_trim.coefficients.radiation.stateSpace.B2B, fname)
                v_t = hydro_trim.coefficients.radiation.stateSpace.B2B.(fname);
                fprintf('    B2B.%s  : [%d x %d] -> [%d x %d]\n', ...
                    fname, size(v_o,1), size(v_o,2), size(v_t,1), size(v_t,2));
            else
                fprintf('    B2B.%s  : [%d x %d] -> MISSING in trimmed\n', ...
                    fname, size(v_o,1), size(v_o,2));
            end
        end
    end
 
    % noB2B size comparison
    noB2BFields = fieldnames(hydro_orig.coefficients.radiation.stateSpace.noB2B);
    for k = 1:numel(noB2BFields)
        fname = noB2BFields{k};
        if endsWith(fname, num2str(i))
            v_o = hydro_orig.coefficients.radiation.stateSpace.noB2B.(fname);
            if isfield(hydro_trim.coefficients.radiation.stateSpace.noB2B, fname)
                v_t = hydro_trim.coefficients.radiation.stateSpace.noB2B.(fname);
                fprintf('    noB2B.%s : [%d x %d] -> [%d x %d]\n', ...
                    fname, size(v_o,1), size(v_o,2), size(v_t,1), size(v_t,2));
            else
                fprintf('    noB2B.%s : [%d x %d] -> MISSING in trimmed\n', ...
                    fname, size(v_o,1), size(v_o,2));
            end
        end
    end
 
    % Spot-check A matrix blocks if A field exists
    AName = sprintf('A%d', i);
    if isfield(hydro_orig.coefficients.radiation.stateSpace.B2B, AName) && ...
       isfield(hydro_orig.coefficients.radiation.stateSpace, 'order')
 
        fprintf('\n    Spot-check B2B kept block  (ii=1, jj=1) surge/surge:\n');
        checkBlock(hydro_orig, hydro_trim, 'B2B', i, 1, 1, Nb, dof1, nDoF);
 
        fprintf('\n    Spot-check B2B trivial block (ii=2, jj=2) sway/sway:\n');
        checkBlock(hydro_orig, hydro_trim, 'B2B', i, 2, 2, Nb, dof1, nDoF);
 
        fprintf('\n    Spot-check B2B trivial block (ii=1, jj=2) surge/sway:\n');
        checkBlock(hydro_orig, hydro_trim, 'B2B', i, 1, 2, Nb, dof1, nDoF);
    end
end
 
fprintf('\n--- TEST COMPLETE ---\n');
fprintf('Trimmed file: %s\n', trimmedFile);
 
%% =========================================================================
%% Helpers
%% =========================================================================
 
function tf = endsWith(str, suffix)
    tf = numel(str) >= numel(suffix) && strcmp(str(end-numel(suffix)+1:end), suffix);
end
 
function checkBlock(hydro_orig, hydro_trim, ssType, bodyIdx, ii, jj, ~, ~, nDoF)
    origOrder = hydro_orig.coefficients.radiation.stateSpace.order;
    trimOrder = hydro_trim.coefficients.radiation.stateSpace.order;
 
    BName = sprintf('B%d', bodyIdx);
    LDoF  = size(hydro_orig.coefficients.radiation.stateSpace.(ssType).(BName), 2);
 
    colOffset = 0;
    if strcmp(ssType, 'noB2B')
        colOffset = hydro_orig.bodies.dofStart(bodyIdx) - 1;
    end
 
    % Find diagonal start in original
    cursor = 0;
    diagStart = -1;
    for iii = 1:nDoF
        for jjj = 1:LDoF
            if iii == ii && jjj == jj
                diagStart = cursor + 1;
                break;
            end
            cursor = cursor + origOrder(iii, jjj + colOffset);
        end
        if diagStart > 0, break; end
    end
 
    % Find diagonal start in trimmed
    cursorT = 0;
    diagStartT = -1;
    for iii = 1:nDoF
        for jjj = 1:LDoF
            if iii == ii && jjj == jj
                diagStartT = cursorT + 1;
                break;
            end
            cursorT = cursorT + trimOrder(iii, jjj + colOffset);
        end
        if diagStartT > 0, break; end
    end
 
    origN = origOrder(ii, jj + colOffset);
    trimN = trimOrder(ii, jj + colOffset);
 
    AName = sprintf('A%d', bodyIdx);
    A_o   = hydro_orig.coefficients.radiation.stateSpace.(ssType).(AName);
    A_t   = hydro_trim.coefficients.radiation.stateSpace.(ssType).(AName);
 
    blockOrig = A_o(diagStart:diagStart+origN-1, diagStart:diagStart+origN-1);
    blockTrim = A_t(diagStartT:diagStartT+trimN-1, diagStartT:diagStartT+trimN-1);
 
    fprintf('      Original order=%d, block A:\n', origN); disp(blockOrig);
    fprintf('      Trimmed  order=%d, block A:\n', trimN); disp(blockTrim);
end