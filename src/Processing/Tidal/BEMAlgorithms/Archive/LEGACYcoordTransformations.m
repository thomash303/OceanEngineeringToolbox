classdef coordTransformations
    % coordTransformations
    % Contains rotation matrices and composite rotations based on yaw, tilt, wing, cone angles.
    % Angles are in degrees.
    
    properties
        yaw   % yaw angle (deg)
        tilt  % tilt angle (deg)
        wing  % wing angle (deg)
        cone  % cone angle (deg)

        R12   % Rotation matrix from frame 1 to 2
        R23   % Rotation matrix from frame 2 to 3
        R34   % Rotation matrix from frame 3 to 4
        R13   % Rotation matrix from frame 1 to 3 (composite)
        R14   % Rotation matrix from frame 1 to 4 (composite)
    end
    
    methods
        % Constructor - must specify all angles explicitly
        function obj = coordTransformations(yaw, tilt, wing, cone)
            obj.yaw = yaw;
            obj.tilt = tilt;
            obj.wing = wing;
            obj.cone = cone;

            % Compute basic rotations
            obj.R12 = coordTransformations.zyxIntrin(obj.yaw, obj.tilt, 0);
            obj.R23 = coordTransformations.zyxIntrin(0, 0, obj.wing);
            obj.R34 = coordTransformations.zyxIntrin(0, obj.cone, 0);
            
            % Compute composite rotations
            obj.R13 = obj.R23 * obj.R12;
            obj.R14 = obj.R34 * obj.R23 * obj.R12;
        end
    end

    methods (Static)
        function Rx = xSimple(alpha)
            Rx = [1, 0, 0;
                  0, cosd(alpha), -sind(alpha);
                  0, sind(alpha),  cosd(alpha)];
        end
        
        function Ry = ySimple(beta)
            Ry = [cosd(beta), 0, sind(beta);
                  0,          1, 0;
                 -sind(beta), 0, cosd(beta)];
        end
        
        function Rz = zSimple(gamma)
            Rz = [cosd(gamma), -sind(gamma), 0;
                  sind(gamma),  cosd(gamma), 0;
                  0,           0,           1];
        end
        
        function R = zyxIntrin(alpha, beta, gamma)
            % Intrinsic ZYX rotation matrix (roll-pitch-yaw)
            % Equivalent to Rx(alpha)*Ry(beta)*Rz(gamma)
            R = coordTransformations.zSimple(gamma) * ...
                coordTransformations.ySimple(beta) * ...
                coordTransformations.xSimple(alpha);

            % r2 = R*r1; this gets same as online
            % r2 = R'*r1; % this gets the same as Modelica (which is taking
            % transpose R12 -> R21)


            % Since the transpose is the difference, they do represent the
            % same matrix, they just go in the opposite direction. Since
            % Modelica is intrinsic xyz, and I had to invert the rotation
            % sequence to zyx to match rotation here implies intrinsic xyz.
            % Further, Hansen does RzRyRz which is intrinsic zyx. I think
            % OrcaFlex does intrinsic xyz, so should be possible

        end
    end
end