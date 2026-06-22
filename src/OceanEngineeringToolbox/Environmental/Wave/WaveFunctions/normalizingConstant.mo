within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions;

function normalizingConstant
  "Function to compute the normalizing constant"
    
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  
  // Input
  input Integer n = 1 "Spreading function constant";
  
  //Output
  output Real k "Normalizing constant";

algorithm

  k := gamma(n/2 + 1)/ (sqrt(pi) * gamma(n/2 + 1/2));

end normalizingConstant;
