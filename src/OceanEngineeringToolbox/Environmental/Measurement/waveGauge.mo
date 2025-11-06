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
  
  MeasurementModels.SubWaveGauge subWaveGauge(zeta = environment.wave.zeta, n_omega = environment.wave.n_omega, omega = environment.wave.omega, phi = environment.wave.phi, ramp = environment.wave.ramp, Trmp = environment.Trmp, k = environment.wave.k, waveHeading = environment.wave.waveHeading, waveHeadingSpreadBins = environment.wave.waveHeadingSpreadBins, waveGaugeEnable = waveGaugeEnable, x = x, y = y) annotation(
    Placement(transformation(origin = {-20, -10}, extent = {{-10, -10}, {10, 10}})));

annotation(
    Diagram(coordinateSystem(extent = {{-40, 40}, {0, -60}})));

end waveGauge;
