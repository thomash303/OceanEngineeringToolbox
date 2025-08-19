classdef windTurbine
    % windTurbine Class for wind turbine blade and aero properties
    
    properties
        % Blade geometry
        Rr              % Rotor radius [m]
        Rh              % Hub radius [m]
        Rb              % Radial positions [m] (1 x nBE)
        chord           % Chord distribution [m] (1 x nBE)
        twist           % Twist distribution [rad] (1 x nBE)
        pitch           % Pitch angle [m]

        % Rotor configuration
        nB              % Number of blades
        nBE             % Number of blade elements
        nDoF            % Number of translational degrees of freedom
        sigma           % Solidity distribution (1 x nBE)
        n               % Rotor shaft axis unit vector

        % Generator parameters
        omega           % angular velocity [rad/s]


        % Influence length
        dr;
    end
    

    methods
        function obj = windTurbine(Rr, Rh, Rb, chord, twist, pitch, nB, nBE, nDoF, RPM, n)
            % Constructor for windTurbine class
            % Inputs:
            %   Rr          - Rotor radius [m]
            %   Rh          - Hub radius [m]
            %   Rb          - Radial positions array [m]
            %   chord       - Chord distribution array [m]
            %   twist       - Twist distribution array [deg]
            %   pitch       - Pitch angle [rad]
            %   nB          - Number of blades
            %   nBE         - Number of blade elements
            %   nDoF        - Number of translational DoFs
            %   nDoF        - Number of translational DoFs
            %   RPM         - Angular speed [RPM]
            %   n           - rotor shaft axis unit vector

            obj.Rr = Rr;
            obj.Rh = Rh;
            obj.Rb = Rb;
            obj.chord = chord;
            obj.twist = twist * pi / 180;
            obj.pitch = pitch;
            obj.nB = nB;
            obj.nBE = nBE;
            obj.nDoF = nDoF;
            obj.omega = RPM * 2 * pi / 60;
            obj.n = n;

            % Compute solidity
            obj.sigma = chord .* nB ./ (2 * pi * Rb);


            % Compute influence lengths
            obj.dr = zeros(1, nBE);
            % Root
            obj.dr(1) = (obj.Rb(2) - obj.Rb(1)) / 2;
            
            % Interior stations
            for i = 2:nBE-1
                obj.dr(i) = (obj.Rb(i+1) - obj.Rb(i-1)) / 2;
            end
            
            % Tip
            obj.dr(nBE) = (obj.Rb(obj.nBE) - obj.Rb(obj.nBE-1)) / 2;
        end
    
    end
end



