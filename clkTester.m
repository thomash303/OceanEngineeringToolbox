
    % % Initialize variables
    % 
    % N = length(output.bodies(1,1).time);
    % numStates = size(hydro.coefficients.radiation.stateSpace.noB2B.A1, 1);   % Number of states
    % numOutputs = size(hydro.coefficients.radiation.stateSpace.noB2B.C1, 1); % Number of outputs
    % X = zeros(numStates, N); % State matrix (store all state vectors over time)
    % Y = zeros(numOutputs, N); % Output matrix (store all outputs over time)
    % 
    % 
    % 
    % U = output.bodies(1,1).velocity;
    % 
    % % Time-stepping loop
    % for k = 1:N-1
    %     % Compute next state
    %     X(:, k+1) = hydro.coefficients.radiation.stateSpace.noB2B.A1 * X(:, k) + hydro.coefficients.radiation.stateSpace.noB2B.B1 * U(k, :)';
    % 
    %     % Compute output
    %     Y(:, k) = hydro.coefficients.radiation.stateSpace.noB2B.C1 * X(:, k) + hydro.coefficients.radiation.stateSpace.noB2B.D1 * U(k, :)';
    % end
    % 
    % % Compute the output for the last time step
    % Y(:, N) = hydro.coefficients.radiation.stateSpace.noB2B.C1 * X(:, N) + hydro.coefficients.radiation.stateSpace.noB2B.D1 * U(N, :)';
% 
% figure('Name','OET MATLAB')
% plot(output.bodies(1,1).time,U(:,3))
% hold on
% plot(output.bodies(1,1).time,Y(3,:)/1000000)
% hold off
% legend('Vel','Rad force')

% figure('Name','WS')
% plot(output.bodies(1,1).time,output.bodies(1,1).velocity(:,3))
% hold on
% plot(output.bodies(1,1).time,output.bodies(1,1).forceRadiationDamping(:,3)/1000000)
% hold off
% legend('Vel','Rad force')
% 
% 
% figure ('Name','OET')
% plot(body(1,1).time,body(1,1).velocity(:,3))
% hold on
% plot(body(1,1).time,body(1,1).radiationForce(:,3)/1000000)
% hold off
% legend('Vel','Rad force')


sys = ss(hydro.coefficients.radiation.stateSpace.noB2B.A1,hydro.coefficients.radiation.stateSpace.noB2B.B1,hydro.coefficients.radiation.stateSpace.noB2B.C1,hydro.coefficients.radiation.stateSpace.noB2B.D1);
y = lsim(sys,output.bodies(1,1).velocity,output.bodies(1,1).time);

figure('Name','OET MATLAB')
plot(output.bodies(1,1).time,output.bodies(1,1).velocity(:,3))
hold on
plot(output.bodies(1,1).time,y(:,3)/1000000)
hold off
legend('Vel','Rad force')


sys = ss(body(1, 1).hydroForce.hf1.ssRadf.A  ,body(1, 1).hydroForce.hf1.ssRadf.B,body(1, 1).hydroForce.hf1.ssRadf.C,body(1, 1).hydroForce.hf1.ssRadf.D);
y = lsim(sys,output.bodies(1,1).velocity,output.bodies(1,1).time);

figure('Name','WS MTALB')
plot(output.bodies(1,1).time,output.bodies(1,1).velocity(:,3))
hold on
plot(output.bodies(1,1).time,y(:,3)/1000000)
hold off
legend('Vel','Rad force')
