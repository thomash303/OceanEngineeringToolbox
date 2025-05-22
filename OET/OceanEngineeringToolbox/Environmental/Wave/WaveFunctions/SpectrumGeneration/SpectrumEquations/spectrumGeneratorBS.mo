within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumGeneration.SpectrumEquations;

function spectrumGeneratorBS
  "Function calculating the Bretschneider (or modified Pierson Moskowitz) wave spectrum"
  
  // Importing from the MSL
  import Modelica.Constants.pi;
  import Modelica.Units.SI;
  
  input SI.Height Hs "Significant wave height";
  input SI.AngularFrequency omegaPeak "Peak spectral frequency" annotation(
    Dialog(group = "Wave Spectrum Parameters"));
  input SI.AngularFrequency omega[n_omega] "Array of frequency components";
  input Integer n_omega "Number of frequency components (default is 100 for irregular)";
  output WaveUnits.spectrumEnergyDensity S[n_omega] "Array of spectral values for input frequencies";

protected
  Real beta[n_omega] "Exponential term";
algorithm
  beta := exp(-1.25*(omegaPeak./omega).^4);
  S := 5/16*Hs^2*omegaPeak^(4).*omega.^(-5).*beta;
  annotation(
    Documentation(info = "<html>
    <p>Syntax: spec = spectrumGenerator_PM(Hs, omega)</p>
    <p>Description: This function generates the Pierson-Moskowitz spectrum, which is suitable for fully developed seas. It calculates spectral values for given frequencies based on the significant wave height.</p>
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
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-90, 50}, {90, -50}}, textString = "PM", textStyle = {TextStyle.Bold})}));

end spectrumGeneratorBS;
