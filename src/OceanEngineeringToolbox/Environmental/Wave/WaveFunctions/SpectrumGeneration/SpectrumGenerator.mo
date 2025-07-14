within OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumGeneration;

function SpectrumGenerator
  "function representing wave spectrum generation for different wave spectra"
 
  // Importing from the MSL
  import Modelica.Units.SI;
  
  input String waveSelector "Wave Generation Selector";
  input SI.Height Hs "Significant wave height";
  input Real alphaPM "Energy scale (Phillips constant)";
  input SI.AngularFrequency omegaPeak "Peak spectral frequency" annotation(
    Dialog(group = "Wave Spectrum Parameters"));
  input SI.AngularFrequency omega[n_omega] "Array of angular frequency components";
  input Integer n_omega "Number of frequency components (default is 100 for irregular)";
  // JONSWAP parameters
  input Real gamma "Peak enhancement factor, the mean typical value is 3.3";
  input Real sigmaA "Lower spectral bound for JONSWAP";
  input Real sigmaB "Upper spectral bound for JONSWAP";
  // Ochi-Hubble Parameters
  input SI.Height HsOH[componentSpectra] "Significant wave heights";
  input SI.AngularFrequency omegaPeakOH[componentSpectra] "Peak spectral frequencies";
  input Real lambdaOH[componentSpectra] "Peak shape parameter";
  
  output WaveUnits.spectrumEnergyDensity S[n_omega] "Array of spectral values for input frequencies";
protected
  Integer componentSpectra = 2;  
algorithm
  if waveSelector == "PiersonMoskowitz" then
    S := SpectrumEquations.spectrumGeneratorPM(alphaPM = alphaPM, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega);
  elseif waveSelector == "Bretschneider" then
    S := SpectrumEquations.spectrumGeneratorBS(Hs = Hs, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega);
  elseif waveSelector == "JONSWAP" then
    S := SpectrumEquations.spectrumGeneratorJS(Hs = Hs, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega, sigmaA = sigmaA, sigmaB = sigmaB, gamma = gamma);
  elseif waveSelector == "OchiHubble" then
    S := SpectrumEquations.spectrumGeneratorOH(Hs = HsOH, omegaPeak = omegaPeakOH, omega = omega, n_omega = n_omega, lambda = lambdaOH);
  end if;
  
 

end SpectrumGenerator;
