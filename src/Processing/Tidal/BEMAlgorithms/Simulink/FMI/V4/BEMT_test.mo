model BEMT_test
  FMUunsteadyBEMTs_me_FMU fMUunsteadyBEMTs_me_FMU annotation(
    Placement(transformation(origin = {0, 12}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Sources.Constant RPM(k = 5)  annotation(
    Placement(transformation(origin = {-70, 14}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(RPM.y, fMUunsteadyBEMTs_me_FMU.In1) annotation(
    Line(points = {{-58, 14}, {-10, 14}, {-10, 20}}, color = {0, 0, 127}));

annotation(
    uses(Modelica(version = "4.0.0")));
end BEMT_test;
