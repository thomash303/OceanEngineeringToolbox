within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces;

model MorisonForce 
  "Model representing the Morison force"

// currently only considering 1D excitation, could probably extend to 2D relatively easily

  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  import Modelica.Blocks.Interfaces;
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  
  // Importing from the OET
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels.*;
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.WaveModels.*;
    
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));

  // Displacement connectors
  Interfaces.RealVectorInput u_abs[3] "Translational position vector" annotation(
    Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {0, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
    
  // Velocity connectors
  Interfaces.RealVectorInput v_abs[3] "Translational velocity vector" annotation(
    Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-88, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Interfaces.RealVectorInput omega_abs[3] "Angular velocity vector" annotation(
    Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-48, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
    
  // Acceleration connectors
  Interfaces.RealVectorInput a_abs[3] "Translational acceleration vector" annotation(
    Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {52, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Interfaces.RealVectorInput alpha_abs[3] "Angular acceleration vector" annotation(
    Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {86, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  
  parameter Integer nME "Number of Morison Morison elements";
  parameter SI.Position rME[3,nME] "Vector to the Morison element from the CG";
  parameter Real nHatME[3,nME] "Orientation unit vector";
  parameter Real Cdn[3,nME] "Normal drag coefficients";
  parameter Real Cdt[3,nME] "Tangential drag coefficients";
  parameter SI.Area Adn[3,nME] "Normal drag area";
  parameter SI.Area Adt[3,nME] "Tangential drag area";
  parameter Real Camn[3,nME] "Normal added mass coefficients";
  parameter Real Camt[3,nME] "Tangential added mass coefficients";
  parameter SI.Volume VME[nME] "Displaced volume";

  replaceable NoCurrent currentModel constrainedby BaseCurrent  "Current profile" annotation(choices(choice(redeclare currentModel NoCurrent "No current"), choice(redeclare currentModel ConstantCurrent "Constant current profile"), choice(redeclare currentModel LinearCurrent "Linear current profile"), choice(redeclare currentModel PowerLawCurrent "Power law current profile")),
    Placement(transformation(origin = {0, 44}, extent = {{-10, -10}, {10, 10}})));
  replaceable NoWaveKin waveModel constrainedby BaseWaveKin annotation(choices(choice(redeclare waveModel NoWaveKin "No wave kinematics"), choice(redeclare waveModel LinearWaveKin "Linear wave kinematics")),
    Placement(transformation(origin = {0, -28}, extent = {{-10, 10}, {10, -10}}, rotation = -0)));

end MorisonForce;
