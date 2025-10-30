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
    n_omega = SDim[2], redeclare parameter SI.Height Hs, redeclare parameter SI.Time Tp, redeclare SI.Angle waveHeading);
    
  // Wave parameters
  parameter WaveTypes.WaveSpectrumType waveSpectrum = WaveTypes.WaveSpectrumType.PiersonMoskowitz "Wave Spectrum Type" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Multidirectional wave parameters
  parameter Boolean multidirectionalEnable = false "Enable multidirectional wave"  annotation(Dialog(enable = false, tab = "Misc"));
  parameter Integer n(min=1) = 5 "Spreading function constant" annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.Angle waveHeadingSpread(min=0,max=pi) = pi/6 "Maximum spread (+/-) from the mean wave heading" annotation(Dialog(enable = false, tab = "Misc"));
  parameter Integer waveHeadingSpreadBins = phiDim[2] "Number of discrete headings centered around the mean heading to consider in the spectrum spread"  annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Random phase selection
  parameter Integer localSeedPhase = 614757 "Local random seed for phase shifts"  annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer globalSeedPhase = 40020 "Global random seed for phase shifts"  annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
    
  // Wave Heading Variables
  parameter SI.Angle spreadBinCentres[waveHeadingSpreadBins] = WaveFunctions.waveSpreadingBins(waveHeading = waveHeading, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins) "Bin centres"  annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Real D[waveHeadingSpreadBins] = WaveFunctions.waveSpreading(n = n, waveHeading = waveHeading, multidirectionalEnable = multidirectionalEnable, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins, spreadBinCentres = spreadBinCentres) "Directional spreading weights" annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.Angle wrapped = Math.wrapAngle(waveHeading,true) annotation(Dialog(enable = false, tab = "Misc"));

  // Frequency variables
  parameter SI.AngularFrequency omegaMin = omega[1] "Lowest frequency component" annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.AngularFrequency omegaMax = omega[end] "Highest frequency component" annotation(Dialog(enable = false, tab = "Misc"));

  // Intermediate calculations
  parameter SI.AngularFrequency domega[n_omega] = WaveFunctions.SpectrumDiscritization.SpectrumCalculations.diferenceFrequencyStep(omega = omega, n_omega = n_omega) "Frequency step size" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter WaveUnits.powerPerUnitLength P = WaveFunctions.wavePower(rho = rho, d = d, k = k, S = S, domega = domega, n_omega = n_omega) "Wave time-average power per unit wave crest length"  annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.WaveNumber k[n_omega] = WaveFunctions.waveNumber(d, omega, n_omega) "Wave number component"  annotation(Dialog(enable = false, tab = "Misc"));
  
  // Spectrum variables
  parameter SI.Height zeta[waveHeadingSpreadBins,n_omega] = WaveFunctions.zeta(S = S, D = D, domega = domega, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins) "Wave amplitude component" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Wave Elevation
  SI.Height SSE "Sea surface elevation";  
  
equation
   
  SSE = WaveFunctions.waveElevation(zeta = zeta, phi = phi, omegaTime = omega*time, k = k, ramp = ramp, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins, theta = waveHeading);
 
  annotation(
    defaultComponentName = "spectrumImport",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Spectrum Import")}),
    Diagram);

end SpectrumImportWave;
