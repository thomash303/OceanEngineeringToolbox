within OceanEngineeringToolbox.Hydro.Forces;

model Hydrostatic
  "Model representing the hydrostatic force"
  // Importing from the MSL
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Mechanics.MultiBody.Types;
  import Modelica.Mechanics.MultiBody.Sensors;
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.InputRecords.BodyIndex;
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{-116, -16}, {-84, 16}}))); 
  
  SubForces.HydrostaticForces.HydrostaticForce hydrostaticForce(filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex) annotation(
    Placement(transformation(origin = {1, 29}, extent = {{-13, -13}, {13, 13}})));
  SubForces.HydrostaticForces.BuoyancyForce buoyancyForce(filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex) annotation(
    Placement(transformation(origin = {2, -32}, extent = {{-14, -14}, {14, 14}})));
  Sensors.AbsoluteSensor absoluteSensor(get_r = true, get_angles = true, resolveInFrame = Types.ResolveInFrameA.world)  annotation(
    Placement(transformation(origin = {4, 80}, extent = {{-12, -12}, {12, 12}})));
equation
  connect(absoluteSensor.frame_a, frame_a) annotation(
    Line(points = {{-8, 80}, {-98, 80}, {-98, 0}, {-100, 0}}, color = {95, 95, 95}));
  connect(hydrostaticForce.frame_a, frame_a) annotation(
    Line(points = {{-12, 30}, {-100, 30}, {-100, 0}}, color = {95, 95, 95}));
  connect(buoyancyForce.frame_a, frame_a) annotation(
    Line(points = {{-12, -32}, {-100, -32}, {-100, 0}}, color = {95, 95, 95}));
  connect(absoluteSensor.angles, hydrostaticForce.theta_abs) annotation(
    Line(points = {{6, 67}, {6, 55}, {4, 55}, {4, 44}}, color = {0, 0, 127}, thickness = 0.5));
  connect(absoluteSensor.r, hydrostaticForce.u_abs) annotation(
    Line(points = {{-8, 67}, {-8, 44}, {-2, 44}}, color = {0, 0, 127}, thickness = 0.5));
end Hydrostatic;
