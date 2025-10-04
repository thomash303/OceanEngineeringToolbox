within OceanEngineeringToolbox.Environmental.Wave;

model SpectrumImport
  "Model representing an imported wave spectrum"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;  
  extends DataImport.ImportRecords.EnvironmentalImport.spectrumImportData;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;

  // Spectrum variables
  parameter SI.Height zeta[n_omega] = sqrt(2*S.*domega) "Wave amplitude component";
  SI.Height SSE "Sea surface elevation";
  
  // Ramp
  Real ramp "Ramping function";
  parameter SI.Time Trmp "Interval for ramping up of waves during start phase";

  // Frequency variables
  parameter SI.AngularFrequency omegaMin = omega[1] "Lowest frequency component";
  parameter SI.AngularFrequency omegaMax = omega[end] "Highest frequency component";

  parameter SI.AngularFrequency domega[n_omega] = WaveFunctions.SpectrumDiscritization.SpectrumCalculations.diferenceFrequencyStep(omega = omega, n_omega = n_omega) "Frequency step size" annotation(Evaluate = false);
  
    parameter WaveUnits.powerPerUnitLength P = WaveFunctions.wavePower(rho = rho, d = d, k = k, S = S, domega = domega, n_omega = n_omega) "Wave time-average power per unit wave crest length";

  // Intermediate calculations
  parameter SI.WaveNumber k[n_omega] = WaveFunctions.waveNumber(d, omega, n_omega) "Wave number component" annotation(HideResult = true);
  
equation
  if time < Trmp then
    ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
  else
    ramp = 1;
  end if;
  
   SSE = WaveFunctions.waveElevation(zeta = zeta, phi = phi, omegaTime = omega, ramp = ramp, n_omega = n_omega);
 
  annotation(
    defaultComponentName = "spectrumImport",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Spectrum Import")}),
    Diagram);
end SpectrumImport;
