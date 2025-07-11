within OceanEngineeringToolbox.Hydro.Forces.SubForces.RadiationForces;

model RadiationForceNoB2B
  "Model representing the radiation force without B2B interactions"
  
  // Extending and inheriting from the OET
  extends PartialRadiationForce;
  extends DataImport.ImportRecords.HydroImport.radiationNoB2BData;

  Real x[n_state[1]] "Dummy variable state vector";
  
initial equation
  x = zeros(n_state[1]) "Initialize state vector to zero";
equation

  // Calculate the radiation force/torque vector
  der(x) = A*x + B*velocity;
  F = C*x + D*velocity;

  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Radiation Force (No B2B)")}),
    Diagram(coordinateSystem(extent = {{-120, 140}, {40, -20}})));
  

end RadiationForceNoB2B;
