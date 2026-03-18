%% Housekeeping
% close all
% clear table  

%% Plots 
time = output.bodies(1).time;
eta = output.wave.elevation;

omega = waves.omega;
S = waves.spectrum;

hold on
subplot(2,1,1)
plot(omega, S)
xlabel('Frequency (rad/s)')
ylabel('Spectral Energy Density')

hold on
subplot(2,1,2)
plot(time,eta)
xlabel('Time (s)')
ylabel('Elevation (m)')

%% Body dynamics
% figure("Name",'Body Dynamics')
% 
% % Body kinematics
% subplot(2,1,1)
% plot(time, output.bodies(1).position(:,3), 'DisplayName','Position')
% hold on
% plot(time, output.bodies(1).velocity(:,3), 'DisplayName','Velocity')
% hold off
% title('Body Dynamics')
% xlabel('Time (s)')
% ylabel('Position (m)')
% legend
% 
% 
% subplot(2,1,2)
% time = simout1.Time;
% pos = simout1.Data;
% plot(time,pos,'DisplayName','Piston position')

% 
% % PTO force
% subplot(2,1,2)
% plot(time, output.ptoSim(1).forcePTO)
% title('PTO Force')
% xlabel('Time (s)')
% ylabel('Force (N)')
% 
% %% Fluid Dynamics
% figure("Name",'Fluid Dynamics')
% 
% % Pressure
% subplot(2,1,1)
% plot(time, output.ptoSim(1).pressureA/1e5, 'DisplayName','Chamber A')
% hold on
% plot(time, output.ptoSim(1).pressureB/1e5, 'DisplayName','Chamber B')
% % plot(time, output.ptoSim(3).pressure/1e5, 'DisplayName','HP')
% % plot(time, output.ptoSim(4).pressure/1e5, 'DisplayName','LP')
% hold off
% title('Pressure')
% xlabel('Time (s)')
% ylabel('Pressure (bar)')
% legend
% % 
% rho = 850; % this is an approximation on constant density
% 
% % Flow
% subplot(2,1,2)
% plot(time, output.ptoSim(2).flowRateA*rho, 'DisplayName','Chamber A')
% hold on
% plot(time, output.ptoSim(2).flowRateB*rho, 'DisplayName','Chamber B')
% plot(time, output.ptoSim(2).flowRateC*rho, 'DisplayName','HP')
% plot(time, output.ptoSim(2).flowRateD*rho, 'DisplayName','LP')
% hold off
% title('Pressure')
% xlabel('Time (s)')
% ylabel('Flow Rate (kg/s)')
% legend


%% Motor Dynamics
% figure("Name",'Motor Dynamics')
% 
% % Motor speed
% subplot(2,1,1)
% plot(time, output.ptoSim(5).shaftSpeed)
% xlabel('Time (s)')
% ylabel('Speed (rpm)')
% title('Motor Speed')
% 
% % Motor torque
% subplot(2,1,2)
% plot(time, output.ptoSim(5).torque)
% xlabel('Time (s)')
% ylabel('Torque (Nm)')
% title('Motor Torque')

% figure("Name",'Motor Dynamics')
% 
% % Motor speed
% subplot(2,1,1)
% plot(time, output.ptoSim(1).shaftSpeed)
% xlabel('Time (s)')
% ylabel('Speed (rpm)')
% title('Motor Speed')
% 
% % Motor torque
% subplot(2,1,2)
% plot(time, output.ptoSim(1).torque)
% xlabel('Time (s)')
% ylabel('Torque (Nm)')
% % title('Motor Torque')
% 
% %% Fluid Dynamics
% figure("Name",'Fluid Dynamics')
% plot(time, output.ptoSim(1).pressure/1e5)
% hold off
% title('Pressure')
% xlabel('Time (s)')
% ylabel('Pressure (bar)')


% %% Fluid Dynamics
% figure("Name",'Fluid Dynamics')
% 
% % Pressure
% subplot(2,1,1)
% hold on
% plot(time, output.ptoSim(1).pressure/1e5, 'DisplayName','HP')
% plot(time, output.ptoSim(2).pressure/1e5, 'DisplayName','LP')
% hold off
% title('Pressure')
% xlabel('Time (s)')
% ylabel('Pressure (bar)')
% legend
% % 
% rho = 850; % this is an approximation on constant density
% 
% % Flow
% subplot(2,1,2)
% plot(time, output.ptoSim(3).flowRate*rho)
% title('Pressure')
% xlabel('Time (s)')
% ylabel('Flow Rate (kg/s)')
% legend
% 
% %% Motor Dynamics
% figure("Name",'Motor Dynamics')
% 
% % Motor speed
% subplot(2,1,1)
% plot(time, output.ptoSim(3).shaftSpeed)
% xlabel('Time (s)')
% ylabel('Speed (rpm)')
% title('Motor Speed')
% 
% % Motor torque
% subplot(2,1,2)
% plot(time, output.ptoSim(3).torque)
% xlabel('Time (s)')
% ylabel('Torque (Nm)')
% title('Motor Torque')
% 


%% Fluid Dynamics
% figure("Name",'Fluid Dynamics')
% 
% pressureA = logsout{1}.Values(:,1).Data;
% 
% pressureB = logsout{2}.Values(:,1).Data;
% 
% % Pressure
% subplot(2,1,1)
% plot(time, pressureA/1e5, 'DisplayName','Chamber A')
% hold on
% plot(time, pressureB/1e5, 'DisplayName','Chamber B')
% plot(time, output.ptoSim(1).pressure/1e5, 'DisplayName','HP')
% plot(time, output.ptoSim(2).pressure/1e5, 'DisplayName','LP')
% hold off
% title('Pressure')
% xlabel('Time (s)')
% ylabel('Pressure (bar)')
% legend
% % 
% rho = 850; % this is an approximation on constant density
% 
% % Flow
% subplot(2,1,2)
% plot(time, output.ptoSim(4).flowRateA*rho, 'DisplayName','Chamber A')
% hold on
% plot(time, output.ptoSim(4).flowRateB*rho, 'DisplayName','Chamber B')
% plot(time, output.ptoSim(4).flowRateC*rho, 'DisplayName','HP')
% plot(time, output.ptoSim(4).flowRateD*rho, 'DisplayName','LP')
% plot(time, output.ptoSim(3).flowRate*rho, 'DisplayName','Motor')
% hold off
% title('Pressure')
% xlabel('Time (s)')
% ylabel('Flow Rate (kg/s)')
% legend
% 
% %% Motor Dynamics
% figure("Name",'Motor Dynamics')
% 
% % Motor speed
% subplot(2,1,1)
% plot(time, output.ptoSim(3).shaftSpeed)
% xlabel('Time (s)')
% ylabel('Speed (rpm)')
% title('Motor Speed')
% 
% % Motor torque
% subplot(2,1,2)
% plot(time, output.ptoSim(3).torque)
% xlabel('Time (s)')
% ylabel('Torque (Nm)')
% title('Motor Torque')

