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
  Visualizers.FixedShape fixedShape1 annotation(
      Placement(transformation(origin = {-76, 92}, extent = {{-10, -10}, {10, 10}})));
  Visualizers.FixedShape fixedShape2 annotation(
      Placement(transformation(origin = {-82, 70}, extent = {{-10, -10}, {10, 10}})));
  Visualizers.FixedShape fixedShape3 annotation(
      Placement(transformation(origin = {-92, 40}, extent = {{-10, -10}, {10, 10}})));
  Visualizers.FixedShape fixedShape4 annotation(
      Placement(transformation(origin = {46, 24}, extent = {{-10, -10}, {10, 10}})));
  Mooring.LinearMooring.linearMooring linearMooring1 annotation(
      Placement(transformation(origin = {-68, -48}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Hydro.HydrodynamicBody platform annotation(
      Placement(transformation(origin = {-26, -36}, extent = {{-10, -10}, {10, 10}})));
  equation
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
  connect(linearMooring1.frame_a, platform.frame_a) annotation(
      Line(points = {{-58, -48}, {-36, -48}, {-36, -36}}, color = {95, 95, 95}));
  connect(platform.frame_b, yawTilt.frame_a) annotation(
      Line(points = {{-16, -36}, {2, -36}, {2, -34}}, color = {95, 95, 95}));
    annotation(
      Diagram(coordinateSystem(extent = {{-140, 140}, {140, -60}})));
  end turbine;

  model animation
  
    import Modelica.Mechanics.MultiBody.{World, Parts, Joints, Visualizers, Forces};
    import Modelica.Blocks.Sources;
    import Modelica.Mechanics.Rotational;
    import Modelica.Electrical.Machines.BasicMachines.SynchronousMachines;
      
    inner World world(axisLength = 10)  annotation(
        Placement(transformation(origin = {-78, 72}, extent = {{-10, -10}, {10, 10}})));
    Parts.Body tower(r_CM = {0, 0, 0}, m = 100)  annotation(
        Placement(transformation(origin = {14, 38}, extent = {{-10, -10}, {10, 10}})));
      Parts.Body rotor(m = 15)  annotation(
        Placement(transformation(origin = {58, -64}, extent = {{-10, -10}, {10, 10}})));
    Visualizers.FixedShape tower3D(shapeType = "file://C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/Tidal/CAD/Turbine_Tower_Simplified.stl", color = {255, 255, 0}, length = 1, width = 1, height = 1)  annotation(
        Placement(transformation(origin = {-26, 44}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
    Visualizers.FixedShape rotor3D(shapeType = "file://C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/applications/Validation/Tidal/CAD/Rotor_Nose_Simplified.stl", length = 1, width = 1, height = 1, animation = true)  annotation(
      Placement(transformation(origin = {-24, -32}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
    Joints.Revolute revolute(useAxisFlange = false, n = {1, 0, 0})  annotation(
      Placement(transformation(origin = {-54, -20}, extent = {{-10, -10}, {10, 10}})));
    Parts.FixedTranslation fixedTranslation(r = {-725, -2254.55+ 175, -175}, animation = false)  annotation(
      Placement(transformation(origin = {66, -32}, extent = {{-10, -10}, {10, 10}})));
    Sources.Constant const(k = 1)  annotation(
      Placement(transformation(origin = {-180, -10}, extent = {{-10, -10}, {10, 10}})));
  Forces.WorldTorque torque annotation(
      Placement(transformation(origin = {-30, -68}, extent = {{-10, -10}, {10, 10}})));
  equation
  torque.torque[2] = 0;
  torque.torque[3] = 0;
    connect(tower3D.frame_a, tower.frame_a) annotation(
      Line(points = {{-16, 44}, {4, 44}, {4, 38}}, color = {95, 95, 95}));
    connect(revolute.frame_b, tower.frame_a) annotation(
      Line(points = {{-44, -20}, {-44, 21}, {4, 21}, {4, 38}}, color = {95, 95, 95}));
    connect(fixedTranslation.frame_b, rotor.frame_a) annotation(
      Line(points = {{76, -32}, {10, -32}, {10, -64}, {48, -64}}, color = {95, 95, 95}));
    connect(revolute.frame_a, fixedTranslation.frame_b) annotation(
      Line(points = {{-64, -20}, {76, -20}, {76, -32}}, color = {95, 95, 95}));
    connect(rotor3D.frame_a, fixedTranslation.frame_a) annotation(
      Line(points = {{-14, -32}, {56, -32}}, color = {95, 95, 95}));
    connect(tower.frame_a, world.frame_b) annotation(
      Line(points = {{4, 38}, {-68, 38}, {-68, 72}}, color = {95, 95, 95}));
  connect(const.y, torque.torque[1]) annotation(
      Line(points = {{-168, -10}, {-42, -10}, {-42, -68}}, color = {0, 0, 127}));
  connect(torque.frame_b, rotor.frame_a) annotation(
      Line(points = {{-20, -68}, {48, -68}, {48, -64}}, color = {95, 95, 95}));
    annotation(
      Diagram);
end animation;
  
  model testingFMUSetup
    
    import Modelica.Mechanics.MultiBody.{World, Parts, Joints, Visualizers, Sensors};
    import Modelica.Mechanics.Rotational;
    import Modelica.Electrical.Machines.BasicMachines.SynchronousMachines;
    import Modelica.Blocks.Sources;
  
  Parts.BodyShape platform(r = {0, 0, 0}, r_CM = {0, 0, 0}, m = 10)  annotation(
      Placement(transformation(origin = {-24, 2}, extent = {{-10, -10}, {10, 10}})));
  inner World world annotation(
      Placement(transformation(origin = {-122, 88}, extent = {{-10, -10}, {10, 10}})));
  Joints.Revolute revolute(useAxisFlange = true, n = {0, 0, 1})  annotation(
      Placement(transformation(origin = {10, 40}, extent = {{-10, -10}, {10, 10}})));
  Parts.BodyShape hub(r = {0, 0, 0}, r_CM = {0, 0, 0}, m = 5, I_11 = 10, I_22 = 10, I_33 = 0.0001)  annotation(
      Placement(transformation(origin = {28, 92}, extent = {{-10, -10}, {10, 10}})));
  Parts.FixedRotation cone annotation(
      Placement(transformation(origin = {-28, 40}, extent = {{-10, -10}, {10, 10}})));
  Rotational.Sources.Speed speed(exact = true)  annotation(
      Placement(transformation(origin = {80, 40}, extent = {{10, -10}, {-10, 10}})));
  Sensors.AbsoluteSensor absoluteSensor(get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = true)  annotation(
      Placement(transformation(origin = {-14, 116}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Sources.Sine sine(amplitude = 50, f = 0.1)  annotation(
      Placement(transformation(origin = {132, -6}, extent = {{10, -10}, {-10, 10}})));
  Sources.Ramp ramp(height = 10, duration = 5)  annotation(
      Placement(transformation(origin = {64, -18}, extent = {{-10, -10}, {10, 10}})));
  equation
    connect(revolute.frame_b, hub.frame_b) annotation(
      Line(points = {{20, 40}, {20, 92}, {38, 92}}, color = {95, 95, 95}));
    connect(cone.frame_b, revolute.frame_a) annotation(
      Line(points = {{-18, 40}, {0, 40}}, color = {95, 95, 95}));
    connect(platform.frame_a, cone.frame_a) annotation(
      Line(points = {{-34, 2}, {-38, 2}, {-38, 40}}, color = {95, 95, 95}));
    connect(speed.flange, revolute.axis) annotation(
      Line(points = {{70, 40}, {48, 40}, {48, 64}, {10, 64}, {10, 50}}));
    connect(absoluteSensor.frame_a, hub.frame_b) annotation(
      Line(points = {{-4, 116}, {38, 116}, {38, 92}}, color = {95, 95, 95}));
  connect(platform.frame_b, world.frame_b) annotation(
      Line(points = {{-14, 2}, {-112, 2}, {-112, 88}}, color = {95, 95, 95}));
  connect(sine.y, speed.w_ref) annotation(
      Line(points = {{122, -6}, {92, -6}, {92, 40}}, color = {0, 0, 127}));
    annotation(
      Diagram(coordinateSystem(extent = {{-140, 140}, {140, -60}})));
  end testingFMUSetup;
  
  model sampleFMU
    
    import Modelica.Mechanics.MultiBody.{World, Parts, Joints, Visualizers, Sensors, Forces};
    import Modelica.Mechanics.Rotational;
    import Modelica.Electrical.Machines.BasicMachines.SynchronousMachines;
    import Modelica.Blocks.{Sources, Interfaces};
  
  Parts.BodyShape platform(r = {0, 0, 0}, r_CM = {0, 0, 0}, m = 10)  annotation(
      Placement(transformation(origin = {-82, -4}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  inner World world annotation(
      Placement(transformation(origin = {-122, 88}, extent = {{-10, -10}, {10, 10}})));
  Joints.Revolute revolute(useAxisFlange = true, n = {0, 0, 1})  annotation(
      Placement(transformation(origin = {-16, 40}, extent = {{-10, -10}, {10, 10}})));
  Parts.BodyShape hub(r = {0, 0, 0}, r_CM = {0, 0, 0}, m = 5, I_11 = 10, I_22 = 10, I_33 = 0.0001)  annotation(
      Placement(transformation(origin = {20, 92}, extent = {{-10, -10}, {10, 10}})));
  Parts.FixedRotation cone annotation(
      Placement(transformation(origin = {-46, 40}, extent = {{-10, -10}, {10, 10}})));
  Rotational.Sources.Speed speed(exact = true)  annotation(
      Placement(transformation(origin = {48, 34}, extent = {{10, -10}, {-10, 10}})));
  Sensors.AbsoluteSensor absoluteSensor(get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = true)  annotation(
      Placement(transformation(origin = {54, 130}, extent = {{10, -10}, {-10, 10}})));
  Sources.Ramp ramp(height = 10, duration = 5) annotation(
      Placement(transformation(origin = {96, 34}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  Interfaces.RealOutput w annotation(
      Placement(transformation(origin = {-46, 138}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {106, -2}, extent = {{-10, -10}, {10, 10}})));
  Interfaces.RealInput F[2] annotation(
      Placement(transformation(origin = {132, 78}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-102, -2}, extent = {{-20, -20}, {20, 20}})));
  Forces.WorldForceAndTorque forceAndTorque annotation(
      Placement(transformation(origin = {48, 74}, extent = {{10, -10}, {-10, 10}})));
  Rotational.Sensors.SpeedSensor speedSensor annotation(
      Placement(transformation(origin = {-46, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  forceTorqueConvert forceTorqueConverter annotation(
      Placement(transformation(origin = {96, 76}, extent = {{10, -10}, {-10, 10}}, rotation = -0)));
  equation
    connect(cone.frame_b, revolute.frame_a) annotation(
      Line(points = {{-36, 40}, {-26, 40}}, color = {95, 95, 95}));
    connect(platform.frame_a, cone.frame_a) annotation(
      Line(points = {{-72, -4}, {-72, 40}, {-56, 40}}, color = {95, 95, 95}));
    connect(absoluteSensor.frame_a, hub.frame_b) annotation(
      Line(points = {{64, 130}, {64, 92}, {30, 92}}, color = {95, 95, 95}));
    connect(platform.frame_b, world.frame_b) annotation(
      Line(points = {{-92, -4}, {-114, -4}, {-114, 88}, {-112, 88}}, color = {95, 95, 95}));
  connect(ramp.y, speed.w_ref) annotation(
      Line(points = {{85, 34}, {60, 34}}, color = {0, 0, 127}));
  connect(speed.flange, revolute.axis) annotation(
      Line(points = {{38, 34}, {6, 34}, {6, 56}, {-16, 56}, {-16, 50}}));
  connect(revolute.axis, speedSensor.flange) annotation(
      Line(points = {{-16, 50}, {-32, 50}, {-32, 80}, {-46, 80}}));
  connect(speedSensor.w, w) annotation(
      Line(points = {{-46, 102}, {-46, 138}}, color = {0, 0, 127}));
  connect(revolute.frame_b, hub.frame_a) annotation(
      Line(points = {{-6, 40}, {-4, 40}, {-4, 92}, {10, 92}}, color = {95, 95, 95}));
  connect(forceAndTorque.frame_b, hub.frame_b) annotation(
      Line(points = {{38, 74}, {30, 74}, {30, 92}}, color = {95, 95, 95}));
  connect(forceTorqueConverter.FT, F) annotation(
      Line(points = {{106, 76}, {132, 76}, {132, 78}}, color = {0, 0, 127}));
  connect(forceTorqueConverter.T, forceAndTorque.torque) annotation(
      Line(points = {{86, 72}, {72, 72}, {72, 80}, {60, 80}}, color = {0, 0, 127}));
  connect(forceTorqueConverter.F, forceAndTorque.force) annotation(
      Line(points = {{86, 76}, {76, 76}, {76, 68}, {60, 68}}, color = {0, 0, 127}));
    annotation(
      Diagram(coordinateSystem(extent = {{-140, 140}, {140, -60}})));
  end sampleFMU;

  model forceTorqueConvert
  
    import Modelica.Blocks.Interfaces;
    
    Interfaces.RealInput FT[2] annotation(
        Placement(transformation(origin = {-102, 2}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-102, 2}, extent = {{-20, -20}, {20, 20}})));
    Interfaces.RealOutput F[3] annotation(
      Placement(transformation(origin = {100, 48}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {100, 0}, extent = {{-20, -20}, {20, 20}})));
    Interfaces.RealOutput T[3] annotation(
      Placement(transformation(origin = {100, -36}, extent = {{-20, -20}, {20, 20}})));
  equation
  
    F[1] = 0;
    F[2] = 0;
    FT[1] = F[3];
    T[1] = 0;
    T[2] = 0;
    FT[2] = T[3];

  end forceTorqueConvert;
end Develop;
