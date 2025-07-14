within OceanEngineeringToolbox.PTO.LinearPTO;

model linearTranslationalPTO
  "Model representing a linear translational PTO"
  
  import Modelica.Mechanics.MultiBody.Interfaces.{Frame_a, Frame_b};
  import Modelica.Mechanics.MultiBody.{Types, Joints};
  import Modelica.Mechanics.Translational.Components;
  import Modelica.Units.SI;
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
    // Frame_b connector
  Frame_b frame_b "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{116, -16}, {84, 16}})));
  
  parameter SI.TranslationalSpringConstant Kpto = 0 "PTO stiffness coefficient" annotation(
    Dialog(group = "PTO Coefficients"));
  parameter SI.TranslationalDampingConstant Cpto = 0 "PTO damping coefficient" annotation(
    Dialog(group = "PTO Coefficients"));
  parameter Types.Axis n = {0, 0, 1} "Joint axis of translation resolved in frame_a (= same as in frame_b)" annotation(
    Dialog(group = "Joint Parameters"));
  parameter SI.Position s_ref = 0 "Reference or equilibirum position (Unstretched spring length)" annotation(
    Dialog(group = "Joint Parameters"));
  parameter SI.Position s_start = 0 "Initial relative distance between frame_a and frame_b" annotation(
    Dialog(group = "Initialization"));
  parameter SI.Position v_start = 0 "First derivative of s_start (relative velocity)" annotation(
    Dialog(group = "Initialization"));
  parameter SI.Position a_start = 0 "Second derivative of s_start (relative acceleration)" annotation(
    Dialog(group = "Initialization"));
    SI.Power P "PTO power output"; 
    
  Joints.Prismatic prismatic(useAxisFlange = true, animation = false, n = n, s(start = s_start, fixed = true), v(start = v_start, fixed = true), a(start = a_start, fixed = true)) annotation(
   Placement(transformation(origin = {1, -1}, extent = {{-13, -13}, {13, 13}})));
  Components.SpringDamper springDamper(c = Kpto, d = Cpto, s_rel0 = s_ref)  annotation(
    Placement(transformation(origin = {2, 46}, extent = {{-12, -12}, {12, 12}})));

equation
  P = prismatic.f*prismatic.v;

  connect(prismatic.frame_b, frame_b) annotation(
    Line(points = {{14, 0}, {100, 0}}, color = {95, 95, 95}));
  connect(prismatic.frame_a, frame_a) annotation(
    Line(points = {{-12, 0}, {-100, 0}}, color = {95, 95, 95}));
  connect(springDamper.flange_a, prismatic.support) annotation(
    Line(points = {{-10, 46}, {-18, 46}, {-18, 6}, {-4, 6}}, color = {0, 127, 0}));
  connect(springDamper.flange_b, prismatic.axis) annotation(
    Line(points = {{14, 46}, {18, 46}, {18, 6}, {12, 6}}, color = {0, 127, 0}));
    
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
      Text(extent={{-100, -100}, {100, 100}}, textString="Linear Translational PTO"),
      Text(extent={{-150, -140}, {150, -110}}, textString="n=%n")
    }
  ),
  Diagram
);

end linearTranslationalPTO;
