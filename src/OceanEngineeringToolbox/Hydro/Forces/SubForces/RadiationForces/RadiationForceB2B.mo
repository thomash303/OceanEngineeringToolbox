within OceanEngineeringToolbox.Hydro.Forces.SubForces.RadiationForces;

model RadiationForceB2B
  "Model representing the radiation force with B2B interactions"
  
  // Extending and inheriting from the OET
  extends PartialRadiationForce;
  extends DataImport.ImportRecords.HydroImport.radiationB2BData;
  
  outer CouplingRadiationB2B couplingRadiationB2B;
  
  Real x[n_state[1]] "Dummy variable state vector";
  
initial equation
  x = zeros(n_state[1]) "Initialize state vector to zero";
equation
  for i in 1:bodyDoF loop
    couplingRadiationB2B.vCoupled[bodyDoF*(bodyIndex - 1) + i] = velocity[i];
  end for;

  // Calculate the radiation force/torque vector
  der(x) = A*x + B*couplingRadiationB2B.vCoupled;
  F = C*x + D*couplingRadiationB2B.vCoupled;


  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Radiation Force (B2B)")}));
    

end RadiationForceB2B;
