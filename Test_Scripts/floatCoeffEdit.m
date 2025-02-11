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
A = hydro.coefficients.radiation.stateSpace.noB2B.A1(86:87,86:87);
% hydro.coefficients.radiation.stateSpace.noB2B.A1(1:2,1:2) = A;
hydro.coefficients.radiation.stateSpace.noB2B.A1(46:47,46:47) = A;


% B
% hydro.coefficients.radiation.stateSpace.noB2B.B1(1:70,1:6) = zeros(70,6);
B = hydro.coefficients.radiation.stateSpace.noB2B.B1(86:87,3);
% hydro.coefficients.radiation.stateSpace.noB2B.B1(1:2,1) = B;
hydro.coefficients.radiation.stateSpace.noB2B.B1(46:47,2) = B;

% C
% hydro.coefficients.radiation.stateSpace.noB2B.C1(1:6,1:70) = zeros(6,70);
C = hydro.coefficients.radiation.stateSpace.noB2B.C1(3,86:87);
% hydro.coefficients.radiation.stateSpace.noB2B.C1(1,1:2) = C;
hydro.coefficients.radiation.stateSpace.noB2B.C1(2,46:47) = C;


save('RM3HydroCoeff.mat','hydro')