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

  SubForces.ExcitationForces.ExcitationForce excitationForce(zeta = environment.wave.zeta, n_omega = environment.wave.n_omega, omega = environment.wave.omega, phi = environment.wave.phi, ramp = environment.wave.ramp, Trmp = environment.Trmp, file = file, bodyIndex = bodyIndex, waveHeading = environment.wave.waveHeading, waveHeadingSpreadBins = environment.wave.waveHeadingSpreadBins, spreadBinCentres = environment.wave.spreadBinCentres) annotation(
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));
equation

  connect(excitationForce.frame_a, frame_a) annotation(
    Line(points = {{-10, 0}, {-100, 0}}, color = {95, 95, 95}));
 annotation(
    Diagram);
end Excitation;
