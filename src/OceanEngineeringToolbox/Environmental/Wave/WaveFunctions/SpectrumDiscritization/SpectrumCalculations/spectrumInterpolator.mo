within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.SpectrumCalculations;

function spectrumInterpolator
  "Function to interpolate the spectral energy density given the frequency"

  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Math.Vectors;

  input Integer n_omega "Number of frequency compenents to define the output spectrum";
  input Integer n_omega_int "Number of steps to define the intermediate spectrum";
  input SI.AngularFrequency omega_int[n_omega_int] "Integration frquencies for the intermediate spectrum";
  input WaveUnits.spectrumEnergyDensity S_int[n_omega_int] "Intermediate spectrum";
  input SI.AngularFrequency omega[n_omega] "Output vector of selected frequency components";
  output WaveUnits.spectrumEnergyDensity S[n_omega] "Output spectrum";

algorithm
  S[1] := S_int[1];
  S[end] := S_int[end];
  for i in 2:(n_omega - 1) loop
    S[i] := Vectors.interpolate(omega_int, S_int, omega[i]);
  end for;

end spectrumInterpolator;
