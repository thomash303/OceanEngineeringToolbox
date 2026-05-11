within OceanEngineeringToolbox.Hydro.Forces.SubForces.RadiationForces;

model RadiationForceNoB2B
  "Model representing the radiation force without B2B interactions"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Extending and inheriting from the OET
  extends DataImport.ImportRecords.HydroImport.radiationNoB2BData(bodyIndex = bodyIndexTemp);
  extends BaseRadiationForce;
  
  // Calling an outer model at the top-level deployment
  outer parameter Integer bodyIndexTemp "Body index used for the radiation force (to avoid instantiation issue with replaceable objects)" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer bodyIndex = bodyIndexTemp "Body index for radiation force"  annotation(HideResult = true, Dialog(enable = false, tab = "Misc")); 


  Real F_int[6];
  
  import Modelica.Mechanics.MultiBody.Frames.resolve2;
protected
  Real x[n_state[1]] "Dummy variable state vector";

initial equation
  x = zeros(n_state[1]) "Initialize state vector to zero";
equation

  // Calculate the radiation force/torque vector
  der(x) = A*x + B*velocity;
  F_int = C*x + D*velocity;
  
    F[4:6] = resolve2(frame_a.R,F_int[4:6]);
  F[1:3] = resolve2(frame_a.R,F_int[1:3]);
    //F = F_int;

  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Radiation Force")}),
    Diagram(coordinateSystem(extent = {{-120, 140}, {40, -20}})));
  

end RadiationForceNoB2B;
