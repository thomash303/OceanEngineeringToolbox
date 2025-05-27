within OceanEngineeringToolbox.Hydro.Forces.SubForces.RadiationForces;

model RadiationForceNoB2B
  "Model representing the radiation force without B2B interactions"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Blocks.Interfaces;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.InputRecords.BodyIndex;
  extends DataImport.ImportRecords.HydroImport.radiationNoB2BData;
    
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));

  // Velocity connectors
  Interfaces.RealVectorInput v_abs[3] "Linear velocity vector" annotation(
    HideResult = true,
    Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Interfaces.RealVectorInput omega_abs[3] "Angular velocity vector" annotation(
    HideResult = true,
    Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  // Force/torque vector
  Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector";

protected
  SI.Force f_element[3];
  SI.Torque t_element[3];
  
  Real x[n_state[1]] "Dummy variable state vector";
  Real velocity[6] = cat(1, v_abs, omega_abs) "Combined velocity vector";
initial equation
  x = zeros(n_state[1]) "Initialize state vector to zero";
equation

  // Calculate the radiation force/torque vector
  der(x) = A*x + B*velocity;
  F = C*x + D*velocity;
  
  frame_a.f = f_element;
  frame_a.t = t_element;
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Radiation Force")}),
    Diagram(coordinateSystem(extent = {{-120, 140}, {40, -20}})));
  

end RadiationForceNoB2B;
