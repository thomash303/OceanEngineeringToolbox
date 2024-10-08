clear
clc

% The default filenames are:
%
%   BEMIO output:   'rm3.h5'
%   Structure:      'hydroCoeff.mat'

% File directory
filename = 'C:\Users\Thomas\Documents\GitHub\OET_6DoF\rm3.h5';

% Simulation parameters
hydroCoeff.parameters.rho = h5read(filename,'/simulation_parameters/rho');  % Density of water
hydroCoeff.parameters.g = h5read(filename,'/simulation_parameters/g');    % Acceleration due to gravity

% Body properties
hydroCoeff.bodyProperties.body1.name = h5read(filename, '/body1/properties/name'); % Body name
hydroCoeff.bodyProperties.body1.number = h5read(filename, '/body1/properties/body_number'); % Body number

% Hydro coefficients
hydroCoeff.hydroCoefficients.m = hydroCoeff.parameters.rho * h5read(filename,'/body1/properties/disp_vol');         % Equilibrium mass
hydroCoeff.hydroCoefficients.Ainf = hydroCoeff.parameters.rho * h5read(filename,'/body1/hydro_coeffs/added_mass/inf_freq');           % Infinite-frequency added mass
hydroCoeff.hydroCoefficients.Ainf = hydroCoeff.hydroCoefficients.Ainf(1:6,:); % Removing b2b coupling terms
hydroCoeff.hydroCoefficients.Khs = hydroCoeff.parameters.rho * hydroCoeff.parameters.g * h5read(filename,'/body1/hydro_coeffs/linear_restoring_stiffness'); % Linear hydrostatic stiffness
hydroCoeff.body.cg = h5read(filename,'/body1/properties/cg');


% Excitation parameters
hydroCoeff.excitation.w = h5read(filename,'/simulation_parameters/w')';       % Frequency values
hydroCoeff.excitation.FexcRe =permute(h5read(filename,'/body1/hydro_coeffs/excitation/re'),[3,1,2]);    % Real component of wave excitation force coefficient
hydroCoeff.excitation.FexcIm = permute(h5read(filename,'/body1/hydro_coeffs/excitation/im'),[3,1,2]);    % Imaginary component of wave excitation force coefficient

% Radiation state-space matrices
hydroCoeff.ss_rad.raw.A = permute(h5read(filename,'/body1/hydro_coeffs/radiation_damping/state_space/A/all'),[4,3,2,1]);   % Time-invariant state-space state matrix
hydroCoeff.ss_rad.raw.B = permute(h5read(filename,'/body1/hydro_coeffs/radiation_damping/state_space/B/all'),[4,3,2,1]);   % Time-invariant state-space input matrix
hydroCoeff.ss_rad.raw.C = permute(h5read(filename,'/body1/hydro_coeffs/radiation_damping/state_space/C/all'),[4,3,2,1]);   % Time-invariant state-space output matrix
hydroCoeff.ss_rad.raw.D = h5read(filename,'/body1/hydro_coeffs/radiation_damping/state_space/D/all');   % Time-invariant state-space feed-through matrix

hydroCoeff.ss_rad.order = h5read(filename,'/body1/hydro_coeffs/radiation_damping/state_space/it')';
hydroCoeff.ss_rad.order = hydroCoeff.ss_rad.order(:,1:6); % Order of state-space approximation

% Multibody Parameters
hydroCoeff.body.dofStart = h5read(filename,'/body1/properties/dof_start'); 
hydroCoeff.body.dofEnd = h5read(filename,'/body1/properties/dof_end'); 
hydroCoeff.body.ndof = h5read(filename,'/body1/properties/dof'); 

% Extracting radiation state-space matrices for uncoupled motion
for ii = 1:hydroCoeff.body.ndof
    for jj =hydroCoeff.body.dofStart:hydroCoeff.body.dofEnd
        jInd = jj-hydroCoeff.body.dofStart+1;
        arraySize = hydroCoeff.ss_rad.order(ii,jj);
        if ii == 1 && jInd == 1 % Begin construction of combined state, input, and output matrices
            A(1:arraySize,1:arraySize) = hydroCoeff.ss_rad.raw.A(ii,jj,1:arraySize,1:arraySize);
            B(1:arraySize,jInd)        = hydroCoeff.ss_rad.raw.B(ii,jj,1:arraySize,1);
            C(ii,1:arraySize)          = hydroCoeff.ss_rad.raw.C(ii,jj,1,1:arraySize);
        else
            A(size(A,1)+1:size(A,1)+arraySize,size(A,2)+1:size(A,2)+arraySize) = hydroCoeff.ss_rad.raw.A(ii,jj,1:arraySize,1:arraySize);
            B(size(B,1)+1:size(B,1)+arraySize,jInd) = hydroCoeff.ss_rad.raw.B(ii,jj,1:arraySize,1);
            C(ii,size(C,2)+1:size(C,2)+arraySize)   = hydroCoeff.ss_rad.raw.C(ii,jj,1,1:arraySize);
        end
    end
end

% Final radiation state-space matrices
hydroCoeff.ss_rad.processed.A = A;
hydroCoeff.ss_rad.processed.B = B;
hydroCoeff.ss_rad.processed.C = C .*hydroCoeff.parameters.rho;
hydroCoeff.ss_rad.processed.D = zeros(hydroCoeff.body.ndof,hydroCoeff.body.ndof);

% PTO Data
hydroCoeff.PTO.Adep = h5read(filename,'/body1/hydro_coeffs/added_mass/all');  
hydroCoeff.PTO.Adep = hydroCoeff.PTO.Adep(:,1:6,:);
hydroCoeff.PTO.Rdamp = h5read(filename,'/body1/hydro_coeffs/radiation_damping/all');
hydroCoeff.PTO.Rdamp = hydroCoeff.PTO.Rdamp(:,1:6,:);
hydroCoeff.PTO.Adep = permute(permute(hydroCoeff.PTO.Adep*hydroCoeff.parameters.rho,[2,3,1]) - hydroCoeff.hydroCoefficients.Ainf,[3,1,2]); % Frequency dependent added mass (only)
hydroCoeff.PTO.Rdamp = hydroCoeff.PTO.Rdamp*hydroCoeff.parameters.rho.*hydroCoeff.excitation.w; % Radiation damping


save('hydroCoeff_6DoF.mat','hydroCoeff')
