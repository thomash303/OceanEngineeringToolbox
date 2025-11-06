within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions;

function waveGroupVelocity
  "Function to compute the wave group velocity for an arbitrary depth"
  
  // Importing from the MSL
  import Modelica.Constants.g_n;
  import Modelica.Units.SI;
  
  // Inputs
  input SI.WaveNumber k[n_omega] "Wave number";
  input SI.Position d "Water depth";
  input Integer n_omega "Number of frequency components";
  
  // Ouput
  output SI.Velocity cg[n_omega] "Group velocity";
  
protected
  // Intermediate variables
  Real n[n_omega] = 1/2 * (1 .+ 2*k*d ./ (sinh(2*k*d))) "Group-to-phase velocity ratio";
  SI.Velocity c[n_omega] = sqrt(g_n./k .* tanh(k*d)) "Phase speed/celerity";
  
algorithm
  cg := n .* c;

end waveGroupVelocity;
