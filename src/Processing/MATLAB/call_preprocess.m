%% Ocean Engineering Toolbox - Calling the Pre-Processing Function
%{
A script calling the post-processing function for the OET to pre-process 
hydrodynamic data. The user must call this function in a script within the 
same folder as the .h5, enter the current file pathfile, and specify the 
device name.
%}

currentPath = pwd;
filePath = 'deviceName.h5';
deviceName = 'deviceName';


[hydro] = preprocess(currentPath, filePath, deviceName);