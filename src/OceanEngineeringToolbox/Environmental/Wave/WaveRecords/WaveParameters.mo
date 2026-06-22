within OceanEngineeringToolbox.Environmental.Wave.WaveRecords;

record WaveParameters
  "Record containing the wave parameters"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  
  // Importing from the OET
  import OceanEngineeringToolbox.Environmental.Wave.WaveTypes.WaveSpectrumType;
  
  // Wave Parameters
  parameter WaveSpectrumType waveSpectrum = WaveTypes.WaveSpectrumType.PiersonMoskowitz "Wave Spectrum Type" annotation(
    Dialog(group = "Wave Parameters"));
  parameter String waveSelector = "PiersonMoskowitz" "Desired wave conditions" annotation(
    Dialog(group = "Wave Parameters"),
    choices(choice = "None", choice = "Regular", choice = "PiersonMoskowitz", choice = "Bretschneider", choice = "JONSWAP", choice = "OchiHubble", choice = "spectrumImport"));
  parameter String frequencySelection = "random" "Frequency discritization method" annotation(
    Dialog(group = "Wave Parameters", enable = (waveSelector == "PiersonMoskowitz" or waveSelector == "Bretschneider" or waveSelector == "JONSWAP" or waveSelector == "OchiHubble")),
    choices(choice = "random", choice = "equalEnergy"));
  parameter SI.Height Hs(min=0) = 2 "Significant wave height" annotation(
    Dialog(group = "Wave Parameters", enable = waveSelector <> "spectrumImport" and waveSelector <> "None"));
  parameter SI.Time Tp(min=0) = 8 "Peak wave period" annotation(
    Dialog(group = "Wave Parameters", enable = waveSelector <> "spectrumImport" and waveSelector <> "OchiHubble" and waveSelector <> "None"));
end WaveParameters;
