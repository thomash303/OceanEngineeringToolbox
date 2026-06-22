function [q,T] = motor_eval(N,x,dp,Cs,Cv,Cf)
    % N - rpm
    % x - 
    % dp - Pa
    % Cs, Cv, Cf - 

    omega = N *2 * pi/ 60;
    D_in = 180; % motor displacement (cc/rev)
    D = D_in / 1e6;
    
    rho = 850; % fluid density (kg/m^3)
    
    nu_in = 50; % kinematic viscosity of the oil (cst/ cm^2/s)
    nu = nu_in / 1e6;
    mu = nu * rho;

    % Motor flow
    q_ls = Cs * D * dp / mu;
    q = x * D * omega / (2 * pi) - q_ls;
    
    % Motor torque
    T_ls = Cv * D * mu .* omega / (2 *pi) + Cf * D * dp;
    T = x * D * dp / (2*pi) - T_ls;
end