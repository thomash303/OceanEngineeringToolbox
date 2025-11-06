%% Loading data

waveData = load('WECSim_eta_20bin.mat');

%% Wave

% Folder to save figures B2B
saveFolder = fullfile(pwd, 'Plots', 'Free');
if ~exist(saveFolder, 'dir')
    mkdir(saveFolder);
end

figure('Name', 'Wave');

plot(waveData.output.wave.time, waveData.output.wave.elevation); 
title('Waves'); 
xlabel('Time (s)');
ylabel('Wave Elevation (m)'); 
legend('WEC-Sim','Location','best');

