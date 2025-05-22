within OceanEngineeringToolbox.Multibody;

model Body
  "Model containing modified MSL body component (joint offset and hydrodynamic added mass effects)"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Mechanics.MultiBody.{Parts, Visualizers, Sensors, Types};

  // Extending from the OceanEngineeringToolbox
  extends DataImport.InputRecords.FilePath;
  extends DataImport.InputRecords.GeometryFile(geometryFile="hi");
  extends DataImport.InputRecords.BodyIndex;
  extends Frame.PartialThreeFrames;
  
  
  parameter SI.Distance r_0Init[3] = {0, 0, 0} "Initial translational position vector between word and centre of mass" annotation(
    Dialog(tab = "Initial Conditions"));
  parameter SI.Velocity v_0Init[3] = {0, 0, 0} "Initial translational velocity vector between word and centre of mass" annotation(
    Dialog(tab = "Initial Conditions"));
  parameter SI.Acceleration a_0Init[3] = {0, 0, 0} "Initial translational acceleration vector between word and centre of mass" annotation(
    Dialog(tab = "Initial Conditions"));
  parameter SI.Angle angles_0Init[3] = {0, 0, 0} "Initial angular position vector between word and centre of mass" annotation(
    Dialog(tab = "Initial Conditions"));
  parameter SI.AngularVelocity w_0Init[3] = {0, 0, 0} "Initial angular velocity vector between word and centre of mass" annotation(
    Dialog(tab = "Initial Conditions"));
  parameter SI.AngularAcceleration z_0Init[3] = {0, 0, 0} "Initial angular acceleration vector between word and centre of mass" annotation(
    Dialog(tab = "Initial Conditions"));
  parameter Boolean animationEnable = false "Enable animation with stl geometry file" annotation(
    Dialog(group = "Body Data"));
  // Mass
  Mass.BodyMass body(filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex, I_11 = I_11, I_22 = I_22, I_33 = I_33, I_21 = I_21, I_31 = I_31, I_32 = I_32, r_CM = {0, 0, 0}, r_0(start = r_0Init), v_0(start = v_0Init), a_0(start = a_0Init), angles_start = angles_0Init, w_0_start = w_0Init, z_0_start = z_0Init, useQuaternions = true) annotation(
    Placement(transformation(origin = {0, -46}, extent = {{-12, -12}, {12, 12}}, rotation = -90)));
  parameter SI.Length ra_CM[3] = {0, 0, 0} "Position vector between joint A and the centre of mass" annotation(
    Dialog(group = "Mass"));
  parameter SI.Length rCM_b[3] = {0, 0, 0} "Position vector between the centre of mass and joint B" annotation(
    Dialog(group = "Mass"));
  parameter SI.Length ra_b[3] = ra_CM + rCM_b "Position vector between joint A and joint B" annotation(
    Dialog(group = "Mass"));
  parameter SI.Inertia I_11 = 0.001 "Element (1,1) of inertia tensor" annotation(
    Dialog(group = "Mass"));
  parameter SI.Inertia I_22 = 0.001 "Element (2,2) of inertia tensor" annotation(
    Dialog(group = "Mass"));
  parameter SI.Inertia I_33 = 0.001 "Element (3,3) of inertia tensor" annotation(
    Dialog(group = "Mass"));
  parameter SI.Inertia I_21 = 0 "Element (2,1) of inertia tensor" annotation(
    Dialog(group = "Mass"));
  parameter SI.Inertia I_31 = 0 "Element (3,1) of inertia tensor" annotation(
    Dialog(group = "Mass"));
  parameter SI.Inertia I_32 = 0 "Element (3,2) of inertia tensor" annotation(
    Dialog(group = "Mass"));
  Parts.FixedTranslation fixedTranslation(r = ra_CM, animation = false) annotation(
    Placement(transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}})));
  Parts.FixedTranslation fixedTranslation1(r = rCM_b, animation = false) annotation(
    Placement(transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}})));
  Visualizers.FixedShape fixedShape(length = 1, width = 1, height = 1, animation = true, shapeType = geometryDirectory, color = {255, 255, 0}) annotation(
    Placement(transformation(origin = {40, -36}, extent = {{-10, -10}, {10, 10}})));
  Sensors.AbsoluteSensor absoluteSensor(get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = true, resolveInFrame = Types.ResolveInFrameA.world, animation = false) annotation(
    Placement(transformation(origin = {50, 52}, extent = {{-10, -10}, {10, 10}})));
protected
  parameter String file = "file://";
  parameter String geometryDirectory = "file://" + "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox" + "/RM3/geometry/float.stl";

equation
  connect(body.frame_a, frame_c) annotation(
    Line(points = {{0, -34}, {0, 100}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_a, body.frame_a) annotation(
    Line(points = {{50, 0}, {0, 0}, {0, -34}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_b, body.frame_a) annotation(
    Line(points = {{-40, 0}, {0, 0}, {0, -34}}, color = {95, 95, 95}));
  connect(fixedTranslation1.frame_b, frame_b) annotation(
    Line(points = {{70, 0}, {100, 0}}, color = {95, 95, 95}));
  connect(fixedTranslation.frame_a, frame_a) annotation(
    Line(points = {{-60, 0}, {-100, 0}}, color = {95, 95, 95}));
  connect(fixedShape.frame_a, body.frame_a) annotation(
    Line(points = {{30, -36}, {0, -36}, {0, -34}}, color = {95, 95, 95}));
  connect(absoluteSensor.frame_a, body.frame_a) annotation(
    Line(points = {{40, 52}, {0, 52}, {0, -34}}, color = {95, 95, 95}));
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 145}, {150, 105}}, textString = "%name", textColor = {0, 0, 255}), Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Body")}),
    Diagram);

end Body;
