within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.WaveModels;

partial model BaseWaveKin
  "Partial model representing the base wave kinematics model"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Blocks.Interfaces;
  import Modelica.Constants.{pi,g_n};
      
  // Translational position connectors
  Interfaces.RealInput positionME[3,nME] "Absolute translational position vector for all Morison elements" annotation(
    Placement(transformation(origin = {0, 115}, extent = {{15, -15}, {-15, 15}}, rotation = -270), iconTransformation(origin = {0, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));

  // Wave velocity connectors
  Interfaces.RealOutput Uw[3,nME] = {uV * cos(waveHeading), vV * sin(waveHeading), wV}"Wave velocity vector" annotation(
    Placement(transformation(origin = {-30, -114}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-38, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
    
  // Wave acceleration connectors
  Interfaces.RealOutput UAw[3,nME] = {uA * cos(waveHeading), vA * sin(waveHeading), wA} "Wave acceleration vector" annotation(
    Placement(transformation(origin = {30, -114}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {40, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
 
  // Base wave parameters
  parameter Integer nME = 2 "Number of Morison Morison elements";
  parameter Integer n_omega "Number of frequency components (default is 100 for irregular)";
  
  // Wave Heading Parameters
  parameter SI.Angle waveHeading "Wave heading";
  
  // Wave variables
  parameter SI.WaveNumber k[n_omega] "Wave number component";
  parameter SI.Angle phi[n_omega] "Wave components phase shift";
  
protected 
  // Intermediate variables
  // Velocity
  SI.Velocity uV[nME] "Horizontal water particle velocity (x)";
  SI.Velocity vV[nME] "Horizontal water particle velocity (y)";
  SI.Velocity wV[nME] "Vertical water particle velocity (z)";

  // Acceleration
  SI.Velocity uA[nME] "Horizontal water particle acceleration (x)";
  SI.Velocity vA[nME] "Horizontal water particle acceleration (y)";
  SI.Velocity wA[nME] "Vertical water particle acceleration (z)";
  
    // Velocity
  SI.Velocity uV_Int[n_omega, nME] "Horizontal water particle velocity (x)";
  SI.Velocity vV_Int[n_omega, nME] "Horizontal water particle velocity (y)";
  SI.Velocity wV_Int[n_omega, nME] "Vertical water particle velocity (z)";

  // Acceleration
  SI.Velocity uA_Int[n_omega, nME] "Horizontal water particle acceleration (x)";
  SI.Velocity vA_Int[n_omega, nME] "Horizontal water particle acceleration (y)";
  SI.Velocity wA_Int[n_omega, nME] "Vertical water particle acceleration (z)";
  
equation
  for i in 1:nME loop
    uV[i] = sum(uV_Int[:, i]);
    vV[i] = sum(vV_Int[:, i]);
    wV[i] = sum(wV_Int[:, i]);
    uA[i] = sum(uA_Int[:, i]);
    vA[i] = sum(vA_Int[:, i]);
    wA[i] = sum(wA_Int[:, i]);
  end for;

end BaseWaveKin;
