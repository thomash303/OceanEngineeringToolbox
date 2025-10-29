within OceanEngineeringToolbox.Environmental.Wave;

model IrregularWave
  "Model representing an irregular wave"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  import OceanEngineeringToolbox.Environmental.Wave.WaveTypes.WaveSpectrumType;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization.equalEnergyGenerator;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.RandomDiscritization.randomGenerator;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.BaseSpectrumDiscritization;

  // Spectrum Parameters  
  parameter String waveSelector = "PiersonMoskowitz";
  parameter WaveSpectrumType waveSpectrum;
  parameter String frequencySelection = "random";
  parameter SI.Height Hs = 2.5 "Significant Wave Height";
  parameter SI.AngularFrequency omegaPeak "Peak angular frequency";
  
  // Wave Heading Parameters
  parameter SI.Angle waveHeading = 0 "Wave heading";
  parameter Boolean multidirectionalEnable "Enable multidirectional wave";
  parameter Integer n "Spreading function constant";
    parameter SI.Angle waveHeadingSpread "Maximum spread (+/-) from the mean wave heading";
  parameter Integer waveHeadingSpreadBins "Number of discrete headings centered around the mean heading to consider in the spectrum spread";
  
  // Pierson-Moskowitz parameters
  parameter Real alphaPM = 0.0081 "Energy scale (Phillips constant)";
  
  // JONSWAP parameters
  parameter Real gamma = 3.3 "Peak enhancement factor for JONSWAP spectrum. The mean typical value is 3.3";
  parameter Real sigmaA = 0.07 "Lower spectral bound for JONSWAP";
  parameter Real sigmaB = 0.09 "Upper spectral bound for JONSWAP";
  
  // Ochi-Hubble Parameters
  parameter SI.Height HsOH[componentSpectra] "Significant wave heights";
  parameter SI.AngularFrequency omegaPeakOH[componentSpectra] "Peak spectral frequencies";
  parameter Real lambdaOH[componentSpectra] "Peak shape parameter";
  final parameter Integer componentSpectra = 2; 
    
  // Ramp
  parameter SI.Time Trmp "Interval for ramping up of waves during start phase" annotation(
    HideResult = true);
    
  // Frequency variables
  constant Integer n_omega = 100 "Number of frequency components (default is 100 for irregular)";

  // Random frequency selection
  parameter Integer localSeedFrequency = 614657 "Local random seed for frequency selection";
  parameter Integer globalSeedFrequency = 30020 "Global random seed for frequency selection";
  
  
  // Random phase selection
  parameter Integer localSeedPhase = 614757 "Local random seed for phase shifts";
  // readd , enable = frequencySelection == "random"
  parameter Integer globalSeedPhase = 40020 "Global random seed for phase shifts";
  
  // Spectrum variables
  SI.Position SSE "Sea surface elevation";

  // Random frequency discritization model
  replaceable randomGenerator spectrumGeneration(waveSpectrum = waveSpectrum, file = file, localSeedFrequency = localSeedFrequency, globalSeedFrequency = globalSeedFrequency, localSeedPhase = localSeedPhase, globalSeedPhase = globalSeedPhase, n_omega = n_omega, waveSelector = waveSelector, Hs = Hs, alphaPM = alphaPM, omegaPeak = omegaPeak, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB, HsOH = HsOH, omegaPeakOH = omegaPeakOH, lambdaOH = lambdaOH, Trmp = Trmp, n = n, waveHeading = waveHeading, multidirectionalEnable = multidirectionalEnable, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins) constrainedby BaseSpectrumDiscritization "Current profile" annotation(choices(choice(redeclare randomGenerator spectrumGeneration "Random frequency selection"), choice(redeclare equalEnergyGenerator spectrumGeneration "Equal-energy frequency selection")));
  
  WaveFunctions.SpectrumDiscritization.RandomDiscritization.randomGenerator RandomGenerator(file = file, localSeedFrequency = localSeedFrequency, globalSeedFrequency = globalSeedFrequency, localSeedPhase = localSeedPhase, globalSeedPhase = globalSeedPhase, n_omega = n_omega, waveSelector = waveSelector, Hs = Hs, alphaPM = alphaPM, omegaPeak = omegaPeak, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB, HsOH = HsOH, omegaPeakOH = omegaPeakOH, lambdaOH = lambdaOH, Trmp = Trmp, n = n, waveHeading = waveHeading, multidirectionalEnable = multidirectionalEnable, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins) if frequencySelection == "random" annotation(
    Placement(transformation(origin = {-48, -2}, extent = {{-10, -10}, {10, 10}})));

  // Equal energy frequency discritization model
  WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization.equalEnergyGenerator EqualEnergyGenerator(file = file, localSeedPhase = localSeedPhase, globalSeedPhase = globalSeedPhase, n_omega = n_omega, waveSelector = waveSelector, Hs = Hs, alphaPM = alphaPM, omegaPeak = omegaPeak, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB, HsOH = HsOH, omegaPeakOH = omegaPeakOH, lambdaOH = lambdaOH, Trmp = Trmp, n = n, waveHeading = waveHeading, multidirectionalEnable = multidirectionalEnable, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins) if frequencySelection == "equalEnergy" annotation(
    Placement(transformation(origin = {20, -14}, extent = {{-10, -10}, {10, 10}})));

equation
  if frequencySelection == "random" then
    SSE = RandomGenerator.SSE;
  elseif frequencySelection == "equalEnergy" then
    SSE = EqualEnergyGenerator.SSE;
  end if;
  
  annotation(
    defaultComponentName = "irregularWave",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Irregular Wave")}),
    Diagram);


end IrregularWave;
