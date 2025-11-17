function [hydro] = preprocess(currentPath, filePath, deviceName)
%% Ocean Engineering Toolbox - Pre-Processing Function
% Pre-process BEM-generated hydrodynamic data and save in the current directory. 
% Functionality based on WEC-Sim's BEMIO and library classes.

% Inputs:
%   currentPath : char (description: current working directory)
%   filePath : char (description: path to the input HDF5 file)
%   deviceName : char (description: name of the device to save data under)

% The default filenames are:
%
%   Output file:           '___.h5'
%   Output structure:      'deviceNamehydroCoeff.mat'


% Build full file path
filePath = fullfile(currentPath, filePath);
hydro = {};


%% === HEADER ========================================
try
    hydro.header.code = h5read(filePath,'/bem_data/code');
catch
    fprintf('BEM data not found at specified path')
    return;
end

%% === Parameters ====================================
try
    [~,hydro.header.file,~] = fileparts(filePath);
    hydro.parameters.rho = h5read(filePath,'/simulation_parameters/rho');
    % Wave direction
    hydro.parameters.theta = h5read(filePath,'/simulation_parameters/wave_dir');
    % Number of waves
    hydro.parameters.Nh = length(hydro.parameters.theta);
    % Depth
    hydro.parameters.depth = h5read(filePath,'/simulation_parameters/water_depth');
    if hydro.parameters.depth == 'infinite'
        hydro.parameters.depth = 100000; 
    end
    
    
    % Frequency (and corresponding period) components
    hydro.parameters.w = h5read(filePath,'/simulation_parameters/w')';
    hydro.parameters.T = h5read(filePath,'/simulation_parameters/T')';
    hydro.parameters.g = h5read(filePath,'/simulation_parameters/g');
    % Number of frequencies
    hydro.parameters.Nf = length(hydro.parameters.w);

catch
    fprintf('Parameter data was not loaded, missing entry in the BEM data. \n')
    hydro.parameters = struct();
end

%% === BODIES ========================================

hydro.bodies.Nb = 0;

% Determine how many bodies are in the h5 file
i = 0;
while true
    i = i + 1;
    h5BodyName = ['/body' num2str(i)];
    try
        hydro.bodies.body{i} = h5read(filePath,[h5BodyName '/properties/name']); 
    catch
        hydro.bodies.Nb = i-1;
        fprintf('Number of bodies in h5 file = %.0f \n',hydro.bodies.Nb)
        break
    end
end

    hydro.bodies.nDoF = 6;

if hydro.bodies.Nb == 0
    fprintf('No bodies found in the BEM data\n');
    return;
end


% Loop over each body
for i = 1:hydro.bodies.Nb
    h5BodyName = ['/body' num2str(i)];

    % Dynamic field names
    cgName = sprintf('cg%d', i); 
    volName = sprintf('vol%d', i); 
    cbName = sprintf('cb%d', i); 

    KhsName = sprintf('Khs%d', i);

    mName = sprintf('m%d', i);
    AinfName = sprintf('Ainf%d', i);
    AinfExName = sprintf('AinfEx%d', i);
    
    excReName = sprintf('re%d', i);
    excImName = sprintf('im%d', i);

    radSSAName = sprintf('A%d', i);
    radSSBName = sprintf('B%d', i);
    radSSCName = sprintf('C%d', i);
    radSSDName = sprintf('D%d', i);


    % Body properties
    try
        hydro.bodies.(cgName) = h5read(filePath,[h5BodyName '/properties/cg']);
        hydro.bodies.(volName) = h5read(filePath,[h5BodyName '/properties/disp_vol']);
        hydro.bodies.(cbName) = h5read(filePath,[h5BodyName '/properties/cb']);

        % Zero-out small numeric noise
        hydro.bodies.(cgName)(abs(hydro.bodies.(cgName)) < 1e-3) = 0;
        hydro.bodies.(cbName)(abs(hydro.bodies.(cbName)) < 1e-3) = 0;

        % Mass
        hydro.bodies.(mName) = hydro.parameters.rho*hydro.bodies.(volName);

    catch
        fprintf('Body property data was not loaded for body %d (%s), missing entry in the BEM data', ...
        i, string(hydro.bodies.body{i}));
        return;
    end

    %% === Coefficients ===================================
    % Hydrostatic stiffness
    try
        Khs = h5read(filePath, [h5BodyName '/hydro_coeffs/linear_restoring_stiffness']);
        Khs = reverseDimensionOrder(Khs);
        hydro.coefficients.hydrostatic.(KhsName) = Khs * hydro.parameters.rho * hydro.parameters.g;
    catch
        fprintf('Hydrostatic data was not loaded for body %d (%s).\n', ...
        i, string(hydro.bodies.body{i}));
        return;
    end

    % Multibody DoF
    hydro.bodies.dof(i) = h5read(filePath,[h5BodyName '/properties/dof']);
    hydro.bodies.dofStart(i) = h5read(filePath,[h5BodyName '/properties/dof_start']);
    hydro.bodies.dofEnd(i) = h5read(filePath,[h5BodyName '/properties/dof_end']); 

    % Radiation infinite frequency added mass
    try
        Ainf = h5read(filePath, [h5BodyName '/hydro_coeffs/added_mass/inf_freq']);
        Ainf = reverseDimensionOrder(Ainf) * hydro.parameters.rho;

        hydro.coefficients.radiation.stateSpace.B2B.(AinfName) = Ainf;
        hydro.coefficients.radiation.stateSpace.noB2B.(AinfName) = ...
            Ainf(:, hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i));

        hydro.coefficients.radiation.stateSpace.B2B.(AinfExName) = ...
            Ainf(:, [1:(i-1)*hydro.bodies.nDoF, i*hydro.bodies.nDoF+1:end]);
    catch
        fprintf('Inifinite frequency added mass data was not loaded for body %d (%s).\n', ...
        i, string(hydro.bodies.body{i}));
    end
    
    % Excitation spectral decompositon
    try
        re3D = permute(h5read(filePath, [h5BodyName '/hydro_coeffs/excitation/re']), [3,1,2]);
        im3D = permute(h5read(filePath, [h5BodyName '/hydro_coeffs/excitation/im']), [3,1,2]);
    
        re3D = re3D * hydro.parameters.rho * hydro.parameters.g;
        im3D = im3D * hydro.parameters.rho * hydro.parameters.g;
    
        hydro.coefficients.excitation.spectralDecomp.D3.(excReName) = re3D;
        hydro.coefficients.excitation.spectralDecomp.D3.(excImName) = im3D;
    
        re2D = zeros(hydro.bodies.nDoF, hydro.parameters.Nf * hydro.parameters.Nh);
        im2D = zeros(hydro.bodies.nDoF, hydro.parameters.Nf * hydro.parameters.Nh);
    
        % Flatten 3D → 2D
        for j = 1:hydro.parameters.Nh
            cols = (j-1)*hydro.parameters.Nf + (1:hydro.parameters.Nf);
            re2D(:, cols) = re3D(:,:,j);
            im2D(:, cols) = im3D(:,:,j);
        end
    
        hydro.coefficients.excitation.spectralDecomp.(excReName) = re2D;
        hydro.coefficients.excitation.spectralDecomp.(excImName) = im2D;
    
    catch
        fprintf('Excitation spectral decomposition data was not loaded for body %d (%s).\n', ...
            i, string(hydro.bodies.body{i}));
        return;
    end

    % Excitation IRF
    try
        hydro.coefficients.excitation.convolution.K( ...
            hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:,:) = ...
            permute(reverseDimensionOrder(h5read(filePath, [h5BodyName ...
            '/hydro_coeffs/excitation/impulse_response_fun/f'])), [1,3,2]) ...
            * hydro.parameters.rho * hydro.parameters.g;

        hydro.coefficients.excitation.convolution.ex_t(1,:) = ...
            reverseDimensionOrder(h5read(filePath, [h5BodyName ...
            '/hydro_coeffs/excitation/impulse_response_fun/t']));

        hydro.coefficients.excitation.convolution.ex_w(1,:) = ...
            h5read(filePath, [h5BodyName '/hydro_coeffs/excitation/impulse_response_fun/w']);
    catch
        fprintf('Excitation IRF data was not loaded for body %d (%s).\n', ...
            i, string(hydro.bodies.body{i}));
    end

    % Radiation state-space
    try
        % Reading
        ss_A = reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/A/all']));
        ss_B = reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/B/all']));
        ss_C = reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/C/all']));
        ss_D = reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/D/all']));

        hydro.coefficients.radiation.stateSpace.order = ...
            reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/it']));

        hydro.coefficients.radiation.stateSpace.R2( ...
            hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:) = ...
            reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/r2t']));
    
        % B2B radiation matrices
        Af = []; Bf = []; Cf = [];
        hydro.bodies.LDoF = hydro.bodies.Nb * hydro.bodies.dof(1);
    
        for ii = 1:hydro.bodies.nDoF
            for jj = 1:hydro.bodies.LDoF
                arraySize = hydro.coefficients.radiation.stateSpace.order(ii,jj);
                if ii == 1 && jj == 1
                    Af(1:arraySize,1:arraySize) = ss_A(ii,jj,1:arraySize,1:arraySize);
                    Bf(1:arraySize,jj) = ss_B(ii,jj,1:arraySize,1);
                    Cf(ii,1:arraySize) = ss_C(ii,jj,1,1:arraySize);
                else
                    Af(size(Af,1)+1:size(Af,1)+arraySize, size(Af,2)+1:size(Af,2)+arraySize) = ...
                        ss_A(ii,jj,1:arraySize,1:arraySize);
                    Bf(size(Bf,1)+1:size(Bf,1)+arraySize, jj) = ss_B(ii,jj,1:arraySize,1);
                    Cf(ii,size(Cf,2)+1:size(Cf,2)+arraySize) = ss_C(ii,jj,1,1:arraySize);
                end
            end
        end
    
        hydro.coefficients.radiation.stateSpace.B2B.(radSSAName) = Af;
        hydro.coefficients.radiation.stateSpace.B2B.(radSSBName) = Bf;
        hydro.coefficients.radiation.stateSpace.B2B.(radSSCName) = Cf .* hydro.parameters.rho;
        hydro.coefficients.radiation.stateSpace.B2B.(radSSDName) = zeros(hydro.bodies.nDoF, hydro.bodies.LDoF);
    
        % No B2B radiation matrices
        Af = []; Bf = []; Cf = [];
        hydro.bodies.LDoF = hydro.bodies.dof(1);
        for ii = 1:hydro.bodies.nDoF
            for jj = hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i)
                jInd = jj - hydro.bodies.dofStart(i) + 1;
                arraySize = hydro.coefficients.radiation.stateSpace.order(ii,jj);
                if ii == 1 && jj == hydro.bodies.dofStart(i)
                    Af(1:arraySize,1:arraySize) = ss_A(ii,jj,1:arraySize,1:arraySize);
                    Bf(1:arraySize,jInd) = ss_B(ii,jj,1:arraySize,1);
                    Cf(ii,1:arraySize) = ss_C(ii,jj,1,1:arraySize);
                else
                    Af(size(Af,1)+1:size(Af,1)+arraySize, size(Af,2)+1:size(Af,2)+arraySize) = ...
                        ss_A(ii,jj,1:arraySize,1:arraySize);
                    Bf(size(Bf,1)+1:size(Bf,1)+arraySize, jInd) = ss_B(ii,jj,1:arraySize,1);
                    Cf(ii,size(Cf,2)+1:size(Cf,2)+arraySize) = ss_C(ii,jj,1,1:arraySize);
                end
            end
        end
    
        hydro.coefficients.radiation.stateSpace.noB2B.(radSSAName) = Af;
        hydro.coefficients.radiation.stateSpace.noB2B.(radSSBName) = Bf;
        hydro.coefficients.radiation.stateSpace.noB2B.(radSSCName) = Cf .* hydro.parameters.rho;
        hydro.coefficients.radiation.stateSpace.noB2B.(radSSDName) = zeros(hydro.bodies.nDoF, hydro.bodies.LDoF);
    
    catch
        fprintf('Radiation state-space data was not loaded  for body %d (%s).\n', ...
            i, string(hydro.bodies.body{i}));
        return;
    end

% End body loop
end


%% === Saving ========================================
save([deviceName 'hydroCoeff.mat'],'hydro')
fullFilePath = fullfile(currentPath, [deviceName 'hydroCoeff.mat']);
fprintf('hydro'' has been successfully saved to file: %s\n', fullFilePath);
end