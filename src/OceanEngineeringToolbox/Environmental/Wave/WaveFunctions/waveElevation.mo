within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions;

function waveElevation
  "Function to compute the wave elevation"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Inputs
  input SI.Height A = 0 "Wave amplitude";
  input SI.Height zeta[waveHeadingSpreadBins, n_omega] = fill(0, waveHeadingSpreadBins, n_omega) "Wave amplitude component";
  input SI.Angle phi[n_omega] = fill(0, n_omega) "Wave components phase shift";
  input SI.Angle omegaTime[n_omega] "Frequency components selected for simulation multiplied by the current time";
  input Real ramp "Ramping function";
  input Integer n_omega "Number of frequency components"; 
  input Integer waveHeadingSpreadBins "Number of discrete headings centered around the mean heading to consider in the spectrum spread";
  input Boolean multidirectionalEnable;
  input Boolean waveGaugeEnable = false "Flag to enable calculation of the wave elevation for a wave gauge";
  
  // Output
  output SI.Height SSE "Sea surface elevation";

algorithm

  // Regular wave
  if n_omega == 1 then
    SSE := ramp.*(A*cos(omegaTime[1]));
  else
  
  end if;
  // make 1 big if statement with nested ones inside
  // D calc has a bug
  // Iregular wave
  /*if (n_omega == 1) and (not multidirectionalEnable)
    
  elseif  then
    SSE := ramp.*sum(zeta[1,:].*cos(omegaTime + phi));  
    
  else
    SSE := 0;  
    
    for i in 1:waveHeadingSpreadBins loop
      SSE := SSE + ramp.*sum(zeta[i,:].*cos(omegaTime + phi));
    end for;
  end if;
*/
end waveElevation;
