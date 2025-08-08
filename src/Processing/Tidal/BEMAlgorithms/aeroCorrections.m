classdef aeroCorrections
    % Class with functions for the different correction factors
    
    properties
        tipLoss          % Enable/disable tip loss (bool)
        thrustCorrection % Enable/disable thrust correction (bool)
        hubLoss          % Enable/disable hub loss (bool)
        dynamicStall     % Enable/disable dynamic stall (bool)
        dynamicWake      % Enable/disable dynamic wake (bool)
        yawModel         % Enable/disable yaw model (bool)

    end
    
    methods

        function obj = aeroCorrections(tipLoss, thrustCorrection, hubLoss, dynamicStall, dynamicWake, yawModel)
            % Constructor to initialize aerodymamic corrections 
            % Inputs must be provided explicitly

            obj.tipLoss = tipLoss;
            obj.thrustCorrection = thrustCorrection;
            obj.hubLoss = hubLoss;
            obj.dynamicStall = dynamicStall;
            obj.dynamicWake = dynamicWake;
            obj.yawModel = yawModel;

        end

        function F = ftipLoss(obj, nB, r, R, phi)
            % Compute tip loss factor using Prandtl's model (minimal example)
            F = 1;
            if obj.tipLoss && (sin(phi) > 0.01)
                F = 2/pi * acos(exp(-nB/2 * (R - r) / (r * sin(phi))));
            end
        end

        function fg = fthrustCorrection(obj, nB, r, R, phi)
            % Compute tip loss factor using Prandtl's model (minimal example)

            if obj.thrustCorrection
                if a
            else
                fg = 1;
            end
        end
    end
end


