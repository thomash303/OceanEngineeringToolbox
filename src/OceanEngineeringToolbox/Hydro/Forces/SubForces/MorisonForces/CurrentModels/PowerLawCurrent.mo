within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels;

model PowerLawCurrent
  "Model representing the linear current model"

  // Extending from the OET
  extends BaseCurrent;

  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Current parameters
  parameter SI.Height currentDepth = environemnt.currentDepth "Current depth" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Real alphaCur = environment.alphaCur "Power-law exponent" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
 
equation

  UcA = Uc0 .* (1 .+ positionME[3,:] ./ currentDepth).^alphaCur;

end PowerLawCurrent;
