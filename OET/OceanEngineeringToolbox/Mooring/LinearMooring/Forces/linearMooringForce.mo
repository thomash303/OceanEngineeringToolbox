within OceanEngineeringToolbox.Mooring.LinearMooring.Forces;

model linearMooringForce
  "Model representing the linear mooring force (coefficients input in Modelica)"

  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Blocks.Interfaces;
  import Modelica.Constants.g_n;
    
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));  
    
  // Displacement connectors
  Interfaces.RealVectorInput u_abs[3] "Linear position vector" annotation(
    Placement(transformation(origin = {-92, 113}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-78, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Interfaces.RealVectorInput theta_abs[3] "Angular position vector" annotation(
    Placement(transformation(origin = {-64, 113}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-38, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
    
  // Velocity connectors
  Interfaces.RealVectorInput v_abs[3] "Linear velocity vector" annotation(
    Placement(transformation(origin = {-20, 111}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {8, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Interfaces.RealVectorInput omega_abs[3] "Angular velocity vector" annotation(
    Placement(transformation(origin = {6, 111}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {48, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));

  // Force/torque vector
  Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector";
  Real s_ref[6] = cat(1, s_refTrans, s_refRot) "Reference or equilibirum position (Unstretched spring length/angle)";
  parameter SI.TranslationalSpringConstant Km[6,6] = zeros(6,6) "Mooring stiffness vector" annotation(HideResult = true, Dialog(group = "Mooring"));
  parameter SI.TranslationalDampingConstant Cm[6,6] = zeros(6,6) "Mooring damping vector" annotation(HideResult = true, Dialog(group = "Mooring"));
  parameter SI.Force pre_Tension[6] = {0, 0, 0, 0, 0, 0} "Pretension force";
  

protected
  SI.Force f_element[3];
  SI.Torque t_element[3];

  parameter SI.Position s_refTrans[3] "Reference position";
  parameter SI.Angle s_refRot[3] "Reference angle";
  Real position[6] = cat(1, u_abs, theta_abs) "Combined position vector";  
  Real displacement[6] = position - s_ref "Combined displacement vector";
  Real velocity[6] = cat(1, v_abs, omega_abs) "Combined velocity vector";

equation

  // Calculate the mooring force/torque vector
  F = Km*displacement + Cm*velocity + pre_Tension;
  
  frame_a.f = f_element;
  frame_a.t = t_element;

end linearMooringForce;
