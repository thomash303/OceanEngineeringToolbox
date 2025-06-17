within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.RandomDiscritization;

model randomGenerator
  "Model representing random frequency discritization"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;

  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  extends DataImport.ImportRecords.EnvironmentalImport.frequencyData;
  
  // Spectrum Parameters  
  parameter String waveSelector = "PiersonMoskowitz";
  parameter SI.Length Hs = 2.5 "Significant Wave Height";
  parameter SI.AngularFrequency omegaPeak = 0.9423 "Peak spectral frequency";
  
  // Pierson-Moskowitz parameters
  parameter Real alphaPM = 0.0081 "Energy scale";
  
  // JONSWAP parameters
  parameter Real gamma = 3.3 "Peak enhancement factor for JONSWAP spectrum. The mean typical value is 3.3";
  parameter Real sigmaA = 0.07 "Lower spectral bound for JONSWAP";
  parameter Real sigmaB = 0.09 "Upper spectral bound for JONSWAP";
  
  // Ramp
  Real ramp "Ramping function";
  parameter SI.Time Trmp "Interval for ramping up of waves during start phase";
  
  // Random frequency selection
  parameter Integer localSeedFrequency = 614657 "Local random seed for frequency selection";
  parameter Integer globalSeedFrequency = 30020 "Global random seed for frequency selection";
  
  // Frequency variables
  constant Integer n_omega "Number of frequency components (default is 100 for irregular)";
  parameter SI.AngularFrequency omegaMin = w[1] "Lowest frequency component";
  parameter SI.AngularFrequency omegaMax = w[end]"Highest frequency component";
  parameter SI.AngularFrequency omega[n_omega] = RandomFunctions.randomFrequencySelector(omegaMin, omegaMax, localSeedFrequency, globalSeedFrequency, n_omega) "Frequency components selected for simulation";
  parameter SI.AngularFrequency domega[n_omega] = fill(SpectrumCalculations.constantFrequencyStep(omegaMin, omegaMax, n_omega), n_omega) "Frequency step size";
  
  // Spectrum variables
  parameter SI.Height zeta[n_omega] = sqrt(2*S.*domega) "Wave amplitude component";
  parameter WaveUnits.spectrumEnergyDensity S[n_omega] = SpectrumGeneration.SpectrumGenerator(waveSelector = waveSelector, Hs = Hs, alphaPM = alphaPM, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB) "Wave energy spectrum";
  SI.Height SSE "Sea surface elevation";
  
  // Random phase selection
  parameter Integer localSeedPhase = 614757 "Local random seed for phase shifts";
  // readd , enable = frequencySelection == "random"
  parameter Integer globalSeedPhase = 40020 "Global random seed for phase shifts";
  parameter SI.Angle phi[n_omega] = 2*pi.*RandomFunctions.randomVectorGenerator(localSeedPhase, globalSeedPhase, n_omega) "Wave components phase shift";
    
protected
  // Intermediate calculations
  parameter SI.WaveNumber k[n_omega] = waveNumber(d, omega, n_omega) "Wave number component";
  parameter SI.Time Tp[n_omega] = 2*pi./omega "Wave period components";
  
equation
  if time < Trmp then
    ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
  else
    ramp = 1;
  end if;
  SSE = ramp.*sum(zeta.*cos(omega*time - phi));
  
  annotation(
  defaultComponentName = "RandomGenerator");

end randomGenerator;
