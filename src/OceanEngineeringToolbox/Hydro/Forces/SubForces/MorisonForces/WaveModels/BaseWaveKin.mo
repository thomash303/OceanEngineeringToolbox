within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.WaveModels;

partial model BaseWaveKin
  "Partial model representing the base wave kinematics model"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Blocks.Interfaces;
  import Modelica.Constants.{pi,g_n};
  
  // Inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  
  // Calling an outer model at the top-level deployment
  outer Environmental.Environment environment;
  outer parameter Integer nMETemp "Body index used for the radiation force (to avoid instantiation issue with replaceable objects)" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer nME = nMETemp "Body index for radiation force" annotation(HideResult = true, Dialog(enable = false, tab = "Misc")); 
  
 // Translational position
  Interfaces.RealInput positionME[3, nME] "Absolute translational position vector for all Morison elements" annotation(HideResult = true,
    Placement(transformation(origin = {0, 115}, extent = {{15, -15}, {-15, 15}}, rotation = -270), iconTransformation(origin = {0, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));

  // Wave velocity connectors
  SI.Velocity Uw[3,nME] = {uV, vV, wV} "Wave velocity vector" annotation(HideResult = true);
    
  // Wave acceleration connectors
  SI.Acceleration Aw[3,nME] = {uA, vA, wA} "Wave acceleration vector" annotation(HideResult = true);
 
  // Base wave parameters
  parameter Integer n_omega = environment.wave.n_omega "Number of frequency components (default is 100 for irregular)" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  // Wave Heading Parameters
  parameter SI.Angle waveHeading = environment.wave.waveHeading "Wave heading" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
   
  // Wave variables
  parameter SI.AngularFrequency omega[n_omega] = environment.wave.omega "Frequency components selected for simulation" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.WaveNumber k[n_omega] = environment.wave.k  "Wave number component" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.Angle phi[waveHeadingSpreadBins, n_omega] = environment.wave.phi  "Wave components phase shift" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter SI.Height zeta[waveHeadingSpreadBins, n_omega] = environment.wave.zeta "Wave amplitude component" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  
  
  parameter SI.Angle spreadBinCentres[waveHeadingSpreadBins] = environment.wave.spreadBinCentres "Bin centres" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer waveHeadingSpreadBins = environment.wave.waveHeadingSpreadBins  "Number of discrete headings centered around the mean heading to consider in the spectrum spread" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));

protected 
  // Intermediate variables
  // Velocity amplitude Components
  SI.Velocity vHorz[waveHeadingSpreadBins,n_omega, nME] "Horiziontal velocity amplitude component";
  SI.Velocity vVert[waveHeadingSpreadBins,n_omega, nME] "Vertical velocity amplitude component";
  
  // Velocity
  SI.Velocity uV[nME] "Horizontal water particle velocity (x)";
  SI.Velocity vV[nME] "Horizontal water particle velocity (y)";
  SI.Velocity wV[nME] "Vertical water particle velocity (z)";

  // Acceleration
  SI.Velocity uA[nME] "Horizontal water particle acceleration (x)";
  SI.Velocity vA[nME] "Horizontal water particle acceleration (y)";
  SI.Velocity wA[nME] "Vertical water particle acceleration (z)";
  
  SI.Angle phase[nME,waveHeadingSpreadBins,n_omega] "Intermediate value for phase";
  
equation
  
  for i in 1:nME loop
    for j in 1:waveHeadingSpreadBins loop
      // Phase computation (equation section compatible)
      phase[i,j,:] = omega .* time
                   - k .* (positionME[1,i] .* cos(spreadBinCentres[j])
                          + positionME[2,i] .* sin(spreadBinCentres[j]))
                   + phi[j,:];
    end for;
  
    // Velocities (nested sums over frequency and heading)
    uV[i] = sum(sum(vHorz[j,:,i] .* cos(phase[i,j,:]) .*  cos(spreadBinCentres[j])) for j in 1:waveHeadingSpreadBins);
    vV[i] = sum(sum(vHorz[j,:,i] .* cos(phase[i,j,:]) .* sin(spreadBinCentres[j])) for j in 1:waveHeadingSpreadBins);
    wV[i] = sum(sum(-vVert[j,:,i] .* sin(phase[i,j,:])) for j in 1:waveHeadingSpreadBins);
  
    // Accelerations (nested sums over frequency and heading)
    uA[i] = sum(sum(-omega .* vHorz[j,:,i] .* sin(phase[i,j,:])  .*  cos(spreadBinCentres[j]))  for j in 1:waveHeadingSpreadBins);
    vA[i] = sum(sum(-omega .* vHorz[j,:,i] .* sin(phase[i,j,:]) .* sin(spreadBinCentres[j]))  for j in 1:waveHeadingSpreadBins);
    wA[i] = sum(sum(-omega .* vVert[j,:,i] .* cos(phase[i,j,:])) for j in 1:waveHeadingSpreadBins);
  end for;
  

end BaseWaveKin;
