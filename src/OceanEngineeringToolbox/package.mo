within;
encapsulated package OceanEngineeringToolbox
  "A package containing The Modelica Ocean Engineering Toolbox - an open-source numerical modelling and simulation tool for wave-to-wire marine renewable energy systems."

 annotation(
    version = "v0.3",
    versionDate = "2025-05-12",
    uses(Modelica(version = "4.0.0")),
    preferredView = "info",
    Documentation(info = "<html><p>This is v0.3 of the Modelica Ocean Engineering Toolbox.</p></html>"), 
    Icon(
    coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
    graphics={

    // Ocean water (approxmiated smooth curve for the wave, filled with blue)
    Polygon(
      points={
        {-100,-20},{-97.5,-16.8},{-95,-13.7},{-92.5,-10.6},{-90,-7.4},{-87.5,-4.3},{-85,-1.1},{-82.5,2.0},{-80,5.0},
        {-77.5,7.7},{-75,10.1},{-72.5,12.0},{-70,13.5},{-67.5,14.4},{-65,14.8},{-62.5,14.5},{-60,13.6},
        {-57.5,12.0},{-55,9.8},{-52.5,7.0},{-50,3.8},{-47.5,0.3},{-45,-3.3},{-42.5,-6.8},{-40,-10.0},
        {-37.5,-12.8},{-35,-15.1},{-32.5,-16.9},{-30,-18.1},{-27.5,-18.7},{-25,-18.8},{-22.5,-18.2},{-20,-17.0},
        {-17.5,-15.2},{-15,-12.9},{-12.5,-10.1},{-10,-6.9},
        {-8,-4.0},{-6,-2.0},{-4,-0.5},{-2.5,1.2},{0,2.5},{2.5,1.2},{4,-0.5},{6,-2.0},{8,-4.0},{10,-6.9},
        {12.5,-10.1},{15,-12.9},{17.5,-15.2},{20,-17.0},{22.5,-18.2},{25,-18.8},{27.5,-18.7},{30,-18.1},
        {32.5,-16.9},{35,-15.1},{37.5,-12.8},{40,-10.0},{42.5,-6.8},{45,-3.3},{47.5,0.3},{50,3.8},
        {52.5,7.0},{55,9.8},{57.5,12.0},{60,13.6},{62.5,14.5},{65,14.8},{67.5,14.4},{70,13.5},
        {72.5,12.0},{75,10.1},{77.5,7.7},{80,5.0},{82.5,2.0},{85,-1.1},{87.5,-4.3},{90,-7.4},
        {92.5,-10.6},{95,-13.7},{97.5,-16.8},{100,-20},
        {100,-100},{-100,-100}
      },
      fillColor={0,0,175},
      lineColor={0,0,175},
      lineThickness=2,
      fillPattern=FillPattern.Solid
    ),

    // Sinusoidal wave crest
    Line(
      points={
        {-100,-20},{-97.5,-16.8},{-95,-13.7},{-92.5,-10.6},{-90,-7.4},{-87.5,-4.3},{-85,-1.1},{-82.5,2.0},{-80,5.0},
        {-77.5,7.7},{-75,10.1},{-72.5,12.0},{-70,13.5},{-67.5,14.4},{-65,14.8},{-62.5,14.5},{-60,13.6},
        {-57.5,12.0},{-55,9.8},{-52.5,7.0},{-50,3.8},{-47.5,0.3},{-45,-3.3},{-42.5,-6.8},{-40,-10.0},
        {-37.5,-12.8},{-35,-15.1},{-32.5,-16.9},{-30,-18.1},{-27.5,-18.7},{-25,-18.8},{-22.5,-18.2},{-20,-17.0},
        {-17.5,-15.2},{-15,-12.9},{-12.5,-10.1},{-10,-6.9},
        {-8,-4.0},{-6,-2.0},{-4,-0.5},{-2.5,1.2},{0,2.5},{2.5,1.2},{4,-0.5},{6,-2.0},{8,-4.0},{10,-6.9},
        {12.5,-10.1},{15,-12.9},{17.5,-15.2},{20,-17.0},{22.5,-18.2},{25,-18.8},{27.5,-18.7},{30,-18.1},
        {32.5,-16.9},{35,-15.1},{37.5,-12.8},{40,-10.0},{42.5,-6.8},{45,-3.3},{47.5,0.3},{50,3.8},
        {52.5,7.0},{55,9.8},{57.5,12.0},{60,13.6},{62.5,14.5},{65,14.8},{67.5,14.4},{70,13.5},
        {72.5,12.0},{75,10.1},{77.5,7.7},{80,5.0},{82.5,2.0},{85,-1.1},{87.5,-4.3},{90,-7.4},
        {92.5,-10.6},{95,-13.7},{97.5,-16.8},{100,-20}
      },
      color={0,0,255},
      smooth=Smooth.Bezier
    ),
      
    // Current (white lines)
    Line(points={{-75,-25},{-65,-23},{-55,-25},{-45,-23}}, color={255,255,255}, smooth=Smooth.Bezier, thickness = 1),
    Line(points={{-75,-30},{-65,-28},{-55,-30},{-45,-28}}, color={255,255,255}, smooth=Smooth.Bezier, thickness = 1),
    Line(points={{-75,-35},{-65,-33},{-55,-35},{-45,-33}}, color={255,255,255}, smooth=Smooth.Bezier, thickness = 1),

    // Flat sand layer at the seabed
    Rectangle(
      extent={{-100,-100},{100,-85}},   
      fillColor={194,178,128},           
      lineColor={194,178,128},           
      lineThickness=1.5,
      fillPattern=FillPattern.Solid
    ),

    // Mooring line (connected to the spar)
    Line(
      points={
        {25, -90},    
        {24, -80},
        {22, -70},
        {19, -60},
        {15, -50},
        {10, -40},
        {0, -30}     
      },
      color={139,69,19},       
      smooth=Smooth.Bezier,
      thickness=2
    ),
      
      // Spar reaction plate
      Ellipse(
        extent={{-25,-40},{25,-15}},  
        fillColor={169,169,169},
        lineColor={0,0,0},
        lineThickness=1.5,
        fillPattern=FillPattern.Solid
      ),
      

      // Vertical spar
      Rectangle(
        extent={{-5,-25},{5,20}},    
        fillColor={169,169,169},
        lineColor={0,0,0},
        lineThickness=1.5,
        radius=1.5,
        fillPattern=FillPattern.Solid 
      ),
      
      // Toroidal float
      Rectangle(
        extent={{-25,-1},{25,8}},      
        fillColor={255,255,0},         
        lineColor={0,0,0},
        lineThickness=1.5,
        radius=6,                       
        fillPattern=FillPattern.Solid
      )
          }
        )
  );
end OceanEngineeringToolbox;
