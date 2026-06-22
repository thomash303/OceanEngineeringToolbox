within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.RandomDiscritization;

model randomGenerator
  "Model representing random frequency discritization"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.{pi,g_n};
  import Modelica.Math;

  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  extends DataImport.ImportRecords.EnvironmentalImport.frequencyData;
  extends BaseSpectrumDiscritization;
  
  // Random frequency selection
  parameter Integer localSeedFrequency = environment.wave.localSeedFrequency "Local random seed for frequency selection" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer globalSeedFrequency = environment.wave.globalSeedFrequency  "Global random seed for frequency selection" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Frequency variables
  parameter SI.AngularFrequency omega[n_omega] = RandomFunctions.randomFrequencySelector(omegaMin, omegaMax, localSeedFrequency, globalSeedFrequency, n_omega) "Frequency components selected for simulation" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.AngularFrequency domega[n_omega] = fill(SpectrumCalculations.constantFrequencyStep(omegaMin, omegaMax, n_omega), n_omega) "Frequency step size" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
    
  // Intermediate calculations
  parameter SI.WaveNumber k[n_omega] = waveNumber(d, omega, n_omega) "Wave number component" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Spectrum variables
 parameter SI.Height zeta[waveHeadingSpreadBins,n_omega] = WaveFunctions.zeta(S = S, D = D, domega = domega, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins) "Wave amplitude component" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
 
  parameter WaveUnits.spectrumEnergyDensity S[n_omega] = SpectrumGeneration.SpectrumGenerator(waveSpectrum = waveSpectrum, Hs = Hs, alphaPM = alphaPM, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB, HsOH = HsOH, omegaPeakOH = omegaPeakOH, lambdaOH = lambdaOH) "Wave energy spectrum" annotation(Dialog(enable = false, tab = "Misc"));

  WaveUnits.powerPerUnitLength P = WaveFunctions.wavePower(rho = rho, d = d, k = k, S = S, domega = domega, n_omega = n_omega) "Wave time-average power per unit wave crest length" annotation(Dialog(enable = false, tab = "Misc"));
  
equation
  
  SSE = WaveFunctions.waveElevation(zeta = zeta, phi = phi, omegaTime = omega*time, k = k, ramp = ramp, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins, theta = waveHeading);
    
  annotation(
  defaultComponentName = "RandomGenerator");

end randomGenerator;
