within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels;

model PowerLawCurrent
  "Model representing the linear current model"

  // Extending from the OET
  extends BaseCurrent;

  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Current parameters
  parameter SI.Position d = 200 "Water depth";
  parameter Real alphaCur = 0.14 "Power-law exponent";
 
equation

  UcA = Uc0 .* (1 .+ positionME[3,:] ./ d).^alphaCur;

end PowerLawCurrent;
