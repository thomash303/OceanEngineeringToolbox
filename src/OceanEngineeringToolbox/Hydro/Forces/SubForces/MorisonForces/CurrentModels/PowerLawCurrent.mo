within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels;

model PowerLawCurrent
  "Model representing the linear current model"

  // Extending from the OET
  extends BaseCurrent;

  // Importing from the MSL
  import Modelica.Units.SI;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  
  // Current parameters
  parameter Real alphaCur = environment.alphaCur "Power-law exponent";
 
equation

  UcA = Uc0 .* (1 .+ positionME[3,:] ./ d).^alphaCur;

end PowerLawCurrent;
