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
  
  extends Wave.WaveRecords.MultidirectionalParameters;
  extends Current.CurrentRecords.CurrentParameters;
  extends Wave.WaveRecords.WaveSpectrumParameters;
  extends Wave.WaveRecords.RandomPhaseParameters;
  extends Wave.WaveRecords.SimulationParameters;
  
  // Wave Parameters
  parameter SI.AngularFrequency omegaPeak = 1 "Peak angular frequency";
    
  // Wave Heading Variables
  parameter SI.Angle spreadBinCentres[waveHeadingSpreadBins] = WaveFunctions.waveSpreadingBins(waveHeading = waveHeading, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins) "Bin centres";
  parameter Real D[waveHeadingSpreadBins] = WaveFunctions.waveSpreading(n = n, waveHeading = waveHeading, multidirectionalEnable = multidirectionalEnable, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins, spreadBinCentres = spreadBinCentres) "Directional spreading weights";
  
  // Ramp
  Real ramp "Ramping function";

  // Frequency variables
  parameter Integer n_omega = 100 "Number of frequency components (default is 100 for irregular)";
  parameter SI.AngularFrequency omegaMin = minFrequency(omegaPeak = omegaPeak, wMin = w[1]) "Lowest frequency component";
  parameter SI.AngularFrequency omegaMax = maxFrequency(omegaPeak = omegaPeak, wMax = w[end]) "Highest frequency component";
  
  // Random phase selection
  parameter SI.Angle phi[waveHeadingSpreadBins, n_omega] = RandomDiscritization.RandomFunctions.randomArrayGenerator(localSeed = localSeedPhase, globalSeed = globalSeedPhase, n_row = waveHeadingSpreadBins, n_col = n_omega) "Wave components phase shift" annotation(HideResult = true);
  
  // Wave variables
  SI.Position SSE "Sea surface elevation";
  
equation

  if time < Trmp then
    ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
  else
    ramp = 1;
  end if;
    
end BaseSpectrumDiscritization;
