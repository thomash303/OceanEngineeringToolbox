model acausal_force
  inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity)  annotation(
    Placement(transformation(origin = {62, 86}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Forces.Spring spring(c = 100)  annotation(
    Placement(transformation(origin = {-56, -8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.MultiBody.Parts.Body body(m = 50)  annotation(
    Placement(transformation(origin = {-56, 52}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Blocks.Sources.Sine sine[3](amplitude = {500, 0, 0}, f = {1, 0, 0})   annotation(
    Placement(transformation(origin = {-86, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {0.000001, 0, 0})  annotation(
    Placement(transformation(origin = {18, -38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = true)  annotation(
    Placement(transformation(origin = {0, 76}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Sine sine1[3](amplitude = {0.005, 0, 0}, f = {1, 0, 0}) annotation(
    Placement(transformation(origin = {-128, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.MultiBody.Forces.WorldForceAndTorque forceAndTorque annotation(
    Placement(transformation(origin = {-106, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(spring.frame_a, body.frame_a) annotation(
    Line(points = {{-56, 2}, {-56, 42}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_a, spring.frame_b) annotation(
    Line(points = {{8, -38}, {-56, -38}, {-56, -18}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, world.frame_b) annotation(
    Line(points = {{28, -38}, {72, -38}, {72, 86}}, color = {95, 95, 95}));
  connect(body.frame_a, absoluteSensor.frame_a) annotation(
    Line(points = {{-56, 42}, {-22, 42}, {-22, 76}, {-10, 76}}, color = {95, 95, 95}));
  connect(sine.y, forceAndTorque.force) annotation(
    Line(points = {{-86, -70}, {-100, -70}, {-100, -20}}, color = {0, 0, 127}, thickness = 0.5));
  connect(sine1.y, forceAndTorque.torque) annotation(
    Line(points = {{-128, -72}, {-112, -72}, {-112, -20}}, color = {0, 0, 127}));
  connect(body.frame_a, forceAndTorque.frame_b) annotation(
    Line(points = {{-56, 42}, {-106, 42}, {-106, 2}}, color = {95, 95, 95}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end acausal_force;
