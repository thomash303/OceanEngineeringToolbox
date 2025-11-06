within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels;

partial model BaseCurrent
  "Partial model representing the base current model"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Blocks.Interfaces;
  
  // Inheriting from the OET
  
  // Calling an outer model at the top-level deployment
  outer Environmental.Environment environment;
  outer parameter Integer nMETemp "Body index used for the radiation force (to avoid instantiation issue with replaceable objects)" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer nME = nMETemp "Body index for radiation force" annotation(HideResult = true, Dialog(enable = false, tab = "Misc")); 
      
  // Translational position connectors
  Interfaces.RealInput positionME[3,nME] "Absolute translational position vector for all Morison elements" annotation(HideResult = true,
    Placement(transformation(origin = {0, 115}, extent = {{15, -15}, {-15, 15}}, rotation = -270), iconTransformation(origin = {0, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
 // Current velocity connectors
  // Base current parameters
  parameter SI.Velocity Uc0 = environment.Uc0 "Current velocity at the mean water level" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.Angle currentHeading = environment.currentHeading "Currrent heading" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  SI.Velocity Uc[3,nME] "Current velocity" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Intermediate variables
  SI.Velocity UcA[nME] "Current velocity amplitude" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
equation

  for i in 1:nME loop
    Uc[:,i] = {UcA[i]*cos(currentHeading), UcA[i]*sin(currentHeading), 0};
  end for;
  
  
end BaseCurrent;
