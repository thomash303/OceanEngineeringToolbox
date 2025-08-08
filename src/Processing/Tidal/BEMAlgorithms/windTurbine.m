classdef windTurbine
    % windTurbine Class for wind turbine blade and aero properties
    
    properties
        % Blade geometry
        R               % Rotor radius [m]
        r               % Radial positions [m] (1 x nBE)
        chord           % Chord distribution [m] (1 x nBE)
        twist           % Twist distribution [rad] (1 x nBE)
        pitch           % Pitch angle [m]

        % Rotor configuration
        nB              % Number of blades
        nBE             % Number of blade elements
        nDoF            % Number of translational degrees of freedom
        sigma           % Solidity distribution (1 x nBE)
        n               % Rotor shaft axis unit vector
        
        % Aerodynamic coefficients
        alphaCoef       % Angles of attack (vector)
        liftCoef        % Lift coefficient (vector)
        dragCoef        % Drag coefficient (vector)
        
        % Airfoil data
        airfoilFile     % Filename (char)
        airfoilData     % Data loaded from airfoil file

        % Generator parameters
        omega           % angular velocity [rad/s]
    end
    

    methods
        function obj = windTurbine(R, r, chord, twist, pitch, nB, nBE, nDoF, RPM, n, airfoilFile)
            % Constructor for windTurbine class
            % Inputs:
            %   R           - Rotor radius [m]
            %   r           - Radial positions array [m]
            %   chord       - Chord distribution array [m]
            %   twist       - Twist distribution array [deg]
            %   pitch       - Pitch angle [rad]
            %   nB          - Number of blades
            %   nBE         - Number of blade elements
            %   nDoF        - Number of translational DoFs
            %   nDoF        - Number of translational DoFs
            %   RPM         - Angular speed [RPM]
            %   n           - rotor shaft axis unit vector
            %   airfoilFile - File path to airfoil data

            obj.R = R;
            obj.r = r;
            obj.chord = chord;
            obj.twist = twist * pi / 180;
            obj.pitch = pitch;
            obj.nB = nB;
            obj.nBE = nBE;
            obj.nDoF = nDoF;
            obj.omega = RPM * 2 * pi / 60;
            obj.n = n;
            obj.airfoilFile = airfoilFile;

            % Load airfoil data from text file
            try
                polarData = parseXFoilPolar(airfoilFile);
            catch ME
                error('Failed to load airfoil data from %s: %s', airfoilFile, ME.message);
            end

            % Read coefficient curves
            obj.alphaCoef = polarData.dataTable.alpha;
            obj.liftCoef  = polarData.dataTable.CL;
            obj.dragCoef  = polarData.dataTable.CD;


            % Compute solidity
            obj.sigma = chord .* nB ./ (2 * pi * r);
        end
    
        function [Cl, Cd] = fAeroCoeff(obj, alpha, Re)
            % fAeroCoeff Compute lift and drag coefficients from angle of attack
            % Inputs:
            %   alpha - Angle of attack (deg)
            %   Re    - Reynolds number (unused for now)
            % Outputs:
            %   Cl    - Lift coefficient
            %   Cd    - Drag coefficient
            
            % can use Re to peform a 2D interpolation with alpha if
            % desired, only changes required would be to modify
            % pre-processing file to add call multiple data files,
            % restructure data format, and then perform a 2D interpolation
            % adding Re into the function

            Cl = interp1(obj.alphaCoef, obj.liftCoef, alpha, 'linear');
            Cd = interp1(obj.alphaCoef, obj.dragCoef, alpha, 'linear');
        end   
    end
end



