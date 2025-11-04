within OceanEngineeringToolbox.Hydro.Forces.SubForces.RadiationForces;

model RadiationForceB2B
  "Model representing the radiation force with B2B interactions"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Extending and inheriting from the OET
  extends DataImport.ImportRecords.HydroImport.radiationB2BData(bodyIndex = bodyIndexTemp);
  extends BaseRadiationForce;
  
  // Calling an outer model at the top-level deployment
  outer RadiationB2BCoupler radiationB2BCoupler;
  outer parameter Integer bodyIndexTemp "Body index used for the radiation force (to avoid instantiation issue with replaceable objects)" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer bodyIndex = bodyIndexTemp "Body index for radiation force"  annotation(HideResult = true, Dialog(enable = false, tab = "Misc")); 

protected
  Real x[n_state[1]] "Dummy variable state vector";

initial equation
  x = zeros(n_state[1]) "Initialize state vector to zero";

equation
    // Assign velocity values for the given body
  for i in 1:bodyDoF loop
    radiationB2BCoupler.vCoupled[bodyDoF*(bodyIndex - 1) + i] = velocity[i];
  end for;

  // Calculate the radiation force/torque vector
  der(x) = A * x + B * radiationB2BCoupler.vCoupled;
  F = C * x + D * radiationB2BCoupler.vCoupled;
  
  
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "B2B Radiation Force")}),
    Diagram(coordinateSystem(extent = {{-120, 140}, {40, -20}})));

end RadiationForceB2B;
