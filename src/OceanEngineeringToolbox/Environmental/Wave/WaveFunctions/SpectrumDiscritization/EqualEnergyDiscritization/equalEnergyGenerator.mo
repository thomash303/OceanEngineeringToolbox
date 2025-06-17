within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization;

model equalEnergyGenerator
  "Model representing equal energy frequency discritization"
  
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

  // Frequency variables
  constant Integer n_omega "Number of frequency components (default is 100 for irregular)";
  parameter SI.AngularFrequency omegaMin = w[1] "Lowest frequency component";
  parameter SI.AngularFrequency omegaMax = w[end] "Highest frequency component";
  parameter SI.AngularFrequency omega[n_omega] = EqualEnergyFunctions.equalEnergyFrequencySelector(omegaMin, omegaMax, n_omega, n_omega_int, omega_int, S_int) "Frequency components selected for simulation";
  parameter SI.AngularFrequency domega[n_omega] = SpectrumCalculations.diferenceFrequencyStep(omega = omega, n_omega = n_omega) "Frequency step size";
  parameter Integer n_omega_int = 500 "Number of frequency components for spectrum generation and integration" annotation(
  HideResult = true);
  parameter SI.AngularFrequency omega_int[n_omega_int] = SpectrumCalculations.constantFrequencyStepGenerator(omegaMin, omegaMax, n_omega_int) "Integration frequency step size";  
  
  // Spectrum variables
  parameter SI.Height zeta[n_omega] = sqrt(2*S.*domega) "Wave amplitude component";
  parameter WaveUnits.spectrumEnergyDensity S[n_omega] = SpectrumCalculations.spectrumInterpolator(n_omega = n_omega, n_omega_int = n_omega_int, omega_int = omega_int, S_int = S_int, omega = omega) "Wave energy spectrum";
  SI.Height SSE "Sea surface elevation";
  parameter WaveUnits.spectrumEnergyDensity S_int[n_omega_int] = SpectrumGeneration.SpectrumGenerator(waveSelector = waveSelector, Hs = Hs, alphaPM = alphaPM, omegaPeak = omegaPeak, omega = omega_int, n_omega = n_omega_int, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB) "Integratation wave energy spectrum"; 

  // Random phase selection
  parameter Integer localSeedPhase = 614757 "Local random seed for phase shifts";
  // readd , enable = frequencySelection == "random"
  parameter Integer globalSeedPhase = 40020 "Global random seed for phase shifts";
  parameter SI.Angle phi[n_omega] = 2*pi.*RandomDiscritization.RandomFunctions.randomVectorGenerator(localSeedPhase, globalSeedPhase, n_omega) "Wave components phase shift";

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
    defaultComponentName = "EqualEnergyGenerator");

end equalEnergyGenerator;
