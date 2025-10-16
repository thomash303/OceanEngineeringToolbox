within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.RandomDiscritization.RandomFunctions;

function randomArrayGenerator
  "Function to generate a matrix of random numbers using XOR shift 64 algorithm"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Inputs
  input Integer localSeed "Local seed for random number generation";
  input Integer globalSeed "Global seed for random number generation";
  constant input Integer n_row "Number of random rows to generate";
  constant input Integer n_col "Number of random columns to generate";
  
  // Output
  output SI.Angle phi[waveHeadingSpreadBins, n_omega] "Wave components phase shift";
  
algorithm

  for i in 1:n_row loop
   phi[i, n_omega] := 2*pi.*RandomFunctions.randomVectorGenerator(localSeed = localSeedPhase, globalSeed = globalSeedPhase, n_omega = n_omega) "Wave components phase shift";
  end for;

end randomArrayGenerator;
