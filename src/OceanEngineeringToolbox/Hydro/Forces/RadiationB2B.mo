within OceanEngineeringToolbox.Hydro.Forces;

model RadiationB2B
  "Model representing the radiation force"

  // Importing from the MSL
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Mechanics.MultiBody.Types;
  import Modelica.Mechanics.MultiBody.Sensors;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath; 
  
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
  
  Sensors.AbsoluteSensor absoluteSensor(get_v = true, get_w = true, resolveInFrame = Types.ResolveInFrameA.world, get_a = true, get_z = true) annotation(Placement(transformation(origin = {-2, 72}, extent = {{-10, -10}, {10, 10}})));
  SubForces.RadiationForces.RadiationForceB2B radiationForceB2B annotation(
    Placement(transformation(origin = {-38, 20}, extent = {{-18, -18}, {18, 18}})));
  SubForces.RadiationForces.AddedMassForceB2B addedMassForceB2B annotation(
    Placement(transformation(origin = {40, 20}, extent = {{-18, -18}, {18, 18}})));
equation
  connect(frame_a, absoluteSensor.frame_a) annotation(
    Line(points = {{-100, 0}, {-100, 72}, {-12, 72}}));
  connect(absoluteSensor.v, radiationForceB2B.v_abs) annotation(
    Line(points = {{-8, 62}, {-42, 62}, {-42, 41}}, color = {0, 0, 127}, thickness = 0.5));
  connect(absoluteSensor.w, radiationForceB2B.omega_abs) annotation(
    Line(points = {{4, 62}, {-34, 62}, {-34, 41}}, color = {0, 0, 127}, thickness = 0.5));
  connect(radiationForceB2B.frame_a, frame_a) annotation(
    Line(points = {{-56, 20}, {-100, 20}, {-100, 0}}, color = {95, 95, 95}));
  connect(absoluteSensor.a, addedMassForceB2B.a_abs) annotation(
    Line(points = {{-4, 62}, {36, 62}, {36, 40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(absoluteSensor.z, addedMassForceB2B.alpha_abs) annotation(
    Line(points = {{8, 62}, {44, 62}, {44, 40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(addedMassForceB2B.frame_a, frame_a) annotation(
    Line(points = {{22, 20}, {20, 20}, {20, 0}, {-100, 0}}, color = {95, 95, 95}));
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "RadiationB2B")}),
    Diagram);

end RadiationB2B;
