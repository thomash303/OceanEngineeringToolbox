within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.SpectrumCalculations;

function diferenceFrequencyStep
  "Function to calculate the step size for varying frequency steps"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  input SI.AngularFrequency omega[n_omega];
  input Integer n_omega;
  output SI.AngularFrequency domega[n_omega];
protected
  SI.AngularFrequency omegaMin = omega[1];
  SI.AngularFrequency omegaMax = omega[end];
  Integer n_TipBuffer = 1 "Buffer at tip to ensure reasonably small step sizes";
  Integer n_TailBuffer = 1 "Buffer at tip to ensure reasonably small step sizes";
  Integer bufferFactor = 1 "Equal energy allows for fewer steps to represent the spectrum, using small steps near the peak frequency. Thus the equivalent step size for equal spacing would be a factor smaller - this specifies that factor";
  SI.AngularFrequency domegaConst = constantFrequencyStep(omegaMin, omegaMax, n_omega*bufferFactor);
  
algorithm
  
  for i in 2:n_omega loop
    domega[i] := omega[i] - omega[i - 1];
  end for;

  // A buffer to account for large step sizes due to low energy density at the tails of the spectrum
  for i in 1:n_TipBuffer loop
    domega[i] := domegaConst;
  end for;
  
  for i in 1:n_TailBuffer loop
    domega[end+1-i] := domegaConst;
  end for;


end diferenceFrequencyStep;
