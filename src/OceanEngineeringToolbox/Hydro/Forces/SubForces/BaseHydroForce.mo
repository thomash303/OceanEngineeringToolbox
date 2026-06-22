within OceanEngineeringToolbox.Hydro.Forces.SubForces;

partial model BaseHydroForce

  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Mechanics.MultiBody.Frames.resolve2;
  
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));

  // Force/torque vector
  replaceable Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector" annotation(Dialog(enable = false, tab = "Misc"));

protected
  SI.Force f_element[3];
  SI.Torque t_element[3];
  SI.Force f_element_loc[3] = resolve2(frame_a.R, f_element);
  SI.Torque t_element_loc[3] = resolve2(frame_a.R, t_element);
  
equation
  frame_a.f = f_element_loc;
  frame_a.t = t_element_loc;

end BaseHydroForce;
