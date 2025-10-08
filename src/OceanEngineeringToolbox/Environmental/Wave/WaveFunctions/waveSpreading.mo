within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions;

function waveSpreading
  "Function computing the wave spreading"
  
  // Importing from the MSL
  import Modelica.Units.{SI,Conversions};
  
  // Inputs
  input Integer n = 1 "Spreading function constant";
  input Real waveHeading = 0 "Mean wave heading";
  input Real waveHeadingSpread = 90 "Maximum spread (+/-) from the mean wave heading";
  input Integer waveHeadingSpreadBins = 5 "Number of discrete headings centered around the mean heading to consider in the spectrum spread";

  // Output
  output Real D[waveHeadingSpreadBins] "Spreading function"; 
  
protected
  // Intermediate
  Real spreadWidth = 2 * waveHeadingSpread / waveHeadingSpreadBins "Spread bin widths";
  Real spreadBinEdges[waveHeadingSpreadBins+1] "Bin edges";
  Real spreadBinCentres[waveHeadingSpreadBins] "Bin centres";
  Real k = normalizingConstant(n) "Normalizing constant";
  Real energy "Amount of energy in the consdired directions relative to the intial energy";
  Real energyThresh = 0.8 "Energy threshold before before throwing energy conservation warning";
algorithm

  for i in 1:waveHeadingSpreadBins+1 loop
    // Finding bin edges
    spreadBinEdges[i] := (-waveHeadingSpread + waveHeading) + spreadWidth*(i-1);
    
  end for;

  for i in 1:waveHeadingSpreadBins loop
    // Finding bin centres
    spreadBinCentres[i] := (spreadBinEdges[i] + spreadBinEdges[i+1]) / 2;
  
    // Computing directional spreading weights
    D[i] := k * cos(Conversions.from_deg(spreadBinCentres[i]) - Conversions.from_deg(waveHeading))^n;
  end for;
  
  // Check to verify if energy is conserved
  energy := sum(D*Conversions.from_deg(spreadWidth));
  
assert(energy >= energyThresh, "Spread range is inadequate. Only : " + String(energy) +
  " of initial energy is captured, below threshold of : " + String(energyThresh) + ". Consider increasing the spread and number of bins",
  level = AssertionLevel.error);
  
  // Normalize the spreading weights to ensure energy conservation
  D := D / energy;
  
  
  
  
end waveSpreading;
