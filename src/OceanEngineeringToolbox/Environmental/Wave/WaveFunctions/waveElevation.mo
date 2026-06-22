within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions;

function waveElevation
  "Function to compute the wave elevation"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Inputs
  //input SI.Height A = 0 "Wave amplitude";
  input SI.Height zeta[waveHeadingSpreadBins,n_omega] = fill(0, waveHeadingSpreadBins, n_omega) "Wave amplitude component";
  input SI.Angle phi[waveHeadingSpreadBins, n_omega] = fill(0, waveHeadingSpreadBins, n_omega) "Wave components phase shift";
  input SI.Angle omegaTime[n_omega] "Frequency components selected for simulation multiplied by the current time";
  input SI.WaveNumber k[n_omega] "Wave number component";
  input Real ramp "Ramping function";
  input Integer n_omega "Number of frequency components";
  input Integer waveHeadingSpreadBins = 1 "Number of discrete headings centered around the mean heading to consider in the spectrum spread";
  input Boolean multidirectionalEnable = false;
  input SI.Angle theta = 0 "Wave heading"; 
  input Boolean waveGaugeEnable = false "Flag to enable calculation of the wave elevation for a wave gauge";
  input SI.Position x = 0 "x-coordinate of the gauge";
  input SI.Position y = 0 "y-coordinate of the gauge";
  
  // Output
  output SI.Position SSE "Sea surface elevation";

algorithm

  // Regular wave
  if n_omega == 1 then
    // Wave gauge
    if waveGaugeEnable then
      SSE := ramp * zeta[1,1].*cos(omegaTime[1] - k[1]*(x*cos(theta) + y*sin(theta)));
    // Body
    else
      SSE := ramp * zeta[1,1].*cos(omegaTime[1]);
    end if;
    
  // Irregular wave and spectrum import
  else
    SSE := 0;  
    
    // Direction loop
    for i in 1:waveHeadingSpreadBins loop
      // Frequency loop 
      for j in 1:n_omega loop
        // Wave gauge
        if waveGaugeEnable then
          SSE := SSE + ramp * zeta[i,j].*cos(omegaTime[j] - k[j]*(x*cos(theta) + y*sin(theta)) + phi[i,j]);
        // Body
        else
          SSE := SSE + ramp * zeta[i,j].*cos(omegaTime[j] + phi[i,j]);
        end if;    
      end for;
    end for;    
 
  end if;

end waveElevation;
