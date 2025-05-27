
%% Modelica Hydrodynamic Data Adjustment
%{
BEMIO post-processes the hydrodynamic data from the WAMIT 
output file (rm3.out) and generates an HDF file (rm3.h5). The hydrostatic
coefficient in the flap appears to have an unstable (negative) coefficient
in the pitch mode. To avoid this issue, the sign of the coefficient needs to
be flipped. This script should be
executed after (if) BEMIO post-processes the WAMIT data and BEFORE the
hydrodynamic data is used to execute a simulation in the OET. This has
already been performed for the provided hydrodynamic data; therefore,
unless you are re-pre-processing the WAMIT data, there is no need to
execute this script.
%}

%% Modifyiung the RM3HydroCoeff.mat structure
% Note: the IRFs are almost identical and produce like state-space matrices
% Pitch
hydro.coefficients.hydrostatic.Khs1(5,5) = abs(hydro.coefficients.hydrostatic.Khs1(5,5));

save('OSWECHydroCoeff.mat','hydro')