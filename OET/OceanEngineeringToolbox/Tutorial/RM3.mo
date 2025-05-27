within OceanEngineeringToolbox.Tutorial;

model RM3
  "Tutorial model for representing the RM3"
  
  import Modelica.Mechanics.MultiBody.{World,Joints};
  
  inner World world annotation(
    Placement(transformation(origin = {-88, 0}, extent = {{-12, -12}, {12, 12}})));
  Hydro.HydrodynamicBody spar(enableRadiationForce = true, enableDampingDragForce = false, ra_CM = {0, 0, -21.29}, enableHydrostaticForce = true, bodyIndex = 2, I_11 = 94419615, I_22 = 94407091, I_33 = 28542225, enableExcitationForce = true, animationEnable = false, rCM_b(each displayUnit = "m"))  annotation(
    Placement(transformation(origin = {-5, -1}, extent = {{-15, -15}, {15, 15}})));
  Hydro.HydrodynamicBody float(enableRadiationForce = true, enableDampingDragForce = false, ra_CM = {0, 0, 20.57}, enableHydrostaticForce = true, bodyIndex = 1, I_11 = 20907301, I_22 = 21306091, I_33 = 37085481, enableExcitationForce = true)  annotation(
    Placement(transformation(origin = {69, 7}, extent = {{-15, -15}, {15, 15}})));
  inner Environmental.Environment environment(waveSelector = "Regular", frequencySelection = "equalEnergy")  annotation(
    Placement(transformation(origin = {8, 56}, extent = {{-12, -12}, {12, 12}})));
  inner DataImport.FileDirectory fileDirectory annotation(
    Placement(transformation(origin = {57, 57}, extent = {{-13, -13}, {13, 13}})));
  Joints.Prismatic prismatic(n = {0, 0, 1})  annotation(
    Placement(transformation(origin = {38, -30}, extent = {{-10, -10}, {10, 10}})));
  Joints.FreeMotion freeMotion annotation(
    Placement(transformation(origin = {-54, -48}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(prismatic.frame_b, float.frame_a) annotation(
    Line(points = {{48, -30}, {54, -30}, {54, 8}}, color = {95, 95, 95}));
  connect(prismatic.frame_a, spar.frame_b) annotation(
    Line(points = {{28, -30}, {10, -30}, {10, 0}}, color = {95, 95, 95}));
  connect(freeMotion.frame_b, spar.frame_a) annotation(
    Line(points = {{-44, -48}, {-20, -48}, {-20, 0}}, color = {95, 95, 95}));
  connect(freeMotion.frame_a, world.frame_b) annotation(
    Line(points = {{-64, -48}, {-74, -48}, {-74, 0}, {-76, 0}}, color = {95, 95, 95}));
  annotation(
    experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-06, Interval = 0.1));
end RM3;
