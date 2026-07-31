%% Ocean Engineering Toolbox - Calling the Pre-Processing Function
%{
A script calling the post-processing function for the OET to pre-process 
hydrodynamic data. The user must call this function in a script within the 
same folder as the .h5, enter the current file pathfile, and specify the 
device name.
%}

projectRoot = fileparts(fileparts(fileparts(fileparts(pwd))));
srcPath = fullfile(projectRoot, 'OceanEngineeringToolbox','src', 'Processing', 'MATLAB', 'Preprocess');
addpath(srcPath);

currentPath = pwd;
filePath = fullfile('hydroData', 'oswec.h5');
deviceName = 'OSWEC_1dir';

[hydro] = preprocess(currentPath, filePath, deviceName);