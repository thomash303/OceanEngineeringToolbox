within OceanEngineeringToolbox.PTO.LinearPTO;

model linearRotationalPTO
  "Model representing a linear rotational PTO"
  
  import Modelica.Mechanics.MultiBody.Interfaces.{Frame_a, Frame_b};
  import Modelica.Mechanics.MultiBody.{Types, Joints};
  import Modelica.Mechanics.Rotational.Components;
  import Modelica.Units.SI;
  
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
    
  // Frame_b connector
  Frame_b frame_b "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{116, -16}, {84, 16}})));
  
  parameter SI.RotationalSpringConstant Kpto = 0 "PTO stiffness coefficient";
  parameter SI.RotationalDampingConstant Cpto = 0 "PTO damping coefficient";
  parameter Types.Axis n = {0, 0, 1} "Axis of rotation resolved in frame_a (= same as in frame_b)";
  parameter SI.Angle s_ref = 0 "Reference or equilibirum position (Unstretched spring angle)";
  SI.Power P "PTO power output";
  
  Joints.Revolute revolute(animation = false, n = n, useAxisFlange = true)  annotation(
    Placement(transformation(origin = {2, 0}, extent = {{-12, -12}, {12, 12}})));
  Components.SpringDamper springDamper(c = Kpto, d = Cpto, phi_rel0 = s_ref)  annotation(
    Placement(transformation(origin = {0, 52}, extent = {{-12, -12}, {12, 12}})));
equation
  P = revolute.tau*revolute.w;
  
  connect(springDamper.flange_b, revolute.axis) annotation(
    Line(points = {{12, 52}, {2, 52}, {2, 12}}));
  connect(springDamper.flange_a, revolute.support) annotation(
    Line(points = {{-12, 52}, {-6, 52}, {-6, 12}}));
  connect(revolute.frame_a, frame_a) annotation(
    Line(points = {{-10, 0}, {-100, 0}}, color = {95, 95, 95}));
  connect(revolute.frame_b, frame_b) annotation(
    Line(points = {{14, 0}, {100, 0}}, color = {95, 95, 95}));

  annotation(
  Icon(
    coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100, -100}, {100, 100}}
    ),
    graphics={
      Text(extent={{-150, 220}, {150, 195}}, textString="Cpto=%Cpto"),
      Text(extent={{-150, 180}, {150, 155}}, textString="Kpto=%Kpto"),
      Text(extent={{-150, 145}, {150, 105}}, textString="%name", textColor={0, 0, 255}),
      Rectangle(extent={{-100, -100}, {100, 100}}),
      Text(extent={{-100, -100}, {100, 100}}, textString="Linear Rotational PTO"),
      Text(extent={{-150, -140}, {150, -110}}, textString="n=%n")
    }
  ),
  Diagram
);
end linearRotationalPTO;
