model inductionGenPorts


  // Importing from the MSL
  import Modelica.Units.SI;
  import Modelica.Constants.pi;

  // Grid parameters
  parameter SI.Frequency fe = 60 "Electrical frequency";
  parameter SI.AngularFrequency we = 2*pi*fe "Electrical angular velocity";
  parameter SI.Angle theta = 0;
  
  // Machine electrical parameters
  parameter SI.Inductance Lm = 0.111 "Mutual inductance (need to look look into further on magnetizing)";
  parameter SI.Inductance Ls = 0.1152 "Stator leakage inductance (look up)";
  parameter SI.Inductance Lr = 0.1152 "Rotor leakage inductance (look up)";
  
  parameter SI.Resistance Rs = 0.729 "Stator resistance";
  parameter SI.Resistance Rr = 0.4 "Rotor resistance";
  
  parameter Integer Np = 2 "Number of poles";
  
  // Machine mechanical parameters
  parameter SI.Inertia J = 45 "Rotor inertia";
  parameter SI.RotationalDampingConstant b = 15 "Winding damping (not currently used)";
  
  // Space phasors
  SI.Angle thetae = we*time "Electrical angular position";

  SI.Voltage Va = plug_sp.pin[1].v - plug_sn.pin[1].v "Phase a voltage (confirm)";
  SI.Voltage Vb = plug_sp.pin[2].v - plug_sn.pin[2].v "Phase b voltage (confirm)";
  SI.Voltage Vc = plug_sp.pin[3].v - plug_sn.pin[3].v "Phase c voltage (confirm)";
  
  // Clarke transform
  SI.Voltage Valpha = 2/3*(Va - 0.5*Vb - 0.5*Vc) "Stationary alpha voltage";
  SI.Voltage Vbeta  = 2/3*(sqrt(3)/2*Vb - sqrt(3)/2*Vc) "Stationary beta voltage";
  // Zero sequence component omitted
  
  // Inverse Clarke transform
  SI.Current ia = ialpha "Phase a current (confirm)";
  SI.Current ib = -0.5*ialpha + sqrt(3)/2*ibeta "Phase b current (confirm)";
  SI.Current ic = -0.5*ialpha - sqrt(3)/2*ibeta "Phase c current (confirm)";
  
  // Park transform
  SI.Voltage Vds = Valpha*cos(thetae) + Vbeta*sin(thetae) "Stator direct axis voltage";
  SI.Voltage Vqs = -Valpha*sin(thetae) + Vbeta*cos(thetae) "Stator quadature axis voltage";
  SI.Voltage Vqr = 0 "Rotor quadature axis voltage (0 in squirrel cage)";
  SI.Voltage Vdr = 0 "Rotor direct axis voltage (0 in squirrel cage)";
  
  // Inverse Park transform
  SI.Current ialpha = ids*cos(thetae) - iqs*sin(thetae) "Stationary alpha current";
  SI.Current ibeta  = ids*sin(thetae) + iqs*cos(thetae) "Stationary beta current";
  
  // Flux linkages
  SI.MagneticFlux lambqs = (Ls + Lm) * iqs + Lm*iqr "Stator quadature axis flux linkage";
  SI.MagneticFlux lambds = (Ls + Lm) * ids + Lm*idr "Stator direct axis flux linkage";
  SI.MagneticFlux lambqr = (Lr + Lm) * iqr + Lm*iqs "Rotor quadature axis flux linkage";
  SI.MagneticFlux lambdr = (Lr + Lm) * idr + Lm*ids "Rotor direct axis flux linkage";
 
  // Currents
  SI.Current iqs "Stator direct axis voltage";
  SI.Current ids "Stator quadature axis voltage";
  SI.Current iqr "Rotor quadature axis voltage";
  SI.Current idr "Rotor direct axis voltage";
  
  // Misc
  SI.Torque Tm "Mechanical/load torque";
  SI.AngularVelocity wr = Np*wm/2 "Rotor electrical angular velocity";
  SI.AngularVelocity wm "Angular velocity of the shaft";
  
  SI.Torque Te = 3*Np/4 * (lambds*iqs - lambqs*ids) "Electric torque";
  
  SI.Power Pe = 3/2 * (Vds*ids + Vqs*iqs) "Electric/output power";
  
  SI.Angle phi "Angular position of the shaft";
  
  // Ports 
  parameter Integer m = 3;
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange "Shaft"
    annotation (Placement(transformation(extent={{90,-10},{110,10}})));
    
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug plug_sp(final m=m)
    "Positive stator plug" annotation (Placement(transformation(extent={{50,
            90},{70,110}})));
  Modelica.Electrical.Polyphase.Interfaces.NegativePlug plug_sn(final m=m)
    "Negative stator plug" annotation (Placement(transformation(extent={{-70,
            90},{-50,110}})));
  
  
equation
  // Voltage state equations
  Vds = Rs*ids - we*lambqs + der(lambds);
  Vqs = Rs*iqs + we*lambds + der(lambqs);
  
  Vdr = Rr*idr - (we-wr)*lambqr + der(lambdr);
  Vqr = Rr*iqr + (we-wr)*lambdr + der(lambqr);

  // Newton's second law
  Te = Tm + J*der(wm);
  
  flange.phi = phi;
  flange.tau = -Tm;
  der(phi) = wm;
  
  // ABC currents to positive port
  plug_sp.pin[1].i = ia;
  plug_sp.pin[2].i = ib;
  plug_sp.pin[3].i = ic;

  // ABC currents to negative port
  plug_sn.pin[1].i = -ia;
  plug_sn.pin[2].i = -ib;
  plug_sn.pin[3].i = -ic;

annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 1e-05));
end inductionGenPorts;
