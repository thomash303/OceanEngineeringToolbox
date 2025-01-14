%% Float Surge (1,1)

A = hydro.coefficients.radiation.stateSpace.noB2B.A1(1:2,1:2);
B = hydro.coefficients.radiation.stateSpace.noB2B.B1(1:2,1);
C = hydro.coefficients.radiation.stateSpace.noB2B.C1(1,1:2); 
D = 0;

[num, den]= ss2tf(A,B,C,D);

fprintf('(1,1)')
TF = tf(num, den)

%% Float Sway (2,2)
hydro.coefficients.radiation.stateSpace.noB2B.B1(45,2) = 0;
hydro.coefficients.radiation.stateSpace.noB2B.B1(46,2) = 0;

A = hydro.coefficients.radiation.stateSpace.noB2B.A1(45:46,45:46);
B = hydro.coefficients.radiation.stateSpace.noB2B.B1(45:46,2);
C = hydro.coefficients.radiation.stateSpace.noB2B.C1(2,45:46); 
D = 0;

[num, den]= ss2tf(A,B,C,D);

fprintf('(2,2)')
TF = tf(num, den)

%% Float heave (3,3)
A = hydro.coefficients.radiation.stateSpace.noB2B.A1(85:86,85:86);
B = hydro.coefficients.radiation.stateSpace.noB2B.B1(85:86,3);
C = hydro.coefficients.radiation.stateSpace.noB2B.C1(3,85:86); 

D = 0;

[num, den]= ss2tf(A,B,C,D);

fprintf('(3,3)')
TF = tf(num, den)
