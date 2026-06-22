within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization;

partial model BaseSpectrumDiscritization
  "Partial model for the base spectrum discritization"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.{pi,g_n};
  import Modelica.Math;

  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  extends DataImport.ImportRecords.EnvironmentalImport.frequencyData;
  
  // Calling an outer model at the top-level deployment
  outer Environmental.Environment environment;
  outer DataImport.FileDirectory fileDirectory;
  
  // Wave parameters
  parameter String waveSpectrum = environment.wave.waveSpectrum "Wave Spectrum Type" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.Height Hs = environment.wave.Hs "Significant wave height"  annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.AngularFrequency omegaPeak = environment.wave.omegaPeak "Peak angular frequency" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Multidirectional wave parameters
  parameter SI.Angle waveHeading = environment.wave.waveHeading "Wave heading ([0-360) or [0-2pi))" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Boolean multidirectionalEnable = environment.wave.multidirectionalEnable "Enable multidirectional wave" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer n = environment.wave.n "Spreading function constant"  annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.Angle waveHeadingSpread = environment.wave.waveHeadingSpread "Maximum spread (+/-) from the mean wave heading" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer waveHeadingSpreadBins = environment.wave.waveHeadingSpreadBins "Number of discrete headings centered around the mean heading to consider in the spectrum spread" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Wave spectrum parameters
  // Pierson-Moskowitz parameters
  parameter Real alphaPM = environment.wave.alphaPM "Energy scale (Phillips constant)"   annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
    
  // JONSWAP parameters
  parameter Real gamma = environment.wave.gamma "Peak enhancement factor for JONSWAP spectrum. The mean typical value is 3.3" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Real sigmaA = environment.wave.sigmaA "Lower spectral bound for JONSWAP"   annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Real sigmaB = environment.wave.sigmaB "Upper spectral bound for JONSWAP"  annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));

// Ochi-Hubble parameters (including sample values from original paper)
  // Default parameters computed from most likely sea state
  parameter SI.Height HsOH[componentSpectra] = environment.wave.HsOH "Significant wave heights" annotation(HideResult = true, Dialog(enable = false, tab = "Misc")); 
  parameter SI.AngularFrequency omegaPeakOH[componentSpectra] = environment.wave.omegaPeakOH "Peak spectral frequencies" annotation(HideResult = true, Dialog(enable = false, tab = "Misc")); 
  parameter Real lambdaOH[componentSpectra] = environment.wave.lambdaOH "Peak shape parameter" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer componentSpectra = environment.wave.componentSpectra  annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Random phase selection
  parameter Integer localSeedPhase = environment.wave.localSeedPhase "Local random seed for phase shifts" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer globalSeedPhase = environment.wave.globalSeedPhase "Global random seed for phase shifts" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Ramp parameters  
  parameter SI.Time Trmp = environment.Trmp "Interval for ramping up of waves during start phase" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
    
  // Wave Heading Variables
  parameter SI.Angle spreadBinCentres[waveHeadingSpreadBins] = WaveFunctions.waveSpreadingBins(waveHeading = waveHeading, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins) "Bin centres"  annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Real D[waveHeadingSpreadBins] = WaveFunctions.waveSpreading(n = n, waveHeading = waveHeading, multidirectionalEnable = multidirectionalEnable, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins, spreadBinCentres = spreadBinCentres) "Directional spreading weights"  annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Ramp variables
  Real ramp "Ramping function" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));

  // Frequency variables
  parameter Integer n_omega = environment.wave.n_omega "Number of frequency components (default is 100 for irregular)" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.AngularFrequency omegaMin = minFrequency(omegaPeak = omegaPeak, wMin = w[1]) "Lowest frequency component" annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.AngularFrequency omegaMax = maxFrequency(omegaPeak = omegaPeak, wMax = w[end]) "Highest frequency component" annotation(Dialog(enable = false, tab = "Misc"));
  
  // Random phase selection
  parameter SI.Angle phi[waveHeadingSpreadBins, n_omega] = RandomDiscritization.RandomFunctions.randomArrayGenerator(localSeed = localSeedPhase, globalSeed = globalSeedPhase, n_row = waveHeadingSpreadBins, n_col = n_omega) "Wave components phase shift" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Wave variables
  SI.Position SSE "Sea surface elevation";
  
equation

  if time < Trmp then
    ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
  else
    ramp = 1;
  end if;
    
end BaseSpectrumDiscritization;
