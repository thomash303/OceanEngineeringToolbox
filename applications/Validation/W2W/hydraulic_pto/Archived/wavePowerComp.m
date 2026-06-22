
%% WEC-Sim Reading
powerTest.ws.P = waves.power;
powerTest.ws.omega = waves.omega;
powerTest.ws.S = waves.spectrum;

%% OET Preprocessing
projectRoot = fileparts(fileparts(fileparts(pwd)));

% Entering RM3 specific data
filePath = {''};
% deviceName = {'OpenHydraulics.Developed.Circuits.w2w_sens_control','w2w_sens_control'};
deviceName = {'powerTest','powerTest'};
currentPath = {pwd};

% Importing Modelica simulation data
% File directory
temp = tempdir;
basePath = fullfile('OpenModelica', 'OMEdit');  % Path to default OMEdit result file
fileName = fullfile([filePath{1} '' deviceName{1}], [deviceName{2} '_res.csv']);  % Path to current file                  
%{
The default result file and file name are shown in the output tab of the 
 simulation setup as "Result File (optional) and File Name Prefix
 (optional).
%}

% Importing Modelica data
filePath = fullfile(temp, basePath, fileName);
outputData = readtable(filePath);

% Remove duplicate time records from OET output file
time = outputData.time;
[~, uidx] = unique(time, 'stable');
outputData = outputData(uidx, :);
time = outputData.time;

%% OET Saving
powerTest.oet.P = outputData.environment_wave_P;

n_omega = 100;

powerTest.oet.S = zeros(1,n_omega);
powerTest.oet.omega = zeros(1,n_omega);

for k = 1:n_omega
    powerTest.oet.S(k) = outputData.(sprintf('environment_wave_S_%d_',k))(1);
    powerTest.oet.omega(k) = outputData.(sprintf('environment_wave_omegaO_%d_',k))(1);
end

powerTest.oet.S = powerTest.oet.S';
powerTest.oet.omega = powerTest.oet.omega';


%% Saving
save('powerTest.mat','powerTest')

%% Comparison
figure('Name','Wave Spectrum Comparison')

plot(powerTest.ws.omega, powerTest.ws.S,'LineWidth',1.5,...
    'DisplayName','WEC-Sim')
hold on
plot(powerTest.oet.omega, powerTest.oet.S,'--','LineWidth',1.5,...
    'DisplayName','OET')
grid on
xlabel('\omega [rad/s]')
ylabel('S(\omega)')
title('Wave Spectrum')
legend('Location','best')

powerComparison = table( ...
    powerTest.ws.P, ...
    powerTest.oet.P(1), ...
    powerTest.oet.P(1) - powerTest.ws.P, ...
    100*(powerTest.oet.P(1) - powerTest.ws.P)/powerTest.ws.P, ...
    'VariableNames',{'WECSim','OET','Difference','PercentDifference'} );

disp('Wave Power Comparison')
disp(powerComparison)