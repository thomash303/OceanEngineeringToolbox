within OceanEngineeringToolbox.Tutorial;

model RM3_FMI "Tutorial model for representing the RM3"
  import Modelica.Mechanics.MultiBody.{World,Joints,Sensors};
  import Modelica.Blocks.{Sources,Interfaces, Math};
  import Modelica.Mechanics.Translational.Components;
  inner World world annotation(
    Placement(transformation(origin = {-88, 0}, extent = {{-12, -12}, {12, 12}})));
  Hydro.HydrodynamicBody spar(enableRadiationForce = false, enableDampingDragForce = false, ra_CM = {0, 0, -21.29}, enableHydrostaticForce = true, bodyIndex = 2, I_11 = 94419615, I_22 = 94407091, I_33 = 28542225, enableExcitationForce = true, animationEnable = true, rCM_b(each displayUnit = "m"), geometryFile = "file://C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/RM3/geometry/plate.stl", bodyColour = {128, 128, 128}) annotation(
    Placement(transformation(origin = {-3, -1}, extent = {{-15, -15}, {15, 15}})));
  Hydro.HydrodynamicBody float(enableRadiationForce = false, enableDampingDragForce = false, ra_CM = {0, 0, 20.57}, enableHydrostaticForce = true, bodyIndex = 1, I_11 = 20907301, I_22 = 21306091, I_33 = 37085481, enableExcitationForce = true, geometryFile = "file://C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/RM3/geometry/float.stl", animationEnable = true, bodyColour = {255, 255, 0}) annotation(
    Placement(transformation(origin = {69, 7}, extent = {{-15, -15}, {15, 15}})));
  inner Environmental.Environment environment(waveSelector = "Regular", frequencySelection = "equalEnergy") annotation(
    Placement(transformation(origin = {8, 56}, extent = {{-12, -12}, {12, 12}})));
  inner DataImport.FileDirectory fileDirectory annotation(
    Placement(transformation(origin = {57, 57}, extent = {{-13, -13}, {13, 13}})));
  Joints.Prismatic prismatic(n = {0, 0, 1}, useAxisFlange = true) annotation(
    Placement(transformation(origin = {38, -30}, extent = {{-10, -10}, {10, 10}})));
  Joints.FreeMotion freeMotion annotation(
    Placement(transformation(origin = {-56, -48}, extent = {{-10, -10}, {10, 10}})));
  Components.GeneralForceToPositionAdaptor forceToPositionAdaptor annotation(
    Placement(transformation(origin = {16, -80}, extent = {{-10, -10}, {10, 10}})));
  Math.Gain gain(k = 1)  annotation(
    Placement(transformation(origin = {80, -72}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.RealOutput y annotation(
    Placement(transformation(origin = {102, -44}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {102, -44}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(prismatic.frame_b, float.frame_a) annotation(
    Line(points = {{48, -30}, {54, -30}, {54, 8}}, color = {95, 95, 95}));
  connect(prismatic.frame_a, spar.frame_b) annotation(
    Line(points = {{28, -30}, {28, -1}, {12, -1}}, color = {95, 95, 95}));
  connect(freeMotion.frame_b, spar.frame_a) annotation(
    Line(points = {{-46, -48}, {-46, -1}, {-18, -1}}, color = {95, 95, 95}));
  connect(freeMotion.frame_a, world.frame_b) annotation(
    Line(points = {{-66, -48}, {-74, -48}, {-74, 0}, {-76, 0}}, color = {95, 95, 95}));
  connect(forceToPositionAdaptor.flange, prismatic.axis) annotation(
    Line(points = {{14, -80}, {46, -80}, {46, -24}}, color = {0, 127, 0}));
  connect(forceToPositionAdaptor.pder, gain.u) annotation(
    Line(points = {{20, -74}, {68, -74}, {68, -72}}, color = {0, 0, 127}));
  connect(gain.y, forceToPositionAdaptor.f) annotation(
    Line(points = {{92, -72}, {20, -72}, {20, -88}}, color = {0, 0, 127}));
  connect(forceToPositionAdaptor.pder, y) annotation(
    Line(points = {{20, -74}, {102, -74}, {102, -44}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-06, Interval = 0.1),
    Diagram);
end RM3_FMI;
