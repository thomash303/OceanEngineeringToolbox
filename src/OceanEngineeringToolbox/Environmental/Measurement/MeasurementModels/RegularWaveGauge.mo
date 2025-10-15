within OceanEngineeringToolbox.Environmental.Measurement.MeasurementModels;

model RegularWaveGauge
  "Model representing a wave gauge to measure regular waves"
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  
    // Wave Gauge Enable
  parameter Boolean waveGaugeEnable "Flag to enable/disable wave gauge calculation";
  
  // Spectrum Parameters
  parameter SI.Height A "Wave amplitude" annotation(
    HideResult = true);
  parameter SI.AngularFrequency omegaPeak "Peak spectral frequency" annotation(
    HideResult = true);
  constant Integer n_omega "Number of frequency components";
  // Spectrum Variables
  parameter SI.WaveNumber k "Wave number component" annotation(
    HideResult = true);
  SI.Height SSE "Sea surface elevation";
  // Ramp
  Real ramp "Ramping function" annotation(
    HideResult = true);
  SI.Time Trmp "Interval for ramping up of waves during start phase" annotation(
    HideResult = true);
  parameter SI.Angle waveHeading "Wave heading";
  // Coordinates
  parameter SI.Position x "x-coordinate of the gauge";
  parameter SI.Position y "y-coordinate of the gauge";
equation
  if time < Trmp then
    ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
  else
    ramp = 1;
  end if;
  
  SSE = Wave.WaveFunctions.waveElevation(A = A, omegaTime = vector(omegaPeak*time), k = k, ramp = ramp, n_omega = n_omega, theta = waveHeading, waveGaugeEnable = waveGaugeEnable, x = x, y = y);
end RegularWaveGauge;
