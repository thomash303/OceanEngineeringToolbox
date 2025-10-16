within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions;

function zeta
  "Function to compute the wave amplitude"
  
  import Modelica.Units.SI;

  // Inputs
  input WaveUnits.spectrumEnergyDensity S[n_omega] "Spectral Density";
  input Real D[waveHeadingSpreadBins] "Directional spreading weights";
  input SI.AngularFrequency domega[n_omega] "Frequency step size";
  input Integer n_omega "Number of frequency components";
  input Integer waveHeadingSpreadBins "Number of discrete headings";

  // Output
  output SI.Height zeta[waveHeadingSpreadBins,n_omega] "Wave amplitude per frequency";

algorithm

  for i in 1:waveHeadingSpreadBins loop
    for j in 1:n_omega loop
      // Sum over directions first, then frequencies
      zeta[i,j] := sqrt(2 * domega[j] * S[j] * D[i]^2);
    end for;
  end for;

/*
  for j in 1:n_omega loop
    // Sum over directions first, then take square root
    zeta[j] := sqrt(2 * domega[j] * sum(S[j] * D));
  end for;
*/
end zeta;
