within OceanEngineeringToolbox.DataImport.ImportRecords.HydroImport;

partial class meanDriftData
"Partial class importing the mean drift force data"
  import Modelica.Utilities.Streams.readRealMatrix;
  import Modelica.Units.{SI, Conversions};
  import Modelica.Math;
  
  extends InputRecords.FilePath;
  extends InputRecords.BodyIndex;
  extends MultibodyImport.multibodyData;
  extends EnvironmentalImport.frequencyData;

protected
  parameter Real nH_read = scalar(readRealMatrix(file, "hydro.parameters.Nh", 1, 1)) "Number of headings";
  parameter Integer nH = integer(nH_read) "Number of wave headings";
  parameter Real thetaDeg[nH](each quantity="Angle", each unit="deg") = vector(readRealMatrix(file, "hydro.parameters.theta", 1, nH)) "Vector of wave headings present in the hydrodynamic coefficients (deg)";
  parameter SI.Angle theta[nH] = Conversions.from_deg(thetaDeg) "Vector of wave headings present in the hydrodynamic coefficients";
  parameter Real F_excMd2D[bodyDoF, nF*nH] = readRealMatrix(file, "hydro.coefficients.excitation.meanDrift.md" + bodyIndexString, bodyDoF, nF*nH) "Mean drift coefficients (2D)";
end meanDriftData;
