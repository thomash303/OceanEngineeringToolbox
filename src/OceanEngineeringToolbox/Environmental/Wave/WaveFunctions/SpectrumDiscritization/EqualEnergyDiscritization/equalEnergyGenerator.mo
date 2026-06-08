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
  extends BaseSpectrumDiscritization;
  
  // Frequency variables
  parameter SI.AngularFrequency omega[n_omega] = EqualEnergyFunctions.equalEnergyFrequencySelector(omegaMin, omegaMax, n_omega, n_omega_int, omega_int, S_int) "Frequency components selected for simulation" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.AngularFrequency domega[n_omega] = SpectrumCalculations.diferenceFrequencyStep(omega = omega, n_omega = n_omega) "Frequency step size" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer n_omega_int = 500 "Number of frequency components for spectrum generation and integration" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.AngularFrequency omega_int[n_omega_int] = SpectrumCalculations.constantFrequencyStepGenerator(omegaMin, omegaMax, n_omega_int) "Integration frequency step size" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));  

  // Intermediate calculations
  parameter SI.WaveNumber k[n_omega] = waveNumber(d, omega, n_omega) "Wave number component" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Spectrum variables
  parameter SI.Height zeta[waveHeadingSpreadBins,n_omega] = WaveFunctions.zeta(S = S, D = D, domega = domega, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins) "Wave amplitude component" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter WaveUnits.spectrumEnergyDensity S[n_omega] = SpectrumCalculations.spectrumInterpolator(n_omega = n_omega, n_omega_int = n_omega_int, omega_int = omega_int, S_int = S_int, omega = omega) "Wave energy spectrum" annotation(Dialog(enable = false, tab = "Misc"));
  parameter WaveUnits.spectrumEnergyDensity S_int[n_omega_int] = SpectrumGeneration.SpectrumGenerator(waveSpectrum = waveSpectrum, Hs = Hs, alphaPM = alphaPM, omegaPeak = omegaPeak, omega = omega_int, n_omega = n_omega_int, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB, HsOH = HsOH, omegaPeakOH = omegaPeakOH, lambdaOH = lambdaOH) "Integratation wave energy spectrum" annotation(HideResult = true, Dialog(enable = false, tab = "Misc")); 
  WaveUnits.powerPerUnitLength P = WaveFunctions.wavePower(rho = rho, d = d, k = k, S = S, domega = domega, n_omega = n_omega) "Wave time-average power per unit wave crest length" annotation(Dialog(enable = false, tab = "Misc"));
  
equation
  
  SSE = WaveFunctions.waveElevation(zeta = zeta, phi = phi, omegaTime = omega*time, k = k, ramp = ramp, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins, theta = waveHeading);

  annotation(
    defaultComponentName = "EqualEnergyGenerator");

end equalEnergyGenerator;
