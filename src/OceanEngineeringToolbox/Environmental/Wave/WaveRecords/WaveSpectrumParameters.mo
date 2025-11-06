within OceanEngineeringToolbox.Environmental.Wave.WaveRecords;

record WaveSpectrumParameters
  "Record containing the wave spectrum parameters"

  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Extending from the OET
  extends WaveParameters;

  // Pierson-Moskowitz Parameters
  parameter Real alphaPM(min=0) = 0.0081 "Energy scale (Phillips constant)" annotation(
    Dialog(group = "Pierson-Moskowitz Parameters", enable = waveSelector == "PiersonMoskowitz"));
  // JONSWAP Parameters
  parameter Real gamma(min=0) = 3.3 "Peak enhancement factor for JONSWAP spectrum. The mean typical value is 3.3" annotation(
    Dialog(group = "JONSWAP Parameters", enable = waveSelector == "JONSWAP"));
  parameter Real sigmaA(min=0) = 0.07 "Lower spectral bound for JONSWAP" annotation(
    Dialog(group = "JONSWAP Parameters", enable = waveSelector == "JONSWAP"));
  parameter Real sigmaB(min=0) = 0.09 "Upper spectral bound for JONSWAP" annotation(
    Dialog(group = "JONSWAP Parameters", enable = waveSelector == "JONSWAP"));

// Ochi-Hubble Parameters (including sample values from original paper)
  // Default parameters computed from most likely sea state
  parameter SI.Height HsOH[componentSpectra] = {0.84*Hs,0.54*Hs} "Significant wave heights" annotation(
    Dialog(group = "Ochi-Hubble Parameters", enable = waveSelector == "OchiHubble")); 
  parameter SI.AngularFrequency omegaPeakOH[componentSpectra] = {0.7*exp(-0.046*Hs),1.15*exp(-0.039*Hs)} "Peak spectral frequencies" annotation(
    Dialog(group = "Ochi-Hubble Parameters", enable = waveSelector == "OchiHubble")); 
  parameter Real lambdaOH[componentSpectra] = {3,1.54*exp(-0.062*Hs)} "Peak shape parameter" annotation(
    Dialog(group = "Ochi-Hubble Parameters", enable = waveSelector == "OchiHubble"));
  final parameter Integer componentSpectra(min=0) = 2;
end WaveSpectrumParameters;
