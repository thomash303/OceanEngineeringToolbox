classdef incomingWind
    % incomingWind Class to represent incoming wind speed at blade elements
    % Simple model for now; can be expanded with spatial/temporal variations
    
    properties
        windSpeed_nom  % Nominal (baseline) wind speed [m/s]
    end

    methods
        function obj = incomingWind(windSpeed_nom)
            % Constructor: initialize nominal wind speed
            obj.windSpeed_nom = windSpeed_nom;
        end

        function windSpeed = getWindSpeed(obj, rb_1)
            % getWindSpeed Returns the wind speed vector at element position rb_1
            % For now, wind is along z with a small linear variation in z-position
            %
            % Inputs:
            %   rb_1 - Blade position vector in frame 1 [3x1]
            %
            % Outputs:
            %   windSpeed - Wind velocity vector [3x1]

            % this isn't an actual function, I will need to implement the
            % power law here
            windSpeed = [obj.windSpeed_nom; obj.windSpeed_nom; obj.windSpeed_nom];
        end
    end
end