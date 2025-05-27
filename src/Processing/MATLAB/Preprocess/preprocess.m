function [hydro] = preprocess(currentPath, filePath, deviceName)
%% Ocean Engineering Toolbox - Pre-Processing Function
%{
A pre-processing file for the OET to post-process BEM data. The code is
modified from the WEC-Sim source code, mainly from the
(WEC-Sim/source/Functions/readH5ToStruct.m) file. The user must call this
function in a script within the same folder as the .h5, enter the current
file pathfile, and specify the device name.
%}

% The default filenames are:
%
%   BEMIO output:          '___.h5'
%   Output structure:      'deviceNamehydroCoeff.mat'


%% Importing BEM Data
% File directory
filePath = fullfile(currentPath, filePath);


hydro = {};

% Read body-independent wave parameters
hydro.header.code = h5read(filePath,'/bem_data/code');
[~,hydro.header.file,~] = fileparts(filePath);
hydro.parameters.rho = h5read(filePath,'/simulation_parameters/rho');
% Wave direction
hydro.parameters.heading = h5read(filePath,'/simulation_parameters/wave_dir');
% Number of waves
hydro.parameters.Nh = length(hydro.parameters.heading);
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

% Determine how many bodies are in the h5 file
for i = 1:1e6
    h5BodyName = ['/body' num2str(i)];
    try
        hydro.bodies.body{i} = h5read(filePath,[h5BodyName '/properties/name']); 
    catch
        hydro.bodies.Nb = i-1;
        fprintf('Number of bodies in h5 file = %.0f \n',hydro.bodies.Nb)
        break
    end
end


hydro.coefficients.radiation.stateSpace.bodyOrderTotal = 0;
for i = 1:hydro.bodies.Nb
    h5BodyName = ['/body' num2str(i)];
        % Create a new field name dynamically
    hydrostaticName = sprintf('Khs%d', i); 
    addedMassName = sprintf('Ainf%d', i);
    excitationSpectralReName = sprintf('re%d', i);
    excitationSpectralImName = sprintf('im%d', i);
    massName = sprintf('m%d', i);
    radiationSSAName = sprintf('A%d', i);
    radiationSSBName = sprintf('B%d', i);
    radiationSSCName = sprintf('C%d', i);
    radiationSSDName = sprintf('D%d', i);

    hydro.bodies.nDoF = 6;

    % CoG, volume, and CoB
    hydro.bodies.cg(1:3,i) = h5read(filePath,[h5BodyName '/properties/cg']);
    hydro.bodies.vol(i) = h5read(filePath,[h5BodyName '/properties/disp_vol']);
    hydro.bodies.cb(1:3,i) = h5read(filePath,[h5BodyName '/properties/cb']);
    
    % Mass
    hydro.bodies.(massName) = hydro.parameters.rho*hydro.bodies.vol(i);

    % Hydrostatic stiffness reading
    hydro.coefficients.hydrostatic.(hydrostaticName) = reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/linear_restoring_stiffness']));
    % Denormalize hydrostatic stiffness
    hydro.coefficients.hydrostatic.(hydrostaticName) =  hydro.coefficients.hydrostatic.(hydrostaticName)*hydro.parameters.rho*hydro.parameters.g;

    % Multibody DoF
    hydro.bodies.dof(i) = h5read(filePath,[h5BodyName '/properties/dof']);
    hydro.bodies.dofStart(i) = h5read(filePath,[h5BodyName '/properties/dof_start']);
    hydro.bodies.dofEnd(i) = h5read(filePath,[h5BodyName '/properties/dof_end']); 

    % Radiation infinite frequency added mass
    hydro.coefficients.radiation.stateSpace.B2B.(addedMassName) = reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/added_mass/inf_freq']));
    hydro.coefficients.radiation.stateSpace.B2B.(addedMassName) = hydro.coefficients.radiation.stateSpace.B2B.(addedMassName)*hydro.parameters.rho;
    hydro.coefficients.radiation.stateSpace.noB2B.(addedMassName) = hydro.coefficients.radiation.stateSpace.B2B.(addedMassName)(:,1+(i-1)*hydro.bodies.nDoF:i*hydro.bodies.nDoF);
    
    % Excitation spectral decompositon
    hydro.coefficients.excitation.spectralDecomp.(excitationSpectralReName) = permute(h5read(filePath, [h5BodyName '/hydro_coeffs/excitation/re']),[3,1,2])*hydro.parameters.rho*hydro.parameters.g;
    hydro.coefficients.excitation.spectralDecomp.(excitationSpectralImName) = permute(h5read(filePath, [h5BodyName '/hydro_coeffs/excitation/im']),[3,1,2])*hydro.parameters.rho*hydro.parameters.g;
    
    % For excitation IRF (not relevant now, but will be required eventually)
    hydro.coefficients.excitation.convolution.K(hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:,:) = permute(reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/excitation/impulse_response_fun/f'])),[1,3,2])*hydro.parameters.rho*hydro.parameters.g;
    hydro.coefficients.excitation.convolution.ex_t(1,:) = reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/excitation/impulse_response_fun/t'])); % Assumes all bodies have same time vector
    hydro.coefficients.excitation.convolution.ex_w(1,:) = h5read(filePath, [h5BodyName '/hydro_coeffs/excitation/impulse_response_fun/w']); % Assumes all bodies have same interpolated frequencies

    % Read radiation damping state space coefficients if available
    ss_A = [];
    ss_B = [];
    ss_C = [];
    ss_D = [];

    try ss_A = reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/A/all'])); end
    try ss_B = reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/B/all'])); end
    try ss_C = reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/C/all'])); end
    try ss_D = reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/D/all'])); end
    
    % SS approximation order
    try hydro.coefficients.radiation.stateSpace.order = reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/it'])); end
    
    % SS approximation R2
    try hydro.coefficients.radiation.stateSpace.R2(hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:) = reverseDimensionOrder(h5read(filePath, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/r2t'])); end

%% Processing BEM Data
     % State-Space Formulation (state-space and B2B)
     Af = [];
     Bf = [];
     Cf = [];
     Df = [];
    
     % State-space matrices including B2B interactions
     hydro.bodies.LDoF =  hydro.bodies.Nb*hydro.bodies.dof(1);
     for ii = 1:hydro.bodies.nDoF
         for jj = 1:hydro.bodies.LDoF 
             arraySize = hydro.coefficients.radiation.stateSpace.order(ii,jj);
             if ii == 1 && jj == 1 % Begin construction of combined state, input, and output matrices
                 Af(1:arraySize,1:arraySize) = ss_A(ii,jj,1:arraySize,1:arraySize);
                 Bf(1:arraySize,jj)        = ss_B(ii,jj,1:arraySize,1);
                 Cf(ii,1:arraySize)          = ss_C(ii,jj,1,1:arraySize);
             else
                 Af(size(Af,1)+1:size(Af,1)+arraySize,size(Af,2)+1:size(Af,2)+arraySize) = ss_A(ii,jj,1:arraySize,1:arraySize);
                 Bf(size(Bf,1)+1:size(Bf,1)+arraySize,jj) = ss_B(ii,jj,1:arraySize,1);
                 Cf(ii,size(Cf,2)+1:size(Cf,2)+arraySize)   = ss_C(ii,jj,1,1:arraySize);
             end
         end
     end
    
     hydro.coefficients.radiation.stateSpace.B2B.(radiationSSAName) = Af;
     hydro.coefficients.radiation.stateSpace.B2B.(radiationSSBName) = Bf;
     hydro.coefficients.radiation.stateSpace.B2B.(radiationSSCName) = Cf .*hydro.parameters.rho;
     hydro.coefficients.radiation.stateSpace.B2B.(radiationSSDName) = zeros(hydro.bodies.nDoF,hydro.bodies.LDoF);
    
     % Clearing matrices
     Af = [];
     Bf = [];
     Cf = [];
     Df = [];
    
     % State-space matrices including B2B interaction
     hydro.bodies.LDoF =  hydro.bodies.dof(1);
     for ii = 1:hydro.bodies.nDoF
         for jj = hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i) % this will need to change if body has < 6DoF
             jInd = jj-hydro.bodies.dofStart(i)+1;
             arraySize = hydro.coefficients.radiation.stateSpace.order(ii,jj);
             if ii == 1 && jj == 1 % Begin construction of combined state, input, and output matrices
                 Af(1:arraySize,1:arraySize) = ss_A(ii,jj,1:arraySize,1:arraySize);
                 Bf(1:arraySize,jInd)        = ss_B(ii,jj,1:arraySize,1);
                 Cf(ii,1:arraySize)          = ss_C(ii,jj,1,1:arraySize);
             else
                 Af(size(Af,1)+1:size(Af,1)+arraySize,size(Af,2)+1:size(Af,2)+arraySize) = ss_A(ii,jj,1:arraySize,1:arraySize);
                 Bf(size(Bf,1)+1:size(Bf,1)+arraySize,jInd) = ss_B(ii,jj,1:arraySize,1);
                 Cf(ii,size(Cf,2)+1:size(Cf,2)+arraySize)   = ss_C(ii,jj,1,1:arraySize);
             end
         end
     end
    
     hydro.coefficients.radiation.stateSpace.noB2B.(radiationSSAName) = Af;
     hydro.coefficients.radiation.stateSpace.noB2B.(radiationSSBName) = Bf;
     hydro.coefficients.radiation.stateSpace.noB2B.(radiationSSCName) = Cf .*hydro.parameters.rho;
     hydro.coefficients.radiation.stateSpace.noB2B.(radiationSSDName) = zeros(hydro.bodies.nDoF,hydro.bodies.LDoF);


end

% Spectrum import (optional)
% hydro.wave.spectrumImport.w = linspace(0,5,51);
% hydro.wave.spectrumImport.S = sin(hydro.wave.spectrumImport.w/1.6);
% hydro.wave.spectrumImport.phi = 2 * pi * rand(1, 51);


save([deviceName 'hydroCoeff.mat'],'hydro')

end