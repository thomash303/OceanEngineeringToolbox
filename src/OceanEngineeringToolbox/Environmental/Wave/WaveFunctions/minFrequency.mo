within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions;

function minFrequency
  "Function to determine the minimum frequency bound"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Inputs
  input SI.AngularFrequency omegaPeak "Peak angular frequency";
  input SI.AngularFrequency wMin "Minimum frequency in the BEM data";
  input Real minFactor = 0.25 "Nominal factor below the peak frequency to select the minimum frequency bound"; 
  
  // Output
  output SI.AngularFrequency omegaMin "Minimum frequency bound";

algorithm
  omegaMin := omegaPeak*minFactor;
  
  if omegaMin < wMin then
    omegaMin :=wMin;
  end if;
  

end minFrequency;
