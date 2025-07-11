within OceanEngineeringToolbox.DataImport.ImportRecords.HydroImport;

partial class radiationB2BData
  "Partial class importing the radiation force data (with B2B interactions)"
  
import Modelica.Utilities.Streams.{readMatrixSize, readRealMatrix};  

  extends InputRecords.FilePath;
  extends InputRecords.BodyIndex;
  extends MultibodyImport.multibodyData;
protected
  parameter Integer n_state[2] = readMatrixSize(fileDir, "hydro.coefficients.radiation.stateSpace.B2B.A" + bodyIndexString) "Number of states";
  parameter Real A[n_state[1], n_state[1]] = readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.B2B.A" + bodyIndexString, n_state[1], n_state[1]) "State matrix";
  parameter Real B[n_state[1], bodyDoF*nbodies] = readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.B2B.B" + bodyIndexString, n_state[1], bodyDoF*nbodies) "Input matrix";
  parameter Real C[bodyDoF, n_state[1]] = readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.B2B.C" + bodyIndexString, bodyDoF, n_state[1]) "Output matrix";
  parameter Real D[bodyDoF, bodyDoF*nbodies] = readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.B2B.D" + bodyIndexString, bodyDoF, bodyDoF*nbodies) "Feedforward matrix";
end radiationB2BData;
