within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions;

function wavePower
  "Function to compute the time-averaged power per unit wave crest"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.g_n;
  
  // Inputs
  input SI.Density rho "Density of water";
  input SI.Position d "Water depth";
  input SI.WaveNumber k[n_omega] "Wave number component";
  input SI.Height A = 0 "Wave amplitude";
  input WaveUnits.spectrumEnergyDensity S[n_omega] = fill(0, n_omega)"Wave energy spectrum";
  input SI.AngularFrequency domega[n_omega] = fill(0, n_omega)"Frequency step size";
  input Integer n_omega "Number of frequency components";
  
  //Output
  output WaveUnits.powerPerUnitLength P "Wave time-average power per unit wave crest length";
  
protected
  parameter WaveUnits.energyPerUnitLength E[n_omega] "Wave time-average wave-induced energy per unit wave crest length";
  parameter SI.Velocity cg[n_omega] = waveGroupVelocity(k, d, n_omega) "Wave group velocity";
algorithm

  // Regular or irregular wave
  if n_omega == 1 then
    E := vector(1/2 * rho * g_n * A^2);
  else
    E := 1/2 * rho * g_n * S .* domega;
  end if;

  // Compute wave power
  P := sum(E .* cg);

end wavePower;
