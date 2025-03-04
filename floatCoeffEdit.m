%% A
% hydro.coefficients.radiation.stateSpace.noB2B.A1(1:70,1:70) = zeros(70,70);
% A = hydro.coefficients.radiation.stateSpace.noB2B.A1(85:86,85:86);
% hydro.coefficients.radiation.stateSpace.noB2B.A1(1:2,1:2) = A;
% hydro.coefficients.radiation.stateSpace.noB2B.A1(45:46,45:46) = A;


%% B
% hydro.coefficients.radiation.stateSpace.noB2B.B1(1:70,1:6) = zeros(70,6);
% B = hydro.coefficients.radiation.stateSpace.noB2B.B1(85:86,3);
% hydro.coefficients.radiation.stateSpace.noB2B.B1(1:2,1) = B;
% hydro.coefficients.radiation.stateSpace.noB2B.B1(45:46,2) = B;

%% C
% hydro.coefficients.radiation.stateSpace.noB2B.C1(1:6,1:70) = zeros(6,70);
% C = hydro.coefficients.radiation.stateSpace.noB2B.C1(3,85:86);
% hydro.coefficients.radiation.stateSpace.noB2B.C1(1,1:2) = C;
% hydro.coefficients.radiation.stateSpace.noB2B.C1(2,45:46) = C;

%% Misized matrices
% A
% hydro.coefficients.radiation.stateSpace.noB2B.A1(1:70,1:70) = zeros(70,70);
% A = hydro.coefficients.radiation.stateSpace.noB2B.A1(86:87,86:87);
% hydro.coefficients.radiation.stateSpace.noB2B.A1(1:2,1:2) = A;
% hydro.coefficients.radiation.stateSpace.noB2B.A1(46:48,46:48) = zeros(3,3); %A


% B
% hydro.coefficients.radiation.stateSpace.noB2B.B1(1:70,1:6) = zeros(70,6);
% B = hydro.coefficients.radiation.stateSpace.noB2B.B1(86:87,3);
% hydro.coefficients.radiation.stateSpace.noB2B.B1(1:2,1) = B;
% hydro.coefficients.radiation.stateSpace.noB2B.B1(4:72,:) = zeros(32,6); %B 
% hydro.coefficients.radiation.stateSpace.noB2B.B1(1:44,1) = zeros(44,1); %C
% hydro.coefficients.radiation.stateSpace.noB2B.B1(45:70,2) = zeros(26,1); %C

% C
% hydro.coefficients.radiation.stateSpace.noB2B.C1(1:6,1:70) = zeros(6,70);
% C = hydro.coefficients.radiation.stateSpace.noB2B.C1(3,86:87);
% hydro.coefficients.radiation.stateSpace.noB2B.C1(1,1:2) = zeros(1,2);
% hydro.coefficients.radiation.stateSpace.noB2B.C1(1,45:46) = zeros(1,2);

% 
% hydro.coefficients.radiation.stateSpace.noB2B.A1(31:34,31:34) = A; %C
% hydro.coefficients.radiation.stateSpace.noB2B.A1(45:46,45:46) = A; %C
% hydro.coefficients.radiation.stateSpace.noB2B.B1(31:34,6) = B; %C
% hydro.coefficients.radiation.stateSpace.noB2B.B1(45:46,2) = B; %C
hydro.coefficients.radiation.stateSpace.noB2B.C1(1,31:34) = C; %C
% hydro.coefficients.radiation.stateSpace.noB2B.C1(2,45:46) = C; %C
% hydro.coefficients.radiation.stateSpace.noB2B.C1(3,71:84) = zeros(1,14); %C
% hydro.coefficients.radiation.stateSpace.noB2B.C1(3,87:108) = zeros(1,22); %C
% hydro.coefficients.radiation.stateSpace.noB2B.C1(1:6,108:192) = zeros(6,85); %C
% hydro.coefficients.radiation.stateSpace.noB2B.C1(3,85:86) = zeros(1,2); %C

save('RM3HydroCoeff.mat','hydro')