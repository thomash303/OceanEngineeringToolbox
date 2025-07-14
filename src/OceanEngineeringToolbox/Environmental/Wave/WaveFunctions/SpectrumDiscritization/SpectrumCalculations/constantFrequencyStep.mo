within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.SpectrumCalculations;

function constantFrequencyStep
  "Function to calculate the step size for constant frequency steps"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  input SI.AngularFrequency omegaMin;
  input SI.AngularFrequency omegaMax;
  constant input Integer n_omega;
  output SI.AngularFrequency domega = (omegaMax - omegaMin)/n_omega "Frequency step size";

end constantFrequencyStep;
