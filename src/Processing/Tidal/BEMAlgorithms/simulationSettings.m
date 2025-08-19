classdef simulationSettings
    % simulationSettings Class to store simulation time parameters
    
    properties
        dt           % Time step size [s]
        t_end        % End time [s]
        time         % Time vector [s]
        N            % Number of time steps

    end

    methods
        function obj = simulationSettings(dt, t_end)
            % Constructor to initialize simulation settings
            % Inputs must be provided explicitly
            
            % Inputs:
            %   dt      - Time step size [s]
            %   t_end   - End time [s]
            
            obj.dt = dt;
            obj.t_end = t_end;

            obj.time = 0:dt:t_end;
            obj.N = length(obj.time);
        end
    end
end