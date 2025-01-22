% Define the interval and the function
x = 0:0.1:5; % x values from 0 to 5 with a step of 0.1
y = x.^3;    % y = x^3

% Use cumtrapz to calculate the cumulative area under the curve
area_under_curve = cumtrapz(x, y);