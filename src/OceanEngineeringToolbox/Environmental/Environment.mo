within OceanEngineeringToolbox.Environmental;

model Environment
  "Model representing the environmental conditions"
 
  outer DataImport.FileDirectory fileDirectory;

  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;

  // Spectrum Parameters
  parameter String waveSelector = "Regular" annotation(
    Dialog(group = "Wave Spectrum Parameters"),
    choices(choice = "None", choice = "Regular", choice = "PiersonMoskowitz", choice = "Bretschneider", choice = "JONSWAP", choice = "OchiHubble", choice = "spectrumImport"));
  parameter String frequencySelection = "random" annotation(
    Dialog(group = "Wave Spectrum Parameters", enable = (waveSelector == "PiersonMoskowitz" or waveSelector == "Bretschneider" or waveSelector == "JONSWAP" or waveSelector == "OchiHubble")),
    choices(choice = "random", choice = "equalEnergy"));
  parameter SI.Height Hs = 2 "Significant wave height" annotation(
    Dialog(group = "Wave Spectrum Parameters", enable = waveSelector <> "spectrumImport" and waveSelector <> "None"));
  parameter SI.Time Tp = 8 "Peak wave period" annotation(
    Dialog(group = "Wave Spectrum Parameters", enable = waveSelector <> "spectrumImport" and waveSelector <> "OchiHubble" and waveSelector <> "None"));
  
  // Pierson-Moskowitz parameters
  parameter Real alphaPM = 0.0081 "Energy scale (Phillips constant)" annotation(
    Dialog(group = "Pierson-Moskowitz Parameters", enable = waveSelector == "PiersonMoskowitz"));
  
  // JONSWAP parameters
  parameter Real gamma = 3.3 "Peak enhancement factor for JONSWAP spectrum. The mean typical value is 3.3" annotation(
    Dialog(group = "JONSWAP Parameters", enable = waveSelector == "JONSWAP"));
  parameter Real sigmaA = 0.07 "Lower spectral bound for JONSWAP" annotation(
    Dialog(group = "JONSWAP Parameters", enable = waveSelector == "JONSWAP"));
  parameter Real sigmaB = 0.09 "Upper spectral bound for JONSWAP" annotation(
    Dialog(group = "JONSWAP Parameters", enable = waveSelector == "JONSWAP"));

  // Ochi-Hubble Parameters
  parameter SI.Height HsOH[componentSpectra] = {0,0} "Significant wave heights" annotation(
    Dialog(group = "Ochi-Hubble Parameters", enable = waveSelector == "OchiHubble"));
  parameter SI.AngularFrequency omegaPeakOH[componentSpectra] = {0,0} "Peak spectral frequencies" annotation(
    Dialog(group = "Ochi-Hubble Parameters", enable = waveSelector == "OchiHubble"));
  parameter Real lambdaOH[componentSpectra] = {0,0} "Peak shape parameter" annotation(
    Dialog(group = "Ochi-Hubble Parameters", enable = waveSelector == "OchiHubble")); 
  
  // Ramp
  parameter SI.Time Trmp = 100 "Interval for ramping up of waves during start phase [s]" annotation(
    Dialog(group = "Simulation Parameters", enable = waveSelector <> "None"));
    // Spectrum Variables
  SI.Height SSE "Sea surface elevation";

  // Regular wave model
  Wave.RegularWave regularWave(Hs = Hs, omegaPeak = omegaPeak, Trmp = Trmp) if waveSelector == "Regular" annotation(
    Placement(transformation(origin = {0, 54}, extent = {{-12, -12}, {12, 12}})));
  // Irregular wave model
  Wave.IrregularWave irregularWave(Hs = Hs, alphaPM = alphaPM, omegaPeak = omegaPeak, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB, HsOH = HsOH, omegaPeakOH = omegaPeakOH, lambdaOH = lambdaOH, Trmp = Trmp, frequencySelection = frequencySelection, waveSelector = waveSelector, filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile) if waveSelector == "PiersonMoskowitz" or waveSelector == "Bretschneider" or  waveSelector == "JONSWAP" or waveSelector == "OchiHubble" annotation(
    Placement(transformation(extent = {{-12, -12}, {12, 12}})));
 // Imported spectrum model
  Wave.SpectrumImport spectrumImport(Trmp = Trmp, filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile) if waveSelector == "spectrumImport" annotation(
    Placement(transformation(origin = {0, -54}, extent = {{-12, -12}, {12, 12}})));

protected
  parameter SI.AngularFrequency omegaPeak = 2*pi/Tp "Peak angular frequency";
  final parameter Integer componentSpectra = 2;
equation
  if waveSelector == "None" then
    SSE = 0;
  elseif waveSelector == "Regular" then
    SSE = regularWave.SSE;
  elseif waveSelector == "PiersonMoskowitz" or waveSelector == "Bretschneider" or waveSelector == "JONSWAP" or waveSelector == "OchiHubble" then
    SSE = irregularWave.SSE;
  elseif waveSelector == "spectrumImport" then
    SSE = spectrumImport.SSE;
  end if;

  annotation(
    defaultComponentName = "environment",
    defaultComponentPrefixes = "inner",
    missingInnerMessage = "No \"environment\" component is defined. Drag the OET.Wave.Environment model into the top level of your model.",
  Icon(
    coordinateSystem(
      preserveAspectRatio=true,
      extent={{-100, -100}, {100, 100}}
    ),
    graphics={
      Text(extent={{-150, 145}, {150, 105}}, textString="%name", textColor={0, 0, 255}),
      Rectangle(extent={{-100, -100}, {100, 100}}),
      Text(extent={{-100, -100}, {100, 100}}, textString="Environment"),
      Text(extent={{-150, -140}, {150, -110}}, textString="waveType=%waveSelector")
    }
  ),
  Diagram
);
end Environment;
