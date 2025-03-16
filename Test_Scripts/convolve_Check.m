% Given impulse response
[y, t] = impulse(tf1_est, t1);
hold on;

% Ensure t, y, and sine_wave are column vectors
t = t(:);  
y = y(:);

% Define sine wave parameters
f = 1; % Frequency in Hz
sine_wave = sin(2 * pi * f * t); % Generate sine wave
sine_wave = sine_wave(:); % Ensure it's a column vector

% Ensure k1 is also a column vector and same size as t
k1 = k1(:);
if length(k1) ~= length(t)
    error('k1 must have the same length as t.');
end

% Initialize integral storage
conv_y_integral = zeros(size(t));
conv_k1_integral = zeros(size(t));

% Compute the convolution integral using numerical integration
for i = 2:length(t)  % Start from 2 to avoid empty integration range
    conv_y_integral(i) = trapz(t(1:i), (y(1:i) .* sine_wave(1:i)));
    conv_k1_integral(i) = trapz(t(1:i), (k1(1:i) .* sine_wave(1:i)));
end

% Plot results
figure;
plot(t, y, 'b', 'DisplayName', 'Impulse Response'); hold on;
plot(t, conv_y_integral, 'r', 'DisplayName', 'Convolution Integral of y');
plot(t, conv_k1_integral, 'g', 'DisplayName', 'Convolution Integral of k1');
xlabel('Time (s)');
ylabel('Amplitude');
legend;
grid on;
title('Convolution Integral of Impulse Response and k1 with Sine Wave');
