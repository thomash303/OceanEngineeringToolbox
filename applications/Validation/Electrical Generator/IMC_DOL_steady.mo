model IMC_DOL_steady "Test example: InductionMachineSquirrelCage direct-on-line"
  extends Modelica.Icons.Example;
  constant Integer m = 3 "Number of phases";
  parameter Modelica.Units.SI.Voltage VNominal = 100 "Nominal RMS voltage per phase";
  parameter Modelica.Units.SI.Frequency fNominal = 50 "Nominal frequency";
  parameter Modelica.Units.SI.Time tStart1 = 0.1 "Start time";
  parameter Modelica.Units.SI.Torque TLoad = 161.4 "Nominal load torque";
  parameter Modelica.Units.SI.AngularVelocity wLoad(displayUnit = "rev/min") = 1440.45*2*Modelica.Constants.pi/60 "Nominal load speed";
  parameter Modelica.Units.SI.Inertia JLoad = 0.29 "Load's moment of inertia";
  Modelica.Electrical.Machines.BasicMachines.InductionMachines.IM_SquirrelCage aimc(p = aimcData.p, fsNominal = aimcData.fsNominal, Rs = aimcData.Rs, TsRef (displayUnit = "K")= 0, alpha20s(displayUnit = "1/K") = 0, Lszero = aimcData.Lszero, Lssigma = aimcData.Lssigma, Jr = aimcData.Jr, Js = aimcData.Js, frictionParameters (power_w = 0), phiMechanical(start = 0, fixed = false), wMechanical(start = 0, fixed = false), statorCoreParameters (VRef = 0), strayLoadParameters (IRef = 0, power_w = 0), Lm = aimcData.Lm, Lrsigma = aimcData.Lrsigma, Rr = aimcData.Rr, TrRef (displayUnit = "K")= 0, TsOperational = 293.15, alpha20r = 0, TrOperational = 293.15) annotation(
    Placement(transformation(extent = {{-20, -50}, {0, -30}})));
  Modelica.Electrical.Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor annotation(
    Placement(transformation(extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Modelica.Electrical.Polyphase.Sources.SineVoltage sineVoltage(final m = m, f = fill(fNominal, m), V = fill(sqrt(2/3)*VNominal, m)) annotation(
    Placement(transformation(origin = {0, 60}, extent = {{10, -10}, {-10, 10}}, rotation = 270)));
  Modelica.Electrical.Polyphase.Basic.Star star(final m = m) annotation(
    Placement(transformation(extent = {{-50, 80}, {-70, 100}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Blocks.Sources.BooleanStep booleanStep[m](each startTime = tStart1) annotation(
    Placement(transformation(extent = {{-80, 30}, {-60, 50}})));
  Modelica.Electrical.Polyphase.Ideal.IdealClosingSwitch idealCloser(final m = m, Ron = fill(1e-5, m), Goff = fill(1e-5, m)) annotation(
    Placement(transformation(origin = {0, 30}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox(terminalConnection = "D") annotation(
    Placement(transformation(extent = {{-20, -34}, {0, -14}})));
  parameter Modelica.Electrical.Machines.Utilities.ParameterRecords.IM_SquirrelCageData aimcData "Induction machine data" annotation(
    Placement(transformation(extent = {{-20, -80}, {0, -60}})));
  Modelica.Mechanics.Rotational.Sources.Speed speed(exact = true)  annotation(
    Placement(transformation(origin = {46, -38}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Modelica.Blocks.Sources.Ramp ramp(height = 1000*2*3.14/60, duration = 1)  annotation(
    Placement(transformation(origin = {98, -36}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
initial equation
  aimc.is = zeros(3);
  aimc.ir = zeros(2);
equation
  connect(star.pin_n, ground.p) annotation(
    Line(points = {{-70, 90}, {-80, 90}}, color = {0, 0, 255}));
  connect(sineVoltage.plug_n, star.plug_p) annotation(
    Line(points = {{0, 70}, {0, 90}, {-50, 90}}, color = {0, 0, 255}));
  connect(sineVoltage.plug_p, idealCloser.plug_p) annotation(
    Line(points = {{0, 50}, {0, 48}, {0, 46}, {0, 40}}, color = {0, 0, 255}));
  connect(booleanStep.y, idealCloser.control) annotation(
    Line(points = {{-59, 40}, {-20, 40}, {-20, 30}, {-12, 30}}, color = {255, 0, 255}));
  connect(idealCloser.plug_n, currentQuasiRMSSensor.plug_p) annotation(
    Line(points = {{0, 20}, {0, 17}, {0, 10}}, color = {0, 0, 255}));
  connect(terminalBox.plug_sn, aimc.plug_sn) annotation(
    Line(points = {{-16, -30}, {-16, -30}}, color = {0, 0, 255}));
  connect(terminalBox.plug_sp, aimc.plug_sp) annotation(
    Line(points = {{-4, -30}, {-4, -30}}, color = {0, 0, 255}));
  connect(terminalBox.plugSupply, currentQuasiRMSSensor.plug_n) annotation(
    Line(points = {{-10, -28}, {-10, -20}, {0, -20}, {0, -10}}, color = {0, 0, 255}));
  connect(speed.flange, aimc.flange) annotation(
    Line(points = {{36, -38}, {-2, -38}, {-2, -40}, {0, -40}}));
  connect(ramp.y, speed.w_ref) annotation(
    Line(points = {{88, -36}, {73, -36}, {73, -38}, {58, -38}}, color = {0, 0, 127}));
  annotation(
    experiment(StopTime = 1.5, Interval = 1E-4, Tolerance = 1e-06),
    Documentation(info = "<html>
<p>At start time tStart three-phase voltage is supplied to the induction machine with squirrel cage;
the machine starts from standstill, accelerating inertias against load torque quadratic dependent on speed,
finally reaching nominal speed.</p>

<p>Simulate for 1.5 seconds and plot (versus time):</p>
<ul>
<li>currentQuasiRMSSensor.I: stator current RMS</li>
<li>aimc.wMechanical: motor's speed</li>
<li>aimc.tauElectrical: motor's torque</li>
</ul>
<p>Default machine parameters are used.</p>
</html>"),
  uses(Modelica(version = "4.0.0")));
end IMC_DOL_steady;
