within OceanEngineeringToolbox.Hydro.Forces.SubForces.RadiationForces;

partial model BaseRadiationForce
  "Partial model representing the base radiation force"
  
  // Importing from the MSL
  import Modelica.Blocks.Interfaces;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  //extends DataImport.InputRecords.BodyIndex;
  extends DataImport.ImportRecords.MultibodyImport.multibodyData;
  extends BaseHydroForce;

  // Velocity connectors
  Interfaces.RealVectorInput v_abs[3] "Translational velocity vector" annotation(
    HideResult = true,
    Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Interfaces.RealVectorInput omega_abs[3] "Angular velocity vector" annotation(
    HideResult = true,
    Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  // Force/torque vector

protected
  Real velocity[6] = cat(1, v_abs, omega_abs) "Combined velocity vector";
  
end BaseRadiationForce;
