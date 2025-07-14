within OceanEngineeringToolbox.Hydro.Forces;

model Radiation
  "Model representing the radiation force"

  // Importing from the MSL
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Mechanics.MultiBody.Types;
  import Modelica.Mechanics.MultiBody.Sensors;
  
  // Extending and inheriting from the OET
  import OET;
  extends DataImport.InputRecords.FilePath;
  extends DataImport.InputRecords.BodyIndex;

  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
  
  Sensors.AbsoluteSensor absoluteSensor(get_v = true, get_w = true, resolveInFrame = Types.ResolveInFrameA.world) annotation(
    HideResult = true,
    Placement(transformation(origin = {1, 53}, extent = {{-15, -15}, {15, 15}}, rotation = -0)));

      SubForces.RadiationForces.RadiationForceNoB2B radiationForceNoB2B(filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex) annotation(
    Placement(transformation(origin = {0, -20}, extent = {{-18, -18}, {18, 18}})));

equation
  connect(absoluteSensor.frame_a, frame_a) annotation(
    Line(points = {{-14, 54}, {-100, 54}, {-100, 0}}, color = {95, 95, 95}));
  connect(absoluteSensor.v, radiationForceNoB2B.v_abs) annotation(
    Line(points = {{-14, 36}, {-14, 1}, {-4, 1}}, color = {0, 0, 127}, thickness = 0.5));
  connect(absoluteSensor.w, radiationForceNoB2B.omega_abs) annotation(
    Line(points = {{4, 36}, {4, 1}}, color = {0, 0, 127}, thickness = 0.5));
  connect(radiationForceNoB2B.frame_a, frame_a) annotation(
    Line(points = {{-18, -20}, {-58, -20}, {-58, 0}, {-100, 0}}, color = {95, 95, 95}));
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Radiation")}),
    Diagram);

end Radiation;
