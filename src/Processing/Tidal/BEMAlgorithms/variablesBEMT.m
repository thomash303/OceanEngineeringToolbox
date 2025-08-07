classdef variablesBEMT
    properties
        %% Initializing BEMT parameters (time, blade, blade element)
        a
        ap
        phi

        %% Steady BEMT
        Ut
        Un
        Vrel_s_norm
        Re
        alpha
        cn
        ct
        Ct
        Cq

        %% Unsteady BEMT (time, nDoF, blade element)
        rb_4
        rb_1
        Wqs_y
        Wqs_z
        Wqs
        W0
        V0_1
        V0_3
        V0_4
        Vrot_4
        Velas_4
        Vrel_4
        lambda

        Wn_3
        Wn_4
        nnW_3
        n
        v_prime_indiction_3
        Wint

        %% Loads
        D
        L

        %% Time Constants (Hansen)
        tau1
        tau2

        %% Aerodynamic Loads
        fy
        fz
        fthrust
        torque
        power

        %% Inputs 
        N
        nB
        nBE
        nDoF

    end

    methods
        function obj = variablesBEMT(N, nB, nBE, nDoF)
            % Initialize all variables with zeros of the correct sizes

            % Initializing BEMT parameters (time, blade, blade element)
            obj.a = zeros(N, nB, nBE);
            obj.ap = zeros(N, nB, nBE);
            obj.phi = zeros(N, nB, nBE);

            % Steady BEMT
            obj.Ut = zeros(N, nB, nBE);
            obj.Un = zeros(N, nB, nBE);
            obj.Vrel_s_norm = zeros(N, nB, nBE);
            obj.Re = zeros(N, nB, nBE);
            obj.alpha = zeros(N, nB, nBE);
            obj.cn = zeros(N, nB, nBE);
            obj.ct = zeros(N, nB, nBE);
            obj.Ct = zeros(N, nB, nBE);  
            obj.Cq = zeros(N, nB, nBE);

            % Unsteady BEMT
            obj.rb_4 = zeros(N, nDoF, nB, nBE);
            obj.rb_1 = zeros(N, nDoF, nB, nBE);
            obj.Wqs_y = zeros(N, nB, nBE);
            obj.Wqs_z = zeros(N, nB, nBE);
            obj.Wqs = zeros(N, nDoF, nB, nBE);
            obj.W0 = zeros(N, nDoF, nB, nBE);
            obj.V0_1 = zeros(N, nDoF, nB, nBE);
            obj.V0_3 = zeros(N, nDoF, nB, nBE);
            obj.V0_4 = zeros(N, nDoF, nB, nBE);
            obj.Vrot_4 = zeros(N, nDoF, nB, nBE);
            obj.Velas_4 = zeros(N, nDoF, nB, nBE);
            obj.Vrel_4 = zeros(N, nDoF, nB, nBE);
            obj.lambda = zeros(N, nB, nBE);

            obj.Wn_3 = zeros(N, nDoF, nDoF, nB, nBE);
            obj.Wn_4 = zeros(N, nDoF, nDoF, nB, nBE);
            obj.nnW_3 = zeros(N, nDoF, nDoF, nB, nBE);
            obj.n = [0; 0; -1];  % Unit vector (constant)
            obj.v_prime_indiction_3 = zeros(N, nDoF, nDoF, nB, nBE);
            obj.Wint = zeros(N, nDoF, nB, nBE);

            % Loads
            obj.D = zeros(N, nB, nBE);
            obj.L = zeros(N, nB, nBE);

            % Time Constants (Hansen)
            obj.tau1 = zeros(N, nB, nBE);
            obj.tau2 = zeros(N, nB, nBE);

            % Aerodynamic Loads
            obj.fy = zeros(N, nB, nBE);
            obj.fz = zeros(N, nB, nBE);
            obj.fthrust = zeros(N, nB, nBE);
            obj.torque = zeros(N, nB, nBE);
            obj.power = zeros(N, nB, nBE);
        end
    end
end
