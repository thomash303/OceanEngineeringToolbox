within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization.EqualEnergyFunctions;

function trapezoidalIntegration
  "Function performing trapezoidal integration to find the energy in regions in the wave spectrum"
  
  input Real y1 "Function value at the left end of the interval";
  input Real y2 "Function value at the right end of the interval";
  input Real domega "Width of the interval";
  output Real Area "Area under the curve using trapezoidal rule";
algorithm
  Area := 0.5*domega*(y1 + y2);

end trapezoidalIntegration;
