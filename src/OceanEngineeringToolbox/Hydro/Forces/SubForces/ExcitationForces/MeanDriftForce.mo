within OceanEngineeringToolbox.Hydro.Forces.SubForces.ExcitationForces;

model MeanDriftForce
  "Model representing the mean drift force"
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Constants.{pi, g_n};
  import Modelica.Math.Vectors.find;

  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.InputRecords.BodyIndex;
  extends DataImport.ImportRecords.HydroImport.meanDriftData;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  extends BaseHydroForce(redeclare Real F[6] = cat(1, -f_element, -t_element));
  
  // Parameters to call
  parameter Integer n_omega "Number of frequency components (default is 100 for irregular)" annotation(HideResult = true, Dialog(group = "Simulation Parameters"));
  parameter SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation" annotation(HideResult = true);
  parameter SI.Height zeta[waveHeadingSpreadBins, n_omega] "Wave amplitude component" annotation(HideResult = true);
  parameter SI.Angle phi[waveHeadingSpreadBins, n_omega] "Wave components phase shift" annotation(HideResult = true);
  parameter SI.Time Trmp "Interval for ramping up of waves during start phase" annotation(HideResult = true,
    Dialog(group = "Simulation Parameters"));
  Real ramp "Ramping function" annotation(HideResult = true);
  
  // Wave Heading Parameters
  parameter SI.Angle waveHeading "Wave heading";
  parameter Integer waveHeadingSpreadBins = 2 "Number of discrete headings centered around the mean heading to consider in the spectrum spread";  
  parameter SI.Angle spreadBinCentres[waveHeadingSpreadBins] "Bin centres";

protected
  
  parameter Real ExcCoeffMd[waveHeadingSpreadBins, bodyDoF, n_omega](each start=0, each fixed=false) = ExcitationFunctions.interpolateMeanDriftCoeffs(w = w, F_excMd2D = F_excMd2D, nH = nH, nF = nF, omega = omega, bodyDoF = bodyDoF, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins, spreadBinCentres = spreadBinCentres, theta = theta) "Mean drift coefficients for frequency components" annotation(HideResult = true);
  parameter SI.Force Fmd[6](each fixed=false) "Mean drift force (no ramp)" annotation(HideResult = true);
  
initial equation
 
   Fmd = {sum(sum((ExcCoeffMd[j, i, :] .* zeta[j, :].^2)
      ) for j in 1:waveHeadingSpreadBins
      ) for i in 1:bodyDoF}; 
      
equation

  F = ramp * Fmd; 
  //F = zeros(6);
  
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Mean Drift Force")}),
    Diagram(coordinateSystem(extent = {{-120, 20}, {-80, -20}})));

end MeanDriftForce;
