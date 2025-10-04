within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions;

function waveElevation
  "Function to compute the wave elevation"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Inputs
  input SI.Height A = 0 "Wave amplitude";
  input SI.Height zeta[n_omega] = fill(0, n_omega) "Wave amplitude component";
  input SI.Angle phi[n_omega] = fill(0, n_omega) "Wave components phase shift";
  input SI.Angle omegaTime[n_omega] "Frequency components selected for simulation multiplied by the current time";
  input Real ramp "Ramping function";
  input Integer n_omega "Number of frequency components"; 
  
  // Output
  output SI.Height SSE "Sea surface elevation";

algorithm

  // Regular or irregular wave
  if n_omega == 1 then
    SSE := ramp.*(A*cos(omegaTime[1]));
  else
    SSE := ramp.*sum(zeta.*cos(omegaTime + phi));
  end if;

end waveElevation;
