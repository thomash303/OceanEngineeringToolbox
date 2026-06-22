within OceanEngineeringToolbox.DataImport.ImportRecords.HydroImport;

partial class radiationNoB2BData
"Partial class importing the radiation force data (without B2B interactions)"
  import Modelica.Utilities.Streams.{readMatrixSize, readRealMatrix};  

  extends InputRecords.FilePath;
  extends InputRecords.BodyIndex;
  extends MultibodyImport.multibodyData;
protected
  parameter Integer n_state[2] = readMatrixSize(file, "hydro.coefficients.radiation.stateSpace.noB2B.A" + bodyIndexString) "Number of states";
  parameter Real A[n_state[1], n_state[1]] = readRealMatrix(file, "hydro.coefficients.radiation.stateSpace.noB2B.A" + bodyIndexString, n_state[1], n_state[1]) "State matrix";
  parameter Real B[n_state[1], bodyDoF] = readRealMatrix(file, "hydro.coefficients.radiation.stateSpace.noB2B.B" + bodyIndexString, n_state[1], bodyDoF) "Input matrix";
  parameter Real C[bodyDoF, n_state[1]] = readRealMatrix(file, "hydro.coefficients.radiation.stateSpace.noB2B.C" + bodyIndexString, bodyDoF, n_state[1]) "Output matrix";
  parameter Real D[bodyDoF, bodyDoF] = readRealMatrix(file, "hydro.coefficients.radiation.stateSpace.noB2B.D" + bodyIndexString, bodyDoF, bodyDoF) "Feedforward matrix";
end radiationNoB2BData;
