
% Omax = 10;
% R2t = 0.9;
% 
% t = body(1,1).hydroData.hydro_coeffs.radiation_damping.impulse_response_fun.t;
% k = body(1,1).hydroData.hydro_coeffs.radiation_damping.impulse_response_fun.K(1,1,:);
% k = permute(k,[3,1,2]);
% k = k;
% 
% dt = t(2)-t(1);
% 
% rad.A22 = zeros(Omax,Omax);
% rad.B22 = zeros(Omax,1);
% rad.C22 = zeros(1,Omax);
% rad.D22 = zeros(1);
% rad.ss_K22 = zeros(length(t));
% 
% 
% 
% 
% K = k;
% R2i = norm(K-mean(K));  % Initial R2
% 
% %Hankel Singular Value Decomposition
% O = 10;  % Initial state space order
% y = dt*K;
% h = hankel(y(2:end));
% [u,svh,v] = svd(h);
% svh=diag(svh);
% 
% 
% u1 = u(1:length(K)-2,1:O);
% v1 = v(1:length(K)-2,1:O);
% u2 = u(2:length(K)-1,1:O);
% sqs = sqrt(svh(1:O));
% ubar = u1.'*u2;
% 
% a = ubar.*((1./sqs)*sqs.');
% b = v1(1,:).'.*sqs;
% c = u1(1,:).*sqs.';
% d = y(1);
% 
% iidd = inv(dt/2*(eye(O)+a));  % (T/2*I+T/2*A)^{-1} = 2/T(I+A)^{-1}
% ac = (a-eye(O))*iidd;         % (A-I)2/T(I+A)^{-1} = 2/T(A-I)(I+A)^{-1}
% bc = dt*(iidd*b);             % (T/2+T/2)*2/T(I+A)^{-1}B = 2(I+A)^{-1}B
% cc = c*iidd;                  % C*2/T(I+A)^{-1} = 2/T(I+A)^{-1}
% dc = d-dt/2*((c*iidd)*b);     % D-T/2C (2/T(I+A)^{-1})B = D-C(I+A)^{-1})B
% for k=1:length(t)
%     ss_K(k) = ((cc*expm(ac*dt*(k-1)))*bc);  % Calc SS IRF approx
% end
% 
% R2 = 1-(norm(K-ss_K.')/R2i)^2;  % Calc R2 for SS IRF approx
% 
% 
% rad.A22(1:O,1:O) = ac;
% rad.B22(1:O,1) = bc;
% rad.C22(1,1:O) = cc;
% rad.D22 = dc;
% rad.ss_K22 = ss_K;
% rad.ss_R22 = R2;
% rad.ss_O22 = O;


% 
% zero_rows = all(rad.A == 0, 2);
% zero_cols = all(rad.A == 0, 1);
% 
% % Remove all-zero rows and columns
% rad.A22 = rad.A22(~zero_rows, ~zero_cols);
% rad.B222 = rad.B22(~zero_rows, :);
% rad.C22 = rad.C22(:, ~zero_cols);

% sys = ss(rad.A,rad.B,rad.C,rad.D);
% impulse(sys,t)


%% Matrix adjustments (1,1)
%B
% B_row = zeros(1,6);
% hydro.coefficients.radiation.stateSpace.noB2B.B1 = [hydro.coefficients.radiation.stateSpace.noB2B.B1(1:2,:)...
%     ; B_row; hydro.coefficients.radiation.stateSpace.noB2B.B1(3:end,:)];

% hydro.coefficients.radiation.stateSpace.noB2B.B1(1:3,1) = rad.B22; 

% C
% C_col = zeros(6,1);
% hydro.coefficients.radiation.stateSpace.noB2B.C1 = [hydro.coefficients.radiation.stateSpace.noB2B.C1(:,1:2)...
%     , C_col, hydro.coefficients.radiation.stateSpace.noB2B.C1(:,3:end)];
% 
% hydro.coefficients.radiation.stateSpace.noB2B.C1(1,1:3) = rad.C22*1000;

% A
%A_row = zeros(1,193);
% A_col = zeros(192,1);
% hydro.coefficients.radiation.stateSpace.noB2B.A1 = [hydro.coefficients.radiation.stateSpace.noB2B.A1(:,1:2)...
%     , A_col, hydro.coefficients.radiation.stateSpace.noB2B.A1(:,3:end)];
% 
% hydro.coefficients.radiation.stateSpace.noB2B.A1 = [hydro.coefficients.radiation.stateSpace.noB2B.A1(1:2,:)...
%     ; A_row; hydro.coefficients.radiation.stateSpace.noB2B.A1(3:end,:)];
% 
% hydro.coefficients.radiation.stateSpace.noB2B.A1(1:3,1:3) = rad.A22;


%% Matrix adjustments (2,2)
% B
% % B_row = zeros(1,6);
% hydro.coefficients.radiation.stateSpace.noB2B.B1 = [hydro.coefficients.radiation.stateSpace.noB2B.B1(1:45,:)...
%     ; B_row; hydro.coefficients.radiation.stateSpace.noB2B.B1(46:end,:)];
% 
% hydro.coefficients.radiation.stateSpace.noB2B.B1(46:48,2) = B;
 
% C
% C_col = zeros(6,1);
% hydro.coefficients.radiation.stateSpace.noB2B.C1 = [hydro.coefficients.radiation.stateSpace.noB2B.C1(:,1:45)...
%     , C_col, hydro.coefficients.radiation.stateSpace.noB2B.C1(:,46:end)];

% hydro.coefficients.radiation.stateSpace.noB2B.C1(2,46:48) = C*1000;

% A
A_row = zeros(1,194);
% A_col = zeros(193,1);
% hydro.coefficients.radiation.stateSpace.noB2B.A1 = [hydro.coefficients.radiation.stateSpace.noB2B.A1(:,1:45)...
%     , A_col, hydro.coefficients.radiation.stateSpace.noB2B.A1(:,46:end)];
% 
% hydro.coefficients.radiation.stateSpace.noB2B.A1 = [hydro.coefficients.radiation.stateSpace.noB2B.A1(1:45,:)...
%     ; A_row; hydro.coefficients.radiation.stateSpace.noB2B.A1(46:end,:)];

hydro.coefficients.radiation.stateSpace.noB2B.A1(46:48,46:48) = A;