%% Plotting_TTT_Data.m
% Extracting and plotting TTT test data
% Thomas Hogan

%% Data Extraction
% Add Result file to path and load data
addpath(fullfile('Upstream_1.4ms-1','Results'))

load('TTT3_INSEAN_Turb_All_Results.mat')

% Save result data locally
meanRes = Results.Turbine.Mean;

omega = meanRes.Rot_Speed_Enc(2:end);
thrust = meanRes.Thrust(2:end);
torque = meanRes.Mech_Torque(2:end);
power_mech = meanRes.Mech_Power(2:end);
flow = meanRes.FM_Velocity(2:end);


%% Plotting
figure;

% Subplot #1 - Angular velocity
subplot(4,1,1)
plot(omega,'x')
xlabel('Test Case #')
ylabel('Angular Velocity (rad/s)')

% Subplot #2 - Thrust force
subplot(4,1,2)
plot(thrust,'x')
xlabel('Test Case #')
ylabel('Thrust Force (N)')

% Subplot #3 - Torque
subplot(4,1,3)
plot(torque,'x')
xlabel('Test Case #')
ylabel('Torque (N/m)')

% Subplot #4 - Mechanical power
subplot(4,1,4)
plot(power_mech,'x')
xlabel('Test Case #')
ylabel('Mechanical Power (W)')

sgtitle(sprintf('TTT Test Data for 1.4 m/s Carriage Speed'));