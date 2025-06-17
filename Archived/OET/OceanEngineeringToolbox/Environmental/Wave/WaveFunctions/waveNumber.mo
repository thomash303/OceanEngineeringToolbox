within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions;

function waveNumber
  "Implicit wave number calculation with the dispersion relationship, using the deep water wave number as an initial guess"
  
  // Importing from the MSL
  import Modelica.Constants.{pi, g_n};
  import Modelica.Units.SI;
  
  input SI.Distance d "Water depth";
  input SI.AngularFrequency omega[n_omega] "Wave frequency components";
  input Integer n_omega "Number of frequency components";
  output SI.WaveNumber k[n_omega] "Wave number components";
protected
  parameter Real tolerance = 0.001 "Tolerance to end loop";
  SI.WaveNumber kL[n_omega] "Wave number looping variable";
  parameter Integer maxIter = 100 "Maximum number of allowable iterations";
  parameter Integer counter "Counter variable";
  SI.WaveNumber k0[n_omega] "Deep water wave number";
algorithm
// Initial guess using deep water wave number
  k0 := omega.^2/g_n;
  counter := 1;
  kL := zeros(n_omega);
  k := k0;
  while max(abs(k - kL)) >= tolerance and counter < maxIter loop
    kL := k;
    k := (omega.^2)./(g_n.*tanh(k.*d));
    counter := counter + 1;
  end while;

end waveNumber;
