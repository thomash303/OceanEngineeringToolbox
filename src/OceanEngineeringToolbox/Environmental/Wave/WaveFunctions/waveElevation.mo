within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions;

function waveElevation
  "Function to compute the wave elevation"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Inputs
  input SI.Height A = 0 "Wave amplitude";
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

    SSE := ramp.*(A*cos(omegaTime[1] - k[1]*(x*cos(theta) + y*sin(theta))));
    
  // Irregular wave and spectrum import
  else
    SSE := 0;  
  
    for i in 1:waveHeadingSpreadBins loop
     // SSE := SSE + ramp.*sum(zeta[i,:].*cos(omegaTime - k*(x*cos(theta) + y*sin(theta)) + phi[i,:]));
      
            //SSE := SSE + ramp.*sum(zeta[i,:].*cos(omegaTime + phi[i,:]));
            
            for j in 1:n_omega loop
            SSE := SSE + ramp * zeta[i,j].*cos(omegaTime[j] + phi[i,j]);
            end for;
    end for;
  
  end if;

end waveElevation;
