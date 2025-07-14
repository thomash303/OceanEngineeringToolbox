within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.RandomDiscritization.RandomFunctions;

function randomFrequencySelector
  "Function to randomly select frequency components within a specified range"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  input SI.AngularFrequency omegaMin "Minimum frequency";
  input SI.AngularFrequency omegaMax "Maximum frequency";
  input Integer localSeed "Local seed for random number generation";
  input Integer globalSeed "Global seed for random number generation";
  input Integer n_omega "Number of frequency components";
  output SI.AngularFrequency omega[n_omega] "Output vector of selected frequency components";
protected
  SI.AngularFrequency epsilon[n_omega] = randomVectorGenerator(localSeed, globalSeed, n_omega) "Random vector for frequency perturbation";
  constant Real scalarShift = 0.5 "Scaler to shift randon vector between -0.5 and 0.5";
  SI.AngularFrequency omegaDefault[n_omega] = omegaMin:domega:omegaMax "Reference frequency vector";
  parameter SI.AngularFrequency domega = SpectrumCalculations.constantFrequencyStep(omegaMin = omegaMin, omegaMax = omegaMax, n_omega = (n_omega - 1)) "Step size";
algorithm
  omega[1] := omegaMin;
  for i in 2:n_omega - 1 loop
    omega[i] := omegaDefault[i] + (epsilon[i] - scalarShift)*domega;
  end for;
  omega[end] := omegaMax;
  annotation(
    Documentation(info = "<html>
    <p>Syntax: omega = frequencySelector(OmegaMin, omega_max, epsilon)</p>
    <p>Description: This function selects frequency components within a specified range, using a random phase vector to perturb the frequencies. This ensures a good distribution of frequencies for irregular wave generation.</p>
    <p>Inputs:</p>
    <ul>
      <li><code>OmegaMin</code>: Minimum frequency [rad/s]</li>
      <li><code>omega_max</code>: Maximum frequency [rad/s]</li>
      <li><code>epsilon</code>: Random phase vector for frequency perturbation</li>
    </ul>
    <p>Outputs:</p>
    <ul>
      <li><code>omega</code>: Output vector of selected frequency components [rad/s]</li>
    </ul>
    <p>Algorithm: The function creates a reference frequency vector and then perturbs it using the random phase vector, ensuring the first and last frequencies are exactly omega_min and omega_max.</p>
  </html>"),
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-90, 50}, {90, -50}}, textString = "ω(ε)", textStyle = {TextStyle.Bold})}));

end randomFrequencySelector;
