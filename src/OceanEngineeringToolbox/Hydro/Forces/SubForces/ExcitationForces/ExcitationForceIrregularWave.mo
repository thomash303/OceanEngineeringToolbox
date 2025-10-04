within OceanEngineeringToolbox.Hydro.Forces.SubForces.ExcitationForces;

model ExcitationForceIrregularWave
  "Model representing the excitation force arising from an irregular wave"
  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Mechanics.MultiBody.Interfaces.Frame_a;
  import Modelica.Constants.{pi, g_n};
  import Modelica.Math.Vectors.find;

  // Extending and inheriting from the OET
  extends DataImport.InputRecords.FilePath;
  extends DataImport.InputRecords.BodyIndex;
  extends DataImport.ImportRecords.HydroImport.excitationData;
  extends DataImport.ImportRecords.EnvironmentalImport.physicalConstantData;
  
  // Frame_a connector
  Frame_a frame_a "Coordinate system fixed at body" annotation(
    HideResult = true,
    Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
  // Parameters to call
  parameter Integer n_omega "Number of frequency components (default is 100 for irregular)" annotation(HideResult = true, Dialog(group = "Simulation Parameters"));
  parameter SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation" annotation(HideResult = true);
  parameter SI.Height zeta[n_omega] "Wave amplitude component" annotation(HideResult = true);
  parameter SI.Angle phi[n_omega] "Wave components phase shift" annotation(HideResult = true);
  parameter SI.Time Trmp "Interval for ramping up of waves during start phase" annotation(HideResult = true,
    Dialog(group = "Simulation Parameters"));
  Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector";
  Real ramp "Ramping function" annotation(HideResult = true);
  parameter Real waveHeading(quantity="Angle", unit="deg") "Wave heading";
protected
  SI.Force f_element[3] annotation(HideResult = true);
  SI.Torque t_element[3] annotation(HideResult = true);
  
  parameter Real ExcCoeffRe[bodyDoF, n_omega](each start=0, each fixed=false) "Real component of excitation coefficient for frequency components" annotation(HideResult = true);
  parameter Real ExcCoeffIm[bodyDoF, n_omega](each start=0, each fixed=false) "Imaginary component of excitation coefficient for frequency components" annotation(HideResult = true);
  
  // Wave heading
  Integer waveHeadingIndex = find(waveHeading,theta) "Index in the excitation coefficients for the desired wave heading";
  
initial equation
 // Interpolate excitation coefficients (Re & Im) for each frequency component and for each DoF
 (ExcCoeffRe, ExcCoeffIm) = ExcitationFunctions.interpolateExcitationCoeffs(w, F_excRe2D, F_excIm2D, waveHeadingIndex, nH, nF[1], omega, bodyDoF, n_omega); 
  
equation
  // Asserts
  assert(waveHeadingIndex <> 0, "Prescribed wave heading is not present in the hydrodynamic coefficients", level = AssertionLevel.error);

  // Calculate excitation force vectors
    F = ExcitationFunctions.computeExcitationForce(ExcCoeffRe = ExcCoeffRe, ExcCoeffIm = ExcCoeffIm, zeta = zeta, phi = phi, omegaTime = omega*time, ramp = ramp, bodyDoF = bodyDoF, n_omega = n_omega);

// Assign excitation force to output
  frame_a.f = -f_element;
  frame_a.t = -t_element;
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Irregular Wave")}),
    Diagram);

end ExcitationForceIrregularWave;
