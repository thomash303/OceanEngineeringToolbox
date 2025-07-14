within OceanEngineeringToolbox.Environmental.Wave;

model IrregularWave
  "Model representing an irregular wave"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;

  // Spectrum Parameters  
  parameter String waveSelector = "PiersonMoskowitz";
  parameter String frequencySelection = "random";
  parameter SI.Height Hs = 2.5 "Significant Wave Height";
  parameter SI.AngularFrequency omegaPeak = 0.9423 "Peak spectral frequency";
  
  // JONSWAP parameters
  parameter Real gamma = 3.3 "Peak enhancement factor for JONSWAP spectrum. The mean typical value is 3.3";
  parameter Real sigmaA = 0.07 "Lower spectral bound for JONSWAP";
  parameter Real sigmaB = 0.09 "Upper spectral bound for JONSWAP";
  
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
  SI.Height SSE "Sea surface elevation";
  

  // Random frequency discritization model
  WaveFunctions.SpectrumDiscritization.RandomDiscritization.randomGenerator RandomGenerator(filePath = filePath, hydroCoeffFile = hydroCoeffFile, localSeedFrequency = localSeedFrequency, globalSeedFrequency = globalSeedFrequency, localSeedPhase = localSeedPhase, globalSeedPhase = globalSeedPhase, n_omega = n_omega, waveSelector = waveSelector, Hs = Hs, omegaPeak = omegaPeak, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB, Trmp = Trmp) if frequencySelection == "random" annotation(
    Placement(transformation(origin = {-48, -2}, extent = {{-10, -10}, {10, 10}})));

  // Equal energy frequency discritization model
  WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization.equalEnergyGenerator EqualEnergyGenerator(filePath = filePath, hydroCoeffFile = hydroCoeffFile, localSeedPhase = localSeedPhase, globalSeedPhase = globalSeedPhase, n_omega = n_omega, waveSelector = waveSelector, Hs = Hs, omegaPeak = omegaPeak, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB, Trmp = Trmp) if frequencySelection == "equalEnergy" annotation(
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
