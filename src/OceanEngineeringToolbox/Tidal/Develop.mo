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
end Develop;
