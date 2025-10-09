within OceanEngineeringToolbox.Environmental.Wave;

model SpectrumImport
  "Model representing an imported wave spectrum"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  import Modelica.Math;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;  
  extends DataImport.ImportRecords.EnvironmentalImport.spectrumImportData;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  
  // Wave Heading Parameters
  parameter SI.Angle waveHeading = 0 "Wave heading";
  parameter Boolean multidirectionalEnable "Enable multidirectional wave";
  parameter Integer n "Spreading function constant";
    parameter SI.Angle waveHeadingSpread "Maximum spread (+/-) from the mean wave heading";
  parameter Integer waveHeadingSpreadBins "Number of discrete headings centered around the mean heading to consider in the spectrum spread";
  
  // Wave Heading Variables
  parameter SI.Angle spreadBinCentres[waveHeadingSpreadBins] = WaveFunctions.waveSpreadingBins(waveHeading = waveHeading, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins) "Bin centres";
  parameter Real D[waveHeadingSpreadBins] = WaveFunctions.waveSpreading(n = n, waveHeading = waveHeading, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins, spreadBinCentres = spreadBinCentres);
  parameter SI.Angle wrapped = Math.wrapAngle(waveHeading,true) "Directional spreading weights";
  
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
  
  // Spectrum variables
  parameter SI.Height zeta[waveHeadingSpreadBins, n_omega] = WaveFunctions.zeta(S = S, D = D, domega = domega, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins) "Wave amplitude component";
  SI.Height SSE "Sea surface elevation";
  
equation
  if time < Trmp then
    ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
  else
    ramp = 1;
  end if;
  
   SSE = WaveFunctions.waveElevation(zeta = zeta, phi = phi, omegaTime = omega*time, ramp = ramp, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins, multidirectionalEnable = multidirectionalEnable);
 
  annotation(
    defaultComponentName = "spectrumImport",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Spectrum Import")}),
    Diagram);
end SpectrumImport;
