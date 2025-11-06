%% Ocean Engineering Toolbox - Calling the Post-Processing Function
%{
A script calling the post-processing function for the OET to post-process 
Modelica simulation data. The user must specify the result folder, 
result file, and the instantiated hydrodynamic body, wave, mooring, and 
PTO Modelica model name (cap sensitive). All names must be enclosed in 
braces. The WEC-Sim output file must be saved as 'output.mat' in the 
working directory.
%}

projectRoot = fileparts(fileparts(fileparts(pwd)));
srcPath = fullfile(projectRoot, 'src', 'Processing', 'MATLAB',...
    'WECSimComparison');
addpath(srcPath);

% Entering RM3 specific data
filePath = {'OceanEngineeringToolbox.Tutorial'};
deviceName = {'RM3'};
bodyName = {'float', 'spar'};
waveName = {'environment_SSE'}; % Do not edit
mooringName = {};
ptoName = {'linearTranslationalPTO'};
currentPath = {pwd};

[body, wave, mooring, pto] = postprocess_WS(filePath, deviceName, ...
    bodyName, waveName, mooringName, ptoName);