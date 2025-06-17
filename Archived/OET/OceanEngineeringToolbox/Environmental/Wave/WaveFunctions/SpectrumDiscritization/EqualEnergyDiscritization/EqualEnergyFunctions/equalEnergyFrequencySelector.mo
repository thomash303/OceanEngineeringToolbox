within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization.EqualEnergyFunctions;

function equalEnergyFrequencySelector
  "Function calculating the equal energy frequency regions"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Math.Vectors;

  input SI.AngularFrequency omegaMin "Minimum frequency";
  input SI.AngularFrequency omegaMax "Maximum frequency";
  input Integer n_omega "Number of frequency compenents to define the output spectrum";
  input Integer n_omega_int "Number of steps to define the intermediate spectrum";
  input SI.AngularFrequency omega_int[n_omega_int] "Integration frquencies for the intermediate spectrum";
  input WaveUnits.spectrumEnergyDensity S_int[n_omega_int] "Intermediate spectrum";
  output SI.AngularFrequency omega[n_omega] "Output vector of selected frequency components [rad/s]";

protected
  WaveUnits.spectrumEnergyDensity S[n_omega] "Wave energy spectrum";
  SI.AngularFrequency domega = SpectrumCalculations.constantFrequencyStep(omegaMin = omegaMin, omegaMax = omegaMax, n_omega = n_omega_int) "Frequency step for the intermediate spectrum";
  WaveUnits.spectrumEnergyDensity cumEnergy_int[n_omega_int] "Vector of cumulative spectrum interval areas in the intermediate spectrum";
  WaveUnits.spectrumEnergyDensity totEnergy "Total energy in the spectrum";
  WaveUnits.spectrumEnergyDensity energy_int "Energy in current interval for the intermediate spectrum";
  WaveUnits.spectrumEnergyDensity meanEnergy "Mean energy per interval in output spectrum";
  WaveUnits.spectrumEnergyDensity cumEnergy "Vector of cumulative sprectrum interval areas in the output spectrum";
algorithm
  cumEnergy := 0;
  cumEnergy_int[1] := 0;
  omega[1] := omegaMin;
  omega[end] := omegaMax;
  S[1] := S_int[1];
  S[end] := S_int[end];
// Finding the energy in the current interval to determine the current cumulative energy
  for i in 2:n_omega_int loop
    energy_int := EqualEnergyFunctions.trapezoidalIntegration(S_int[i - 1], S_int[i], domega);
    cumEnergy_int[i] := cumEnergy_int[i - 1] + energy_int;
  end for;
  totEnergy := cumEnergy_int[end];
// Finding the total energy by taking the last step of the cumulative energy
  meanEnergy := totEnergy/(n_omega - 1);
/*Adding the desired mean energy to the energy to the culmulative energy at the current step so that the output frequency and spectrum can be interpolated from the intermediate spectrum */
  for i in 2:(n_omega - 1) loop
    cumEnergy := cumEnergy + meanEnergy;
    omega[i] := Vectors.interpolate(cumEnergy_int, omega_int, cumEnergy);
    S[i] := Vectors.interpolate(omega_int, S_int, omega[i]);
  end for;

end equalEnergyFrequencySelector;
