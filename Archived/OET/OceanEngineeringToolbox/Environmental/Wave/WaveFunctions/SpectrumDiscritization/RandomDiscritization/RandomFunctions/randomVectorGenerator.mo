within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.RandomDiscritization.RandomFunctions;

function randomVectorGenerator
  "Function to generate a vector random numbers using XOR shift 64 algorithm"
  
  // Importing from the MSL
  import Modelica.Math.Random.Generators.Xorshift64star;
  
  input Integer localSeed "Local seed for random number generation";
  input Integer globalSeed "Global seed for random number generation";
  constant input Integer n "Number of random numbers to generate";
  output Real r[n] "Vector of generated random numbers";
protected
  Integer state[2](each start = 0, each fixed = true) "State vector for XOR shift algorithm";
algorithm
  state := Xorshift64star.initialState(localSeed, globalSeed);
  for i in 1:n loop
    (r[i], state) := Xorshift64star.random(state);
  end for;
  annotation(
    Documentation(info = "<html>
    <p>Syntax: r64 = randomNumberGen(ls, gs, n)</p>
    <p>Description: This function generates a vector of random numbers using the Xorshift64star algorithm, which is known for its efficiency and good statistical properties.</p>
    <p>Inputs:</p>
    <ul>
      <li><code>ls</code>: Local seed for random number generation (default: 614657)</li>
      <li><code>gs</code>: Global seed for random number generation (default: 30020)</li>
      <li><code>n</code>: Number of random numbers to generate (default: 100)</li>
    </ul>
    <p>Outputs:</p>
    <ul>
      <li><code>r64</code>: Vector of generated random numbers</li>
    </ul>
    <p>Algorithm: The function uses the Xorshift64star algorithm to generate random numbers based on the provided seeds.</p>
  </html>"),
    Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-90, 50}, {90, -50}}, textString = "RNG", textStyle = {TextStyle.Bold})}));

end randomVectorGenerator;
