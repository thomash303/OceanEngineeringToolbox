
time = output.bodies(1).time;

%% Body dynamics
figure("Name",'Body Dynamics')

% Body kinematics
subplot(2,1,1)
plot(time, output.bodies(1).position(:,3), 'DisplayName','Position')
hold on
plot(time, output.bodies(1).velocity(:,3), 'DisplayName','Velocity')
hold off
title('Body Dynamics')
xlabel('Time (s)')
yyaxis left
ylabel('Position (m)')
yyaxis right
ylabel('Velocity (m/s)')
legend

% PTO force
subplot(2,1,2)
plot(time, output.ptoSim(1).forcePTO)
title('PTO Force')
xlabel('Time (s)')
ylabel('Force (N)')

%% Fluid Dynamics
figure("Name",'Fluid Dynamics')

% Pressure
subplot(2,1,1)
plot(time, output.ptoSim(1).pressureA/1e5, 'DisplayName','Chamber A')
hold on
plot(time, output.ptoSim(1).pressureB/1e5, 'DisplayName','Chamber B')
plot(time, output.ptoSim(3).pressure/1e5, 'DisplayName','HP')
plot(time, output.ptoSim(4).pressure/1e5, 'DisplayName','LP')
hold off
title('Pressure')
xlabel('Time (s)')
ylabel('Pressure (bar)')
legend

rho = 850; % this is an approximation on constant density

% Flow
subplot(2,1,2)
plot(time, output.ptoSim(2).flowRateA*rho, 'DisplayName','Chamber A')
hold on
plot(time, output.ptoSim(2).flowRateB*rho, 'DisplayName','Chamber B')
plot(time, output.ptoSim(2).flowRateC*rho, 'DisplayName','HP')
plot(time, output.ptoSim(2).flowRateD*rho, 'DisplayName','LP')
hold off
title('Pressure')
xlabel('Time (s)')
ylabel('Flow Rate (kg/s)')
legend


%% Motor Dynamics
figure("Name",'Motor Dynamics')

% Motor speed
subplot(2,1,1)
plot(time, output.ptoSim(5).shaftSpeed)
xlabel('Time (s)')
ylabel('Speed (rpm)')
title('Motor Speed')

% Motor torque
subplot(2,1,2)
plot(time, output.ptoSim(5).torque)
xlabel('Time (s)')
ylabel('Torque (Nm)')
title('Motor Torque')




% 
% output.ptoSim(1).forcePTO
% 
% output.ptoSim(1).pressureA
% output.ptoSim(1).pressureB
% 
% output.ptoSim(2).flowRateA
% output.ptoSim(2).flowRateB
% output.ptoSim(2).flowRateC
% output.ptoSim(2).flowRateD
% 
% output.ptoSim(5).shaftSpeed
% output.ptoSim(5).torque


