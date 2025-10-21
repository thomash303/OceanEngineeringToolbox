within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization;

model equalEnergyGenerator
  "Model representing equal energy frequency discritization"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.{pi,g_n};
  import Modelica.Math;

  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  extends DataImport.ImportRecords.EnvironmentalImport.frequencyData;
  
  // Spectrum Parameters  
  parameter String waveSelector = "PiersonMoskowitz";
  parameter SI.Length Hs "Significant Wave Height";
  parameter SI.AngularFrequency omegaPeak "Peak angular frequency";
  
  // Wave Heading Parameters
  parameter SI.Angle waveHeading = 0 "Wave heading";
  parameter Boolean multidirectionalEnable "Enable multidirectional wave";
  parameter Integer n "Spreading function constant";
    parameter SI.Angle waveHeadingSpread "Maximum spread (+/-) from the mean wave heading";
  parameter Integer waveHeadingSpreadBins "Number of discrete headings centered around the mean heading to consider in the spectrum spread";
    
  // Wave Heading Variables
  parameter SI.Angle spreadBinCentres[waveHeadingSpreadBins] = WaveFunctions.waveSpreadingBins(waveHeading = waveHeading, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins) "Bin centres";
  parameter Real D[waveHeadingSpreadBins] = WaveFunctions.waveSpreading(n = n, waveHeading = waveHeading, multidirectionalEnable = multidirectionalEnable, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins, spreadBinCentres = spreadBinCentres);
  parameter SI.Angle wrapped = Math.wrapAngle(waveHeading,true) "Directional spreading weights";
  
  // Pierson-Moskowitz parameters
  parameter Real alphaPM = 0.0081 "Energy scale";
  
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
  Real ramp "Ramping function";
  parameter SI.Time Trmp "Interval for ramping up of waves during start phase";

  // Frequency variables
  constant Integer n_omega "Number of frequency components (default is 100 for irregular)";
  parameter SI.AngularFrequency omegaMin = minFrequency(omegaPeak = omegaPeak, wMin = w[1]) "Lowest frequency component";
  parameter SI.AngularFrequency omegaMax = maxFrequency(omegaPeak = omegaPeak, wMax = w[end]) "Highest frequency component";
  parameter SI.AngularFrequency omega[n_omega] = EqualEnergyFunctions.equalEnergyFrequencySelector(omegaMin, omegaMax, n_omega, n_omega_int, omega_int, S_int) "Frequency components selected for simulation";
  parameter SI.AngularFrequency domega[n_omega] = SpectrumCalculations.diferenceFrequencyStep(omega = omega, n_omega = n_omega) "Frequency step size";
  parameter Integer n_omega_int = 500 "Number of frequency components for spectrum generation and integration" annotation(
  HideResult = true);
  parameter SI.AngularFrequency omega_int[n_omega_int] = SpectrumCalculations.constantFrequencyStepGenerator(omegaMin, omegaMax, n_omega_int) "Integration frequency step size";  
  
  // Random phase selection
  parameter Integer localSeedPhase = 614757 "Local random seed for phase shifts";
  // readd , enable = frequencySelection == "random"
  parameter Integer globalSeedPhase = 40020 "Global random seed for phase shifts";
  parameter SI.Angle phi[waveHeadingSpreadBins, n_omega] = RandomDiscritization.RandomFunctions.randomArrayGenerator(localSeed = localSeedPhase, globalSeed = globalSeedPhase, n_row = waveHeadingSpreadBins, n_col = n_omega) "Wave components phase shift" annotation(HideResult = true);

  // Intermediate calculations
  parameter SI.WaveNumber k[n_omega] = waveNumber(d, omega, n_omega) "Wave number component" annotation(HideResult = true);
  
  // Spectrum variables
  parameter SI.Height zeta[waveHeadingSpreadBins,n_omega] = WaveFunctions.zeta(S = S, D = D, domega = domega, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins) "Wave amplitude component" annotation(
    HideResult = true);
  parameter WaveUnits.spectrumEnergyDensity S[n_omega] = SpectrumCalculations.spectrumInterpolator(n_omega = n_omega, n_omega_int = n_omega_int, omega_int = omega_int, S_int = S_int, omega = omega) "Wave energy spectrum";
  parameter WaveUnits.spectrumEnergyDensity S_int[n_omega_int] = SpectrumGeneration.SpectrumGenerator(waveSelector = waveSelector, Hs = Hs, alphaPM = alphaPM, omegaPeak = omegaPeak, omega = omega_int, n_omega = n_omega_int, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB, HsOH = HsOH, omegaPeakOH = omegaPeakOH, lambdaOH = lambdaOH) "Integratation wave energy spectrum"; 
  SI.Position SSE "Sea surface elevation";
  parameter WaveUnits.powerPerUnitLength P = WaveFunctions.wavePower(rho = rho, d = d, k = k, S = S, domega = domega, n_omega = n_omega) "Wave time-average power per unit wave crest length";
  
equation
  if time < Trmp then
    ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
  else
    ramp = 1;
  end if;
  
  SSE = WaveFunctions.waveElevation(zeta = zeta, phi = phi, omegaTime = omega*time, k = k, ramp = ramp, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins, theta = waveHeading);

  annotation(
    defaultComponentName = "EqualEnergyGenerator");

end equalEnergyGenerator;
