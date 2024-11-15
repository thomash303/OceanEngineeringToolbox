clear
clc

% This is directly from WEC-Sim/source/Functions/readH5ToStruct.m
% However, I have removed several components irrelevent to OET 
% and made many adaptions
% The default filenames are:
%
%   BEMIO output:   'rm3.h5'
%   Structure:      'hydroCoeff.mat'


%% Reading
% File directory
filename = 'C:\Users\thogan1\Documents\GitHub\OET_6DoF\rm3.h5';

hydro = {};

% Read body-independent wave parameters
hydro.header.code = h5read(filename,'/bem_data/code');
[~,hydro.header.file,~] = fileparts(filename);
hydro.parameters.rho = h5read(filename,'/simulation_parameters/rho');
% Wave direction
hydro.parameters.heading = h5read(filename,'/simulation_parameters/wave_dir');
% Number of waves
hydro.parameters.Nh = length(hydro.parameters.heading);
% Depth
hydro.parameters.depth = h5read(filename,'/simulation_parameters/water_depth');
if hydro.parameters.depth == 'infinite'
    hydro.parameters.depth = 150; 
end
% should move back to Inf, but issues regarding importing strings in
% Modelica, assuming 150 is infinite depth here

% Frequency (and corresponding period) components
hydro.parameters.w = h5read(filename,'/simulation_parameters/w')';
hydro.parameters.T = h5read(filename,'/simulation_parameters/T')';
hydro.parameters.g = h5read(filename,'/simulation_parameters/g');
% Number of frequencies
hydro.parameters.Nf = length(hydro.parameters.w);

% Determine how many bodies are in the h5 file
for i = 1:1e6
    h5BodyName = ['/body' num2str(i)];
    try
        hydro.bodies.body{i} = h5read(filename,[h5BodyName '/properties/name']); 
    catch
        hydro.bodies.Nb = i-1;
        fprintf('Number of bodies in h5 file = %.0f \n',hydro.bodies.Nb)
        break
    end
end


hydro.coefficients.radiation.stateSpace.bodyOrderTotal = 0;
for i = 1:hydro.bodies.Nb
    h5BodyName = ['/body' num2str(i)];

    % CoG, volume, and CoB
    hydro.bodies.cg(1:3,i) = h5read(filename,[h5BodyName '/properties/cg']);
    hydro.bodies.vol(i) = h5read(filename,[h5BodyName '/properties/disp_vol']);
    hydro.bodies.cb(1:3,i) = h5read(filename,[h5BodyName '/properties/cb']);
    
    % Hydrostatic stiffness reading
    hydro.coefficients.Khs(:,:,i) = reverseDimensionOrder(h5read(filename, [h5BodyName '/hydro_coeffs/linear_restoring_stiffness']));

    % Multibody DoF
    hydro.bodies.dof(i) = h5read(filename,[h5BodyName '/properties/dof']);
    hydro.bodies.dofStart(i) = h5read(filename,[h5BodyName '/properties/dof_start']);
    hydro.bodies.dofEnd(i) = h5read(filename,[h5BodyName '/properties/dof_end']); 

    % Radiation infinite frequency added mass
    hydro.coefficients.radiation.Ainf(hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:) = reverseDimensionOrder(h5read(filename, [h5BodyName '/hydro_coeffs/added_mass/inf_freq']));
    % Excitation spectral decompositon
    hydro.coefficients.excitation.spectralDecomp.re(hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:,:) = permute(h5read(filename, [h5BodyName '/hydro_coeffs/excitation/re']),[3,1,2]);
    hydro.coefficients.excitation.spectralDecomp.im(hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:,:) = permute(h5read(filename, [h5BodyName '/hydro_coeffs/excitation/im']),[3,1,2]);
    
    % For excitation IRF (not relevant now, but will be required eventually)
    hydro.coefficients.excitation.convolution.K(hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:,:) = reverseDimensionOrder(h5read(filename, [h5BodyName '/hydro_coeffs/excitation/impulse_response_fun/f']));
    hydro.coefficients.excitation.convolution.ex_t(1,:) = reverseDimensionOrder(h5read(filename, [h5BodyName '/hydro_coeffs/excitation/impulse_response_fun/t'])); % Assumes all bodies have same time vector
    hydro.coefficients.excitation.convolution.ex_w(1,:) = h5read(filename, [h5BodyName '/hydro_coeffs/excitation/impulse_response_fun/w']); % Assumes all bodies have same interpolated frequencies

    % Read radiation damping state space coefficients if available
    try ss_A(hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:,:,:) = reverseDimensionOrder(h5read(filename, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/A/all'])); end
    try ss_B(hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:,:) = reverseDimensionOrder(h5read(filename, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/B/all'])); end
    try ss_C(hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:,:,:) = reverseDimensionOrder(h5read(filename, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/C/all'])); end
    try ss_D(hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:) = reverseDimensionOrder(h5read(filename, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/D/all'])); end
    % Unsure
   % try ss_K(hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:,:) = reverseDimensionOrder(h5read(filename, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/K/all'])); end
    % SS approximation order
    try hydro.coefficients.radiation.stateSpace.order(hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:) = reverseDimensionOrder(h5read(filename, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/it'])); end
    % Number of states per body
    hydro.coefficients.radiation.stateSpace.bodyOrder(i)=sum(sum(hydro.coefficients.radiation.stateSpace.order(hydro.bodies.dof(1)*(i-1)+1:hydro.bodies.dof(1)*i,:)));
    hydro.coefficients.radiation.stateSpace.bodyOrderUncoupled(i)=sum(sum(hydro.coefficients.radiation.stateSpace.order(hydro.bodies.dof(1)*(i-1)+1:hydro.bodies.dof(1)*i,hydro.bodies.dof(1)*(i-1)+1:hydro.bodies.dof(1)*i)));
    hydro.coefficients.radiation.stateSpace.bodyOrderTotal = hydro.coefficients.radiation.stateSpace.bodyOrder(i) +     hydro.coefficients.radiation.stateSpace.bodyOrderTotal;
    % SS approximation R2
    try hydro.coefficients.radiation.stateSpace.R2(hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:) = reverseDimensionOrder(h5read(filename, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/r2t'])); end
    % Unsure
   % try ss_conv(hydro.bodies.dofStart(i):hydro.bodies.dofEnd(i),:) = reverseDimensionOrder(h5read(filename, [h5BodyName '/hydro_coeffs/radiation_damping/state_space/conv'])); end
    
end

%% Processing 

 % Scaling 
 hydro.coefficients.Khs =  hydro.coefficients.Khs*hydro.parameters.rho*hydro.parameters.g;

 % Scaling
 hydro.coefficients.radiation.Ainf = hydro.coefficients.radiation.Ainf*hydro.parameters.rho;

 % Mass
 hydro.bodies.m = hydro.parameters.rho*hydro.bodies.vol;

 % Total DoF
hydro.bodies.nDOF = hydro.bodies.Nb*hydro.bodies.dof(1); % dof is just 6


% Reshape into 2D matrix
hydro.coefficients.Khs = reshape(hydro.coefficients.Khs,hydro.bodies.dof(1),hydro.bodies.nDOF);


 % State Space Formulation (state-space and B2B)
                    for ii = 1:hydro.bodies.nDOF
                        for jj = 1:hydro.bodies.nDOF % this will need to change if body has < 6DoF
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
                    hydro.coefficients.radiation.stateSpace.A = Af;
                    hydro.coefficients.radiation.stateSpace.B = Bf;
                    hydro.coefficients.radiation.stateSpace.C = Cf .*hydro.parameters.rho;
                    hydro.coefficients.radiation.stateSpace.D = zeros(hydro.bodies.nDOF,hydro.bodies.nDOF);

% will need to subdivide matrix into submatrix corresponding to each body
% body 1 ss_O(1:6,1:12), will make legit algorithm (best to do in Modelica

% General single PTO and mooring matrices

hydro.pto.linear.cpto = diag([0,0,3000,0,0,0]);
hydro.pto.linear.kpto = diag([0,0,-40000,0,0,0]);

hydro.mooring.linear.cm = diag([50,60,3000,500,40,60]);
hydro.mooring.linear.km = diag([100,400,5000,300,200,100]);

save('hydroCoeff_6DoF_multibody.mat','hydro')