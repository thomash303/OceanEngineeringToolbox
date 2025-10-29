within OceanEngineeringToolbox.Hydro.Forces.SubForces.MorisonForces.WaveModels;

partial model BaseWaveKin
  "Partial model representing the base wave kinematics model"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Blocks.Interfaces;
  import Modelica.Constants.{pi,g_n};
      
  // Translational position connectors
  Interfaces.RealInput positionME[3,nME] "Absolute translational position vector for all Morison elements" annotation(
    Placement(transformation(origin = {0, 115}, extent = {{15, -15}, {-15, 15}}, rotation = -270), iconTransformation(origin = {0, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));

  // Wave velocity connectors
  Interfaces.RealOutput Uw[3,nME] = {uV , vV, wV} "Wave velocity vector" annotation(
    Placement(transformation(origin = {-30, -114}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-38, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
    
  // Wave acceleration connectors
  Interfaces.RealOutput Aw[3,nME] = {uA, vA, wA} "Wave acceleration vector" annotation(
    Placement(transformation(origin = {30, -114}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {40, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
 
  // Base wave parameters
  parameter Integer nME = 2 "Number of Morison Morison elements";
  parameter Integer n_omega = 2 "Number of frequency components (default is 100 for irregular)";
  
  // Wave Heading Parameters
  parameter SI.Angle waveHeading = 0 "Wave heading";
  
  // Wave variables
  parameter SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation";
  parameter SI.WaveNumber k[n_omega]  "Wave number component";
  parameter SI.Angle phi[waveHeadingSpreadBins, n_omega]  "Wave components phase shift";
  parameter SI.Height zeta[waveHeadingSpreadBins, n_omega] "Wave amplitude component";
  
  
  parameter SI.Angle spreadBinCentres[waveHeadingSpreadBins] "Bin centres";
  parameter Integer waveHeadingSpreadBins "Number of discrete headings centered around the mean heading to consider in the spectrum spread";
protected 
  // Intermediate variables
  // Velocity amplitude Components
 
  SI.Velocity vHorz[n_omega, nME] "Horiziontal velocity amplitude component";
  SI.Velocity vVert[n_omega, nME] "Vertical velocity amplitude component";
  
  // Velocity
  SI.Velocity uV[nME] "Horizontal water particle velocity (x)";
  SI.Velocity vV[nME] "Horizontal water particle velocity (y)";
  SI.Velocity wV[nME] "Vertical water particle velocity (z)";

  // Acceleration
  SI.Velocity uA[nME] "Horizontal water particle acceleration (x)";
  SI.Velocity vA[nME] "Horizontal water particle acceleration (y)";
  SI.Velocity wA[nME] "Vertical water particle acceleration (z)";
  
  SI.Angle phase[nME,n_omega] "Intermediate value for phase";
  
equation

  for i in 1:nME loop
    phase[i,:] = omega .* time - k .* (fill(positionME[1,i],n_omega) .* cos(waveHeading) + fill(positionME[2,i],n_omega) .* sin(waveHeading)) + phi[1,:];
  
    // Velocities
    uV[i] = sum(vHorz[:,i] .* cos(phase[i,:])) * cos(waveHeading);
    vV[i] = sum(vHorz[:,i] .* cos(phase[i,:])) * sin(waveHeading);
    wV[i] = sum(vVert[:,i] .* sin(phase[i,:]));
    
    // Accelerations
    uA[i] = sum(omega .* vHorz[:,i] .* sin(phase[i,:])) * cos(waveHeading);
    vA[i] = sum(omega .* vHorz[:,i] .* sin(phase[i,:])) * sin(waveHeading);
    wA[i] = sum(-omega .* vVert[:,i] .* cos(phase[i,:]));
  end for;

end BaseWaveKin;
