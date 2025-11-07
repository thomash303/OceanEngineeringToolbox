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
    Placement(transformation(origin = {-88, 0}, extent = {{-12, -12}, {12, 12}})));
  Hydro.HydrodynamicBody spar(enableRadiationForce = false, enableDampingDragForce = false, ra_CM = {0, 0, -21.29}, enableHydrostaticForce = true, bodyIndex = 2, I_11 = 94419615, I_22 = 94407091, I_33 = 28542225, enableExcitationForce = true, animationEnable = true, rCM_b(each displayUnit = "m"), geometryFile = "file://C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/RM3/geometry/plate.stl", bodyColour = {128, 128, 128})  annotation(
    Placement(transformation(origin = {-3, -1}, extent = {{-15, -15}, {15, 15}})));
  Hydro.HydrodynamicBody float(enableRadiationForce = false, enableDampingDragForce = false, ra_CM = {0, 0, 20.57}, enableHydrostaticForce = true, bodyIndex = 1, I_11 = 20907301, I_22 = 21306091, I_33 = 37085481, enableExcitationForce = true, geometryFile = "file://C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/RM3/geometry/float.stl", animationEnable = true, bodyColour = {255, 255, 0})  annotation(
    Placement(transformation(origin = {69, 7}, extent = {{-15, -15}, {15, 15}})));
  inner Environmental.Environment environment  annotation(
    Placement(transformation(origin = {-16, 46}, extent = {{-12, -12}, {12, 12}})));
  inner DataImport.FileDirectory fileDirectory(file = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/RM3/RM3HydroCoeff.mat")  annotation(
    Placement(transformation(origin = {58, 58}, extent = {{-12, -12}, {12, 12}})));
  Multibody.Joints.Prismatic prismatic(n = {0, 0, 1})  annotation(
    Placement(transformation(origin = {38, -30}, extent = {{-10, -10}, {10, 10}})));
  Multibody.Joints.FreeMotion freeMotion annotation(
    Placement(transformation(origin = {-56, -48}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(prismatic.frame_b, float.frame_a) annotation(
    Line(points = {{48, -30}, {54, -30}, {54, 8}}, color = {95, 95, 95}));
  connect(prismatic.frame_a, spar.frame_b) annotation(
    Line(points = {{28, -30}, {28, -1}, {12, -1}}, color = {95, 95, 95}));
  connect(freeMotion.frame_b, spar.frame_a) annotation(
    Line(points = {{-46, -48}, {-46, -1}, {-18, -1}}, color = {95, 95, 95}));
  connect(freeMotion.frame_a, world.frame_b) annotation(
    Line(points = {{-66, -48}, {-74, -48}, {-74, 0}, {-76, 0}}, color = {95, 95, 95}));
  annotation(
    experiment(StartTime = 0, StopTime = 150, Tolerance = 1e-06, Interval = 0.1));
end RM3;
