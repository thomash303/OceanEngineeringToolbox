within OceanEngineeringToolbox.Environmental.Measurement;

model waveGauge
  "Model representing a wave gauge to exactly measure the incident wave elevation at the specified location"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Calling an outer model at the top-level deployment
  outer Environment environment;
  
  // Wave Gauge Enable
  parameter Boolean waveGaugeEnable = true "Flag to enable/disable wave gauge calculation" annotation(Dialog(group = "Wave Gauge"));
  
  // Coordinates
  parameter SI.Position x = 0 "x-coordinate of the gauge" annotation(Dialog(group = "Coordinates"));
  parameter SI.Position y = 0 "y-coordinate of the gauge" annotation(Dialog(group = "Coordinates"));
  
  // Regular wave gauge
  MeasurementModels.RegularWaveGauge regularWaveGauge(A = environment.regularWave.A, omegaPeak = environment.regularWave.omegaPeak, Trmp = environment.Trmp, n_omega = environment.regularWave.n_omega, k = environment.regularWave.k, waveHeading = environment.waveHeading, waveGaugeEnable = waveGaugeEnable, x = x, y = y) if environment.waveSelector == "Regular" annotation(
    Placement(transformation(origin = {-16, 28}, extent = {{-10, -10}, {10, 10}})));
  
  // Irregular wave equal-energy wave gauge
  MeasurementModels.IrregularWaveGauge irregularWaveGaugeEqualEnergy(zeta = environment.irregularWave.EqualEnergyGenerator.zeta, n_omega = environment.irregularWave.n_omega, omega = environment.irregularWave.EqualEnergyGenerator.omega, phi = environment.irregularWave.EqualEnergyGenerator.phi, Trmp = environment.Trmp, k = environment.irregularWave.EqualEnergyGenerator.k, waveHeading = environment.waveHeading, waveGaugeEnable = waveGaugeEnable, x = x, y = y) if (environment.waveSelector == "PiersonMoskowitz" or environment.waveSelector == "Bretschneider" or environment.waveSelector == "JONSWAP" or environment.waveSelector == "OchiHubble") and environment.frequencySelection == "equalEnergy" annotation(
    Placement(transformation(origin = {-16, -20}, extent = {{-10, -10}, {10, 10}})));
 
 // Irregular wave random wave gauge
 MeasurementModels.IrregularWaveGauge irregularWaveGaugeRandom(zeta = environment.irregularWave.RandomGenerator.zeta, n_omega = environment.irregularWave.n_omega, omega = environment.irregularWave.RandomGenerator.omega, phi = environment.irregularWave.RandomGenerator.phi, Trmp = environment.Trmp, k = environment.irregularWave.RandomGenerator.k, waveHeading = environment.waveHeading,  waveGaugeEnable = waveGaugeEnable, x = x, y = y) if (environment.waveSelector == "PiersonMoskowitz" or environment.waveSelector == "Bretschneider" or environment.waveSelector == "JONSWAP" or environment.waveSelector == "OchiHubble") and environment.frequencySelection == "random" annotation(
    Placement(transformation(origin = {-16, 4}, extent = {{-10, -10}, {10, 10}})));
 
// Irregular wave spectrum import wave Gauge
 MeasurementModels.IrregularWaveGauge irregularWaveGaugeSpectrumImport(zeta = environment.spectrumImport.zeta, n_omega = environment.spectrumImport.n_omega, omega = environment.spectrumImport.omega, phi = environment.spectrumImport.phi, Trmp = environment.Trmp, k = environment.spectrumImport.k, waveHeading = environment.waveHeading, waveGaugeEnable = waveGaugeEnable, x = x, y = y) if environment.waveSelector == "spectrumImport" annotation(
    Placement(transformation(origin = {-16, -44}, extent = {{-10, -10}, {10, 10}})));

equation

annotation(
    Diagram(coordinateSystem(extent = {{-40, 40}, {0, -60}})));

end waveGauge;
