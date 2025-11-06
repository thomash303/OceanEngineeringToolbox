within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions;

function maxFrequency
  "Function to determine the maximum frequency bound"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Inputs
  input SI.AngularFrequency omegaPeak "Peak angular frequency";
  input SI.AngularFrequency wMax "Maximum frequency in the BEM data";
  input Real maxFactor = 4 "Nominal factor above the peak frequency to select the minimum frequency bound"; 
  
  // Output
  output SI.AngularFrequency omegaMax "Maximum frequency bound";

algorithm
  omegaMax := omegaPeak*maxFactor;
  
  if omegaMax > wMax then
    omegaMax :=wMax;
  end if;
  

end maxFrequency;
