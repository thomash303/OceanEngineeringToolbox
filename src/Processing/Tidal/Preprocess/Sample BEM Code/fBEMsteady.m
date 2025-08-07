function [RES] = fBEMsteady(WT, Sim, Wind, Algo)
% fBEMsteady: steady Blade Element Momentum (BEM) method implementation
% Author: E. Branlard
%
% Inputs:
%   WT   - Wind turbine structure with rotor properties
%   Sim  - Simulation parameters (density, viscosity, pitch, RPM)
%   Wind - Wind conditions (incoming velocity)
%   Algo - Algorithm options (iterations, tolerance, tip loss)
%
% Outputs:
%   RES - Struct containing aerodynamic loads and performance coefficients

% --- Extract parameters ---
V0 = Wind.V0;                % Incoming wind [m/s]
rho = Sim.rho;               % Air density [kg/m^3]
KinVisc = Sim.KinVisc;       % Kinematic viscosity [m^2/s]
pitch = Sim.PITCH;           % Pitch angle [rad]
Omega = Sim.RPM * 2 * pi/60; % Rotor angular speed [rad/s]

% Rotor geometry
nB = WT.Rotor.nB;            % Number of blades
R = WT.Rotor.R;              % Rotor radius [m]
r = WT.Rotor.r;              % Radial positions [m] (1 x ne)
chord = WT.Rotor.chord;      % Chord distribution [m]
twist = WT.Rotor.twist;      % Twist distribution [rad]

% Algorithm options
nbIt = Algo.nbIt;            % Max iterations
aTol = Algo.aTol;            % Axial induction tolerance
bTipLoss = Algo.BEM.bTipLoss; % Apply tip losses? (true/false)

% Derived parameters
lambda_r = Omega * r / V0;   % Local tip-speed ratio
sigma = chord .* nB ./ (2 * pi * r); % Solidity

% Initialize results
ne = length(r);
RES.Pn = zeros(1, ne);       % Normal force per length
RES.Pt = zeros(1, ne);       % Tangential force per length

% Loop over blade elements
for e = 1:ne
    % Initial guesses
    a = 0;
    aprime = 0;
    
    for i = 1:nbIt
        % Step 1: Velocity components at blade element
        Ut = Omega * r(e) * (1 + aprime);
        Un = V0 * (1 - a);
        Vrel_norm = sqrt(Un^2 + Ut^2);
        Re = Vrel_norm * chord(e) / KinVisc; % Reynolds number
        
        % Step 2: Flow angle
        phi = atan2(Un, Ut); % radians
        if imag(phi) ~= 0
            fprintf('Algorithm failed: r=%.2f\n', r(e));
            break;
        end
        
        % Step 3: Tip loss correction
        F = fTipLoss(nB, r(e), R, phi, bTipLoss);
        
        % Step 4: Angle of attack
        alpha = phi - (twist(e) + pitch);
        
        % Step 5: Airfoil coefficients
        [Cl, Cd] = fAeroCoeff(alpha, Re);
        
        % Step 6: Normal and tangential force coefficients
        cn = Cl * cos(phi) + Cd * sin(phi);
        ct = Cl * sin(phi) - Cd * cos(phi);
        
        % Local thrust and torque coefficients
        Ct = (Vrel_norm^2 / V0^2) * sigma(e) * cn;
        Cq = (Vrel_norm^2 / V0^2) * sigma(e) * ct;
        
        % Step 7: Induction coefficient update
        a_last = a;
        aprime_last = aprime;
        [a, aprime] = fInductionCoefficients(a_last, Ct, Cq, F, lambda_r(e));
        
        % Step 8: Check convergence
        if (i > 3) && (abs(a - a_last) + abs(aprime - aprime_last) < aTol)
            break;
        end
    end
    
    if i == nbIt
        fprintf('Maximum iterations reached at r=%.2f\n', r(e));
    end
    
    % Step 9: Aerodynamic forces per length (with drag)
    RES.Pn(e) = 0.5 * rho * Vrel_norm^2 * chord(e) * cn;
    RES.Pt(e) = 0.5 * rho * Vrel_norm^2 * chord(e) * ct;
end

% Aggregate rotor loads and performance
RES.Thrust = nB * trapz(r, RES.Pn);
RES.Power = nB * trapz(r, r .* RES.Pt) * Omega;
RES.CP = RES.Power / (0.5 * rho * V0^3 * pi * R^2);
RES.CT = RES.Thrust / (0.5 * rho * V0^2 * pi * R^2);

end


%% Sub-functions below

function F = fTipLoss(nB, r, R, phi, bTipLoss)
% Compute tip loss factor using Prandtl's model (minimal example)
F = 1;
if bTipLoss && (sin(phi) > 0.01)
    F = 2/pi * acos(exp(-nB/2 * (R - r) / (r * sin(phi))));
end
end

function [Cl, Cd] = fAeroCoeff(alpha, Re)
% Compute aerodynamic coefficients (minimal inviscid example)
Cl = 2 * pi * sin(alpha);
Cd = 0;
end

function [a, aprime] = fInductionCoefficients(a_last, Ct, Cq, F, lambda_r)
% Compute axial and tangential induction with simple relaxation and correction

[a, Ct] = fCorrectionHighThrust(Ct, F);
% Relax axial induction (steady simulation)
relaxation_factor = 0.3;
a = relaxation_factor * a + (1 - relaxation_factor) * a_last;

aprime = Cq / (4 * F * (1 - a) * lambda_r);
end

function [a, Ct] = fCorrectionHighThrust(Ct, F)
% High-thrust correction polynomial (minimal example)
k = [0.00, 0.251163, 0.0544955, 0.0892074];
Ctb = Ct / F;
a = k(4) * Ctb.^3 + k(3) * Ctb.^2 + k(2) * Ctb + k(1);
end
