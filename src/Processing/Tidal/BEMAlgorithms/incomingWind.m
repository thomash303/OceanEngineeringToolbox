classdef incomingWind
    % incomingWind Class to represent incoming wind speed at blade elements
    % Simple model for now; can be expanded with spatial/temporal variations
    
    properties
        windSpeed_nom  % Nominal (baseline) wind speed at the hub in frame 1 [m/s]
        hhub_nom       % Nominal height of the hub (where windspeed is defined) in frame 1 [m]
        alphaPowerLaw  % Power law exponent
        a              % Tower radius [m]
        towerShadow    % Enable/disable tower shadow (bool)
    end

    methods
        function obj = incomingWind(windSpeed_nom, hhub_nom, alphaPowerLaw, a, towerShadow)
            % Constructor: initialize nominal wind speed
            obj.windSpeed_nom = windSpeed_nom;
            obj.hhub_nom = hhub_nom;
            obj.alphaPowerLaw = alphaPowerLaw;
            obj.a = a;
            obj.towerShadow = towerShadow;
        end

        function windSpeed = fgetWindSpeed(obj, rb_1)
            % fgetWindSpeed Returns the wind speed vector at element position rb_1
            % For now, wind is along z with a small linear variation in z-position
            %
            % Inputs:
            %   rb_1         - Blade position vector in frame 1 (3x1) [m]

            % Outputs:
            %   windSpeed    - Wind velocity vector in frame 1 (3x1) [m/s]

            % This formulation neglects any height change of the hub. The
            % wind speed at the hub height is entered, and then the
            % relative height of the blade element is used to compute the
            % current height. This neglects all of the dynamics from the
            % inertial frame to the hub.

            % (height of the blade relative to the hub, which is currently in x)
            rb_1_x = rb_1(1);

            % Absolute hub height
            H = obj.hhub_nom;

            % Absolute blade height
            z = rb_1_x + H;

            Vwind = obj.ftowerShade(rb_1);

            windSpeed = Vwind * (z / H) ^ obj.alphaPowerLaw;

        end

        function Vwind = ftowerShade(obj, rb_1)
            % ftowerShade accounts for the influence of the tower on the
            % wind
            % For now, wind is along z 

            % Inputs:
            %   rb_1         - Blade position vector in frame 1 (3x1) [m]

            % Outputs:
            %   Vwind        - Modified wind velocity vector in frame 1 (3x1) [m/s]

            if obj.towerShadow
                % Convert to polar coordinates
                y = rb_1(2);
                z = rb_1(3);
    
                r = sqrt(y^2 + z^2);
    
                cosTheta = z / r;
                sinTheta = -y / r;
            
                % Tower-induced radial and tangential velocities
                Vr = obj.windSpeed_nom * (1 - (obj.a^2)/(r^2)) * cosTheta;
                Vtheta = -obj.windSpeed_nom * (1 + (obj.a^2)/(r^2)) * sinTheta;
            
                % Transform back to Cartesian frame 1 
                Vwindx = 0;
                Vwindy = -Vr * sinTheta - Vtheta * cosTheta;
                Vwindz = Vr * cosTheta - Vtheta * sinTheta;

                Vwind = [Vwindx; Vwindy; Vwindz];
              
            else
                Vwind = [0; 0; obj.windSpeed_nom];

            end
        end
    end
end