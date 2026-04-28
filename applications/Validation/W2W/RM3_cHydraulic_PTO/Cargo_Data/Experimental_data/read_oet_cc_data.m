%% Preprocessing and loading OET data
projectRoot = fileparts(fileparts(fileparts(pwd)));

% Entering RM3 specific data
filePath = {''};
deviceName = {'OpenHydraulics.Developed.Circuits.CC_HIL_sens_no_rot_val','CC_HIL_sens_no_rot_val'};

currentPath = {pwd};

% Importing Modelica simulation data
temp = tempdir;
basePath = fullfile('OpenModelica', 'OMEdit');
fileName = fullfile([filePath{1} '' deviceName{1}], [deviceName{2} '_res.csv']);

filePath = fullfile(temp, basePath, fileName);
outputData = readtable(filePath);

oet_cargo_data = {};

time = outputData.time;
[~, uidx] = unique(time, 'stable');
outputData = outputData(uidx, :);
oet_cargo_data.time = outputData.time;

% Saving data
oet_cargo_data.p1 = outputData.daq_p1/paBar;
oet_cargo_data.p2 = outputData.daq_p2/paBar;
oet_cargo_data.p3 = outputData.daq_p3/paBar;
oet_cargo_data.p4 = outputData.daq_p4/paBar;
oet_cargo_data.p5 = outputData.daq_p5/paBar;
oet_cargo_data.p6 = outputData.daq_p6/paBar;

oet_cargo_data.f1 = outputData.daq_qL1;
oet_cargo_data.f2 = outputData.daq_qL2;

oet_cargo_data.fpto = outputData.Fpto;

oet_cargo_data.s = outputData.doubleActingCylinder_piston_s;

save('oet_cargo_datav3.mat','oet_cargo_data');