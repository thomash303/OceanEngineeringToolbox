within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces;

model MorisonForce 
  "Model representing the Morison force"

// currently only considering 1D excitation, could probably extend to 2D relatively easily

  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  import Modelica.Blocks.Interfaces;
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Mechanics.MultiBody.Frames;
  import Modelica.Math.Vectors.normalizeWithAssert;
  
  // Importing and extending from the OET
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels.*;
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.WaveModels.*;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    Placement(transformation(origin = {0, -200}, extent = {{-116, -16}, {-84, 16}}, rotation = -90), iconTransformation(extent = {{-116, -16}, {-84, 16}}, rotation = 90)));

  // Displacement connectors
  Interfaces.RealVectorInput u_abs[3] "Absolute translational position vector" annotation(
    Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {0, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
    
  // Velocity connectors
  Interfaces.RealVectorInput v_abs[3] "Translational velocity vector" annotation(
    Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-88, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Interfaces.RealVectorInput omega_abs[3] "Angular velocity vector" annotation(
    Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-46, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
    
  // Acceleration connectors
  Interfaces.RealVectorInput a_abs[3] "Translational acceleration vector" annotation(
    Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {44, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Interfaces.RealVectorInput alpha_abs[3] "Angular acceleration vector" annotation(
    Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {86, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  
  // Morison parameters
  parameter Integer nME = 2 "Number of Morison Morison elements";
  parameter SI.Position rME[3,nME] "Vector to the Morison element from the CG in the body frame";
  parameter Real nHatME[3,nME] "Orientation unit vector in the body frame";
  parameter Real Cd[3,nME] "Normal drag coefficients";
  parameter SI.Area AcME[3,nME] "Characteristic area";
  parameter SI.Area Adn[3,nME] "Normal drag area";
  parameter SI.Area Adt[3,nME] "Tangential drag area";
  parameter Real Cam[3,nME] "Normal added mass coefficients"; 
  parameter Real Camn[3,nME] "Normal added mass coefficients";
  parameter Real Camt[3,nME] "Tangential added mass coefficients";
  parameter SI.Volume VME[nME] "Displaced volume";

  replaceable NoCurrent currentModel constrainedby BaseCurrent  "Current profile" annotation(choices(choice(redeclare NoCurrent currentModel  "No current"), choice(redeclare ConstantCurrent currentModel "Constant current profile"), choice(redeclare LinearCurrent currentModel "Linear current profile"), choice(redeclare PowerLawCurrent currentModel "Power law current profile")),
    Placement(transformation(origin = {0, 44}, extent = {{-10, -10}, {10, 10}})));
  replaceable NoWaveKin waveModel constrainedby BaseWaveKin annotation(choices(choice(redeclare NoWaveKin waveModel "No wave kinematics"), choice(redeclare LinearWaveKin waveModel "Linear wave kinematics")),
    Placement(transformation(origin = {0, -28}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));
  Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector";
  
  // Fluid kinematics
  Interfaces.RealInput Uc[3,nME] "Current fluid velocity input";
  Interfaces.RealInput Uw[3,nME] "Wave fluid velocity input";
  SI.Velocity Uf[3,nME] "Combined wave and current fluid velocity";
  SI.Velocity UfT[3,nME] "Tangential component of the combined wave and current fluid velocity";
  SI.Velocity UfN[3,nME] "Normal component of the combined wave and current fluid velocity";
  Interfaces.RealInput UAw[3,nME] "Wave fluid acceleration input";
  SI.Velocity Af[3,nME] "Wave fluid acceleration";
  SI.Velocity AfT[3,nME] "Tangential component of the wave fluid acceleration";
  SI.Velocity AfN[3,nME] "Normal component of the wave fluid acceleration";

  SI.Force f_element[3];
  SI.Torque t_element[3];
  
  Real position[3] = u_abs "Translational position vector";
  Real velocity[6] = cat(1, v_abs, omega_abs) "Combined velocity vector";
  Real acceleration[6] = cat(1, a_abs, alpha_abs) "Combined acceleration vector";
  Interfaces.RealOutput positionME[3,nME] "Absolute translational position vector for all Morison elements";
  
  SI.Position rMEG[3,nME] "Vector to the Morison element from the CG in the global frame";
  Real nHatMEG[3,nME] "Orientation unit vector in the global frame";
  
  // Intermediate force components
  SI.Force fFK[3,nME] "Froude-Krylov force component";
  SI.Force fFKN[3,nME] "Froude-Krylov normal force component";
  // If doing
  SI.Force fFKT[3,nME] "Froude-Krylov tangential force component";  
  SI.Force fAM[3,nME] "Added mass force component"; 
  SI.Force fAMN[3,nME] "Added mass normal force component"; 
  // If doing
  SI.Force fAMT[3,nME] "Added mass tangential force component";
  SI.Force fI[3,nME] "Inertial force component";
  SI.Force fD[3,nME] "Drag force component";
  SI.Force fDN[3,nME] "Drag force normal component";
  SI.Force fDT[3,nME] "Drag force tangential component"; 
  SI.Force fME[3,nME] "Morison force";
  SI.Torque mME[3,nME] "Morison moment"; 
  Frames.Orientation R "Rotation orientation object between the global and body-fixed frames";
  
  // Morison element kinematics
  SI.Velocity UME[3,nME] "Velocity of the Morison elements";
  SI.Velocity UMEN[3,nME] "Normal velocity of the Morison elements";
  SI.Velocity UMET[3,nME] "Tangential velocity of the Morison elements";
  SI.Acceleration AME[3,nME] "Acceleration of the Morison elements"; 
  SI.Acceleration AMEN[3,nME] "Normal acceleration of the Morison elements";
  SI.Acceleration AMET[3,nME] "Tangential acceleration of the Morison elements";
  // Projected Area and coefficients?? (if doing)
  //SI.Area Aproj[3,nME] "Projected area in cylinder axis";
equation 
  // Need to first rotate r,n!!!!!!!!!!!!
  R = frame_a.R;
  Uf = currentModel.Uc;
  
  for i in 1:nME loop
    // Computing the global quantities from the body-fixed frame
    rMEG[:,i] = Frames.resolve1(R,rME[:,i]);
    nHatMEG[:,i] = Frames.resolve1(R,nHatME[:,i]);
    positionME[:,i] = position + rME[:,i];
    
    // Determining kinematics of the Morison element
    UME[:,i] = v_abs + cross(omega_abs,rMEG[:,i]);
    AME[:,i] = a_abs + cross(der(omega_abs),rMEG[:,i]) + cross(omega_abs,cross(omega_abs,rMEG[:,i]));
    
    /* The fluid and body kinematics are determined in the normal and tangential directions using vector projection. Since nHatME is given as a unit vector, its normalization is redundant (because it is already a unit vector); however, the original form of the equation is kept for clarity.*/
    
    // Projecting the fluid velocity in the tangential direction
    UfT[:,i] = (Uf[:,i] * normalizeWithAssert(nHatMEG[:,i])) * normalizeWithAssert(nHatMEG[:,i]);
    
    // Computing the normal fluid velocity component
    UfN[:,i] = Uf[:,i] - UfT[:,i];
    
    // Projecting the fluid acceleration in the tangential direction
    AfT[:,i] = (Af[:,i] * normalizeWithAssert(nHatMEG[:,i])) * normalizeWithAssert(nHatMEG[:,i]);
    
    // Computing the normal fluid acceleration component
    AfN[:,i] = Af[:,i] - AfT[:,i];
    
    // Projecting the body velocity in the tangential direction
    UMET[:,i] = (UME[:,i] * normalizeWithAssert(nHatMEG[:,i])) * normalizeWithAssert(nHatMEG[:,i]);
    
    // Computing the normal body velocity component
    UMEN[:,i] = UME[:,i] - UMET[:,i];
    
    // Projecting the body acceleration in the tangential direction
    AMET[:,i] = (AME[:,i] * normalizeWithAssert(nHatMEG[:,i])) * normalizeWithAssert(nHatMEG[:,i]);
    
    // Computing the normal body acceleration component
    AMEN[:,i] = AME[:,i] - AMET[:,i];
    
    // Morison force components 
    // Froude-Krylov
    fFKN[:,i] = rho * VME[i] * AfN[:,i];
    fFK[:,i] = fFKN[:,i];
    
    // Added mass
    fAMN[:,i] = rho * VME[i] * Cam[:,i] .* (AfN[:,i] - AMEN[:,i]);
    fAMT[:,i] = rho * VME[i] * Cam[:,i] .* (AfT[:,i] - AMET[:,i]);
    fAM[:,i] = fFKN[:,i] + fAMT[:,i];
    
    // Inertial
    fI[:,i] = fFK[:,i] + fAM[:,i];
    
    // Drag
    // Should Cd be a vector in xyz or a scalar constant for all DoF
    fDN[:,i] = 1 / 2 * rho * AcME[:,i] * Cd[:,i] .* (UfN[:,i] - UMEN[:,i]);
    fDT[:,i] = 1 / 2 * rho * AcME[:,i] * Cd[:,i] .* (UfT[:,i] - UMET[:,i]);
    fD[:,i] = fDN[:,i] + fDT[:,i]; 
    
    // Check if Z-coordinate of the Morison element is above the mean free surface
    // Should I Wheeler stretch??
    if positionME[3,i] <= 0 then  
      fME[:,i] = fI[:,i] + fD[:,i];
      mME[:,i] = cross(rME[:,i],fME[:,i]);
    else
      fME[:,i] = zeros(3);
      mME[:,i] = zeros(3);
    end if;
    
  end for; 
  
  F = cat(1, sum(fME[:, i] for i in 1:nME),
            sum(mME[:, i] for i in 1:nME));
  // Connects
  connect(positionME,currentModel.positionME);
  connect(positionME,waveModel.positionME);
  connect(Uc,currentModel.Uc);
  connect(Uw,waveModel.Uw);
  connect(UAw,waveModel.UAw);
end MorisonForce;
