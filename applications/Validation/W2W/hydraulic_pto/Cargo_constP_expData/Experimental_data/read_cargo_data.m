
%% Loading and saving data from spreadsheet
file = 'master_experimental_cargo.xlsx';

% Read and convert to arrar
T = readtable(file);
A = table2array(T);

% Remove nan
A(:, all(isnan(A),1)) = [];


% Data structure
% (col1, col2) - (t, displacement)
% (col3, col4) - (t, flow 1)
% (col5, col6) - (t, flow 2)
% (col7, col8) - (t, pressure 1)
% (col9, col10) - (t, pressure 2)
% (col11, col12) - (t, pressure 3)
% (col13, col14) - (t, pressure 4)
% (col15, col16) - (t, pressure 5)
% (col17, col18) - (t, pressure 6)
% (col19, col20) - (t, pto force)

% Saving data to a structure
cargo_data = {};

% Displacement
cargo_data.disp.t = A(:,1);
cargo_data.disp.s = A(:,2);

% Flow 1
cargo_data.flow(1).t = A(:,3);
cargo_data.flow(1).q = A(:,4);

% Flow 2
cargo_data.flow(2).t = A(:,5);
cargo_data.flow(2).q = A(:,6);

% Pressure 1
cargo_data.pressure(1).t = A(:,7);
cargo_data.pressure(1).p = A(:,8);

% Pressure 2
cargo_data.pressure(2).t = A(:,9);
cargo_data.pressure(2).p = A(:,10);

% Pressure 3
cargo_data.pressure(3).t = A(:,11);
cargo_data.pressure(3).p = A(:,12);

% Pressure 4
cargo_data.pressure(4).t = A(:,13);
cargo_data.pressure(4).p = A(:,14);

% Pressure 5
cargo_data.pressure(5).t = A(:,15);
cargo_data.pressure(5).p = A(:,16);

% Pressure 6
cargo_data.pressure(6).t = A(:,17);
cargo_data.pressure(6).p = A(:,18);

% PTO force
cargo_data.pto.t = A(:,19);
cargo_data.pto.F = A(:,20);

% Alternate Cargo Fpto calculation
t1 = cargo_data.pressure(1).t;
p1 = cargo_data.pressure(1).p;

t2 = cargo_data.pressure(2).t;
p2 = cargo_data.pressure(2).p;

valid2 = isfinite(t2) & isfinite(p2);
t2 = t2(valid2);
p2 = p2(valid2);

% Interpolate p2 onto t1
p2_interp = interp1(t2, p2, t1, 'linear', 'extrap');

% Now subtraction is valid
cargo_data.pto.Fp = 1e5 * Ap * (p1 - p2_interp);
cargo_data.pto.Tp = t1;

%% Save
save('cargo_data.mat','cargo_data');
