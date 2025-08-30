classdef unsteadyBEMTSystem < matlab.System
    % unsteadyBEMTSystem Add summary here


    % Public, tunable properties
    properties

        % Simulation Settings
        dt = 0.01;                          % Time step [s]
        % --- This needs to be synched with the Simulink FIXED step size --- %

        % Fluid Properties
        rho = 1.225;                        % Air density [kg/m^3]
        kinVisc = 1.5e-5;                   % Kinematic viscosity [m^2/s]

        % Incoming Wind
        windSpeed_nom = 2;                  % Nominal (baseline) wind speed in frame 1 [m/s]
        hhub_nom = 25;                      % Nominal height of the hub (where windspeed is defined) in frame 1 [m] (this needs to be higher than most negative value of rb_1 or else incoming wind power law has a negative sqrt)     
        alphaPowerLaw = 1/5;                % Power law exponent
        betaBedRoughness = 1;               % Bed roughness coefficient
        a = 2;                              % Tower radius [m]
        towerShadow = true;                 % Enable/disable tower shadow (bool)

        % Coordinate Transformation
        yaw = 0;                            % yaw angle (deg)
        tilt = 0;                           % tilt angle (deg)
        cone = 5;                           % cone angle (deg) (needs to be nonzero for tower shadow model)
        
        % Aerodynamic Corrections
        prandtlCorrection = true;           % Enable/disable Prandtl correction (bool)
        prandtlTipLoss = true;              % Enable/disable tip loss (bool)
        prandtlHubLoss = true;              % Enable/disable hub loss (bool)
        glauertCorrection = true;           % Enable/disable Glauert correction (bool)
        dynamicStall = true;                % Enable/disable dynamic stall (bool)
        dynamicWake = true;                 % Enable/disable dynamic wake (bool)
        skewedWake = false;                 % Enable/disable skewed wake yaw model (bool)
        
        ac = 1/3;                           % Critical Glauert value (default: 1/3)
        
        % Wind Turbine
        
        % Blade geometry
        Rr = 20.5;                          % Rotor radius [m]
        Rh = 3.5;                           % hub radius [m]
        Rb = [4.5 5.5 6.5 7.5 8.5 9.5 10.5 11.5 12.5 13.5 14.5 15.5 16.5 17.5 18.5 19.5 20.3];  % Radial positions [m] (1 x nBE)
        chord = [1.63 1.597 1.540 1.481 1.420 1.356 1.294 1.229 1.163 1.095 1.026 0.955 0.881 0.806 0.705 0.545 0.265]; % Chord distribution [m] (1 x nBE)
        twist = [20.0 16.3 13.0 10.05 7.45 5.85 4.85 4.00 3.15 2.60 2.02 1.36 0.77 0.33 0.14 0.05 0.02]; % Twist distribution [deg] (1 x nBE)
        pitch = 0.01;                       % Pitch angle [rad]
        
        % Rotor configuration
        nB = 3;                             % Number of blades
        n = [0, 0, -1];                     % Rotor shaft axis unit vector

    end

    % Public, non-tunable properties
    properties (Nontunable)

        % Airfoil data
        linThresh = 0.85;                   % Linearity threshold for linear region of lift coefficient
        polarData = load('polarData.mat', 'polarData');       % Structure storing airfoil coefficient data

        % Rotor configuration
        nDoF = 3;                           % Translational DoF
    end

    % Pre-computed constants or internal states
    properties (Access = private)
        bemtObj;

    end

    methods (Access = protected)
        %% Common functions
        function setupImpl(obj)
            % Perform one-time calculations, such as computing constants

            % Simulation Settings
            Sim.dt = obj.dt;                        
            
            % Fluid Properties
            Fluid.rho = obj.rho;             
            Fluid.kinVisc = obj.kinVisc;        
            
            % Incoming Wind
            Wind.windSpeed_nom = obj.windSpeed_nom;               
            Wind.hhub_nom = obj.hhub_nom;                   
            Wind.alphaPowerLaw = obj.alphaPowerLaw;
            Wind.betaBedRoughness = obj.betaBedRoughness;
            Wind.a = obj.a;                           
            Wind.towerShadow = obj.towerShadow;              
            
            % Coordinate Transformation
            Rot.yaw = obj.yaw;               
            Rot.tilt = obj.tilt;               
            Rot.cone = obj.cone;               
            
            % Aerodynamic Corrections
            Cor.prandtlCorrection = obj.prandtlCorrection;               
            Cor.prandtlTipLoss = obj.prandtlTipLoss;                  
            Cor.prandtlHubLoss = obj.prandtlHubLoss;                  
            Cor.glauertCorrection = obj.glauertCorrection;            
            Cor.dynamicStall = obj.dynamicStall;             
            Cor.dynamicWake = obj.dynamicWake;         
            Cor.skewedWake = obj.skewedWake;                    
            
            Cor.ac = obj.ac;                            
            
            % Airfoil data
            Cor.polarData = obj.polarData.polarData;         
            Cor.linThresh = obj.linThresh;                       
            
            % Wind Turbine
            
            % Blade geometry
            Turb.Rr = obj.Rr;              
            Turb.Rh = obj.Rh;          
            Turb.Rb = obj.Rb;  
            Turb.chord = obj.chord; 
            Turb.twist = obj.twist; 
            Turb.pitch = obj.pitch;            
            
            % Rotor configuration
            Turb.nB = obj.nB;                
            Turb.nBE = length(obj.Rb);               
            Turb.nDoF = obj.nDoF;               
            Turb.n = obj.n;         

            obj.bemtObj = unsteadyBEMTSystemAlgorithm(Sim,Fluid,Wind,Rot,Cor,Turb);
        end

        function [Fz, Fy, Ty, Py] = stepImpl(obj, r0_1, RPM)
            % Implement algorithm. Calculate y as a function of input u and
            % internal or discrete states.

            % Update turbine angular speed
            obj.bemtObj.turb.omega = obj.bemtObj.turb.RPM2Omega(RPM);

           % Call BEMT algorithm object for a single time-step
            obj.bemtObj.stepSimulation();

            % Outputs
            Fz = obj.bemtObj.Fz;
            Fy = obj.bemtObj.Fy;
            Ty = obj.bemtObj.Ty;
            Py = obj.bemtObj.Py;
        end

        function resetImpl(obj)
            % Initialize / reset internal or discrete properties
        end

    end
end
