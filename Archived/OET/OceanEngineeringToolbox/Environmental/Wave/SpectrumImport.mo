within OceanEngineeringToolbox.Environmental.Wave;

model SpectrumImport
  "Model representing an imported wave spectrum"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;  
  extends DataImport.ImportRecords.EnvironmentalImport.spectrumImportData;

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

protected
  constant Real pi = pi "Mathematical constant pi";
equation
  if time < Trmp then
    ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
  else
    ramp = 1;
  end if;
  SSE = ramp.*sum(zeta.*cos(omega*time - phi));
  annotation(
    defaultComponentName = "spectrumImport",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Spectrum Import")}),
    Diagram);
end SpectrumImport;
