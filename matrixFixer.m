A11 = hydro.coefficients.radiation.stateSpace.noB2B.A1(1:2,1:2);
A22 = hydro.coefficients.radiation.stateSpace.noB2B.A1(45:46,45:46);
A33 = hydro.coefficients.radiation.stateSpace.noB2B.A1(85:86,85:86);
A44 = hydro.coefficients.radiation.stateSpace.noB2B.A1(131:132,131:132);
A55 = hydro.coefficients.radiation.stateSpace.noB2B.A1(175:176,175:176);
A66 = hydro.coefficients.radiation.stateSpace.noB2B.A1(189:192,189:192);


B11 = hydro.coefficients.radiation.stateSpace.noB2B.B1(1:2,1);
B22 = hydro.coefficients.radiation.stateSpace.noB2B.B1(45:46,2);
B33 = hydro.coefficients.radiation.stateSpace.noB2B.B1(85:86,3);
B44 = hydro.coefficients.radiation.stateSpace.noB2B.B1(131:132,4);
B55 = hydro.coefficients.radiation.stateSpace.noB2B.B1(175:176,5);
B66 = hydro.coefficients.radiation.stateSpace.noB2B.B1(189:192,6);

A = zeros(192,192);
B = zeros(192,6);

A(1:2,1:2) = A11;
A(45:46,45:46) = A22;
A(85:86,85:86) = A33;
A(131:132,131:132) = A44;
A(175:176,175:176) = A55;
A(189:192,189:192) = A66;

B(1:2,1) = B11;
B(45:46,2) = B22;
B(85:86,3) = B33;
B(131:132,4) = B44;
B(175:176,5) = B55;
B(189:192,6) = B66;

hydro.coefficients.radiation.stateSpace.noB2B.Atest = A;
hydro.coefficients.radiation.stateSpace.noB2B.Btest = B;