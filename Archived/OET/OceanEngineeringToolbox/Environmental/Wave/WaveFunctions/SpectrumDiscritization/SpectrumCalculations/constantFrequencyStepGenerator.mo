within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.SpectrumCalculations;

function constantFrequencyStepGenerator
  "Function to calculate frequencies using a constant frequency step"

  // Importing from the MSL
  import Modelica.Units.SI;

  input SI.AngularFrequency omegaMin "Minimum frequency";
  input SI.AngularFrequency omegaMax "Maximum frequency";
  constant input Integer n_omega_int "Number of frequency compenents defining the spectrum";
  output SI.AngularFrequency omega_int[n_omega_int];
protected
  SI.AngularFrequency domega_int = constantFrequencyStep(omegaMin, omegaMax, n_omega_int) "Frequency step size";
algorithm
  omega_int[1] := omegaMin;
  omega_int[end] := omegaMax;
  for i in 2:n_omega_int - 1 loop
    omega_int[i] := omega_int[i - 1] + domega_int;
  end for;

end constantFrequencyStepGenerator;
