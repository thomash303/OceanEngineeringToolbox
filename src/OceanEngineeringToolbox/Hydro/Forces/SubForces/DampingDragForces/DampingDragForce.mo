within OceanEngineeringToolbox.Hydro.Forces.SubForces.DampingDragForces;

model DampingDragForce
  "Model representing the damping/drag force (coefficients input in Modelica)"
  
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Blocks.Interfaces;
  import Modelica.Math.Vectors.length;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  extends BaseHydroForce;

  // Velocity connectors
  Interfaces.RealVectorInput v_abs[3] "Linear velocity vector" annotation(
    HideResult = true,
    Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Interfaces.RealVectorInput omega_abs[3] "Angular velocity vector" annotation(
    HideResult = true,
    Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));

  // Drag coefficients
  parameter Real Cv[6] = zeros(6) "Linear damping coefficient vector" annotation(HideResult = true, Dialog(group = "Damping/Drag"));
  parameter Real Cd[6] = zeros(6) "Quadratic drag coefficient vector" annotation(HideResult = true, Dialog(group = "Damping/Drag"));
  parameter Real Ad[6] = zeros(6) "Characteristic area vector" annotation(HideResult = true, Dialog(group = "Damping/Drag"));

protected
  Real velocity[6] = cat(1, v_abs, omega_abs) "Combined velocity vector";
equation

  // Calculate the damping/drag force/torque vector
  F = Cv.*velocity + 0.5*rho.*Ad.*Cd.*velocity.*length(velocity);
  
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Damping/Drag Force")}));

end DampingDragForce;
