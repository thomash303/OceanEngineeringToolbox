within OceanEngineeringToolbox.Environmental.Wave.WaveRecords;

record MultidirectionalParameters
  "Package containing the multidirectional wave parameters"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  
  // Extending from the OET
  extends WaveParameters;
  
  // Multidirectional wave Parameters
  parameter SI.Angle waveHeading = 0 "Wave heading ([0-360) or [0-2pi))" annotation(Dialog(group = "Multidirectional Wave Parameters"));
  parameter Boolean multidirectionalEnable = false "Enable multidirectional wave" annotation(choices(checkBox = true), Dialog(group = "Multidirectional Wave Parameters", enable = (waveSelector == "PiersonMoskowitz" or waveSelector == "Bretschneider" or waveSelector == "JONSWAP" or waveSelector == "OchiHubble" or waveSelector == "spectrumImport")));
  parameter Integer n(min=1) = 5 "Spreading function constant" annotation(Dialog(group = "Multidirectional Wave Parameters", enable = (multidirectionalEnable and (waveSelector == "PiersonMoskowitz" or waveSelector == "Bretschneider" or waveSelector == "JONSWAP" or waveSelector == "OchiHubble" or waveSelector == "spectrumImport"))));
  parameter SI.Angle waveHeadingSpread(min=0,max=pi) = pi/6 "Maximum spread (+/-) from the mean wave heading" annotation(Dialog(group = "Multidirectional Wave Parameters", enable = (multidirectionalEnable and (waveSelector == "PiersonMoskowitz" or waveSelector == "Bretschneider" or waveSelector == "JONSWAP" or waveSelector == "OchiHubble" or waveSelector == "spectrumImport"))));
  parameter Integer waveHeadingSpreadBins = 1 "Number of discrete headings centered around the mean heading to consider in the spectrum spread" annotation(Dialog(group = "Multidirectional Wave Parameters", enable = (multidirectionalEnable and (waveSelector == "PiersonMoskowitz" or waveSelector == "Bretschneider" or waveSelector == "JONSWAP" or waveSelector == "OchiHubble" or waveSelector == "spectrumImport"))));
end MultidirectionalParameters;
