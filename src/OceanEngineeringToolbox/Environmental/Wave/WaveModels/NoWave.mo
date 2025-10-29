within OceanEngineeringToolbox.Environmental.Wave.WaveModels;

model NoWave
  "Model representing no wave"

  // Importing from the MSL
  import Modelica.Units.SI; 
  import Modelica.Constants.{pi,g_n};
  
  // Extending and inheriting from the OET
  import OceanEngineeringToolbox.Environmental.Wave.WaveTypes.WaveSpectrumType;
  extends DataImport.InputRecords.FilePath;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  extends BaseWave(
    n_omega = 1,
    redeclare parameter Real alphaPM,
    redeclare parameter Real gamma,
    redeclare parameter Real sigmaA,
    redeclare parameter Real sigmaB,
    redeclare parameter SI.Height HsOH,
    redeclare parameter SI.AngularFrequency omegaPeakOH,
    redeclare parameter Real lambdaOH,
    redeclare parameter Integer componentSpectra,
    redeclare parameter Integer localSeedPhase,
    redeclare parameter Integer globalSeedPhase,
    redeclare parameter SI.Angle waveHeading,
    redeclare parameter Boolean multidirectionalEnable,
    redeclare parameter Integer n,
    redeclare parameter SI.Angle waveHeadingSpread,
    redeclare parameter Integer waveHeadingSpreadBins,
    redeclare parameter WaveSpectrumType waveSpectrum,
    redeclare parameter String waveSelector,
    redeclare parameter String frequencySelection,
    redeclare parameter SI.Height Hs,
    redeclare parameter SI.Time Tp
  );
  

  // Wave Parameters
  parameter SI.Height A = Hs/2 "Wave amplitude" annotation(Dialog(enable = false, tab = "Misc"));
  
  // Wave Heading Parameters
  parameter SI.Angle waveHeading = 0 "Wave heading" annotation(Dialog(enable = false, tab = "Misc"));
  
  // Ramp  
  Real ramp "Ramping function" annotation(Dialog(enable = false, tab = "Misc"));
    
  parameter SI.WaveNumber k[n_omega] = WaveFunctions.waveNumber(d, vector(omegaPeak), n_omega) "Wave number component" annotation(Dialog(enable = false,tab = "Misc"));
  
  // Spectrum Variables
  parameter WaveUnits.powerPerUnitLength P = WaveFunctions.wavePower(rho = rho, d = d, k = k, A = A, n_omega = n_omega) "Wave time-average power per unit wave crest length" annotation(Dialog(enable = false,tab = "Misc"));

  // Output variables for excitation, Morison, and wave gauge
  parameter SI.Height zeta[waveHeadingSpreadBins,n_omega] = fill(A,waveHeadingSpreadBins,n_omega) "Wave amplitude component" annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.Angle phi[waveHeadingSpreadBins, n_omega] = zeros(waveHeadingSpreadBins,n_omega) "Wave components phase shift" annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.AngularFrequency omega[n_omega] = vector(omegaPeak) "Frequency components selected for simulation" annotation(Dialog(enable = false, tab = "Misc"));
  parameter SI.Angle spreadBinCentres[waveHeadingSpreadBins] = zeros(waveHeadingSpreadBins) "Bin centres" annotation(Dialog(enable = false, tab = "Misc"));
  parameter Real D[waveHeadingSpreadBins] = zeros(waveHeadingSpreadBins) "Directional spreading weights" annotation(Dialog(enable = false, tab = "Misc"));
  
  // Wave Elevation
  SI.Position SSE = 0 "Sea surface elevation";
equation
  
  
  annotation(
    defaultComponentName = "noWave",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "No Wave")}),
    Diagram);

end NoWave;
