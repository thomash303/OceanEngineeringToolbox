%% Correcting the mass and volume quantities in the BEM data
load('F3OF_NhydroCoeff.mat')

hydro.bodies.vol1 = 1089825/1025;
hydro.bodies.m1 = hydro.bodies.vol1 * hydro.parameters.rho;
hydro.bodies.vol2 = 179250/1025;
hydro.bodies.m2 = hydro.bodies.vol2 * hydro.parameters.rho;
hydro.bodies.vol3 = 179250/1025;
hydro.bodies.m3 = hydro.bodies.vol3 * hydro.parameters.rho;

save('F3OFhydroCoeff.mat','hydro')