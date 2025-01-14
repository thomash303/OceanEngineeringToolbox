% hydro.coefficients.radiation.stateSpace.noB2B.B1 = zeros(192,6);
% 
% %% R SS 3
% hydro.coefficients.radiation.stateSpace.noB2B.B1(85,3) = -6.4077;
% hydro.coefficients.radiation.stateSpace.noB2B.B1(86,3) = 0.2535;
% 
% %% R SS 4
% hydro.coefficients.radiation.stateSpace.noB2B.B1(131,4) = -0.09455;
% hydro.coefficients.radiation.stateSpace.noB2B.B1(132,4) = 21.51592;
% 
% %% R SS 5
% hydro.coefficients.radiation.stateSpace.noB2B.B1(175,5) = -0.09455;
% hydro.coefficients.radiation.stateSpace.noB2B.B1(176,5) = 21.51592;

% %% Hydrostatic
% hydro.coefficients.hydrostatic.Khs1 = zeros(6,6);
% hydro.coefficients.hydrostatic.Khs1(3,3) = 2.800951200000000e+06;
% hydro.coefficients.hydrostatic.Khs1(4,4) = 72074070;
% hydro.coefficients.hydrostatic.Khs1(5,5) = 72074070;

% % R SS 1
% hydro.coefficients.radiation.stateSpace.noB2B.B1(1,1) = -0.13016;
% hydro.coefficients.radiation.stateSpace.noB2B.B1(2,1) = 5.8519;
% 
% % R SS 2
% hydro.coefficients.radiation.stateSpace.noB2B.B1(45,2) = -0.13016;
% hydro.coefficients.radiation.stateSpace.noB2B.B1(46,2) = 5.8519;

% 
% % R SS 1
% hydro.coefficients.radiation.stateSpace.noB2B.B1(1,1) = 0;
% hydro.coefficients.radiation.stateSpace.noB2B.B1(2,1) = 0;
% 
% % R SS 2
% hydro.coefficients.radiation.stateSpace.noB2B.B1(45,2) = 0;
% hydro.coefficients.radiation.stateSpace.noB2B.B1(46,2) = 0;

hydro.coefficients.radiation.stateSpace.noB2B.B1(1:84,1:6) = zeros(84,6);

% %% Ainf
% hydro.coefficients.radiation.stateSpace.noB2B.Ainf1 = ones(6,6);
% hydro.coefficients.radiation.stateSpace.noB2B.Ainf1(1,1) = 9.272929000000001e+04;
% hydro.coefficients.radiation.stateSpace.noB2B.Ainf1(2,2) = 9.272851000000000e+04;
% hydro.coefficients.radiation.stateSpace.noB2B.Ainf1(3,3) = 1232838;
% hydro.coefficients.radiation.stateSpace.noB2B.Ainf1(4,4) = 20061740;
% hydro.coefficients.radiation.stateSpace.noB2B.Ainf1(5,5) = 20061720;
% hydro.coefficients.radiation.stateSpace.noB2B.Ainf1(6,6) = 7.181509000000000e-05;


% %% Spar
% hydro.coefficients.radiation.stateSpace.noB2B.B2 = zeros(204,6);
% 
% %% R SS 1
% hydro.coefficients.radiation.stateSpace.noB2B.B2(1,1) = - 0.032974531262693;
% hydro.coefficients.radiation.stateSpace.noB2B.B2(2,1) = 1.990145111574652;
% 
% %% R SS 2
% hydro.coefficients.radiation.stateSpace.noB2B.B2(47,2) = - 0.032974125470991;
% hydro.coefficients.radiation.stateSpace.noB2B.B2(48,2) = 1.990141288687343;
% 
% %% R SS 3
% hydro.coefficients.radiation.stateSpace.noB2B.B2(85,3) = 3.210876870553194;
% hydro.coefficients.radiation.stateSpace.noB2B.B2(86,3) = 0.011491709902042;
% 
% %% R SS 4
% hydro.coefficients.radiation.stateSpace.noB2B.B2(131,4) = -0.142586303011022;
% hydro.coefficients.radiation.stateSpace.noB2B.B2(132,4) = 13.145243244493300;
% 
% %% R SS 5
% hydro.coefficients.radiation.stateSpace.noB2B.B2(177,5) = -0.142586303011022;
% hydro.coefficients.radiation.stateSpace.noB2B.B2(178,5) = 13.145243244493300;





save('RM3HydroCoeff.mat','hydro')


