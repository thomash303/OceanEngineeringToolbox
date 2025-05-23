within OceanEngineeringToolbox.Tutorial;

model RM3
  "Tutorial model for representing the RM3"
  
  import Modelica.Mechanics.MultiBody.{World,Joints};
  
  inner World world annotation(
    Placement(transformation(origin = {-88, 0}, extent = {{-12, -12}, {12, 12}})));
  Hydro.HydrodynamicBody spar(enableRadiationForce = false, enableDampingDragForce = false, ra_CM = {0, 0, -21.29}, enableHydrostaticForce = false, bodyIndex = 2, I_11 = 94419615, I_22 = 94407091, I_33 = 28542225, enableExcitationForce = false, animationEnable = false)  annotation(
    Placement(transformation(origin = {-5, -1}, extent = {{-15, -15}, {15, 15}})));
  Hydro.HydrodynamicBody float(enableRadiationForce = false, enableDampingDragForce = false, ra_CM = {0, 0, 20.57}, enableHydrostaticForce = false, bodyIndex = 1, I_11 = 20907301, I_22 = 21306091, I_33 = 37085481, enableExcitationForce = false)  annotation(
    Placement(transformation(origin = {69, -1}, extent = {{-15, -15}, {15, 15}})));
  inner Environmental.Environment environment(waveSelector = "PiersonMoskowitz", frequencySelection = "random")  annotation(
    Placement(transformation(origin = {8, 56}, extent = {{-12, -12}, {12, 12}})));
  inner DataImport.FileDirectory fileDirectory annotation(
    Placement(transformation(origin = {57, 57}, extent = {{-13, -13}, {13, 13}})));
  Multibody.Joints.FreeMotion freeMotion annotation(
    Placement(transformation(origin = {-50, -28}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(freeMotion.frame_b, spar.frame_a) annotation(
    Line(points = {{-40, -28}, {-20, -28}, {-20, 0}}, color = {95, 95, 95}));
  connect(freeMotion.frame_a, world.frame_b) annotation(
    Line(points = {{-60, -28}, {-76, -28}, {-76, 0}}, color = {95, 95, 95}));
annotation(
    experiment(StartTime = 0, StopTime = 250, Tolerance = 1e-06, Interval = 0.002));
end RM3;
