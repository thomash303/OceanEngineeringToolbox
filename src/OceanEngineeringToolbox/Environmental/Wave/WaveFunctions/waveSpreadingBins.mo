within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions;

function waveSpreadingBins
  "Function to compute the wave spreading weights"
  
  // This somewhat redundant step is needed so that both the spreading weigths and bin centres can be called in the declaration section (tuples can only be called in equation and algorithm sections).
  
  // Importing from the MSL
  import Modelica.Units.{SI,Conversions};
  import Modelica.Constants.pi;
  import Modelica.Math.{wrapAngle,Vectors};
  
  // Inputs
  //input Integer n = 1 "Spreading function constant";
  input SI.Angle waveHeading = 0 "Mean wave heading";
  input SI.Angle waveHeadingSpread = pi/2 "Maximum spread (+/-) from the mean wave heading (must be <= pi/2)";
  input Integer waveHeadingSpreadBins = 5 "Number of discrete headings centered around the mean heading to consider in the spectrum spread";

  // Output
  output SI.Angle spreadBinCentres[waveHeadingSpreadBins] "Bin centres"; 
  
protected
  // Intermediate
  SI.Angle spreadWidth = 2 * waveHeadingSpread / waveHeadingSpreadBins "Spread bin widths";
  SI.Angle spreadBinEdges[waveHeadingSpreadBins+1] "Bin edges";
  //Real k = normalizingConstant(n) "Normalizing constant";
  SI.Angle spreadThresh = pi/2 "Maximum permissible spreading range for the cosine spreading function";
  
algorithm
  // Assert
  assert(spreadThresh >= waveHeadingSpread, "Spread range exceeds the permissible spreading range for the cosine spreading range: " + String(Conversions.to_deg(waveHeadingSpread)) +
  " deg > " + String(Conversions.to_deg(spreadThresh)) + " deg. Decrease the spreading range.",
  level = AssertionLevel.error);

  for i in 1:waveHeadingSpreadBins+1 loop
    // Finding bin edges
    spreadBinEdges[i] := (-waveHeadingSpread + waveHeading) + spreadWidth*(i-1);
    
  end for;

  for i in 1:waveHeadingSpreadBins loop
    // Finding bin centres
    // Wrapping to [0,360)
    spreadBinCentres[i] := wrapAngle(u = ((spreadBinEdges[i] + spreadBinEdges[i+1]) / 2), positiveRange = true);
  end for;
  
  // Sorting to ascending order for interpolation
  spreadBinCentres := Vectors.sort(spreadBinCentres);
  

end waveSpreadingBins;
