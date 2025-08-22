classdef aeroCorrections < handle
    % Class with functions for the different correction factors
    
    properties
        % Correction factor inclusion
        prandtlCorrection % Enable/disable prandtl correction (bool)
        prandtlTipLoss    % Enable/disable tip loss (bool)
        prandtlHubLoss    % Enable/disable hub loss (bool)
        glauertCorrection % Enable/disable thrust correction (bool)
        dynamicStall      % Enable/disable dynamic stall (bool)
        dynamicWake       % Enable/disable dynamic wake (bool)
        skewedWake        % Enable/disable skewed wake yaw (bool)

        ac                % Critical Glauert value (default: 1/3)

        % Aerodynamic coefficients
        alphaCoef       % Angles of attack (vector)
        liftCoef        % Lift coefficient (vector)
        dragCoef        % Drag coefficient (vector)
        
        % Airfoil data
        polarData       % Data loaded from airfoil file

        % Dynamic stall
        f_last = 0      % Separation function from previous time-step
        linThresh       % Linearity threshold for linear region of lift coefficient

        % Linear lift region boundaries
        alpha_neg_linReg % Negative angle of attack at end of linear lift region [deg]
        CL_neg_linReg    % Lift coefficient at negative linear region boundary [-]
        alpha_pos_linReg % Positive angle of attack at end of linear lift region [deg]
        CL_pos_linReg    % Lift coefficient at positive linear region boundary [-]
        linearSlope      % Slope of lift curve in linear region [-/deg]

        % Wind object
        wind
        
        % Rot object
        rot

        % Turb object
        turb
        r_over_R_idx = 0
        k = 0;
        psi0 = 0;

    end
    
    methods

        function obj = aeroCorrections(prandtlCorrection, prandtlTipLoss,  prandtlHubLoss, glauertCorrection, dynamicStall, dynamicWake, skewedWake, ac, polarData, linThresh, wind, rot, turb)
            % Constructor to initialize aerodymamic corrections 
            % Inputs must be provided explicitly
            % Inputs:
            % prandtlCorrection - Enable/disable prandtl correction (bool)
            % prandtlTipLoss    - Enable/disable tip loss (bool)
            % prandtlHubLoss    - Enable/disable hub loss (bool)
            % glauertCorrection - Enable/disable thrust correction (bool)
            % dynamicStall      - Enable/disable dynamic stall (bool)
            % dynamicWake       - Enable/disable dynamic wake (bool)
            % skewedWake        - Enable/disable skewed wake (bool)
            % ac                - Critical Glauert value (default: 1/3)
            % polarData         - File path to airfoil data
            % linThresh         - Linear threshold for linear region of lift coefficient

            obj.prandtlCorrection = prandtlCorrection;
            obj.prandtlTipLoss = prandtlTipLoss;
            obj.prandtlHubLoss = prandtlHubLoss;
            obj.glauertCorrection = glauertCorrection;
            obj.dynamicStall = dynamicStall;
            obj.dynamicWake = dynamicWake;
            obj.skewedWake = skewedWake;

            obj.ac = ac;
            
            % Aerodynamic coefficients
            obj.polarData = polarData;

            % Read coefficient curves
            obj.alphaCoef = obj.polarData.data(:,1); % first column = alpha
            obj.liftCoef  = obj.polarData.data(:,2); % second column = CL
            obj.dragCoef  = obj.polarData.data(:,3); % third column = CD

            % Dynamic stall
            obj.linThresh = linThresh;      

            % Compute linear lift region once at initialization
            [obj.CL_neg_linReg, obj.alpha_neg_linReg, obj.CL_pos_linReg, obj.alpha_pos_linReg, ...
             obj.linearSlope] = obj.ffindLinearLiftRegion();

            % Wind
            obj.wind = wind;
            obj.wind.towerShadow = false; % is aligned with hub so does not exist here

            % Rot
            obj.rot = rot;

            % Turb
            obj.turb = turb;
            r_over_R = obj.turb.Rb ./ obj.turb.Rr;              
            [~, obj.r_over_R_idx] = min(abs(r_over_R - 0.7)); % index of element closest to 0.7


        end
        
        function Fp = fprandtlCorrection(obj, nB, Rr, Rh, Rb, phi)
            % fprandtlCorrection Compute the Prandtl correction
            % Inputs:
            %   nb  - Number of blades
            %   Rr  - Rotor radius [m]
            %   Rh  - Hub radius [m]
            %   Rb  - Blade element radius [m]
            %   phi - Flow angle [m]

            % Outputs:
            %   Fp   - Prandtl correction


            Ftip = fprandtlTipCorrection(obj, nB, Rr, Rb, phi);
            Fhub = fprandtlHubCorrection(obj, nB, Rh, Rb, phi);

            if obj.prandtlCorrection
                Fp = Ftip * Fhub;
            else
                Fp = 1;
            end
        end

        function Ftip = fprandtlTipCorrection(obj, nB, Rr, Rb, phi)
            % fprandtlTipCorrection Compute the Prandtl tip correction
            % Inputs:
            %   nb   - Number of blades
            %   Rr   - Rotor radius [m]
            %   Rb   - Blade element radius [m]
            %   phi  - Flow angle [m]

            % Outputs:
            %   Ftip - Prandtl tip correction

            if obj.prandtlTipLoss
                ftip = -nB/2 * (Rr - Rb) / (Rb * sin(phi));
                Ftip = 2/pi * acos(exp(ftip));
            else
                Ftip = 1;
            end
        end

        function Fhub = fprandtlHubCorrection(obj, nB, Rh, Rb, phi)
            % fprandtlHubCorrection Compute the Prandtl correction
            % Inputs:
            %   nb   - Number of blades
            %   Rh   - Hub radius [m]
            %   Rb   - Blade element radius [m]
            %   phi  - Flow angle [m]

            % Outputs:
            %   Fhub - Prandtl hub correction

            if obj.prandtlHubLoss
                fhub = -nB/2 * (Rb - Rh) / (Rb * sin(phi));
                Fhub = 2/pi * acos(exp(fhub));
            else
                Fhub = 1;
            end
        end

        function Fg = fglauertCorrection(obj, a)
            % fglauertCorrection Compute the Glauert thrust correction with
            % the Wilson and Walker method
            % Inputs:
            %   a  - Axial induction factor

            % Outputs:
            %   Fp   - Glauert's correction

            if obj.glauertCorrection && a > obj.ac
                aca = obj.ac / a;
                Fg = aca * (2 - aca);
            else
                Fg = 1;
            end
        end

        function gamma = fskewedWake(obj, psi, W_prev, inB, inBE)
            % fskewedWake Compute the Glauert skewed wake correction
            % Inputs:
            %   psi    - Azimuthal angle (rad)
            %   W_prev - Previous induced velocity (1x1xnBxnBE) [m/s]
            %   inB    - Current blade index
            %   inBE   - Current blade element index

            % Outputs:
            %   gamma   - skewed wake correction


            % only needed for blade 1, and has some consideration over
            % element to update these parameters

            if obj.skewedWake
                if inB == 1
                    Hhub_rel = [0; 0; 0]; % Height of hub relative to hub
                    V0_1 = obj.wind.fgetWindSpeed(Hhub_rel);
                    V0_2 = obj.rot.R12 * V0_1;
                    obj.psi0 = atan2(V0_2(2), V0_2(1));

                    % Extract the idx-th nBE for all nB
                    slice = W_prev(:, :, :, obj.r_over_R_idx);  % now shape is (1 x 1 x nB x inBE)
                    
                    % Remove singleton dims and take average over nB
                    obj.rot.updateAzimuthal(psi);
                    Wmean_4 = [0; 0; mean(squeeze(slice), 1)];  
                    Wmean_2 = (obj.rot.R34 * obj.rot.R23)' * Wmean_4;
                    Vprime =  V0_2 + Wmean_2;

                    khi = acos(dot(obj.turb.n, Vprime) / cos(psi - obj.psi0));

                    obj.k = tand(khi / 2);
                end
                
                gamma = 1 + obj.k * obj.turb.Rb(inBE) / obj.turb.Rr * cos(psi - obj.psi0);

            else
                gamma = 1;
            end
        end

        function CLdy = fdynamicStall(obj, alphaR, CLst, dt, chord, Vrel)
            % fdynamicStall Compute the Oye dynamic stall model (trailing
            % edge correction only)
            % Inputs:
            %   alpha - Angle of attack (rad)
            %   CLst   - static lift coefficient
            %   dt     - step size
            %   chord  - local chord length
            %   Vrel   - Vrel

            % Outputs:
            %   CLdy   - dynamic lift coefficient 

            % should move faerocoeff into cor class

            if obj.dynamicStall

                alpha = alphaR * 180 / pi;
                CL_inv = obj.flinearExtrapolatedLift(alpha);

                fst = min((2 * sqrt(abs(CLst / CL_inv))), 1);

                tau = 4 * chord / norm(Vrel);
    
                f = fst + (obj.f_last - fst) * exp(-dt / tau);

                tol = 1e-6; % tolerance for "close to 1"

                if abs(fst - 1) < tol
                    CLfs = CLst / 2;
                else
                    CLfs = CLst - fst * CL_inv / (1 - fst);
                end
    
                CLdy = f * CL_inv + (1 - f) * CLfs;
    
                obj.f_last = f;

            else
                CLdy = CLst;
            end

        end

        function [Cl, Cd] = fAeroCoeff(obj, alphaR, Re)
            % fAeroCoeff Compute lift and drag coefficients from angle of attack
            % Inputs:
            %   alphaR - Angle of attack (rad)
            %   Re    - Reynolds number (unused for now)-
            % Outputs:
            %   Cl    - Lift coefficient
            %   Cd    - Drag coefficient
            
            % can use Re to peform a 2D interpolation with alpha if
            % desired, only changes required would be to modify
            % pre-processing file to add call multiple data files,
            % restructure data format, and then perform a 2D interpolation
            % adding Re into the function

            alpha = alphaR * 180 / pi;

            % % Check for extrapolation
            % if alpha < min(obj.alphaCoef) || alpha > max(obj.alphaCoef)
            %     warning('fAeroCoeff: Extrapolating lift/drag coefficients at alpha = %.2f deg', alpha);
            % end

            Cl = interp1(obj.alphaCoef, obj.liftCoef, alpha, 'linear', 'extrap');
            Cd = interp1(obj.alphaCoef, obj.dragCoef, alpha, 'linear', 'extrap');
        end 

        function [CL_neg_linReg, alpha_neg_linReg, CL_pos_linReg, alpha_pos_linReg, linearSlope]  = ffindLinearLiftRegion(obj)
            % ffindLinearLiftRegion Compute the linear lift region
            % Outputs:
            %   alpha_neg_linReg - Negative angle of attack at end of linear lift region [deg]
            %   CL_neg_linReg    - Lift coefficient at negative linear region boundary [-]
            %   alpha_pos_linReg - Positive angle of attack at end of linear lift region [deg]
            %   CL_pos_linReg    - Lift coefficient at positive linear region boundary [-]
            %   linearSlope      - Slope of lift curve in linear region [-/deg]
        
            % Compute slope between points
            dCL_dAlpha = diff(obj.liftCoef) ./ diff(obj.alphaCoef);
            
            % Estimate initial slope from small angles near 0 (+- 2 deg)
            smallAngle = 2;
            linearSlope = mean(dCL_dAlpha(obj.alphaCoef(1:end-1) >= -smallAngle & obj.alphaCoef(1:end-1) <= smallAngle));
            
            % Threshold to detect deviation
            threshold = obj.linThresh * linearSlope;
            
            % Positive break
            posIdx = find(dCL_dAlpha(obj.alphaCoef(1:end-1) > 0) < threshold, 1, 'first');
            posIdx = posIdx + find(obj.alphaCoef > 0, 1) - 1; % adjust index to match alpha
            alpha_pos_linReg = obj.alphaCoef(posIdx);
            CL_pos_linReg    = obj.liftCoef(posIdx);
            
            % Negative break
            negIdx = find(dCL_dAlpha(obj.alphaCoef(1:end-1) < 0) < threshold, 1, 'last');
            alpha_neg_linReg = obj.alphaCoef(negIdx);
            CL_neg_linReg    = obj.liftCoef(negIdx);
        end


        function CL_inv = flinearExtrapolatedLift(obj, alpha)
            % flinearExtrapolatedLift Extrapolate the linear lift region
            % Inputs:
            %   alpha  - Angle of attack (deg)
            % Outputs:
            %   CL_inv - Lift coefficient for inviscid flow without separation

            % Linear lift law: CL = slope * alpha + intercept
            % Intercept from origin: assume alpha=0 -> CL=0
            intercept = 0;  
        
            if alpha > obj.alpha_pos_linReg
                % Positive side extrapolation
                CL_inv = obj.linearSlope * alpha + intercept;
            elseif alpha < obj.alpha_neg_linReg
                % Negative side extrapolation
                CL_inv = obj.linearSlope * alpha + intercept;
            else
                % Within linear region — just use polar value
                CL_inv = interp1(obj.alphaCoef, obj.liftCoef, alpha, 'linear', 'extrap');
            end
        end

        function [W, Wint] = fdynamicWake(obj, V0, Wqs, Wqs_prev, Wint_prev, W_prev, a, Rr, Rb, dt)
            % fdynamicWake Compute the dynamic wake velocity at a single time-step

            % Inputs:
            %   V0       - Incoming wind velocity (1x3) [m/s]
            %   Wqs      - Quasi-steady induced velocity (1x3) [m/s]
            %   Wqs_prev - Previous quasi-steady induced velocity (1x3) [m/s]
            %   Wint_prev- Previous intermediate induced velocity (1x3) [m/s]
            %   W_prev   - Previous induced velocity (1x3) [m/s]
            %   a        - Axial induction factor at this blade element
            %   Rr       - Rotor radius [m]
            %   Rb       - Local blade element radius [m]
            %   dt       - Time step size [s]
            
            % Outputs:
            %   W   - Updated wake velocity (1x3) [m/s]
            %   Wint- Intermediate induced velocity (1x3) [m/s]

            if obj.dynamicWake
                % Compute time constants
                tau1 = 1.1 / (1 - 1.3 * min(a, 0.5)) * Rr / norm(V0);
                tau2 = (0.39 - 0.26 * (Rb / Rr)^2) * tau1;
        
                % Intermediate step
                H = Wqs + 0.6 * tau1 * (Wqs - Wqs_prev) / dt;
        
                % Internal wake
                Wint = H + (Wint_prev - H) * exp(-dt / tau1);
        
                % Final wake
                W = Wint + (W_prev - Wint) * exp(-dt / tau2);
            else
                Wint = zeros(3,1);
                W = Wqs;
            end
        end


    end
end


