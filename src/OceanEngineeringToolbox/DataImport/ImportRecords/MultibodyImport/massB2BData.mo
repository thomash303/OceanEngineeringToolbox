within OceanEngineeringToolbox.DataImport.ImportRecords.MultibodyImport;

partial class massB2BData
  "Partial class importing the mass data (with B2B interactions)"
  
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Utilities.Streams.readRealMatrix;
  
  // Extending and inheriting from the OET
  extends InputRecords.FilePath;
  extends InputRecords.BodyIndex;
  extends multibodyData;
  
  parameter SI.Mass M[1, 1] = readRealMatrix(fileDir, "hydro.bodies.m" + bodyIndexString, 1, 1) "Total mass of the body";
protected
  parameter SI.Mass Ainf[bodyDoF, nDoF] = readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.B2B.Ainf" + bodyIndexString, bodyDoF, bodyDoF) "Added mass at maximum (cut-off) frequency";
  parameter SI.Mass m[3, 3] = diagonal({M[1, 1], M[1, 1], M[1, 1]}) "Mass matrix of the body (including ballast)";  
  parameter SI.Mass Ainf11[3, 3*nbodies] = massB2BExctraction(quadrant = 1, nbodies = 2, Ainf_full = Ainf) "Upper left block";
  parameter SI.Mass Ainf12[3, 3*nbodies] = massB2BExctraction(quadrant = 2, nbodies = 2, Ainf_full = Ainf) "Upper right block";
  parameter SI.Mass Ainf21[3, 3*nbodies] = massB2BExctraction(quadrant = 3, nbodies = 2, Ainf_full = Ainf) "Lower left block";
  parameter SI.Mass Ainf22[3, 3*nbodies] = massB2BExctraction(quadrant = 4, nbodies = 2, Ainf_full = Ainf) "Lower right block";

  
end massB2BData;
