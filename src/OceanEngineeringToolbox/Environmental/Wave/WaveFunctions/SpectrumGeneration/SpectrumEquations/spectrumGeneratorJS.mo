within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumGeneration.SpectrumEquations;

function spectrumGeneratorJS
  "Function calculating the JONSWAP wave spectrum. Using the modified Pierson-Moskowitz spectra not Pierson-Moskowitz. Normalizing factor needed to ensure energy is consistent with the prescribed wave height."
  
  // Importing from the MSL
  import Modelica.Constants.pi;
  import Modelica.Units.SI;
  
  input SI.Height Hs "Significant wave height";
  input SI.AngularFrequency omegaPeak "Peak spectral frequency";
  input SI.AngularFrequency omega[n_omega] "Array of frequency components";
  input Integer n_omega "Number of frequency components (default is 100 for irregular)";
  input Real sigmaA "Minimum spectral width parameter";
  input Real sigmaB "Maximum spectral width parameter";
  input Real gamma "Peak enhancement factor for JONSWAP spectrum";
  output WaveUnits.spectrumEnergyDensity S[n_omega] "Array of spectral values for input frequencies";
protected
  Real lambda "Normalizing parameter";
  Real alpha[n_omega] "Peak shape parameter exponent";
  Real sigma[n_omega] "Spectral width parameter";
  Real b "Exponent for peak enhancement factor";
  WaveUnits.spectrumEnergyDensity Spm[n_omega] "Pierson-Moskowitz spectrum";
algorithm
  Spm := spectrumGeneratorBS(Hs = Hs, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega);
  lambda := 1 - 0.287*log(gamma);
  for i in 1:n_omega loop
    if omega[i] <= omegaPeak then
      sigma[i] := sigmaA;
    else
      sigma[i] := sigmaB;
    end if;
    alpha[i] := exp(-0.5*((omega[i] - omegaPeak)/(sigma[i]*omegaPeak))^2);
    S[i] := lambda*Spm[i]*gamma^alpha[i];
  end for;
  annotation(
    Documentation(info = "<html>
    <p>Syntax: spec = spectrumGenerator_JONSWAP(Hs, omega, omega_peak, spectralWidth_min, spectralWidth_max)</p>
    <p>Description: This function generates the JONSWAP (Joint North Sea Wave Project) spectrum, which is suitable for developing seas with fetch limitations. It calculates spectral values based on significant wave height, peak frequency, and spectral width parameters.</p>
    <p>Inputs:</p>
    <ul>
      <li><code>Hs</code>: Significant wave height [m] (default: 1)</li>
      <li><code>omega</code>: Array of frequency components [rad/s]</li>
      <li><code>omega_peak</code>: Peak spectral frequency [rad/s] (default: 0.9423)</li>
      <li><code>spectralWidth_min</code>: Minimum spectral width parameter</li>
      <li><code>spectralWidth_max</code>: Maximum spectral width parameter</li>
    </ul>
    <p>Outputs:</p>
    <ul>
      <li><code>spec</code>: Array of spectral values for input frequencies [m^2s]</li>
    </ul>
    <p>Algorithm: The function calculates spectral values using the JONSWAP formula, which is an extension of the Pierson-Moskowitz spectrum with additional parameters to account for fetch-limited seas.</p>
  </html>"),
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-90, 50}, {90, -50}}, textString = "JONSWAP", textStyle = {TextStyle.Bold})}));

end spectrumGeneratorJS;
