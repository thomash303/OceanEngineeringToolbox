within OceanEngineeringToolbox.Environmental.Measurement.MeasurementModels;

model IrregularWaveGauge
  "Model representing a wave gauge to measure irregular waves"
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  
  // Wave Gauge Enable
  parameter Boolean waveGaugeEnable "Flag to enable/disable wave gauge calculation";
  
  // Spectrum Parameters
  parameter SI.Height zeta[waveHeadingSpreadBins, n_omega] "Wave amplitude component" annotation(
    HideResult = true);
  
  // Wave Heading Parameters
  parameter SI.Angle waveHeading "Wave heading";
  parameter Integer waveHeadingSpreadBins "Number of discrete headings centered around the mean heading to consider in the spectrum spread";
  
  // Frequency variables
  parameter SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation" annotation(
    HideResult = true);
  parameter Integer n_omega "Number of frequency components (default is 100 for irregular)" annotation(
    HideResult = true);
  // Random phase selection
  parameter SI.Angle phi[waveHeadingSpreadBins, n_omega] "Wave components phase shift" annotation(
    HideResult = true);
  // Spectrum Variables
  parameter SI.WaveNumber k[n_omega] "Wave number component" annotation(
    HideResult = true);
  SI.Height SSE "Sea surface elevation";
  // Ramp
  Real ramp "Ramping function" annotation(
    HideResult = true);
  SI.Time Trmp "Interval for ramping up of waves during start phase" annotation(
    HideResult = true);

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
  
  SSE = Wave.WaveFunctions.waveElevation(zeta = zeta, omegaTime = omega*time, phi = phi, k = k, ramp = ramp, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins, theta = waveHeading, waveGaugeEnable = waveGaugeEnable, x = x, y = y);
    
end IrregularWaveGauge;
