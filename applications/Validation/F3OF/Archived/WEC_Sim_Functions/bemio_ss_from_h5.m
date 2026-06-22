%% Computing radiation state space from radiation data in an h5 file
% Normally BEMIO reads BEM data and performs the state space approximation
% directly from the BEM output file. However, the original BEM output file
% is not available, saved only in the h5 file. Thus, the radiation kernals
% must be extracted from the h5 to perform the radiation approximation, and
% saved back in the h5 file.


hydro = struct();

hydro = readCAPYTAINE(hydro,'outputs/rm3_hydrodynamics.nc');
hydro = radiationIRF(hydro,125,[],[],[],[]);
hydro = radiationIRFSS(hydro,[],[]);
writeBEMIOH5(hydro)
plotBEMIO(hydro)