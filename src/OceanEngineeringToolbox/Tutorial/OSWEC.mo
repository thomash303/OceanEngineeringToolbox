within OceanEngineeringToolbox.Tutorial;

model OSWEC
  "Tutorial model for representing an OSWEC"
  
  import Modelica.Mechanics.MultiBody.{World,Joints};
  
  inner World world annotation(
    Placement(transformation(origin = {-84, 50}, extent = {{-10, -10}, {10, 10}})));
  inner Environmental.Environment environment(waveHeading = 0, waveSelector = "PiersonMoskowitz", frequencySelection = "equalEnergy")  annotation(
    Placement(transformation(origin = {16, 26}, extent = {{-10, -10}, {10, 10}})));
  inner DataImport.FileDirectory fileDirectory(file = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/OSWEC/OSWECHydroCoeff.mat")   annotation(
    Placement(transformation(origin = {74, 14}, extent = {{-10, -10}, {10, 10}})));
  Hydro.HydrodynamicBody flap(enableRadiationForce = false, enableDampingDragForce = false, animationEnable = false, I_11 = 10000000, I_22 = 1000000, I_33 = 1000000)  annotation(
    Placement(transformation(origin = {-36, -24}, extent = {{-10, -10}, {10, 10}})));
equation

end OSWEC;
