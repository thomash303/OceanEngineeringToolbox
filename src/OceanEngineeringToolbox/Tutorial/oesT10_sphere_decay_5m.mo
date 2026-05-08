within OceanEngineeringToolbox.Tutorial;

model oesT10_sphere_decay_5m "Model for representing the OES Task 10 heaving sphere for the 1m decay test"

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
    Placement(transformation(origin = {-32, -32}, extent = {{-10, -10}, {10, 10}})));
  Multibody.Joints.Prismatic prismatic(s(start = 5, fixed = true))  annotation(
    Placement(transformation(origin = {-6, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Hydro.HydrodynamicBody sphere(ra_CM = {0, 0, -2}, bodyIndex = 1, enableRadiationForce = true)  annotation(
    Placement(transformation(origin = {8, 38}, extent = {{-10, -10}, {10, 10}})));
  inner Environmental.Environment environment(redeclare NoWave wave(file = fileDirectory.file) "No wave")  annotation(
    Placement(transformation(origin = {-68, 74}, extent = {{-10, -8}, {10, 8}})));
  inner DataImport.FileDirectory fileDirectory(file = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/Sphere_oes_task_10/SPHEREhydroCoeff.mat")  annotation(
    Placement(transformation(origin = {-30, 74}, extent = {{-9, -7.25}, {9, 7.25}})));
equation
  connect(world.frame_b, prismatic.frame_a) annotation(
    Line(points = {{-22, -32}, {-6, -32}, {-6, -8}}, color = {95, 95, 95}));
  connect(prismatic.frame_b, sphere.frame_a) annotation(
    Line(points = {{-6, 12}, {-6, 23}, {-2, 23}, {-2, 38}}, color = {95, 95, 95}));
annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.1));
end oesT10_sphere_decay_5m;
