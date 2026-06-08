hydro = struct();

hydro = readCAPYTAINE(hydro,'sphere_3480p_test.nc');
hydro = radiationIRF(hydro,15,[],[],[],[]);
% hydro = radiationIRFSS(hydro,[],[]);
hydro = excitationIRF(hydro,15,[],[],[],[]);
writeBEMIOH5(hydro)


