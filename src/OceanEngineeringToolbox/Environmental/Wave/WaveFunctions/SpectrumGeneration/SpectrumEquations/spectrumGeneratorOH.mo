within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumGeneration.SpectrumEquations;

function spectrumGeneratorOH
  "Function calculating the bimodal Ochi-Hubble wave spectrum"
  
  /* The Gamma function is estimated using Stirling approximation. The first elements represent the lower frequency component (swell) and the second elements represent the higher frequency component (wind sea).
  */
  
  // Importing from the MSL
  import Modelica.Constants.pi;
  import Modelica.Units.SI;
  
  input SI.Height Hs[componentSpectra] "Significant wave heights";
  input SI.AngularFrequency omegaPeak[componentSpectra] "Peak spectral frequencies";
  input Real lambda[componentSpectra] "Peak shape parameter";
  input SI.AngularFrequency omega[n_omega] "Array of frequency components";
  input Integer n_omega "Number of frequency components (default is 100 for irregular)";
  
  output WaveUnits.spectrumEnergyDensity S[n_omega] "Array of spectral values for input frequencies";

protected
  Real beta[componentSpectra];
  Real kappa[componentSpectra];
  Real delta[componentSpectra, n_omega];
  Real epsilon[componentSpectra, n_omega];
  Real Sint[componentSpectra, n_omega];
  Integer componentSpectra = 2;
algorithm

  for i in 1:componentSpectra loop
    beta[i] := (4*lambda[i] + 1)/4;
    kappa[i] := (beta[i]^lambda[i]*omegaPeak[i]^(4*lambda[i])*Hs[i]^2)/(4*SpectrumGenerationCalculations.gamma(lambda[i]));
    delta[i,:] := omega.^(-(4*lambda[i]+1));
    epsilon[i,:] := exp(-beta[i]*(omega./omegaPeak[i]).^(-4));
    Sint[i,:] := kappa[i].*delta[i,:].*epsilon[i,:];
  end for;

  S := Sint[1,:] + Sint[2,:];

  annotation(
    Documentation(info = "<html>
    <p>Syntax: spec = spectrumGenerator_PM(Hs, omega)</p>
    <p>Description: This function generates the Ochi-Hubble spectrum, which is suitable for fully developed seas. It calculates spectral values for given frequencies based on the significant wave height.</p>
    <p>Inputs:</p>
    <ul>
      <li><code>Hs</code>: Significant wave height [m] (default: 1)</li>
      <li><code>omega</code>: Array of frequency components [rad/s]</li>
    </ul>
    <p>Outputs:</p>
    <ul>
      <li><code>spec</code>: Array of spectral values for input frequencies [m^2s]</li>
    </ul>
    <p>Algorithm: The function calculates spectral values using the Pierson-Moskowitz formula: S(ω) = 0.0081*g^2/ω^5 * exp(-0.0358*(g/(Hs*ω^2))^2)</p>
  </html>"),
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-90, 50}, {90, -50}}, textString = "Ochi-Hubble", textStyle = {TextStyle.Bold})}));


end spectrumGeneratorOH;
