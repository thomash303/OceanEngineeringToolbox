within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions;

function waveSpreading
  "Function to compute the wave spreading weights"
  
  // Importing from the MSL
  import Modelica.Units.{SI,Conversions};
  import Modelica.Constants.pi;
  
  // Inputs
  input Integer n = 1 "Spreading function constant";
  input SI.Angle waveHeading = 0 "Mean wave heading";
  input SI.Angle waveHeadingSpread = pi/2 "Maximum spread (+/-) from the mean wave heading (must be <= pi/2)";
  input Integer waveHeadingSpreadBins = 5 "Number of discrete headings centered around the mean heading to consider in the spectrum spread";
  input SI.Angle spreadBinCentres[waveHeadingSpreadBins] "Bin centres";
  input Boolean multidirectionalEnable = false "Flag to enable/disable the multidirectional wave calculation";

  // Output
  output Real D[waveHeadingSpreadBins] "Directional spreading weights"; 
  
protected
  // Intermediate
  SI.Angle spreadWidth = 2 * waveHeadingSpread / waveHeadingSpreadBins "Spread bin widths";
  Real k = normalizingConstant(n) "Normalizing constant";
  SI.Energy energy "Amount of energy in the consdired directions relative to the intial energy";
  Real energyThresh = 0.8 "Energy threshold before before throwing energy conservation warning";
  
algorithm

  if multidirectionalEnable then

    for i in 1:waveHeadingSpreadBins loop
      // Computing directional spreading weights
      D[i] := k * cos(spreadBinCentres[i] - waveHeading)^n;
    end for;
    
    // Check to verify if energy is conserved
    energy := sum(D*spreadWidth);
    
  assert(energy >= energyThresh, "Spread range is inadequate. Only : " + String(energy) +
    " of initial energy is captured, below threshold of: " + String(energyThresh) + ". Consider increasing the spread and number of bins",
    level = AssertionLevel.error);
    
    // Normalize the spreading weights to ensure energy conservation
    D := (D / energy)*spreadWidth;
    
  else
    D := fill(1,waveHeadingSpreadBins);
  
  end if;
  
end waveSpreading;
