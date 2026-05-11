within OceanEngineeringToolbox.Hydro.Forces.SubForces.HydrostaticForces;

model BuoyancyForce
  "Model representing the buoyancy torque resulting from representing the buoyancy at the centre of mass. This is only relevant when the body mass is defined explicitly and to account for the rotational buoyancy when the centres of buoyancy and gravity when they are not aligned."

  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Blocks.Interfaces;
  import Modelica.Constants.g_n;
  
  import Modelica.Mechanics.MultiBody.Frames.resolve2;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.InputRecords.BodyIndex;
  extends DataImport.ImportRecords.MultibodyImport.bodyData;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  extends DataImport.ImportRecords.MultibodyImport.massNoB2BData;
  extends BaseHydroForce;
  
    // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));  

//protected
  parameter SI.Force f_gravity[3]= {0, 0, g_n *M[1,1]} "Gravitational force";
  parameter SI.Force f_buoyancy[3] = {0,0, vol[1,1]*rho*g_n} "BuoyancyForce";
  parameter Real offset[3] = vector(cb - cg) "Offset between centres of bouyancy and gravity";
  
equation

  //F = cat(1, f_gravity - f_buoyancy, cross(f_buoyancy, offset));
  
  F =  cat(1, resolve2(frame_a.R,f_gravity - f_buoyancy), resolve2(frame_a.R,cross(f_buoyancy, offset)));
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Buoyancy Force")}));


end BuoyancyForce;
