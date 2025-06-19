within OceanEngineeringToolbox.Hydro.Forces;

model Excitation
  "Model representing the excitation force"
  
  // Importing from the MSL
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.InputRecords.BodyIndex;
  
  // Calling an outer model at the top-level deployment
  outer Environmental.Environment environment;
 
  
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));

 // Regular wave excitation force
  SubForces.ExcitationForces.ExcitationForceRegularWave excitationForceRegularWave(A = environment.regularWave.A, omegaPeak = environment.regularWave.omegaPeak, Trmp = environment.Trmp, ramp = environment.regularWave.ramp, filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex) if environment.waveSelector == "Regular" annotation(
        Placement(transformation(origin = {58, 80}, extent = {{-16, -16}, {16, 16}})));
  // Irregular wave (w/ random spectral discritization) excitation force
  SubForces.ExcitationForces.ExcitationForceIrregularWave excitationForceIrregularWaveRandom(n_omega = environment.irregularWave.n_omega, omega = environment.irregularWave.RandomGenerator.omega, zeta = environment.irregularWave.RandomGenerator.zeta, phi = environment.irregularWave.RandomGenerator.phi, Trmp = environment.Trmp, ramp = environment.irregularWave.RandomGenerator.ramp, filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex) if (environment.waveSelector == "PiersonMoskowitz" or environment.waveSelector == "Bretschneider" or environment.waveSelector == "JONSWAP" or environment.waveSelector == "OchiHubble") and environment.frequencySelection == "random" annotation(
        Placement(transformation(origin = {58, 20}, extent = {{-16, -16}, {16, 16}})));
  // Irregular wave (w/ equal energy spectral discritization) excitation force
  SubForces.ExcitationForces.ExcitationForceIrregularWave excitationForceIrregularWaveEqualEnergy(n_omega = environment.irregularWave.n_omega, omega = environment.irregularWave.EqualEnergyGenerator.omega, zeta = environment.irregularWave.EqualEnergyGenerator.zeta, phi = environment.irregularWave.EqualEnergyGenerator.phi, Trmp = environment.Trmp, ramp = environment.irregularWave.EqualEnergyGenerator.ramp, filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex) if (environment.waveSelector == "PiersonMoskowitz" or environment.waveSelector == "Bretschneider" or environment.waveSelector == "JONSWAP" or environment.waveSelector == "OchiHubble") and environment.frequencySelection == "equalEnergy" annotation(
        Placement(transformation(origin = {58, -24}, extent = {{-16, -16}, {16, 16}})));
  // Imported spectrum excitation force
  SubForces.ExcitationForces.ExcitationForceIrregularWave excitationForceSpectrumImport(n_omega = environment.spectrumImport.n_omega, omega = environment.spectrumImport.omega, zeta = environment.spectrumImport.zeta, phi = environment.spectrumImport.phi, Trmp = environment.Trmp, ramp = environment.spectrumImport.ramp, filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex) if environment.waveSelector == "spectrumImport" annotation(
        Placement(transformation(origin = {58, -80}, extent = {{-16, -16}, {16, 16}})));

equation
  connect(excitationForceRegularWave.frame_a, frame_a) annotation(
    Line(points = {{42, 80}, {-100, 80}, {-100, 0}}, color = {95, 95, 95}));
  connect(excitationForceIrregularWaveRandom.frame_a, frame_a) annotation(
    Line(points = {{42, 20}, {-100, 20}, {-100, 0}}, color = {95, 95, 95}));
  connect(excitationForceIrregularWaveEqualEnergy.frame_a, frame_a) annotation(
    Line(points = {{42, -24}, {-100, -24}, {-100, 0}}, color = {95, 95, 95}));
  connect(excitationForceSpectrumImport.frame_a, frame_a) annotation(
    Line(points = {{42, -80}, {-100, -80}, {-100, 0}}, color = {95, 95, 95}));  
  annotation(
    Diagram);
end Excitation;
