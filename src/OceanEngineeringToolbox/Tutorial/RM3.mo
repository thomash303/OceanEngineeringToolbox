within OceanEngineeringToolbox.Tutorial;

model RM3
  "Tutorial model for representing the RM3"
  // Importing from the OET
  import OceanEngineeringToolbox.Hydro.*;
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels.*;
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.WaveModels.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveTypes.WaveSpectrumType;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.RandomDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveModels.*;
  
  inner Multibody.Worlds.World world annotation(
    Placement(transformation(origin = {-80, 0}, extent = {{-12, -12}, {12, 12}})));
  Hydro.HydrodynamicBody spar(enableRadiationForce = true, enableDampingDragForce = false, ra_CM = {0, 0, -21.29}, enableHydrostaticForce = true, bodyIndex = 2, I_11 = 94419615, I_22 = 94407091, I_33 = 28542225, enableExcitationForce = true, animationEnable = true, rCM_b(each displayUnit = "m"), geometryFile = "file://C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/RM3/geometry/plate.stl", bodyColour = {128, 128, 128})  annotation(
    Placement(transformation(origin = {-3, -1}, extent = {{-15, -15}, {15, 15}})));
  Hydro.HydrodynamicBody float(enableRadiationForce = true, enableDampingDragForce = false, ra_CM = {0, 0, 20.57}, enableHydrostaticForce = true, bodyIndex = 1, I_11 = 20907301, I_22 = 21306091, I_33 = 37085481, enableExcitationForce = true, geometryFile = "file://C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/RM3/geometry/float.stl", animationEnable = true, bodyColour = {255, 255, 0})  annotation(
    Placement(transformation(origin = {67, 7}, extent = {{-15, -15}, {15, 15}})));
  inner Environmental.Environment environment  annotation(
    Placement(transformation(origin = {-22, 52}, extent = {{-12, -12}, {12, 12}})));
  inner DataImport.FileDirectory fileDirectory(file = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/RM3/RM3v1hydroCoeff.mat")  annotation(
    Placement(transformation(origin = {24, 52}, extent = {{-12, -12}, {12, 12}})));
  
  import Modelica.Mechanics.MultiBody.Joints.Prismatic;
  Prismatic prismatic(n = {0, 0, 1})  annotation(
    Placement(transformation(origin = {32, -26}, extent = {{-10, -10}, {10, 10}})));
  Multibody.Joints.Planar planar annotation(
    Placement(transformation(origin = {-42, -26}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(prismatic.frame_b, float.frame_a) annotation(
    Line(points = {{42, -26}, {42, 7}, {52, 7}}, color = {95, 95, 95}));
  connect(prismatic.frame_a, spar.frame_b) annotation(
    Line(points = {{22, -26}, {12, -26}, {12, 0}}, color = {95, 95, 95}));
  connect(planar.frame_a, world.frame_b) annotation(
    Line(points = {{-52, -26}, {-68, -26}, {-68, 0}}, color = {95, 95, 95}));
  connect(planar.frame_b, spar.frame_a) annotation(
    Line(points = {{-32, -26}, {-18, -26}, {-18, 0}}, color = {95, 95, 95}));
  annotation(
    experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-06, Interval = 0.1));
end RM3;
