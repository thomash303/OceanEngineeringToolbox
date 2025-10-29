within OceanEngineeringToolbox.Environmental.Wave.WaveModels;

model SpectrumImportWave
  "Model representing an imported wave spectrum"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  import Modelica.Math;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;  
  extends DataImport.ImportRecords.EnvironmentalImport.spectrumImportData;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  extends BaseWave(
    n_omega = SDim[2],
    waveHeadingSpreadBins = phiDim[2],
  redeclare parameter Real alphaPM,
  redeclare parameter Real gamma,
  redeclare parameter Real sigmaA,
  redeclare parameter Real sigmaB,
  redeclare parameter SI.Height HsOH,
  redeclare parameter SI.AngularFrequency omegaPeakOH,
  redeclare parameter Real lambdaOH,
  redeclare parameter Integer componentSpectra,
  redeclare parameter Integer localSeedPhase,
  redeclare parameter Integer globalSeedPhase,
  waveSpectrum = waveSpectrum,
  redeclare parameter String waveSelector,
  redeclare parameter String frequencySelection,
  redeclare parameter SI.Height Hs,
  redeclare parameter SI.Time Tp
  );
    
  // Wave Heading Variables
  parameter SI.Angle spreadBinCentres[waveHeadingSpreadBins] = WaveFunctions.waveSpreadingBins(waveHeading = waveHeading, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins) "Bin centres" annotation(Dialog(enable = false, tab = "Misc"));
  parameter Real D[waveHeadingSpreadBins] = WaveFunctions.waveSpreading(n = n, waveHeading = waveHeading, multidirectionalEnable = multidirectionalEnable, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins, spreadBinCentres = spreadBinCentres) "Directional spreading weights" annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.Angle wrapped = Math.wrapAngle(waveHeading,true) annotation(Dialog(enable = false, tab = "Misc"));

  // Frequency variables
  parameter SI.AngularFrequency omegaMin = omega[1] "Lowest frequency component" annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.AngularFrequency omegaMax = omega[end] "Highest frequency component" annotation(Dialog(enable = false, tab = "Misc"));

  // Intermediate calculations
  parameter SI.AngularFrequency domega[n_omega] = WaveFunctions.SpectrumDiscritization.SpectrumCalculations.diferenceFrequencyStep(omega = omega, n_omega = n_omega) "Frequency step size" annotation(Dialog(enable = false, tab = "Misc"));
  parameter WaveUnits.powerPerUnitLength P = WaveFunctions.wavePower(rho = rho, d = d, k = k, S = S, domega = domega, n_omega = n_omega) "Wave time-average power per unit wave crest length"  annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.WaveNumber k[n_omega] = WaveFunctions.waveNumber(d, omega, n_omega) "Wave number component"  annotation(Dialog(enable = false, tab = "Misc"));
  
  // Spectrum variables
  parameter SI.Height zeta[waveHeadingSpreadBins,n_omega] = WaveFunctions.zeta(S = S, D = D, domega = domega, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins) "Wave amplitude component"  annotation(Dialog(enable = false, tab = "Misc"));
  
  // Wave Elevation
  SI.Height SSE "Sea surface elevation";  
  
equation
   
  SSE = WaveFunctions.waveElevation(zeta = zeta, phi = phi, omegaTime = omega*time, k = k, ramp = ramp, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins, theta = waveHeading);
 
  annotation(
    defaultComponentName = "spectrumImport",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Spectrum Import")}),
    Diagram);

end SpectrumImportWave;
