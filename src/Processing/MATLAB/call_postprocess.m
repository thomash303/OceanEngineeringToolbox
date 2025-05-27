%% Ocean Engineering Toolbox - Calling the Post-Processing Function
%{
A script calling the post-processing function for the OET to post-process 
Modelica simulation data. The user must specify the result folder, 
result file, and the instantiated hydrodynamic body, wave, mooring, and 
PTO Modelica model name (cap sensitive). All names must be enclosed in 
braces.
%}

filePath = {'filePath'};
deviceName = {'deviceName'};
bodyName = {'body', 'names'};
waveName = {'environment_SSE'}; % Do not edit
mooringName = {'mooring', 'names'};
ptoName = {'pto', 'names'};

[body, wave, mooring, pto] = postprocess(filePath, deviceName, ...
    bodyName, waveName, mooringName, ptoName);