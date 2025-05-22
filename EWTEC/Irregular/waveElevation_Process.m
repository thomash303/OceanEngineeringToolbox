%% Loading data

temp = tempdir;
current = 'OpenModelica\OMEdit';
% file = '\OET.Example.multibodyWECSingleDoF\multibodyWECSingleDoF_res.csv';
file = '\OceanEngineeringToolbox.Tutorial.RM3\RM3_res.csv';

filedir = [temp current file];

outputData = readtable(filedir);


[~, uidx] = unique(outputData.time, 'stable');
outputData = outputData(uidx, :);


% Remove duplicate time records from OET output file
elevationData(:,1) = outputData.time;        % Time
elevationData(:,2) = outputData.environment_SSE;       % Wave elevation


% Save the elevation variable to a MATLAB structure. Note, this structure
% must be saved inside the WEC-Sim simulation directory to enable import.
save('elevationData.mat','elevationData')