within OceanEngineeringToolbox.Environmental;

model Environment
  "Model representing the environmental conditions"
 
  outer DataImport.FileDirectory fileDirectory;

// Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;

// Spectrum Parameters
  parameter String waveSelector = "Regular" "Desired wave conditions" annotation(
    Dialog(group = "Wave Spectrum Parameters"),
    choices(choice = "None", choice = "Regular", choice = "PiersonMoskowitz", choice = "Bretschneider", choice = "JONSWAP", choice = "OchiHubble", choice = "spectrumImport"));
  parameter String frequencySelection = "random" "Frequency discritization method" annotation(
    Dialog(group = "Wave Spectrum Parameters", enable = (waveSelector == "PiersonMoskowitz" or waveSelector == "Bretschneider" or waveSelector == "JONSWAP" or waveSelector == "OchiHubble")),
    choices(choice = "random", choice = "equalEnergy"));
  parameter SI.Height Hs = 2 "Significant wave height" annotation(
    Dialog(group = "Wave Spectrum Parameters", enable = waveSelector <> "spectrumImport" and waveSelector <> "None"));
  parameter SI.Time Tp = 8 "Peak wave period" annotation(
    Dialog(group = "Wave Spectrum Parameters", enable = waveSelector <> "spectrumImport" and waveSelector <> "OchiHubble" and waveSelector <> "None"));
  // Wave Heading Parameters
  parameter SI.Angle waveHeading = 0 "Wave heading" annotation(Dialog(group = "Multidirectional Wave Parameters"));
  parameter Boolean multidirectionalEnable = false "Enable multidirectional wave" annotation(choices(checkBox = true), Dialog(group = "Multidirectional Wave Parameters", enable = (waveSelector == "PiersonMoskowitz" or waveSelector == "Bretschneider" or waveSelector == "JONSWAP" or waveSelector == "OchiHubble" or waveSelector == "spectrumImport")));
  parameter Integer n = 5 "Spreading function constant" annotation(Dialog(group = "Multidirectional Wave Parameters", enable = (multidirectionalEnable and (waveSelector == "PiersonMoskowitz" or waveSelector == "Bretschneider" or waveSelector == "JONSWAP" or waveSelector == "OchiHubble" or waveSelector == "spectrumImport"))));
  parameter SI.Angle waveHeadingSpread = pi/6 "Maximum spread (+/-) from the mean wave heading" annotation(Dialog(group = "Multidirectional Wave Parameters", enable = (multidirectionalEnable and (waveSelector == "PiersonMoskowitz" or waveSelector == "Bretschneider" or waveSelector == "JONSWAP" or waveSelector == "OchiHubble" or waveSelector == "spectrumImport"))));
  parameter Integer waveHeadingSpreadBins = 1 "Number of discrete headings centered around the mean heading to consider in the spectrum spread" annotation(Dialog(group = "Multidirectional Wave Parameters", enable = (multidirectionalEnable and (waveSelector == "PiersonMoskowitz" or waveSelector == "Bretschneider" or waveSelector == "JONSWAP" or waveSelector == "OchiHubble" or waveSelector == "spectrumImport"))));
  
  // Pierson-Moskowitz Parameters
  parameter Real alphaPM = 0.0081 "Energy scale (Phillips constant)" annotation(
    Dialog(group = "Pierson-Moskowitz Parameters", enable = waveSelector == "PiersonMoskowitz"));
  // JONSWAP Parameters
  parameter Real gamma = 3.3 "Peak enhancement factor for JONSWAP spectrum. The mean typical value is 3.3" annotation(
    Dialog(group = "JONSWAP Parameters", enable = waveSelector == "JONSWAP"));
  parameter Real sigmaA = 0.07 "Lower spectral bound for JONSWAP" annotation(
    Dialog(group = "JONSWAP Parameters", enable = waveSelector == "JONSWAP"));
  parameter Real sigmaB = 0.09 "Upper spectral bound for JONSWAP" annotation(
    Dialog(group = "JONSWAP Parameters", enable = waveSelector == "JONSWAP"));

// Ochi-Hubble Parameters (including sample values from original paper)
  // Default parameters computed from most likely sea state
  parameter SI.Height HsOH[componentSpectra] = {0.84*Hs,0.54*Hs} "Significant wave heights" annotation(
    Dialog(group = "Ochi-Hubble Parameters", enable = waveSelector == "OchiHubble")); // {4.14,3.27}
  parameter SI.AngularFrequency omegaPeakOH[componentSpectra] = {0.7*exp(-0.046*Hs),1.15*exp(-0.039*Hs)} "Peak spectral frequencies" annotation(
    Dialog(group = "Ochi-Hubble Parameters", enable = waveSelector == "OchiHubble")); // {0.58, 1}
  parameter Real lambdaOH[componentSpectra] = {3,1.54*exp(-0.062*Hs)} "Peak shape parameter" annotation(
    Dialog(group = "Ochi-Hubble Parameters", enable = waveSelector == "OchiHubble"));   // {2.67, 1.37}
  // Ramp
  parameter SI.Time Trmp = 100 "Interval for ramping up of waves during start phase [s]" annotation(
    Dialog(group = "Simulation Parameters", enable = waveSelector <> "None"));
    // Spectrum Variables
  SI.Height SSE "Sea surface elevation";

// Regular wave model
  Wave.RegularWave regularWave(Hs = Hs, omegaPeak = omegaPeak, Trmp = Trmp, file = fileDirectory.file) if waveSelector == "Regular" annotation(
    Placement(transformation(origin = {0, 54}, extent = {{-12, -12}, {12, 12}})));
  // Irregular wave model
  Wave.IrregularWave irregularWave(Hs = Hs, alphaPM = alphaPM, omegaPeak = omegaPeak, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB, HsOH = HsOH, omegaPeakOH = omegaPeakOH, lambdaOH = lambdaOH, Trmp = Trmp, frequencySelection = frequencySelection, waveSelector = waveSelector, file = fileDirectory.file, n = n, waveHeading = waveHeading, multidirectionalEnable = multidirectionalEnable, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins) if waveSelector == "PiersonMoskowitz" or waveSelector == "Bretschneider" or  waveSelector == "JONSWAP" or waveSelector == "OchiHubble" annotation(
    Placement(transformation(extent = {{-12, -12}, {12, 12}})));
 // Imported spectrum model
  Wave.SpectrumImport spectrumImport(Trmp = Trmp, file = fileDirectory.file, n = n, waveHeading = waveHeading, multidirectionalEnable = multidirectionalEnable, waveHeadingSpread = waveHeadingSpread) if waveSelector == "spectrumImport" annotation(
    Placement(transformation(origin = {0, -54}, extent = {{-12, -12}, {12, 12}})));

protected
  parameter SI.AngularFrequency omegaPeak = 2*pi/Tp "Peak angular frequency";
  final parameter Integer componentSpectra = 2;
equation
  // Assert
  assert(multidirectionalEnable or waveHeadingSpreadBins == 1, "1D waves must contain ONLY 1 wave heading bin. Only multidirectional waves can contain multiple wave bins.", level = AssertionLevel.error);

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
  Diagram(coordinateSystem(extent = {{-20, 80}, {20, -80}})));
end Environment;
