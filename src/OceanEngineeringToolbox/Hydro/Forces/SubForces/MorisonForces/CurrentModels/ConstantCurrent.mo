within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels;

model ConstantCurrent
  "Model representing the constant current model"
  
  // Extending from the OET
  extends BaseCurrent;

equation

  UcA = fill(Uc0,nME);

end ConstantCurrent;
