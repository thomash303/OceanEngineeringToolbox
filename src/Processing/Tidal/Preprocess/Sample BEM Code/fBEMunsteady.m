function [RES, WT] = fBEMunsteady(x, v, bUpdate, WT, Sim, Wind, Algo)
% fBEM: unsteady BEM code implementation
% Author: E. Branlard

% x and v speed and positions of degrees of freedom (DOF)
% [ code removed ]

[a12, a23, a34] = getTransfoMatrices(yaw, tilt, 0, Rotor.cone);
 
function [a12] = R12(yaw,tilt)
    
%%% Loop on blades
for idB = 1:nB
    psi = Vpsi(idB); % azimutal position of the blade

    % Transformation matrix
    a23 = [cos(psi) sin(psi) 0; -sin(psi) cos(psi) 0; 0 0 1];

    % [ code removed ]

    % loop on elements
    for e = 1:ne

        % --- Step 0: Relative wind
        % Cross section position
        rb_in4 = [r(e); 0; 0];
        rb_in1 = a41 * rb_in4;

        % Incoming wind (including tower effect, turbulence)
        V0_in1 = getIncomingWind(rb_in1, WT, Wind, Algo);
        V0_in4 = a14 * V0_in1;
        V0_in3 = a13 * V0_in1;
        V0_in4 = [0; V0_in4(2); V0_in4(3)]; % no x comp
        V0_in3 = [0; V0_in3(2); V0_in3(3)];

        % Velocity seen by the blade due to elasticity and rotation
        Vb_in4 = [0; -omega * r(e) * cos(Rotor.cone); 0];

        % blade speed
        Velast_in4 = a14 * [0; 0; 0 * -v(1)]; % nacelle displacement only

        % Relative speed speed (Change me if more DOF)
        Vrel_in4 = V0_in4 + WT.Aero.last.W(:, e, idB) + Vb_in4 + Velast_in4;

        lambda_r = omega * r(e) * cos(cone) / norm(V0_in3);

        % --- Step 1 to 5 [similar to steady BEM code]

        % --- Project axial induction to get a
        Wn_in4 = [0; 0; WT.Aero.last.W(3, e, idB)];
        Wn_in3 = a34' * Wn_in4;
        nnW_in3 = n_thrust_in3 .* (n_thrust_in3 .* Wn_in3);
        V_prime_induction_in3 = V0_in3 + nnW_in3;

        sign = 1;
        if V_prime_induction_in3(3) < 0
            sign = -1;
        end

        a = (norm(V0_in3) - sign * norm(V_prime_induction_in3)) / norm(V0_in3);

        % --- Step 6: Induction Coefficients from BEM
        [a, aprime] = fInductionCoefficients(a, Ct, Cq, F, lambda_r(e));

        % --- Step 7: Dynamic wake model
        W_y_qs = -omega * r(e) * aprime;
        W_z_qs = -norm(V0_in3) * a;
        W_qs(:, e, idB) = [0; W_y_qs; W_z_qs];

        if Algo.BEM.bDynaWake
            % Solving differential equation
            tau1 = 1.1 / (1 - 1.3 * min(a, 0.5)) * R / norm(V0_in4);
            tau2 = (0.39 - 0.26 * (r(e) / R)^2) * tau1;
            H = W_qs(:, e, idB) + 0.6 * tau1 * (W_qs(:, e, idB) - WT.Aero.last.W_qs(:, e, idB)) / Algo.dt;
            W_int(:, e, idB) = H + (WT.Aero.last.W_int(:, e, idB) - H) * exp(-Algo.dt / tau1);
            W0(:, e, idB) = W_int(:, e, idB) + (WT.Aero.last.W0(:, e, idB) - W_int(:, e, idB)) * exp(-Algo.dt / tau2);
        else
            % Using quasi-steady values
            W0(:, e, idB) = W_qs(:, e, idB);
        end

        % --- Step 8: Yaw model, repartition of the induced velocity
        if Algo.BEM.bYawModel
            if (e == Rotor.e_ref_for_khi && idB == 1)
                % psi0 determined based on incoming wind at hub
                V0_in1 = getIncomingWind(r_hub_in1, WT, Wind, Algo);
                V0_in2 = a12 * V0_in1;
                psi0 = atan2(V0_in2(2), V0_in2(1)) * 180 / pi;

                %%% Determination of skew angle
                meanWn_in4 = [0; 0; mean(W0(3, Rotor.e_ref_for_khi, :))];
                meanWn_in2 = a34' * meanWn_in4;
                V_prime_for_khi_in2 = V0_in2 + meanWn_in2;
                khi = acos(dot(n_rotor_in2, V_prime_for_khi_in2) / norm(V_prime_for_khi_in2));
            end
            W(:, e, idB) = W0(:, e, idB) * (1 + r(e) / R * tan(khi / 2) * cos(Vpsi(idB) - psi0));
        else
            W(:, e, idB) = W0(:, e, idB);
        end

        % --- Step 9: Aerodynamic Forces [similar to steady BEM code]

    end % loop on radial positions
end % loop on blades
