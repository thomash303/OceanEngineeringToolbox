within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.SpectrumCalculations;

function diferenceFrequencyStep
  "Function to calculate the step size for varying frequency steps"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  input SI.AngularFrequency omega[n_omega];
  input Integer n_omega;
  output SI.AngularFrequency domega[n_omega];
protected
  SI.AngularFrequency omegaMin;
  SI.AngularFrequency omegaMax;
algorithm
  omegaMin := omega[1];
  omegaMax := omega[end];
  domega[1] := constantFrequencyStep(omegaMin, omegaMax, n_omega);
  for i in 2:n_omega loop
    domega[i] := omega[i] - omega[i - 1];
  end for;

end diferenceFrequencyStep;
