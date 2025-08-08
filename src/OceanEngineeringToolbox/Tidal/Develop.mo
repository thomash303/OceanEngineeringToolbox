within OceanEngineeringToolbox.Tidal;

package Develop
   
model airfoilImport
    import Modelica.Blocks.Tables;
    import Modelica.Blocks.Sources;
    Tables.CombiTable1Ds combiTable1Ds(tableOnFile = true, fileName = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/src/Processing/Tidal/Preprocess/NACA_63415_AIRFOIL_Mach0_Re1e06_Ncrit5.0.mat", tableName = "data", verboseExtrapolation = true, columns = 2:7) annotation(
      Placement(transformation(origin = {2, 18}, extent = {{-10, -10}, {10, 10}})));
    Sources.Sine sine(amplitude = 1, f = 0.1) annotation(
      Placement(transformation(origin = {-66, 18}, extent = {{-10, -10}, {10, 10}})));
    Real alpha = -9;
    Real CL = combiTable1Ds.y[1];
    Real CD = combiTable1Ds.y[2];
    Real CDp = combiTable1Ds.y[3];
    Real CM = combiTable1Ds.y[4];
    Real Top_Xtr = combiTable1Ds.y[5];
    Real Bot_Xtr = combiTable1Ds.y[6];
  equation
    connect(sine.y, combiTable1Ds.u) annotation(
      Line(points = {{-55, 18}, {-10, 18}}, color = {0, 0, 127}));
    annotation(
      uses(Modelica(version = "4.0.0"), OceanEngineeringToolbox(version = "v0.3")));
  end airfoilImport;

  model currentModel
  //Real z "depth"
  equation

  end currentModel;

  model turbine
    
    import Modelica.Mechanics.MultiBody.{World, Parts, Joints, Visualizers};
    import Modelica.Mechanics.Rotational.Components;
    import Modelica.Electrical.Machines.BasicMachines.SynchronousMachines;
  
  Parts.BodyShape platform annotation(
      Placement(transformation(origin = {-22, -36}, extent = {{-10, -10}, {10, 10}})));
  inner World world annotation(
      Placement(transformation(origin = {-122, 88}, extent = {{-10, -10}, {10, 10}})));
  Parts.FixedRotation yawTilt annotation(
      Placement(transformation(origin = {12, -34}, extent = {{-10, -10}, {10, 10}})));
  Parts.BodyShape tower annotation(
      Placement(transformation(origin = {12, 6}, extent = {{-10, -10}, {10, 10}})));
  Parts.FixedRotation wing annotation(
      Placement(transformation(origin = {-24, 6}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Parts.BodyShape nacelle annotation(
      Placement(transformation(origin = {-62, 40}, extent = {{-10, -10}, {10, 10}})));
  Components.Gearbox gearbox annotation(
      Placement(transformation(origin = {84, 62}, extent = {{-10, -10}, {10, 10}})));
  SynchronousMachines.SM_PermanentMagnet smpm annotation(
      Placement(transformation(origin = {118, 62}, extent = {{10, -10}, {-10, 10}})));
  Joints.Revolute revolute(useAxisFlange = true)  annotation(
      Placement(transformation(origin = {4, 40}, extent = {{-10, -10}, {10, 10}})));
  Parts.BodyShape hub annotation(
      Placement(transformation(origin = {28, 92}, extent = {{-10, -10}, {10, 10}})));
  Parts.FixedRotation cone annotation(
      Placement(transformation(origin = {-28, 40}, extent = {{-10, -10}, {10, 10}})));
  Parts.FixedRotation bladeAng1 annotation(
      Placement(transformation(origin = {-12, 120}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Parts.FixedRotation bladeAng2 annotation(
      Placement(transformation(origin = {-8, 94}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Parts.FixedRotation bladeAng3 annotation(
      Placement(transformation(origin = {-16, 68}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Parts.Body blade1 annotation(
      Placement(transformation(origin = {-56, 118}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Parts.Body blade2 annotation(
      Placement(transformation(origin = {-54, 94}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Parts.Body blade3 annotation(
      Placement(transformation(origin = {-54, 68}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Visualizers.FixedShape fixedShape annotation(
      Placement(transformation(origin = {-36, 134}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape1 annotation(
      Placement(transformation(origin = {-76, 92}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape2 annotation(
      Placement(transformation(origin = {-82, 70}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape3 annotation(
      Placement(transformation(origin = {-92, 40}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape4 annotation(
      Placement(transformation(origin = {46, 24}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape5 annotation(
      Placement(transformation(origin = {-56, -24}, extent = {{-10, -10}, {10, 10}})));
  equation
  connect(platform.frame_b, yawTilt.frame_a) annotation(
      Line(points = {{-12, -36}, {2, -36}, {2, -34}}, color = {95, 95, 95}));
  connect(yawTilt.frame_b, tower.frame_b) annotation(
      Line(points = {{22, -34}, {54, -34}, {54, 6}, {22, 6}}, color = {95, 95, 95}));
  connect(tower.frame_a, wing.frame_a) annotation(
      Line(points = {{2, 6}, {-14, 6}}, color = {95, 95, 95}));
  connect(wing.frame_b, nacelle.frame_a) annotation(
      Line(points = {{-34, 6}, {-72, 6}, {-72, 40}}, color = {95, 95, 95}));
  connect(smpm.flange, gearbox.flange_b) annotation(
      Line(points = {{108, 62}, {94, 62}}));
  connect(revolute.frame_b, hub.frame_b) annotation(
      Line(points = {{14, 40}, {38, 40}, {38, 92}}, color = {95, 95, 95}));
  connect(revolute.axis, gearbox.flange_a) annotation(
      Line(points = {{4, 50}, {74, 50}, {74, 62}}));
  connect(nacelle.frame_b, cone.frame_a) annotation(
      Line(points = {{-52, 40}, {-38, 40}}, color = {95, 95, 95}));
  connect(cone.frame_b, revolute.frame_a) annotation(
      Line(points = {{-18, 40}, {-6, 40}}, color = {95, 95, 95}));
  connect(hub.frame_a, bladeAng1.frame_a) annotation(
      Line(points = {{18, 92}, {16, 92}, {16, 120}, {-2, 120}}, color = {95, 95, 95}));
  connect(hub.frame_a, bladeAng2.frame_a) annotation(
      Line(points = {{18, 92}, {2, 92}, {2, 94}}, color = {95, 95, 95}));
  connect(hub.frame_a, bladeAng3.frame_a) annotation(
      Line(points = {{18, 92}, {18, 68}, {-6, 68}}, color = {95, 95, 95}));
  connect(blade1.frame_a, bladeAng1.frame_b) annotation(
      Line(points = {{-46, 118}, {-34, 118}, {-34, 120}, {-22, 120}}, color = {95, 95, 95}));
  connect(blade2.frame_a, bladeAng2.frame_b) annotation(
      Line(points = {{-44, 94}, {-18, 94}}, color = {95, 95, 95}));
  connect(blade3.frame_a, bladeAng3.frame_b) annotation(
      Line(points = {{-44, 68}, {-26, 68}}, color = {95, 95, 95}));
  connect(fixedShape.frame_a, blade1.frame_a) annotation(
      Line(points = {{-46, 134}, {-46, 118}}, color = {95, 95, 95}));
  connect(fixedShape1.frame_a, blade2.frame_a) annotation(
      Line(points = {{-86, 92}, {-44, 92}, {-44, 94}}, color = {95, 95, 95}));
  connect(fixedShape2.frame_a, blade3.frame_a) annotation(
      Line(points = {{-92, 70}, {-44, 70}, {-44, 68}}, color = {95, 95, 95}));
  connect(fixedShape3.frame_a, nacelle.frame_a) annotation(
      Line(points = {{-102, 40}, {-72, 40}}, color = {95, 95, 95}));
  connect(fixedShape4.frame_a, tower.frame_b) annotation(
      Line(points = {{36, 24}, {22, 24}, {22, 6}}, color = {95, 95, 95}));
  connect(fixedShape5.frame_a, platform.frame_a) annotation(
      Line(points = {{-66, -24}, {-32, -24}, {-32, -36}}, color = {95, 95, 95}));
  annotation(
      Diagram(coordinateSystem(extent = {{-140, 140}, {140, -60}})));
end turbine;
end Develop;
