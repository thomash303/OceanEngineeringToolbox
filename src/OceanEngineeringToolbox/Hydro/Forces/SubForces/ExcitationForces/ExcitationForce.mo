within OceanEngineeringToolbox.Hydro.Forces.SubForces.ExcitationForces;

model ExcitationForce
  "Model representing the excitation force"
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Constants.{pi, g_n};
  import Modelica.Math.Vectors.find;
  
  import Modelica.Mechanics.MultiBody.Frames.resolve2;

  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.InputRecords.BodyIndex;
  extends DataImport.ImportRecords.HydroImport.excitationData;
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
 
 Real F_int[6];
protected
  
  parameter Real ExcCoeffRe[waveHeadingSpreadBins, bodyDoF, n_omega](each start=0, each fixed=false) "Real component of excitation coefficient for frequency components" annotation(HideResult = true);
  parameter Real ExcCoeffIm[waveHeadingSpreadBins, bodyDoF, n_omega](each start=0, each fixed=false) "Imaginary component of excitation coefficient for frequency components" annotation(HideResult = true);
  
initial equation
 // Interpolate excitation coefficients (Re & Im) for each frequency component and for each DoF
 (ExcCoeffRe, ExcCoeffIm) = ExcitationFunctions.interpolateExcitationCoeffs(w = w, F_excRe2D = F_excRe2D, F_excIm2D = F_excIm2D, nH = nH, nF = nF, omega = omega, bodyDoF = bodyDoF, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins, spreadBinCentres = spreadBinCentres, theta = theta);
equation

  F_int = {sum(ramp * sum((ExcCoeffRe[j, i, :] .* zeta[j, :] .* cos(omega*time + phi[j,:])
      - ExcCoeffIm[j, i, :] .* zeta[j, :] .* sin(omega*time + phi[j, :]))
      ) for j in 1:waveHeadingSpreadBins
      ) for i in 1:bodyDoF}; 
      
      
  F[4:6] = resolve2(frame_a.R,F_int[4:6]);
  F[1:3] = resolve2(frame_a.R,F_int[1:3]);
  //F = F_int;
  
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Excitation Force")}),
    Diagram(coordinateSystem(extent = {{-120, 20}, {-80, -20}})));
end ExcitationForce;
