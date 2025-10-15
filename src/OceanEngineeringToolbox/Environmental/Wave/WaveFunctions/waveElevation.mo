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
  input SI.WaveNumber k[n_omega] "Wave number component";
  input Real ramp "Ramping function";
  input Integer n_omega "Number of frequency components";
  input SI.Angle theta = 0 "Wave heading"; 
  input Boolean waveGaugeEnable = false "Flag to enable calculation of the wave elevation for a wave gauge";
  input SI.Position x = 0 "x-coordinate of the gauge";
  input SI.Position y = 0 "y-coordinate of the gauge";
  
  // Output
  output SI.Height SSE "Sea surface elevation";

algorithm
  // Do not actually need all of the nested if statements, but doing so to avoid unecessary computations.

  // Regular wave
  if n_omega == 1 then
  
    // Wave gauge regular wave
    if waveGaugeEnable then
      SSE := ramp.*(A*cos(omegaTime[1] - k[1]*(x*cos(theta) + y*sin(theta))));
    
    // Default regular wave
    else
      SSE := ramp.*(A*cos(omegaTime[1]));
    end if;
  
  // Irregular wave and spectrum import
  else
  
    // Wave gauge irregular Wave
    if waveGaugeEnable then
      SSE := ramp.*sum(zeta.*cos(omegaTime - k*(x*cos(theta) + y*sin(theta)) + phi));
    
    // Default irregular wave
    else
      SSE := ramp.*sum(zeta.*cos(omegaTime + phi)); 
    
    end if; 
  
  end if;

end waveElevation;
