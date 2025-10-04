within OceanEngineeringToolbox.Environmental.Measurement;

model waveBuoy
  "Model representing a wave buoy to exactly measure the incident wave elevation at the specified location"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Calling an outer model at the top-level deployment
  outer Environment environment;
  
  // Coordinates
  parameter SI.Position x = 0 "x-coordinate of the buoy" annotation(Dialog(group = "Coordinates"));
  parameter SI.Position y = 0 "y-coordinate of the buoy" annotation(Dialog(group = "Coordinates"));
  
  // Regular wavebuoy
  MeasurementModels.RegularWaveBuoy regularWaveBuoy(A = environment.regularWave.A, omegaPeak = environment.regularWave.omegaPeak, Trmp = environment.Trmp, k = environment.regularWave.k, theta = environment.waveHeading, x = x, y = y) if environment.waveSelector == "Regular" annotation(
    Placement(transformation(origin = {-16, 28}, extent = {{-10, -10}, {10, 10}})));
  
  // Irregular wave equal-energy wave buoy
  MeasurementModels.IrregularWaveBuoy irregularWaveBuoyEqualEnergy(zeta = environment.irregularWave.EqualEnergyGenerator.zeta, n_omega = environment.irregularWave.n_omega, omega = environment.irregularWave.EqualEnergyGenerator.omega, phi = environment.irregularWave.EqualEnergyGenerator.phi, Trmp = environment.Trmp, k = environment.irregularWave.EqualEnergyGenerator.k, theta = environment.waveHeading, x = x, y = y) if (environment.waveSelector == "PiersonMoskowitz" or environment.waveSelector == "Bretschneider" or environment.waveSelector == "JONSWAP" or environment.waveSelector == "OchiHubble") and environment.frequencySelection == "equalEnergy" annotation(
    Placement(transformation(origin = {-16, -20}, extent = {{-10, -10}, {10, 10}})));
 
 // Irregular wave random wave buoy
 MeasurementModels.IrregularWaveBuoy irregularWaveBuoyRandom(zeta = environment.irregularWave.RandomGenerator.zeta, n_omega = environment.irregularWave.n_omega, omega = environment.irregularWave.RandomGenerator.omega, phi = environment.irregularWave.RandomGenerator.phi, Trmp = environment.Trmp, k = environment.irregularWave.RandomGenerator.k, theta = environment.waveHeading, x = x, y = y) if (environment.waveSelector == "PiersonMoskowitz" or environment.waveSelector == "Bretschneider" or environment.waveSelector == "JONSWAP" or environment.waveSelector == "OchiHubble") and environment.frequencySelection == "random" annotation(
    Placement(transformation(origin = {-16, 4}, extent = {{-10, -10}, {10, 10}})));
 
// Irregular wave spectrum import wave buoy
 MeasurementModels.IrregularWaveBuoy irregularWaveBuoySpectrumImport(zeta = environment.spectrumImport.zeta, n_omega = environment.spectrumImport.n_omega, omega = environment.spectrumImport.omega, phi = environment.spectrumImport.phi, Trmp = environment.Trmp, k = environment.spectrumImport.k, theta = environment.waveHeading, x = x, y = y) if environment.waveSelector == "spectrumImport" annotation(
    Placement(transformation(origin = {-16, -44}, extent = {{-10, -10}, {10, 10}})));

protected
  // Spectrum Parameters
  parameter String waveSelector = environment.waveSelector annotation(HideResult = true);

equation

annotation(
    Diagram(coordinateSystem(extent = {{-40, 40}, {0, -60}})));
end waveBuoy;
