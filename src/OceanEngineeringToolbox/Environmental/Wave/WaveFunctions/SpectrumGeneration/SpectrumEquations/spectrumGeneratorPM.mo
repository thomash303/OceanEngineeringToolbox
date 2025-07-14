within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumGeneration.SpectrumEquations;

function spectrumGeneratorPM
  "Function calculating the Pierson Moskowitz wave spectrum"
  
  // Importing from the MSL
  import Modelica.Constants.g_n;
  import Modelica.Units.SI;
  
  input Real alphaPM "Energy scale (Phillips constant)";
  input SI.AngularFrequency omegaPeak "Peak spectral frequency";
  input SI.AngularFrequency omega[n_omega] "Array of frequency components";
  input Integer n_omega "Number of frequency components (default is 100 for irregular)";
  output WaveUnits.spectrumEnergyDensity S[n_omega] "Array of spectral values for input frequencies";

protected
  Real beta[n_omega] "Exponential term";
algorithm
  beta := exp(-1.25*(omegaPeak./omega).^4);
  S := alphaPM*g_n^2*omega.^(-5).*beta;
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
end spectrumGeneratorPM;
