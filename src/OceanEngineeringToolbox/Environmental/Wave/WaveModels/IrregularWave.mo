within OceanEngineeringToolbox.Environmental.Wave.WaveModels;

model IrregularWave
  "Model representing an irregular wave"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  import OceanEngineeringToolbox.Environmental.Wave.WaveTypes.WaveSpectrumType;
  extends BaseWave(n_omega = 100);
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization.equalEnergyGenerator;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.RandomDiscritization.randomGenerator;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.BaseSpectrumDiscritization;
  
  // Wave parameters
  parameter WaveSpectrumType waveSpectrum = WaveTypes.WaveSpectrumType.PiersonMoskowitz "Wave Spectrum Type" annotation(
    Dialog(group = "Wave Parameters"));
    
  // Multidirectional wave Parameters
  parameter Boolean multidirectionalEnable = false "Enable multidirectional wave" annotation(choices(checkBox = true), Dialog(group = "Multidirectional Wave Parameters"));
  parameter Integer n(min=1) = 5 "Spreading function constant" annotation(Dialog(group = "Multidirectional Wave Parameters", enable = multidirectionalEnable));
  parameter SI.Angle waveHeadingSpread(min=0,max=pi) = pi/6 "Maximum spread (+/-) from the mean wave heading" annotation(Dialog(group = "Multidirectional Wave Parameters", enable = multidirectionalEnable));
  parameter Integer waveHeadingSpreadBins = 1 "Number of discrete headings centered around the mean heading to consider in the spectrum spread" annotation(Dialog(group = "Multidirectional Wave Parameters", enable = multidirectionalEnable));
    
  // Wave spectrum parameters
  // Pierson-Moskowitz parameters
  parameter Real alphaPM(min=0) = 0.0081 "Energy scale (Phillips constant)" annotation(
    Dialog(group = "Pierson-Moskowitz Parameters", enable = waveSpectrum == WaveTypes.WaveSpectrumType.PiersonMoskowitz));
    
  // JONSWAP parameters
  parameter Real gamma(min=0) = 3.3 "Peak enhancement factor for JONSWAP spectrum. The mean typical value is 3.3" annotation(
    Dialog(group = "JONSWAP Parameters", enable = waveSpectrum == WaveTypes.WaveSpectrumType.JONSWAP));
  parameter Real sigmaA(min=0) = 0.07 "Lower spectral bound for JONSWAP" annotation(
    Dialog(group = "JONSWAP Parameters", enable = waveSpectrum == WaveTypes.WaveSpectrumType.JONSWAP));
  parameter Real sigmaB(min=0) = 0.09 "Upper spectral bound for JONSWAP" annotation(
    Dialog(group = "JONSWAP Parameters", enable = waveSpectrum == WaveTypes.WaveSpectrumType.JONSWAP));

// Ochi-Hubble parameters (including sample values from original paper)
  // Default parameters computed from most likely sea state
  parameter SI.Height HsOH[componentSpectra] = {0.84*Hs,0.54*Hs} "Significant wave heights" annotation(
    Dialog(group = "Ochi-Hubble Parameters", enable = waveSpectrum == WaveTypes.WaveSpectrumType.OchiHubble)); 
  parameter SI.AngularFrequency omegaPeakOH[componentSpectra] = {0.7*exp(-0.046*Hs),1.15*exp(-0.039*Hs)} "Peak spectral frequencies" annotation(
    Dialog(group = "Ochi-Hubble Parameters", enable = waveSpectrum == WaveTypes.WaveSpectrumType.OchiHubble)); 
  parameter Real lambdaOH[componentSpectra] = {3,1.54*exp(-0.062*Hs)} "Peak shape parameter" annotation(
    Dialog(group = "Ochi-Hubble Parameters", enable = waveSpectrum == WaveTypes.WaveSpectrumType.OchiHubble));
  parameter Integer componentSpectra(min=0) = 2 annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Random phase selection
  parameter Integer localSeedPhase = 614757 "Local random seed for phase shifts" annotation(
    Dialog(group = "Random Phase Parameters"));
  parameter Integer globalSeedPhase = 40020 "Global random seed for phase shifts" annotation(
    Dialog(group = "Random Phase Parameters"));
    
  // Random frequency selection
  parameter Integer localSeedFrequency = 614657 "Local random seed for frequency selection" annotation(Dialog(enable = false, tab = "Misc"));
  parameter Integer globalSeedFrequency = 30020 "Global random seed for frequency selection" annotation(Dialog(enable = false, tab = "Misc"));

  // Random frequency discritization model
  replaceable randomGenerator frequencySelector(file = fileDirectory.file) constrainedby BaseSpectrumDiscritization "Frequency discritization method" annotation(Dialog(group = "Wave Parameters"), choices(choice(redeclare randomGenerator frequencySelector(file = fileDirectory.file) "Random frequency selection"), choice(redeclare equalEnergyGenerator frequencySelector(file = fileDirectory.file) "Equal-energy frequency selection")));
 
  // Output variables for excitation, Morison, and wave gauge
  parameter SI.Height zeta[waveHeadingSpreadBins,n_omega] = frequencySelector.zeta "Wave amplitude component" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.Angle phi[waveHeadingSpreadBins, n_omega] = frequencySelector.phi "Wave components phase shift" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.AngularFrequency omega[n_omega] = frequencySelector.omega "Frequency components selected for simulation" annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.WaveNumber k[n_omega] = frequencySelector.k "Wave number component" annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.Angle spreadBinCentres[waveHeadingSpreadBins] = frequencySelector.spreadBinCentres "Bin centres" annotation(Dialog(enable = false, tab = "Misc"));
  parameter Real D[waveHeadingSpreadBins] = frequencySelector.D "Directional spreading weights" annotation(Dialog(enable = false, tab = "Misc"));

equation
  // Assert
  assert(multidirectionalEnable or waveHeadingSpreadBins == 1, "1D waves must contain ONLY 1 wave heading bin. Only multidirectional waves can contain multiple wave bins.", level = AssertionLevel.error);
    assert(waveHeading >= 0 and waveHeading < 2*pi,
    "waveHeading (" + String(waveHeading) + 
    " rad) must be within [0, 2*pi) radians or [0, 360) degrees"
  );
  

  annotation(
    defaultComponentName = "irregularWave",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Irregular Wave")}),
    Diagram);


end IrregularWave;
