within OceanEngineeringToolbox.Hydro.Forces.SubForces.HydrostaticForces;

model HydrostaticForce
  "Model representing the hydrostatic force"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Blocks.Interfaces;
  import Modelica.Constants.g_n;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.InputRecords.BodyIndex;
  extends DataImport.ImportRecords.HydroImport.hydrostaticData;
  extends DataImport.ImportRecords.MultibodyImport.bodyData;
    
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));  
    
  // Displacement connectors
  Interfaces.RealVectorInput u_abs[3] "Linear position vector" annotation(
    HideResult = true,
    Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Interfaces.RealVectorInput theta_abs[3] "Angular position vector" annotation(
    HideResult = true,
    Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  // Force/torque vector
  Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector";

protected
  SI.Force f_element[3];
  SI.Torque t_element[3];
  Real CoG[6] = cat(1, vector(cg), zeros(3));

  Real position[6] = cat(1, u_abs, theta_abs) "Combined position vector";  
  Real displacement[6] = position - CoG "Combined displacement vector";
equation

  // Calculate the hydrostatic force/torque vector
  F = Khs*displacement;
  
  frame_a.f = f_element;
  frame_a.t = t_element;
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Hydrostatic Force")}));

end HydrostaticForce;
