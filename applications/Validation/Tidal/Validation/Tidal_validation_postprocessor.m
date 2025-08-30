%% Tidal_validation_postprocessor
% MATLAB script to read .dat file with headers

%% Reading Data
% Path to the folder
dataFolder = 'Upstream_1.4ms-1';

% Name of the file inside that folder
filename = fullfile(dataFolder, 'TTT3_INSEAN_TURB_161123_1628');

% Read the data into a table (automatically parses headers)
T = readtable(filename, 'Delimiter', '\t', 'ReadVariableNames', true);

% Extract columns into variables
Year               = T.Year;
Month              = T.Month;
Day                = T.Day;
Hour               = T.Hour;
Minute             = T.Minute;
Second             = T.Second;
Fractional_Second  = T.Fractional_Second;

FlowMeter          = T.FlowMeter;

Current01          = T.Current01;
Voltage01          = T.Voltage01;
Pelec01            = T.Pelec01;
LoadCell01         = T.LoadCell01;
Temp01             = T.Temp01;
RPM01enc           = T.RPM01enc;
Position01         = T.Position01;

Current02          = T.Current02;
Voltage02          = T.Voltage02;
Pelec02            = T.Pelec02;
LoadCell02         = T.LoadCell02;
Temp02             = T.Temp02;
RPM02enc           = T.RPM02enc;
Position02         = T.Position02;

Torque01           = T.Torque01;
Speed01            = T.Speed01;
Pmech01            = T.Pmech01;

Torque02           = T.Torque02;
Speed02            = T.Speed02;
Pmech02            = T.Pmech02;

Time = datetime(T.Year, T.Month, T.Day, T.Hour, T.Minute, T.Second + T.Fractional_Second);

% Convert datetime to seconds relative to the first timestamp
TimeInSeconds = seconds(Time - Time(1));


%% Plotting Data
% Sample steady-state range
idx = 400:1850;

% Slice time
TimeInSeconds_sliced = TimeInSeconds(idx);
RPM01enc_sliced = RPM01enc(idx);

% Plot figure
figure;
plot(TimeInSeconds_sliced, RPM01enc_sliced, 'LineWidth', 1.2);
xlabel('Time [s]');
ylabel('Encoder 1 (RPM)');
grid on;
title('RPM vs Time');