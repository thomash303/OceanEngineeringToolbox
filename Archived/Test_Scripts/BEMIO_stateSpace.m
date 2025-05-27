% kk = hydro.ss_K(1,1,:);
% kk = permute(kk,[3,1,2]);
% tt = hydro.ra_t;
% kkog = hydro.ra_K(1,1,:);
% kkog = permute(kk,[3,1,2]);
% 
% 
% R2i = norm(kkog-mean(kkog));  
% R2 = 1-(norm(kkog-kk.')/R2i)^2  
% 
% plot(tt,kk)
% hold on
% plot(tt,kkog,'*')
% legend('State space', 'IRF')

% Time vector
t = linspace(0, 5, 500);  % 10 seconds, 1000 points

% Define the system input (impulse input)
u = zeros(size(t));  
u(1) = 1;  % Impulse at t = 0

% Define the system output (a simple sine wave)
%for i = 1:length(t)
   % if t(i) < 2
     %   y(i) = sin(2*pi*0.5*t(i));  % 0.5 Hz sine wave as output
   % else
       % y(i) = 0;
   % end
%end
y = sin(2*pi*0.5*t);

dt = t(2) - t(1);

% Create an iddata object (input-output data)
data = iddata(y(:),t(:), t(2)-t(1));  % Sampling time is the time step
TFopt = tfestOptions('EnforceStability',true,'InitializeMethod','n4sid');
num_zeros = 2;
num_poles = 8;
init_sys = idtf(NaN(1,num_zeros+1),[1,NaN(1,num_poles)]); %initial structure for tf
init_sys.Structure.Numerator.Minimum = 0; % all coefficients

% Estimate transfer function (2 poles, 1 zero)
tf_est = tfest(data, init_sys,TFopt);  

% Convert to state-space
sys_est = ss(tf_est);

% Display estimated transfer function
disp('Estimated Transfer Function:');
tf_est


A = sys_est.A;
B = sys_est.B;
C = sys_est.C;
D = sys_est.D;


for m=1:length(t)
    ss_K(m) = ((C*expm(A*(t(2)-t(1))*(m-1)))*B);  % Calc SS IRF approx
end

% Simulate impulse response of estimated system
figure;
%plot(t, ss_K); hold on;
impulse(sys_est,t); hold on
plot(t, y, 'r', 'LineWidth', 1.5);
legend('Estimated System Response', 'Original Sinusoidal Output');
xlabel('Time (s)'); ylabel('Response');
title('Impulse Response Comparison');
grid on;