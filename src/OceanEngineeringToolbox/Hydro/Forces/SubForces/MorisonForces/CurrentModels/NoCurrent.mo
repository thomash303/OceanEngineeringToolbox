within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels;

model NoCurrent
  "Model representing the no current model"
  
  // Extending from the OET
  extends BaseCurrent;

equation

  UcA = zeros(nME);

end NoCurrent;
