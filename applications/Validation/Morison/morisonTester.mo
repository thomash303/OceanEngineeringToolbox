model morisonTester
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels.*;
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.WaveModels.*;
  import OceanEngineeringToolbox.Hydro.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveTypes.WaveSpectrumType;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.RandomDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveModels.*;
  inner OceanEngineeringToolbox.Multibody.Worlds.World world annotation(
    Placement(transformation(origin = {-88, 70}, extent = {{-10, -10}, {10, 10}})));
  inner OceanEngineeringToolbox.DataImport.FileDirectory fileDirectory annotation(
    Placement(transformation(origin = {40, 50}, extent = {{-10, -10}, {10, 10}})));
  inner OceanEngineeringToolbox.Environmental.Environment environment(redeclare RegularWave wave(file = fileDirectory.file) "Regular wave", Uc0 = 2) annotation(
    Placement(transformation(origin = {84, 6}, extent = {{-10, -10}, {10, 10}})));
  // OceanEngineeringToolbox.Environmental.Measurement.waveBuoy waveBuoy annotation(
  // Placement(transformation(origin = {6, -38}, extent = {{-10, -10}, {10, 10}})));
  //parameter Integer bodyIndex = 1;
  OceanEngineeringToolbox.Hydro.HydrodynamicBody monopile(bodyIndex = 1, I_11 = 1.25*1e9, I_22 = 1.25*1e9, I_33 = 0.15, enableExcitationForce = false, enableRadiationForce = false, enableHydrostaticForce = false, enableMorisonForce = true, M = fill(1044536, 1, 1), rME = {{0, 0}, {0, 0}, {1, -1}}, Cfk = {{1, 1}, {1, 1}}, Cd = {{1, 1}, {1, 1}}, Ac = {{300, 300}, {150, 50}}, Cam = {{1, 1}, {1, 1}}, VME = {3.14*100*30, 3.14*100*30}, nHatME = {{0, 0}, {0, 0}, {1, 1}}, morison(morisonForce(redeclare NoCurrent currentModel "No current", redeclare LinearWaveKin waveModel(file = fileDirectory.file) "Linear wave kinematics")), redeclare Forces.Radiation radiation(file = fileDirectory.file) "Radiation Force", nME = 2) annotation(
    Placement(transformation(origin = {-40, 12}, extent = {{-10, -10}, {10, 10}})));
  OceanEngineeringToolbox.Multibody.Joints.Fixed fixed(r = {0, 0, -25}) annotation(
    Placement(transformation(origin = {-50, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
//connect(float.frame_a, world.frame_b) annotation(
//  Line(points = {{-54, -28}, {-78, -28}, {-78, 70}}, color = {95, 95, 95}));
  connect(fixed.frame_b, monopile.frame_a) annotation(
    Line(points = {{-50, -22}, {-50, 12}}, color = {95, 95, 95}));
  annotation(
    uses(OceanEngineeringToolbox(version = "v0.3")),
    Diagram(graphics = {Bitmap(extent = {{82, 4}, {82, 4}})}),
    experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-06, Interval = 0.266667));
end morisonTester;
