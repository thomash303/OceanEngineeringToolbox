within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels;

model LinearCurrent
  "Model representing the linear current model"

  // Extending from the OET
  extends BaseCurrent;

  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Current parameters
  parameter SI.Position d = 200 "Water depth";
  
equation

  UcA = Uc0 .* (1 .+ positionME[3,:] ./ d);

end LinearCurrent;
