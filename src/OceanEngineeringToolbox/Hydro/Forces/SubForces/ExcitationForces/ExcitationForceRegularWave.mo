within OceanEngineeringToolbox.Hydro.Forces.SubForces.ExcitationForces;

model ExcitationForceRegularWave
  "Model representing the excitation force arising from a regular wave"
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
  constant Integer n_omega = 1 "Number of frequency components";
  parameter SI.AngularFrequency omegaPeak "Peak spectral frequency" annotation(HideResult = true,
    Dialog(group = "Wave Spectrum Parameters"));
  parameter SI.Height A "Wave amplitude" annotation(
    HideResult = true);
  parameter SI.Time Trmp "Interval for ramping up of waves during start phase [s]" annotation(HideResult = true, Dialog(group = "Simulation Parameters"));
  Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector [N,Nm]";
  Real ramp "Ramping function" annotation(
    HideResult = true);
  
  // Wave Heading Parameters
  parameter SI.Angle waveHeading "Wave heading";
  parameter Integer waveHeadingSpreadBins "Number of discrete headings centered around the mean heading to consider in the spectrum spread";

protected
  SI.Force f_element[3] annotation(HideResult = true);
  SI.Torque t_element[3] annotation(HideResult = true);
  parameter Real ExcCoeffRe[waveHeadingSpreadBins,bodyDoF,n_omega](each start=0, each fixed=false) "Real component of excitation coefficient" annotation(
   HideResult = true);
  parameter Real ExcCoeffIm[waveHeadingSpreadBins,bodyDoF,n_omega](each start=0, each fixed=false) "Imaginary component of excitation coefficient" annotation(
    HideResult = true);
  

initial equation
 // Interpolate excitation coefficients (Re & Im) for each frequency component and for each DoF
 (ExcCoeffRe, ExcCoeffIm) = ExcitationFunctions.interpolateExcitationCoeffs(w = w, F_excRe2D = F_excRe2D, F_excIm2D = F_excIm2D, nH = nH, nF = nF[1], omega = vector(omegaPeak), bodyDoF = bodyDoF, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins, spreadBinCentres = vector(waveHeading), theta = theta); 
   
equation  

  // Calculate excitation force vectors
  // This is a bug, for some reason I have to multiply by ramp at front and end
  F = ExcitationFunctions.computeExcitationForce(ExcCoeffRe = ExcCoeffRe, ExcCoeffIm = ExcCoeffIm, A = A, omegaTime = vector(omegaPeak*time), ramp = ramp, bodyDoF = bodyDoF, n_omega = n_omega, waveHeadingSpreadBins = waveHeadingSpreadBins);

  frame_a.f = -f_element;
  frame_a.t = -t_element;

  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Regular Wave")}),
    Diagram(coordinateSystem(extent = {{-120, 20}, {-40, -60}})));

end ExcitationForceRegularWave;
