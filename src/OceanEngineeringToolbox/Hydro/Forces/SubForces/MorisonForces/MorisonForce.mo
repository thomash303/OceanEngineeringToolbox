within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces;

model MorisonForce 
  "Model representing the Morison force"
  /* The development of this model is derived from the Morison formulation in WEC-Sim. */


  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  import Modelica.Blocks.Interfaces;
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Mechanics.MultiBody.Frames;
  import Modelica.Math.Vectors.{length, normalizeWithAssert};
  
  // Importing and extending from the OET
  extends BaseHydroForce(redeclare Real F[6] = cat(1, -f_element, -t_element));
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels.*;
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.WaveModels.*;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  
  // Calling an outer model at the top-level deployment
  outer DataImport.FileDirectory fileDirectory;

  // Displacement connectors
  Interfaces.RealVectorInput u_abs[3] "Absolute translational position vector" annotation(HideResult = true,
    Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {0, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
    
  // Velocity connectors
  Interfaces.RealVectorInput v_abs[3] "Translational velocity vector" annotation(HideResult = true,
    Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-88, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Interfaces.RealVectorInput omega_abs[3] "Angular velocity vector" annotation(HideResult = true,
    Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-46, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
    
  // Acceleration connectors
  Interfaces.RealVectorInput a_abs[3] "Translational acceleration vector" annotation(HideResult = true,
    Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {44, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Interfaces.RealVectorInput alpha_abs[3] "Angular acceleration vector" annotation(HideResult = true,
    Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {86, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  
  // Morison parameters
  parameter Integer nME "Number of Morison Morison elements" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.Position rME[3,nME] "Vector to the Morison element from the CG in the body frame" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Real nHatME[3,nME] "Orientation unit vector in the body frame" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Real Cfk[2,nME] "Froude-Krylov coefficients [normal, tangential]" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));  
  parameter Real Cd[2,nME] "Drag coefficients [normal, tangential]" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));  
  parameter SI.Area Ac[2,nME] "Characteristic drag area [normal, tangential]" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Real Cam[2,nME] "Added mass coefficients [normal, tangential]" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.Volume VME[nME] "Displaced volume" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));

  // Fluid kinematics
  SI.Velocity Uf[3,nME] "Combined wave and current fluid velocity" annotation(HideResult = true);
  SI.Velocity UfT[3,nME] "Tangential component of the combined wave and current fluid velocity" annotation(HideResult = true);
  SI.Velocity UfN[3,nME] "Normal component of the combined wave and current fluid velocity" annotation(HideResult = true);
  SI.Velocity Af[3,nME] "Wave fluid acceleration" annotation(HideResult = true);
  SI.Velocity AfT[3,nME] "Tangential component of the wave fluid acceleration" annotation(HideResult = true);
  SI.Velocity AfN[3,nME] "Normal component of the wave fluid acceleration" annotation(HideResult = true);
  
  // Body kinematics
  SI.Position position[3] = u_abs "Translational position vector" annotation(HideResult = true);
  Real velocity[6] = cat(1, v_abs, omega_abs) "Combined velocity vector" annotation(HideResult = true);
  Real acceleration[6] = cat(1, a_abs, alpha_abs) "Combined acceleration vector" annotation(HideResult = true);
  Interfaces.RealOutput positionME[3,nME] "Absolute translational position vector for all Morison elements" annotation(HideResult = true);
  
  // Global Morison quantities
  SI.Position rMEG[3,nME] "Vector to the Morison element from the CG in the global frame" annotation(HideResult = true);
  Real nHatMEG[3,nME] "Orientation unit vector in the global frame" annotation(HideResult = true);
  
  // Intermediate force components
  SI.Force fFK[3,nME] "Froude-Krylov force component" annotation(HideResult = true);
  SI.Force fFKN[3,nME] "Froude-Krylov normal force component" annotation(HideResult = true);
  // If doing
  SI.Force fFKT[3,nME] "Froude-Krylov tangential force component" annotation(HideResult = true);  
  SI.Force fAM[3,nME] "Added mass force component" annotation(HideResult = true); 
  SI.Force fAMN[3,nME] "Added mass normal force component" annotation(HideResult = true); 
  // If doing
  SI.Force fAMT[3,nME] "Added mass tangential force component" annotation(HideResult = true);
  SI.Force fI[3,nME] "Inertial force component" annotation(HideResult = true);
  SI.Force fD[3,nME] "Drag force component" annotation(HideResult = true);
  SI.Force fDN[3,nME] "Drag force normal component" annotation(HideResult = true);
  SI.Force fDT[3,nME] "Drag force tangential component" annotation(HideResult = true); 
  SI.Force fME[3,nME] "Morison force" annotation(HideResult = true);
  SI.Torque mME[3,nME] "Morison moment" annotation(HideResult = true); 
  Frames.Orientation R "Rotation orientation object between the global and body-fixed frames" annotation(HideResult = true);
  
  // Morison element kinematics
  SI.Velocity UME[3,nME] "Velocity of the Morison elements" annotation(HideResult = true);
  SI.Velocity UMEN[3,nME] "Normal velocity of the Morison elements" annotation(HideResult = true);
  SI.Velocity UMET[3,nME] "Tangential velocity of the Morison elements" annotation(HideResult = true);
  SI.Acceleration AME[3,nME] "Acceleration of the Morison elements" annotation(HideResult = true); 
  SI.Acceleration AMEN[3,nME] "Normal acceleration of the Morison elements" annotation(HideResult = true);
  SI.Acceleration AMET[3,nME] "Tangential acceleration of the Morison elements" annotation(HideResult = true);
  
  // Ramp
  Real ramp "Ramping function" annotation(HideResult = true);
  
  // Current model
  replaceable NoCurrent currentModel constrainedby BaseCurrent  "Current profile" annotation(Dialog(group = "Wave and current kinematic model selection"),choices(choice(redeclare NoCurrent currentModel  "No current"), choice(redeclare ConstantCurrent currentModel "Constant current profile"), choice(redeclare LinearCurrent currentModel "Linear current profile"), choice(redeclare PowerLawCurrent currentModel "Power law current profile")),
    Placement(transformation(origin = {0, 44}, extent = {{-10, -10}, {10, 10}})));
  
  // Wave model
  replaceable NoWaveKin waveModel(file = fileDirectory.file) constrainedby BaseWaveKin annotation(Dialog(group = "Wave and current kinematic model selection"),choices(choice(redeclare NoWaveKin waveModel(file = fileDirectory.file) "No wave kinematics"), choice(redeclare LinearWaveKin waveModel(file = fileDirectory.file) "Linear wave kinematics")),
    Placement(transformation(origin = {0, -28}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));

equation
  R = frame_a.R;
  Uf = currentModel.Uc + waveModel.Uw;
  Af = waveModel.Aw;
  for i in 1:nME loop
// Computing the global quantities from the body-fixed frame
    rMEG[:, i] = Frames.resolve1(R, rME[:, i]);
    nHatMEG[:, i] = Frames.resolve1(R, nHatME[:, i]);
    positionME[:, i] = position + rME[:, i];
// Determining kinematics of the Morison element
    UME[:, i] = v_abs + cross(omega_abs, rMEG[:, i]);
    AME[:, i] = a_abs + cross(der(omega_abs), rMEG[:, i]) + cross(omega_abs, cross(omega_abs, rMEG[:, i]));
/* The fluid and body kinematics are determined in the normal and tangential directions using vector projection. Since nHatME is given as a unit vector, its normalization is redundant (because it is already a unit vector); however, the original form of the equation is kept for clarity. */
// Projecting the fluid velocity in the tangential direction
    UfT[:, i] = (Uf[:, i]*normalizeWithAssert(nHatMEG[:, i]))*normalizeWithAssert(nHatMEG[:, i]);
// Computing the normal fluid velocity component
    UfN[:, i] = Uf[:, i] - UfT[:, i];
// Projecting the fluid acceleration in the tangential direction
    AfT[:, i] = (Af[:, i]*normalizeWithAssert(nHatMEG[:, i]))*normalizeWithAssert(nHatMEG[:, i]);
// Computing the normal fluid acceleration component
    AfN[:, i] = Af[:, i] - AfT[:, i];
// Projecting the body velocity in the tangential direction
    UMET[:, i] = (UME[:, i]*normalizeWithAssert(nHatMEG[:, i]))*normalizeWithAssert(nHatMEG[:, i]);
// Computing the normal body velocity component
    UMEN[:, i] = UME[:, i] - UMET[:, i];
// Projecting the body acceleration in the tangential direction
    AMET[:, i] = (AME[:, i]*normalizeWithAssert(nHatMEG[:, i]))*normalizeWithAssert(nHatMEG[:, i]);
// Computing the normal body acceleration component
    AMEN[:, i] = AME[:, i] - AMET[:, i];
// Morison force components
// Have switch to only compute the drag component
// Froude-Krylov
    fFKN[:, i] = rho*VME[i]*Cfk[1, i]*AfN[:, i];
    fFKT[:, i] = rho*VME[i]*Cfk[2, i]*AfT[:, i];
    fFK[:, i] = fFKN[:, i] + fFKT[:, i];
// Added mass
    fAMN[:, i] = rho*VME[i]*Cam[1, i]*(AfN[:, i] - AMEN[:, i]);
    fAMT[:, i] = rho*VME[i]*Cam[2, i]*(AfT[:, i] - AMET[:, i]);
    fAM[:, i] = fAMN[:, i] + fAMT[:, i];
// Inertial
    fI[:, i] = fFK[:, i] + fAM[:, i];
// Drag
    fDN[:, i] = 1/2*rho*Ac[1, i]*Cd[1, i].*(UfN[:, i] - UMEN[:, i]) * length(UfN[:, i] - UMEN[:, i]);
    fDT[:, i] = 1/2*rho*Ac[2, i]*Cd[2, i].*(UfT[:, i] - UMET[:, i]) * length(UfT[:, i] - UMET[:, i]);
    fD[:, i] = fDN[:, i] + fDT[:, i];
// Check if Z-coordinate of the Morison element is above the mean free surface
// Should I Wheeler stretch??
    if positionME[3, i] <= 0 then
      fME[:, i] = fI[:, i] + fD[:, i];
      mME[:, i] = cross(rME[:, i], fME[:, i]);
    else
      fME[:, i] = zeros(3);
      mME[:, i] = zeros(3);
    end if;
  end for;
  F = ramp.*cat(1, sum(fME[:, i] for i in 1:nME), sum(mME[:, i] for i in 1:nME));
  // Connects
  connect(positionME, currentModel.positionME);
  connect(positionME, waveModel.positionME);

end MorisonForce;
