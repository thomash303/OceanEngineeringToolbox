within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumGeneration.SpectrumGenerationCalculations;

function gamma
  "Function to approximate the Gamma function using Stirling's approximation"
  
  // Importing from the MSL
  import Modelica.Constants.{pi,e};
  import Modelica.Units.SI;
  
  input Real z "Real or complex number";
  output Real Gamma "Output value of the Gamma function (approximation of the factorial)";

algorithm
  Gamma := sqrt(2*pi)*z^(z-0.5)*exp(-z);

end gamma;
