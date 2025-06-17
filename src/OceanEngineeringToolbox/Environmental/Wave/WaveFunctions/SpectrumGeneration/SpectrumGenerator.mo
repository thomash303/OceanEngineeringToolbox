within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumGeneration;

function SpectrumGenerator
  "function representing wave spectrum generation for different wave spectra"
  
  input String waveSelector "Wave Generation Selector";
  input Real Hs "Significant wave height";
  input Real alphaPM "Energy scale (Phillips constant)";
  input Real omegaPeak "Peak spectral frequency" annotation(
    Dialog(group = "Wave Spectrum Parameters"));
  input Real omega[n_omega] "Array of frequency components";
  input Integer n_omega "Number of frequency components (default is 100 for irregular)";
  // JONSWAP parameters
  input Real gamma "Peak enhancement factor, the mean typical value is 3.3";
  input Real sigmaA "Lower spectral bound for JONSWAP";
  input Real sigmaB "Upper spectral bound for JONSWAP";
  output Real S[n_omega] "Array of spectral values for input frequencies";
algorithm
  if waveSelector == "PiersonMoskowitz" then
    S := SpectrumEquations.spectrumGeneratorPM(alphaPM = alphaPM, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega);
  elseif waveSelector == "Bretschneider" then
    S := SpectrumEquations.spectrumGeneratorBS(Hs = Hs, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega);
  elseif waveSelector == "JONSWAP" then
    S := SpectrumEquations.spectrumGeneratorJS(Hs = Hs, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega, sigmaA = sigmaA, sigmaB = sigmaB, gamma = gamma);
  end if;

end SpectrumGenerator;
