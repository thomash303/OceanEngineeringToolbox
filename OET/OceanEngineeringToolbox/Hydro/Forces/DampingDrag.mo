within OceanEngineeringToolbox.Hydro.Forces;

model DampingDrag
  "Model representing the damping/drag force"
    
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
  SubForces.DampingDragForces.DampingDragForce dampingDragForce(filePath = filePath, hydroCoeffFile = hydroCoeffFile, Cv = Cv, Cd = Cd, Ad = Ad) annotation(
    Placement(transformation(origin = {2, 0}, extent = {{-14, -14}, {14, 14}})));
  Sensors.AbsoluteSensor absoluteSensor(get_v = true, get_w = true, animation = false, resolveInFrame = Types.ResolveInFrameA.world)  annotation(
    Placement(transformation(origin = {0, 64}, extent = {{-12, -12}, {12, 12}})));

  // Drag coefficients
  parameter Real Cv[6] = zeros(6) "Linear damping coefficient vector" annotation(HideResult = true, Dialog(group = "Damping/Drag"));
  parameter Real Cd[6] = zeros(6) "Quadratic drag coefficient vector" annotation(HideResult = true, Dialog(group = "Damping/Drag"));
  parameter Real Ad[6] = zeros(6) "Characteristic area vector" annotation(HideResult = true, Dialog(group = "Damping/Drag"));


equation
  connect(dampingDragForce.frame_a, frame_a) annotation(
    Line(points = {{-12, 0}, {-100, 0}}, color = {95, 95, 95}));
  connect(absoluteSensor.frame_a, frame_a) annotation(
    Line(points = {{-12, 64}, {-100, 64}, {-100, 0}}, color = {95, 95, 95}));
  connect(absoluteSensor.v, dampingDragForce.v_abs) annotation(
    Line(points = {{-8, 50}, {0, 50}, {0, 16}}, color = {0, 0, 127}, thickness = 0.5));
  connect(absoluteSensor.w, dampingDragForce.omega_abs) annotation(
    Line(points = {{8, 50}, {4, 50}, {4, 16}}, color = {0, 0, 127}, thickness = 0.5));
end DampingDrag;
