%% Ocean Engineering Toolbox - Calling the Pre-Processing Function
%{
A script calling the post-processing function for the OET to pre-process 
hydrodynamic data. The user must call this function in a script within the 
same folder as the .h5, enter the current file pathfile, and specify the 
device name.
%}

projectRoot = fileparts(fileparts(fileparts(fileparts(pwd))));
srcPath = fullfile(projectRoot, 'OceanEngineeringToolbox', 'src', 'Processing', 'MATLAB','Preprocess');
addpath(srcPath);

currentPath = pwd;
filePath = fullfile('hydroData', 'wec3_short.h5');
% filePath = fullfile('hydroData', 'f3of.h5');
deviceName = 'F3OF_W';

[hydro] = preprocess(currentPath, filePath, deviceName);