within OceanEngineeringToolbox.Environmental;

model Environment
  "Model representing the environmental conditions"
 
  outer DataImport.FileDirectory fileDirectory;

  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  
  import OceanEngineeringToolbox.Environmental.Wave.WaveModels.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.RandomDiscritization.*;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.*;
    
  // Current parameters
  parameter SI.Velocity Uc0 = 1 "Current velocity at the mean water level" annotation(Dialog(group = "Current Parameters (for Morison only)"));
  parameter SI.Angle currentHeading = 0 "Current heading" annotation(Dialog(group = "Current Parameters (for Morison only)"));
  parameter Real alphaCur = 0.14 "Power-law exponent" annotation(Dialog(group = "Current Parameters (for Morison only)"));
  
  // Simulation parameters
  parameter SI.Time Trmp = 100 "Interval for ramping up of waves during start phase" annotation(
    Dialog(group = "Simulation Parameters"));
    
  replaceable RegularWave wave(file = fileDirectory.file) constrainedby BaseWave  "Wave type" annotation(choices(choice(redeclare NoWave wave(file = fileDirectory.file) "No wave"), choice(redeclare RegularWave wave(file = fileDirectory.file) "Regular wave"), choice(redeclare IrregularWave wave(file = fileDirectory.file) "Irregular wave"), choice(redeclare SpectrumImportWave wave(file = fileDirectory.file) "Spectrum import wave")));
  

    
/*  // Irregular wave model
  replaceable Wave.IrregularWave irregularWave(waveSpectrum = waveSpectrum, Hs = Hs, alphaPM = alphaPM, omegaPeak = omegaPeak, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB, HsOH = HsOH, omegaPeakOH = omegaPeakOH, lambdaOH = lambdaOH, Trmp = Trmp, frequencySelection = frequencySelection, waveSelector = waveSelector, file = fileDirectory.file, n = n, waveHeading = waveHeading, multidirectionalEnable = multidirectionalEnable, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins, redeclare randomGenerator spectrumGeneration "Random frequency selection") if waveSelector == "PiersonMoskowitz" or waveSelector == "Bretschneider" or  waveSelector == "JONSWAP" or waveSelector == "OchiHubble" annotation(
    Placement(transformation(extent = {{-12, -12}, {12, 12}})));
 // Imported spectrum model
  Wave.SpectrumImport spectrumImport(Trmp = Trmp, file = fileDirectory.file, n = n, waveHeading = waveHeading, multidirectionalEnable = multidirectionalEnable, waveHeadingSpread = waveHeadingSpread) if waveSelector == "spectrumImport" annotation(
    Placement(transformation(origin = {0, -54}, extent = {{-12, -12}, {12, 12}})));
 */


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
