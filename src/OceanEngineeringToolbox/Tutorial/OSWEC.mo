within OceanEngineeringToolbox.Tutorial;

model OSWEC "Tutorial model for representing an OSWEC"
  import OceanEngineeringToolbox.Hydro.*;
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels.*;
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.WaveModels.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveTypes.WaveSpectrumType;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.RandomDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveModels.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveTypes.WaveSpectrumType.*;
  import Modelica.Mechanics.Rotational.Components;
  inner Multibody.Worlds.World world annotation(
    Placement(transformation(origin = {-58, -38}, extent = {{-10, -10}, {10, 10}})));
  inner Environmental.Environment environment(redeclare RegularWave wave(file = fileDirectory.file) "Regular wave") annotation(
    Placement(transformation(origin = {-72, 58}, extent = {{-10, -10}, {10, 10}})));
  inner DataImport.FileDirectory fileDirectory(file = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/OSWEC/OSWECHydroCoeff.mat") annotation(
    Placement(transformation(origin = {-34, 58}, extent = {{-10, -10}, {10, 10}})));
  Hydro.HydrodynamicBody flap(enableRadiationForce = true, enableDampingDragForce = false, animationEnable = false, I_22 = 1.85e6, bodyIndex = 1, ra_CM = {0, 0, 5}, CD = {0, 0, 0, 0, 100000, 0}, Ad = {0, 0, 0, 0, 1, 0}, M = {{127e3}}, geometryFile = "file://C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/OSWEC/geometry/flap.stl", bodyColour = {128, 128, 128}) annotation(
    Placement(transformation(origin = {10, 32}, extent = {{-10, -10}, {10, 10}})));
  Multibody.Joints.Fixed fixed(r = {0, 0, -8.9}) annotation(
    Placement(transformation(origin = {2, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Multibody.Joints.Revolute revolute(n = {0, 1, 0}, useAxisFlange = false, phi(fixed = false)) annotation(
    Placement(transformation(origin = {2, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(fixed.frame_b, revolute.frame_a) annotation(
    Line(points = {{2, -38}, {2, -22}}, color = {95, 95, 95}));
  connect(revolute.frame_b, flap.frame_a) annotation(
    Line(points = {{2, -2}, {2, 0}, {0, 0}, {0, 32}}, color = {95, 95, 95}));
  annotation(
    experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-06, Interval = 0.1));
end OSWEC;
