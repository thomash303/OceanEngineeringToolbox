within OceanEngineeringToolbox.Tutorial;

model F3OF_DT1
  "Tutorial model for representing the F-3OF decay test 1 in the WEC3 comparison project"
  // Importing from the OET
  import OceanEngineeringToolbox.Hydro.*;
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.CurrentModels.*;
  import OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.WaveModels.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveTypes.WaveSpectrumType;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.RandomDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveModels.*;
  inner Environmental.Environment environment(redeclare NoWave wave(file = fileDirectory.file) "No wave")  annotation(
    Placement(transformation(origin = {-60, 72}, extent = {{-10, -8}, {10, 8}})));
  inner DataImport.FileDirectory fileDirectory annotation(
    Placement(transformation(origin = {-20, 72}, extent = {{-9, -7.25}, {9, 7.25}})));
  inner Multibody.Worlds.World world annotation(
    Placement(transformation(origin = {-70, -36}, extent = {{-10, -10}, {10, 10}})));
  Multibody.Joints.Revolute revolute annotation(
    Placement(transformation(origin = {-34, 8}, extent = {{-10, -10}, {10, 10}})));
  Multibody.Joints.Revolute revolute1 annotation(
    Placement(transformation(origin = {32, 10}, extent = {{-10, -10}, {10, 10}})));
  Mooring.LinearMooring.linearMooring linearMooring annotation(
    Placement(transformation(origin = {24, -30}, extent = {{-10, -10}, {10, 10}})));
  Multibody.Joints.FreeMotion freeMotion annotation(
    Placement(transformation(origin = {-18, -34}, extent = {{-10, -10}, {10, 10}})));
  Hydro.HydrodynamicBody base(enableExcitationForce = true)  annotation(
    Placement(transformation(origin = {-40, -76}, extent = {{-10, -10}, {10, 10}})));
  Hydro.HydrodynamicBody flap1 annotation(
    Placement(transformation(origin = {2, -74}, extent = {{-10, -10}, {10, 10}})));
  Hydro.HydrodynamicBody flap2 annotation(
    Placement(transformation(origin = {36, -72}, extent = {{-10, -10}, {10, 10}})));


end F3OF_DT1;
