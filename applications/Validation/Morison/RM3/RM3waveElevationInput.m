%% Modelica Wave Elevation Extraction
%{
Extract the wave elevation time history from Modelica to enable WEC-Sim to 
replicate the corresponding excitation force. Must be performed AFTER the
Modelica simulation but PRIOR to the WEC-Sim simulation.
%}

% File directory
temp = tempdir;
basePath = fullfile('OpenModelica','OMEdit');  % Path to default OMEdit result file
fileName = fullfile('OceanEngineeringToolbox.Tutorial.RM3','RM3_res.csv');  % Path to current file                  
%{
The default result file and file name are shown in the output tab of the 
 simulation setup as "Result File (optional) and File Name Prefix
 (optional).
%}

% Importing Modelica data
filePath = fullfile(temp, basePath, fileName);
outputData = readtable(filePath);

% Remove duplicate time records from OET output file
[~, uidx] = unique(outputData.time, 'stable');
outputData = outputData(uidx, :);

% Extracting Modelica data
elevationData(:,1) = outputData.time;              % Time
elevationData(:,2) = outputData.environment_SSE;   % Wave elevation


% Save the elevation variable to a MATLAB structure. Note, this structure
% must be saved inside the WEC-Sim simulation directory to enable import.
save('elevationData.mat','elevationData')