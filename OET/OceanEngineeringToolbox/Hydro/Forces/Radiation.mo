within OceanEngineeringToolbox.Hydro.Forces;

model Radiation
  "Model representing the radiation force"
  
  // Importing from the MSL
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Mechanics.MultiBody.Types;
  import Modelica.Mechanics.MultiBody.Sensors;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath(filePath = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox", hydroCoeffFile = "/RM3HydroCoeff.mat");
  extends DataImport.InputRecords.BodyIndex;
  
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
  
  SubForces.RadiationForces.RadiationForceNoB2B radiationForceNoB2B(filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex) annotation(
    Placement(transformation(extent = {{-14, -14}, {14, 14}})));
  Sensors.AbsoluteSensor absoluteSensor(get_v = true, get_w = true, animation = false, resolveInFrame = Types.ResolveInFrameA.world)  annotation(
    Placement(transformation(origin = {-1, 65}, extent = {{-13, -13}, {13, 13}})));
equation
  connect(radiationForceNoB2B.frame_a, frame_a) annotation(
    Line(points = {{-14, 0}, {-100, 0}}, color = {95, 95, 95}));
  connect(absoluteSensor.v, radiationForceNoB2B.v_abs) annotation(
    Line(points = {{-8, 50}, {-2, 50}, {-2, 16}}, color = {0, 0, 127}, thickness = 0.5));
  connect(absoluteSensor.w, radiationForceNoB2B.omega_abs) annotation(
    Line(points = {{6, 50}, {2, 50}, {2, 16}}, color = {0, 0, 127}, thickness = 0.5));
  connect(absoluteSensor.frame_a, frame_a) annotation(
    Line(points = {{-14, 66}, {-100, 66}, {-100, 0}}, color = {95, 95, 95}));
end Radiation;
