%% Half-sphere profile 

clc; clear; close all;

% Parameters
R = 2.5;                  
theta = linspace(-pi/2,pi/2,100);

% Cartesian coordinates
x = R * cos(theta);       
z = R * sin(theta);      

% Plot the profile
figure
plot(x, z, 'b-o','LineWidth',1.5)
axis equal
grid on
xlabel('x (m)')
ylabel('z (m)')
title('Half-sphere profile (2D)')

% Export coordinates to Excel
coords = [x' z'];
writematrix(coords,'half_sphere_profile_100.xlsx');
disp('Half-sphere cartesian coordinates exported to half_sphere_profile.xlsx');
