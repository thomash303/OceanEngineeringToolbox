
% 
% t1 = cargo_data.pressure(1).t;
% p1 = cargo_data.pressure(1).p;
% 
% t2 = cargo_data.pressure(2).t;
% p2 = cargo_data.pressure(2).p;
% 
% 
% valid2 = isfinite(t2) & isfinite(p2);
% t2 = t2(valid2);
% p2 = p2(valid2);
% 
% % Interpolate p2 onto t1
% p2_interp = interp1(t2, p2, t1, 'linear', 'extrap');
% 
% % Now subtraction is valid
% Fpto_exp = 1e5 * Ap * (p1 - p2_interp);
% 
% plot(t1, Fpto_exp, 'DisplayName','exp Fpto')


t1 = oet_cargo_data.time;
p1 = oet_cargo_data.p1;
p2 = oet_cargo_data.p2;



valid2 = isfinite(t2) & isfinite(p2);
t2 = t2(valid2);
p2 = p2(valid2);

% Interpolate p2 onto t1
p2_interp = interp1(t2, p2, t1, 'linear', 'extrap');

% Now subtraction is valid
Fpto_exp = 1e5 * Ap * (p1 - p2_interp);

plot(t1, Fpto_exp, 'DisplayName','exp Fpto')