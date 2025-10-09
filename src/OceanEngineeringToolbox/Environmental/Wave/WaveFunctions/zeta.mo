within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions;

function zeta
  "Function to compute the wave amplitude"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Inputs
  input WaveUnits.spectrumEnergyDensity S[n_omega] "Spectral Density";
  input Real D[waveHeadingSpreadBins] "Directional spreading weights";
  input SI.AngularFrequency domega[n_omega] "Frequency step size";
  input Integer n_omega "Number of frequency components";
  input Integer waveHeadingSpreadBins "Number of discrete headings centered around the mean heading to consider in the spectrum spread";
  
  // Output
  output SI.Height zeta[waveHeadingSpreadBins, n_omega] "Wave amplitude";
  
algorithm

  for i in 1:waveHeadingSpreadBins loop
   zeta[i,:] := sqrt(2*S.*D[i].*domega);
   
  end for;

end zeta;
