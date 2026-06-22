hydro = struct();

hydro = readCAPYTAINE(hydro,'hydroData/sphere_9024p.nc');
hydro = radiationIRF(hydro,15,[],[],[],[]);
hydro = radiationIRFSS(hydro,[],[]);
hydro = excitationIRF(hydro,15,[],[],[],[]);
writeBEMIOH5(hydro)


