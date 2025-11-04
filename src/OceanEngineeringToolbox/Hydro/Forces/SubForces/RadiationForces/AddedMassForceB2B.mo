within OceanEngineeringToolbox.Hydro.Forces.SubForces.RadiationForces;

model AddedMassForceB2B

  // Inheriting from the OET

  import Modelica.Blocks.Interfaces;
  
  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  //extends DataImport.InputRecords.BodyIndex;
  extends DataImport.ImportRecords.MultibodyImport.multibodyData;
  extends DataImport.ImportRecords.MultibodyImport.massB2BData(bodyIndex = bodyIndexTemp);
  extends BaseHydroForce;
  
  // Calling an outer model at the top-level deployment
  outer RadiationB2BCoupler radiationB2BCoupler;
  outer parameter Integer bodyIndexTemp "Body index used for the radiation force (to avoid instantiation issue with replaceable objects)" annotation(HideResult = true, Dialog(enable = false, tab = "Misc"));
  parameter Integer bodyIndex = bodyIndexTemp "Body index for radiation force"  annotation(HideResult = true, Dialog(enable = false, tab = "Misc")); 

 // Acceleration connectors
  Interfaces.RealVectorInput a_abs[3] "Translational acceleration vector" annotation(
    HideResult = true,
    Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Interfaces.RealVectorInput alpha_abs[3] "Angular acceleration vector" annotation(
    HideResult = true,
    Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
  Real aCoupledEx[nDoF-bodyDoF] "Reduced acceleration vector (with accelerations of all bodies except itself)";
protected
  
  Real acceleration[6] = cat(1, a_abs, alpha_abs) "Combined velocity vector";
  
equation
  // Assign acceleration values for the given body
  for i in 1:bodyDoF loop
    radiationB2BCoupler.aCoupled[bodyDoF*(bodyIndex - 1) + i] = acceleration[i];
  end for;
  
  // Build reduced acceleration vector (with accelerations of all bodies except itself)
  for j in 1:(nbodies-1) loop
    if j < bodyIndex then
      // Bodies before self
      aCoupledEx[bodyDoF*(j-1)+1:bodyDoF*j] = 
        radiationB2BCoupler.aCoupled[bodyDoF*(j-1)+1:bodyDoF*j];
    else
      // Bodies after self
      aCoupledEx[bodyDoF*(j-1)+1:bodyDoF*j] = 
        radiationB2BCoupler.aCoupled[bodyDoF*j+1:bodyDoF*(j+1)];
    end if;
  end for;

  // Force calculation using reduced coupling
  F = AinfEx * aCoupledEx;
  
    annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "B2B Added Mass Force")}),
    Diagram(coordinateSystem(extent = {{-120, 140}, {40, -20}})));

end AddedMassForceB2B;
