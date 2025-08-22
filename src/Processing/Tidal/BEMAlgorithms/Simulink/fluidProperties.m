classdef fluidProperties
    % Class with fluid properties
    
    properties
        rho        % Air density [kg/m^3]
        kinVisc    % Kinematic viscosity [m^2/s]
    end

    methods
        function obj = fluidProperties(rho, kinVisc)
            % Inputs:
            %   rho        - Air density [kg/m^3]
            %   kinVisc    - Kinematic viscosity [m^2/s]

            obj.rho = rho;
            obj.kinVisc = kinVisc;
        end
    end
end