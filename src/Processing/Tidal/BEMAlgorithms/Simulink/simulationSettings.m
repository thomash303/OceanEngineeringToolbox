classdef simulationSettings
    % simulationSettings Class to store simulation time parameters
    
    properties
        dt           % Time step size [s]

    end

    methods
        function obj = simulationSettings(dt, t_end)
            % Constructor to initialize simulation settings
            % Inputs must be provided explicitly
            
            % Inputs:
            %   dt      - Time step size [s]
            
            obj.dt = dt;
        end
    end
end