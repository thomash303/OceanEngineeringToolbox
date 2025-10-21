within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels;

partial model BaseCurrent
  "Partial model representing the base current model"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Blocks.Interfaces;
      
  // Translational position connectors
  Interfaces.RealInput positionME[3,nME] "Absolute translational position vector for all Morison elements" annotation(
    Placement(transformation(origin = {0, 115}, extent = {{15, -15}, {-15, 15}}, rotation = -270), iconTransformation(origin = {0, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));

  // Current velocity connectors
  Interfaces.RealOutput Uc[3,nME] = {UcA * cos(currentHeading), UcA * sin(currentHeading), zeros(nME)}"Current velocity vector" annotation(
    Placement(transformation(origin = {0, -114}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {0, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
 
  // Base current parameters
  parameter Integer nME = 2 "Number of Morison Morison elements";
  parameter SI.Velocity Uc0 = 1 "Current velocity at the mean water level";
  parameter SI.Angle currentHeading = 0 "Currrent heading";
  
  // Intermediate variables
  SI.Velocity UcA[nME] "Current velocity amplitude";
  
  
end BaseCurrent;
