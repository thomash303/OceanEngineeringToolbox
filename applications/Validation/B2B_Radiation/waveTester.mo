model waveTester
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
  
  
 OceanEngineeringToolbox.Hydro.HydrodynamicBody float(animationEnable = false, bodyIndex = 1, enableRadiationForce = true, enableDampingDragForce = false, enableExcitationForce = true, I_11 = 20907301, I_22 = 21306091, I_33 = 37085481, ra_CM = {0, 0, 20.57}, enableHydrostaticForce = true, enableMorisonForce = false, nME = 1, Cfk = {{1}, {1}}, Cd = {{1}, {1}}, Ac = {{1}, {1}}, Cam = {{1}, {1}}, VME = {1}, rCM_b(each displayUnit = "um"), redeclare Forces.RadiationB2B radiation(file = fileDirectory.file) "B2B Radiation Force")  annotation(
    Placement(transformation(origin = {32, 2}, extent = {{-10, -10}, {10, 10}})));

// OceanEngineeringToolbox.Environmental.Measurement.waveBuoy waveBuoy annotation(
  // Placement(transformation(origin = {6, -38}, extent = {{-10, -10}, {10, 10}})));
  //parameter Integer bodyIndex = 1;
 OceanEngineeringToolbox.Hydro.HydrodynamicBody spar(bodyIndex = 2, I_11 = 94419615, I_22 = 94419615, I_33 = 94419615, redeclare Forces.RadiationB2B radiation(file = fileDirectory.file) "B2B Radiation Force", ra_CM = {0, 0, -21.29})  annotation(
    Placement(transformation(origin = {-40, 4}, extent = {{-10, -10}, {10, 10}})));
 inner OceanEngineeringToolbox.Hydro.Forces.SubForces.RadiationForces.RadiationB2BCoupler radiationB2BCoupler annotation(
    Placement(transformation(origin = {-8, 52}, extent = {{-10, -10}, {10, 10}})));
 OceanEngineeringToolbox.Multibody.Joints.Prismatic prismatic(n = {0, 0, 1})  annotation(
    Placement(transformation(origin = {-70, 24}, extent = {{-10, -10}, {10, 10}})));
 OceanEngineeringToolbox.Multibody.Joints.Prismatic prismatic1(n = {0, 0, 1}) annotation(
    Placement(transformation(origin = {-2, 4}, extent = {{-10, -10}, {10, 10}})));
equation
//connect(float.frame_a, world.frame_b) annotation(
//  Line(points = {{-54, -28}, {-78, -28}, {-78, 70}}, color = {95, 95, 95}));
  connect(prismatic.frame_a, world.frame_b) annotation(
    Line(points = {{-80, 24}, {-78, 24}, {-78, 70}}, color = {95, 95, 95}));
 connect(prismatic.frame_b, spar.frame_a) annotation(
    Line(points = {{-60, 24}, {-50, 24}, {-50, 4}}, color = {95, 95, 95}));
 connect(spar.frame_b, prismatic1.frame_a) annotation(
    Line(points = {{-30, 4}, {-12, 4}}, color = {95, 95, 95}));
 connect(prismatic1.frame_b, float.frame_a) annotation(
    Line(points = {{8, 4}, {22, 4}, {22, 2}}, color = {95, 95, 95}));

annotation(
    uses(OceanEngineeringToolbox(version = "v0.3")),
  Diagram(graphics = {Bitmap(extent = {{82, 4}, {82, 4}})}),
 experiment(StartTime = 0, StopTime = 400, Tolerance = 1e-06, Interval = 0.266667));
end waveTester;
