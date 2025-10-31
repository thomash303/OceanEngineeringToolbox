within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels;

partial model BaseCurrent
  "Partial model representing the base current model"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Blocks.Interfaces;
  
  // Inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  
  // Calling an outer model at the top-level deployment
  outer Environmental.Environment environment;
      
  // Translational position connectors
  Interfaces.RealInput positionME[3,nME] "Absolute translational position vector for all Morison elements" annotation(
    Placement(transformation(origin = {0, 115}, extent = {{15, -15}, {-15, 15}}, rotation = -270), iconTransformation(origin = {0, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
 // Current velocity connectors
  // Base current parameters
  parameter Integer nME "Number of Morison Morison elements";
  parameter SI.Velocity Uc0 = environment.Uc0 "Current velocity at the mean water level";
  parameter SI.Angle currentHeading = environment.currentHeading "Currrent heading";
  SI.Velocity Uc[3,nME] "Current velocity";
  
  // Intermediate variables
  SI.Velocity UcA[nME] "Current velocity amplitude";
  
equation

  for i in 1:nME loop
    Uc[:,i] = {UcA[i]*cos(currentHeading), UcA[i]*sin(currentHeading), 0};
  end for;
  
  
end BaseCurrent;
