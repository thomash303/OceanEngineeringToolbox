within OceanEngineeringToolbox.Environmental.Wave.WaveModels;

model RegularWave
  "Model representing a regular wave"

  // Importing from the MSL
  import Modelica.Units.SI; 
  import Modelica.Constants.{pi,g_n};
  
  // Extending and inheriting from the OET
  import OceanEngineeringToolbox.Environmental.Wave.WaveTypes.WaveSpectrumType;
  extends DataImport.InputRecords.FilePath;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  extends BaseWave(
    n_omega = 1);
  
  // Wave parameters
  parameter WaveTypes.WaveSpectrumType waveSpectrum = WaveTypes.WaveSpectrumType.PiersonMoskowitz "Wave Spectrum Type" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.Height A = Hs/2 "Wave amplitude" annotation(Dialog(enable = false, tab = "Misc"));
  
  // Multidirectional wave parameters
  parameter Boolean multidirectionalEnable = false "Enable multidirectional wave" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer n(min=1) = 5 "Spreading function constant" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.Angle waveHeadingSpread(min=0,max=pi) = pi/6 "Maximum spread (+/-) from the mean wave heading" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer waveHeadingSpreadBins = 1 "Number of discrete headings centered around the mean heading to consider in the spectrum spread" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Random phase selection
  parameter Integer localSeedPhase = 614757 "Local random seed for phase shifts"  annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer globalSeedPhase = 40020 "Global random seed for phase shifts"  annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Ramp  
  Real ramp "Ramping function" annotation(Dialog(enable = false, tab = "Misc"));
    
  parameter SI.WaveNumber k[n_omega] = WaveFunctions.waveNumber(d, vector(omegaPeak), n_omega) "Wave number component" annotation(Dialog(enable = false,tab = "Misc"));
  
  // Spectrum Variables
  WaveUnits.powerPerUnitLength P = WaveFunctions.wavePower(rho = rho, d = d, k = k, A = A, n_omega = n_omega) "Wave time-average power per unit wave crest length" annotation(Dialog(enable = false,tab = "Misc"));

  // Output variables for excitation, Morison, and wave gauge
  parameter SI.Height zeta[waveHeadingSpreadBins,n_omega] = fill(A,waveHeadingSpreadBins,n_omega) "Wave amplitude component" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.Angle phi[waveHeadingSpreadBins, n_omega] = zeros(waveHeadingSpreadBins,n_omega) "Wave components phase shift"  annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.AngularFrequency omega[n_omega] = vector(omegaPeak) "Frequency components selected for simulation" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
    parameter SI.Angle spreadBinCentres[waveHeadingSpreadBins] = fill(waveHeading,waveHeadingSpreadBins) "Bin centres" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Real D[waveHeadingSpreadBins] = zeros(waveHeadingSpreadBins) "Directional spreading weights" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));

  // Wave elevation
  SI.Position SSE "Sea surface elevation";

equation
  
  SSE = WaveFunctions.waveElevation(zeta = zeta, omegaTime = omega*time, k = k, ramp = ramp, n_omega = n_omega);
  
  annotation(
    defaultComponentName = "regularWave",
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Regular Wave")}),
    Diagram);

end RegularWave;
