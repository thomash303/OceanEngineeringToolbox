% Read in graph grabbed experimental data for the hydraulic PTO

direc = pwd;
basePath = fullfile('Cargo_Data','Tuning');


fileName = 'Displacement_sim.csv';
filePath = fullfile(direc, basePath, fileName);
Table = readtable(filePath);

dispSimTime = Table.Series1_DisplacementSim;
dispSim = Table.Var2;

fileName = 'Displacement_exp.csv';
filePath = fullfile(direc, basePath, fileName);
Table = readtable(filePath);

dispExpTime = Table.Series2_DisplacementExp;
dispExp = Table.Var2;


