within OceanEngineeringToolbox.Environmental.Wave.WaveModels;

model IrregularWave
  "Model representing an irregular wave"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  import OceanEngineeringToolbox.Environmental.Wave.WaveTypes.WaveSpectrumType;
  extends BaseWave(n_omega = 100);
  extends WaveRecords.RandomFrequencyParameters;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.EqualEnergyDiscritization.equalEnergyGenerator;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.RandomDiscritization.randomGenerator;
  import OceanEngineeringToolbox.Environmental.Wave.WaveFunctions.SpectrumDiscritization.BaseSpectrumDiscritization;

  // Random frequency discritization model
  replaceable randomGenerator frequencySelector(waveSpectrum = waveSpectrum, file = file, localSeedFrequency = localSeedFrequency, globalSeedFrequency = globalSeedFrequency, localSeedPhase = localSeedPhase, globalSeedPhase = globalSeedPhase, n_omega = n_omega, waveSelector = waveSelector, Hs = Hs, alphaPM = alphaPM, omegaPeak = omegaPeak, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB, HsOH = HsOH, omegaPeakOH = omegaPeakOH, lambdaOH = lambdaOH, Trmp = Trmp, n = n, waveHeading = waveHeading, multidirectionalEnable = multidirectionalEnable, waveHeadingSpread = waveHeadingSpread, waveHeadingSpreadBins = waveHeadingSpreadBins) constrainedby BaseSpectrumDiscritization "Frequency discritization method" annotation(Dialog(group = "Wave Parameters"), choices(choice(redeclare randomGenerator frequencySelector "Random frequency selection"), choice(redeclare equalEnergyGenerator frequencySelector "Equal-energy frequency selection")));
 
  // Output variables for excitation, Morison, and wave gauge
  parameter SI.Height zeta[waveHeadingSpreadBins,n_omega] = frequencySelector.zeta "Wave amplitude component"  annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.Angle phi[waveHeadingSpreadBins, n_omega] = frequencySelector.phi "Wave components phase shift"  annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.AngularFrequency omega[n_omega] = frequencySelector.omega "Frequency components selected for simulation" annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.WaveNumber k[n_omega] = frequencySelector.k "Wave number component" annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.Angle spreadBinCentres[waveHeadingSpreadBins] = frequencySelector.spreadBinCentres "Bin centres" annotation(Dialog(enable = false, tab = "Misc"));
  parameter Real D[waveHeadingSpreadBins] = frequencySelector.D "Directional spreading weights" annotation(Dialog(enable = false, tab = "Misc"));

equation
  // Assert
  assert(multidirectionalEnable or waveHeadingSpreadBins == 1, "1D waves must contain ONLY 1 wave heading bin. Only multidirectional waves can contain multiple wave bins.", level = AssertionLevel.error);
    assert(waveHeading >= 0 and waveHeading < 2*pi,
    "waveHeading (" + String(waveHeading) + 
    " rad) must be within [0, 2*pi) radians or [0, 360) degrees"
  );
  

  annotation(
    defaultComponentName = "irregularWave",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Irregular Wave")}),
    Diagram);


end IrregularWave;
