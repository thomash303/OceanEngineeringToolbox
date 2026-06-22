function hydro = readH5ToStruct(filename)
% Function to read BEMIO data from an h5 file into a hydrodata structure
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This was copied directly from the WEC-Sim source code, and has since be
% modified for bespoke needs. Removing everything except for those
% required for the radiation state space.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Parameters
% ----------
%     filename : string
%         Path to the BEMIO .h5 file to read
% 
% Returns
% -------
%     hydroData : struct
%         Struct of hydro data
% 

hydro = {};

% Read body-independent wave parameters
hydro.code = h5read(filename,'/bem_data/code');
[~,hydro.file,~] = fileparts(filename);
hydro.rho = h5read(filename,'/simulation_parameters/rho');
hydro.theta = h5read(filename,'/simulation_parameters/wave_dir');
hydro.Nh = length(hydro.theta);
hydro.h = h5read(filename,'/simulation_parameters/water_depth');
if hydro.h == 'infinite'
    hydro.h = Inf;
end
hydro.w = h5read(filename,'/simulation_parameters/w');
hydro.T = h5read(filename,'/simulation_parameters/T');
hydro.g = h5read(filename,'/simulation_parameters/g');
hydro.Nf = length(hydro.w);

% Determine how many bodies are in the h5 file
for i = 1:1e6
    h5BodyName = ['/body' num2str(i)];
    try
        hydro.body{i} = h5read(filename,[h5BodyName '/properties/name']); 
    catch
        hydro.Nb = i-1;
        fprintf('Number of bodies in h5 file = %.0f \n',hydro.Nb)
        break
    end
end

for i = 1:hydro.Nb
    h5BodyName = ['/body' num2str(i)];

    hydro.dof(i) = h5read(filename,[h5BodyName '/properties/dof']);
    dofStart = h5read(filename,[h5BodyName '/properties/dof_start']);
    dofEnd = h5read(filename,[h5BodyName '/properties/dof_end']);
    hydro.ra_K(dofStart:dofEnd,:,:) = reverseDimensionOrder(h5read(filename, [h5BodyName '/hydro_coeffs/radiation_damping/impulse_response_fun/K']));
    hydro.ra_t(1,:) = reverseDimensionOrder(h5read(filename, [h5BodyName '/hydro_coeffs/radiation_damping/impulse_response_fun/t'])); % Assumes all bodies have same time vector
    hydro.ra_w(1,:) = reverseDimensionOrder(h5read(filename, [h5BodyName '/hydro_coeffs/radiation_damping/impulse_response_fun/w'])); % Assumes all bodies have same interpolated frequencies
    
   
end

end