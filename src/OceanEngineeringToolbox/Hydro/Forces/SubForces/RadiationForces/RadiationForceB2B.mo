within OceanEngineeringToolbox.Hydro.Forces.SubForces.RadiationForces;

model RadiationForceB2B
  "Model representing the radiation force with B2B interactions"
  
  // This has yet to be developed.

/*
  // Import hydro coefficients
  extends DataImport.radiationDataB2B;
  // Inherit frame_a
  extends Modelica.Mechanics.MultiBody.Interfaces.PartialOneFrame_a;
  // Velocity connectors
  Modelica.Blocks.Interfaces.RealInput v_abs[3] "Linear velocity vector [m/s]" annotation(
    HideResult = true,
    Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Modelica.Blocks.Interfaces.RealInput omega_abs[3] "Angular velocity vector [rad/s]" annotation(
    HideResult = true,
    Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector [N,Nm]";
  // Enable/disable radiation force
  parameter Boolean enableRadiationForce = true "Switch to enable/disable radiation force calculation" annotation(
    HideResult = true,
    Dialog(group = "Radiation Force Parameters"));
  Real velocityVector[nDoF];
protected
  Real velocity[6] = cat(1, v_abs, omega_abs) "Combined velocity vector [m/s, rad/s]";
  Modelica.Units.SI.Force f_element[3];
  Modelica.Units.SI.Torque t_element[3];
  Real x[n_states] "Dummy variable state vector";
initial equation
  x = zeros(n_states) "Initialize state vector to zero";
equation
  for i in 1:bodyDoF loop
    velocityVector[bodyDoF*(bodyIndex - 1) + i] = velocity[i];
  end for;
// Use the switch to conditionally output the radiation force torque element
  if enableRadiationForce then
// Radiation state space
    der(x) = A*x + B*velocityVector;
    F = C*x + D*velocityVector;
  else
    x = zeros(n_states);
    F = zeros(6);
  end if;
  frame_a.f = f_element;
  frame_a.t = t_element;
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Radiation Force")}));
    
    */

end RadiationForceB2B;
