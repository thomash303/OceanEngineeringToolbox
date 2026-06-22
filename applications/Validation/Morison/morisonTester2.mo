model morisonTester2
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
  inner OceanEngineeringToolbox.Environmental.Environment environment(redeclare RegularWave wave(file = fileDirectory.file) "Regular wave")  annotation(
    Placement(transformation(origin = {84, 6}, extent = {{-10, -10}, {10, 10}})));

// OceanEngineeringToolbox.Environmental.Measurement.waveBuoy waveBuoy annotation(
  // Placement(transformation(origin = {6, -38}, extent = {{-10, -10}, {10, 10}})));
  //parameter Integer bodyIndex = 1;
 OceanEngineeringToolbox.Hydro.HydrodynamicBody spar(bodyIndex = 2, I_11 = 94419615, I_22 = 94419615, I_33 = 94419615, ra_CM = {0, 0, -21.29}, enableExcitationForce = false, enableRadiationForce = false, enableHydrostaticForce = false, enableMorisonForce = true, morison(morisonForce(redeclare LinearWaveKin waveModel(file = fileDirectory.file) "Linear wave kinematics")), rME = {{0}, {0}, {0}}, nHatME = {{0}, {0}, {1}}, Cfk = {{1}, {1}}, Cd = {{1}, {1}}, Ac = {{20}, {10}}, Cam = {{1}, {1}}, VME = {50})  annotation(
    Placement(transformation(origin = {-28, -20}, extent = {{-10, -10}, {10, 10}})));
  OceanEngineeringToolbox.Multibody.Joints.FreeMotion freeMotion annotation(
    Placement(transformation(origin = {-60, 24}, extent = {{-10, -10}, {10, 10}})));
equation
//connect(float.frame_a, world.frame_b) annotation(
//  Line(points = {{-54, -28}, {-78, -28}, {-78, 70}}, color = {95, 95, 95}));
  connect(freeMotion.frame_b, spar.frame_a) annotation(
    Line(points = {{-50, 24}, {-38, 24}, {-38, -20}}, color = {95, 95, 95}));
  connect(freeMotion.frame_a, world.frame_b) annotation(
    Line(points = {{-70, 24}, {-78, 24}, {-78, 70}}, color = {95, 95, 95}));
  annotation(
    uses(OceanEngineeringToolbox(version = "v0.3")),
  Diagram(graphics = {Bitmap(extent = {{82, 4}, {82, 4}})}),
 experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-06, Interval = 0.266667));
end morisonTester2;
