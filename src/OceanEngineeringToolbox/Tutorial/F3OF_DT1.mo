within OceanEngineeringToolbox.Tutorial;

model F3OF_DT1 "Tutorial model for representing the F-3OF decay test 1 in the WEC3 comparison project"
  // Importing from the OET
  import OceanEngineeringToolbox.Hydro.*;
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels.*;
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.WaveModels.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveTypes.WaveSpectrumType;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.RandomDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveModels.*;
  inner Environmental.Environment environment(redeclare NoWave wave(file = fileDirectory.file) "No wave") annotation(
    Placement(transformation(origin = {-60, 72}, extent = {{-10, -8}, {10, 8}})));
  inner DataImport.FileDirectory fileDirectory(file = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/F3OF/F3OF_WhydroCoeff_TRIMMED.mat") annotation(
    Placement(transformation(origin = {-20, 72}, extent = {{-9, -7.25}, {9, 7.25}})));
  inner Multibody.Worlds.World world annotation(
    Placement(transformation(origin = {-76, -68}, extent = {{-10, -10}, {10, 10}})));
  /*
      Multibody.Joints.Revolute revolute annotation(
        Placement(transformation(origin = {-34, 8}, extent = {{-10, -10}, {10, 10}})));
      Multibody.Joints.Revolute revolute1 annotation(
        Placement(transformation(origin = {32, 10}, extent = {{-10, -10}, {10, 10}})));
      */
  Mooring.LinearMooring.linearMooring linearMooring(Km = diagonal({1e5, 0, 0, 0, 0, 0}), s_ref = {0, 0, -9, 0, 0, 0})  annotation(
    Placement(transformation(origin = {58, -38}, extent = {{-10, -10}, {10, 10}})));
  Hydro.HydrodynamicBody base(enableExcitationForce = true, animationEnable = false, geometryFile = "file://C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/F3OF/geometry/base.obj", bodyIndex = 1, enableRadiationForce = true, ra_CM = {-12.5, 0, 0}, rCM_b = {12.5, 0, 0}, I_22 = 7.63e7, I_11 = 7.63e7, I_33 = 7.63e7, redeclare Forces.RadiationB2B radiation(file = fileDirectory.file) "B2B Radiation Force") annotation(
    Placement(transformation(origin = {4, -10}, extent = {{-10, -10}, {10, 10}})));
  
  Hydro.HydrodynamicBody flap1(bodyIndex = 2, animationEnable = false, geometryFile = "file://C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/F3OF/geometry/flap.obj", rCM_b = {0, 0, -3.5}, enableRadiationForce = true, I_22 = 1.3e6, I_11 = 1.3e6, I_33 = 1.3e6, redeclare Forces.RadiationB2B radiation(file = fileDirectory.file) "B2B Radiation Force")  annotation(
                              Placement(transformation(origin = {-46, 14}, extent = {{-10, -10}, {10, 10}})));
  Hydro.HydrodynamicBody flap2(bodyIndex = 3, animationEnable = false, geometryFile = "file://C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/F3OF/geometry/flap.obj", ra_CM = {0, 0, 3.5}, enableRadiationForce = true, I_22 = 1.3e6, I_11 = 1.3e6, I_33 = 1.3e6, redeclare Forces.RadiationB2B radiation(file = fileDirectory.file) "B2B Radiation Force")  annotation(
                              Placement(transformation(origin = {56, 12}, extent = {{-10, -10}, {10, 10}})));
                            
  Multibody.Mass.FixedTranslation fixedTranslation(r = {0, 0, -9})  annotation(
    Placement(transformation(origin = {4, -56}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
                                        inner Hydro.Forces.SubForces.RadiationForces.RadiationB2BCoupler radiationB2BCoupler(file = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/F3OF/F3OFhydroCoeff.mat")  annotation(
                                          Placement(transformation(origin = {28, 68}, extent = {{-10, -10}, {10, 10}})));
                                        
  Multibody.Joints.Planar planar(s_x(start = 5, fixed = true))  annotation(
    Placement(transformation(origin = {-30, -68}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(fixedTranslation.frame_b, base.frame_c) annotation(
    Line(points = {{4, -46}, {4, -20}}, color = {95, 95, 95}));
  connect(linearMooring.frame_a, base.frame_c) annotation(
    Line(points = {{48, -38}, {4, -38}, {4, -20}}, color = {95, 95, 95}));
  connect(flap1.frame_b, base.frame_a) annotation(
    Line(points = {{-36, 14}, {-36, -10}, {-6, -10}}, color = {95, 95, 95}));
  connect(base.frame_b, flap2.frame_a) annotation(
    Line(points = {{14, -10}, {46, -10}, {46, 12}}, color = {95, 95, 95}));
  connect(planar.frame_b, fixedTranslation.frame_a) annotation(
    Line(points = {{-20, -68}, {4, -68}, {4, -66}}, color = {95, 95, 95}));
  connect(planar.frame_a, world.frame_b) annotation(
    Line(points = {{-40, -68}, {-66, -68}}, color = {95, 95, 95}));
  annotation(
    experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-06, Interval = 0.1));
end F3OF_DT1;
