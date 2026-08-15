model inductionGenCirc_steady_load
  import Modelica.Units.SI;
  import Modelica.Constants.pi;

  constant Integer m = 3 "Number of phases";
  parameter SI.Voltage VNominal = 100 "Nominal RMS voltage per phase";
  parameter SI.Frequency fNominal = 50 "Nominal frequency";
  parameter SI.Time tStart1 = 0.1 "Start time";
  parameter SI.Torque TLoad = 161.4 "Nominal load torque";
  parameter SI.AngularVelocity wLoad(displayUnit = "rev/min") = 1440.45*2*Modelica.Constants.pi/60 "Nominal load speed";
  parameter SI.Inertia JLoad = 0.29 "Load's moment of inertia";
  parameter SI.Frequency fe = 50;


  inductionGenPorts inductionGenPorts1(fe = fe, Rs = 0.03, Rr = 0.04, J = 0.29, b = 0.1, Np = 4, Ls = 3*(1 - sqrt(1 - 0.0667))/(2*pi*fe), Lr = 3*(1 - sqrt(1 - 0.0667))/(2*pi*fe), Lm = 3*sqrt(1 - 0.0667)/(2*pi*fe))  annotation(
    Placement(transformation(origin = {2, -6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Electrical.Machines.Sensors.CurrentQuasiRMSSensor currentQuasiRMSSensor annotation(
    Placement(transformation(origin = {0, 28},extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Modelica.Electrical.Polyphase.Sources.SineVoltage sineVoltage(V = fill(sqrt(2/3)*VNominal, m), f = fill(fNominal, m), final m = m) annotation(
    Placement(transformation(origin = {0, 88}, extent = {{10, -10}, {-10, 10}}, rotation = 270)));
  Modelica.Electrical.Polyphase.Basic.Star star(final m = m) annotation(
    Placement(transformation(origin = {0, 28}, extent = {{-50, 80}, {-70, 100}})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation(
    Placement(transformation(origin = {-90, 118}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Blocks.Sources.BooleanStep booleanStep[m](each startTime = tStart1) annotation(
    Placement(transformation(origin = {0, 28}, extent = {{-80, 30}, {-60, 50}})));
  Modelica.Electrical.Polyphase.Ideal.IdealClosingSwitch idealCloser(Goff = fill(1e-5, m), Ron = fill(1e-5, m), final m = m) annotation(
    Placement(transformation(origin = {0, 58}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Modelica.Electrical.Machines.Utilities.TerminalBox terminalBox(terminalConnection = "D")  annotation(
    Placement(transformation(origin = {2, 14}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Inertia loadInertia(J = 0.5) annotation(
    Placement(transformation(origin = {-8, 64}, extent = {{40, -50}, {60, -30}})));
  Modelica.Mechanics.Rotational.Components.Fixed fixed annotation(
    Placement(transformation(origin = {48, -36}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 10) annotation(
    Placement(transformation(origin = {34, -32}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(ground.p, star.pin_n) annotation(
    Line(points = {{-80, 118}, {-70, 118}}, color = {0, 0, 255}));
  connect(star.plug_p, sineVoltage.plug_n) annotation(
    Line(points = {{-50, 118}, {0, 118}, {0, 98}}, color = {0, 0, 255}));
  connect(sineVoltage.plug_p, idealCloser.plug_p) annotation(
    Line(points = {{0, 78}, {0, 68}}, color = {0, 0, 255}));
  connect(idealCloser.plug_n, currentQuasiRMSSensor.plug_p) annotation(
    Line(points = {{0, 48}, {0, 38}}, color = {0, 0, 255}));
  connect(terminalBox.plug_sn, inductionGenPorts1.plug_sn) annotation(
    Line(points = {{-4, 8}, {-4, 4}}, color = {0, 0, 255}));
  connect(terminalBox.plug_sp, inductionGenPorts1.plug_sp) annotation(
    Line(points = {{8, 8}, {8, 4}}, color = {0, 0, 255}));
  connect(terminalBox.plugSupply, currentQuasiRMSSensor.plug_n) annotation(
    Line(points = {{2, 10}, {0, 10}, {0, 18}}, color = {0, 0, 255}));
  connect(booleanStep.y, idealCloser.control) annotation(
    Line(points = {{-58, 68}, {-40, 68}, {-40, 58}, {-12, 58}}, color = {255, 0, 255}));
  connect(inductionGenPorts1.flange, loadInertia.flange_a) annotation(
    Line(points = {{12, -6}, {28, -6}, {28, 24}, {32, 24}}));
  connect(fixed.flange, damper.flange_b) annotation(
    Line(points = {{48, -36}, {44, -36}, {44, -32}}));
  connect(damper.flange_a, inductionGenPorts1.flange) annotation(
    Line(points = {{24, -32}, {12, -32}, {12, -6}}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, 140}, {60, -60}})),
    version = "",
    uses(Modelica(version = "4.0.0")),
  experiment(StartTime = 0, StopTime = 1.5, Tolerance = 1e-06, Interval = 0.0001));
end inductionGenCirc_steady_load;
