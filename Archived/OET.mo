within;
package OET
/*  Modelica Ocean Engineering Toolbox v0.3
    Copyright (C) 2024  Thomas Hogan, Ajay Menon, Alix Haider, and Kush Bubbar

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    Your copy of the GNU General Public License can be viewed
    here <https://www.gnu.org/licenses/>.
*/
  
/*  Library structure (needs to be updated):
     OET (Package)
     |  
     |->  Wave Profile (PACKAGE)
     |    |-> Regular Wave (PACKAGE)
     |    |   |-> LinearWave (MODEL)                         [!- Monochromatic regular wave]
     |    |
     |    |-> Irregular Wave (PACKAGE)
     |    |   |-> Pierson Moskowitz Spectrum (MODEL)          [!- Fully-developed sea state]
     |    |   |-> Bretschneider Spectrum (MODEL)             [!- Modified PM spectrum for developing sea state]
     |    |   |-> JONSWAP Spectrum (MODEL)                    [!- Developing sea state with limited fetch]
     |    |
     |->  Structures (PACKAGE)
     |    |-> RigidBody (MODEL)                               [!- Solves motion using the Cummins equation]
     |
     |->  Internal (PACKAGE)
     |    |-> Functions (PACKAGE)
     |    |   |-> waveNumber (FUNCTION)                       [!- Wave number iterations from frequency and depth]
     |    |   |-> randomNumberGen (FUNCTION)                  [!- Random numbers through XOR shift generator]
     |    |   |-> frequencySelector (FUNCTION)                [!- Select wave frequencies from a range]
     |    |   |-> spectrumGenerator_PM (FUNCTION)             [!- Generate Pierson Moskowitz spectrum for frequency components]
     |    |   |-> spectrumGenerator_BRT (FUNCTION)            [!- Generate Bretschneider spectrum for frequency components]
     |    |   |-> spectrumGenerator_JONSWAP (FUNCTION)        [!- Generate JONSWAP spectrum for frequency components]
     |    |
     |    |-> Connectors (PACKAGE)
     |    |   |-> WaveOutConn (CONNECTOR)                     [!- Output transfer wave elevation and excitation force]
     |    |   |-> WaveInConn (CONNECTOR)                      [!- Input transfer wave elevation and excitation force]
     |    |   |-> DataCollector (CONNECTOR)                   [!- Transfer 'Rigid Body' dynamics and forces]
     |    |
     |    |-> TestDevelopment (MODEL)                         [!- Developer component to test all models, functions, connectors]
     |
     |->  Tutorial (PACKAGE)
     |    |-> Sample1 (MODEL)                                 [!- Example model to simulate a rigid body in regular waves]
     |    |-> Sample2 (MODEL)                                 [!- Example model to simulate a rigid body in irregular waves]
     |
     |->  Simulations (PACKAGE)
          |-> * Directory for users to build custom simulation models *
*/

  extends Modelica.Icons.Package;

  //within OET;
  package Example
    extends Modelica.Icons.Package;

    model multibodyWEC
      extends Modelica.Icons.Package;
      // World component (no gravity, Z-axis pointing downwards)
      inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity, n = {0, 0, -1}, label1 = "x", label2 = "z") "World coordinate system without gravity" annotation(
        Placement(transformation(origin = {-50, -18}, extent = {{-10, -10}, {10, 10}})));
      // Prismatic joint constraining motion in heave
      // Force and torque element (adapt wave output to a force and apply to the body)
      // Define hydrodynamic body
      inner Hydro.FilePath fileDirectory annotation(
        Placement(transformation(origin = {100, -34}, extent = {{-10, -10}, {10, 10}})));
      Hydro.HydrodynamicBody spar(enableRadiationForce = true, bodyIndex = 2, enableExcitationForce = true, I_11 = 94419615, I_22 = 94407091, I_33 = 28542225, ra_CM = {0, 0, 0}, enableHydrostaticForce = true, enableDampingDragForce = false) annotation(
        Placement(transformation(origin = {12, -16}, extent = {{-10, -10}, {10, 10}})));
      Hydro.HydrodynamicBody float(enableRadiationForce = true, bodyIndex = 1, enableExcitationForce = true, enableDampingDragForce = false, enableHydrostaticForce = true, I_11 = 20907301, I_22 = 21306091, I_33 = 37085481, ra_CM = {0, 0, 0}) annotation(
        Placement(transformation(origin = {70, -16}, extent = {{-10, -10}, {10, 10}})));
      inner Wave.Environment environment(waveSelector = "Regular", omegaPeak = 0.785, Trmp = 50, frequencySelection = "random", Hs = 1) annotation(
        Placement(transformation(origin = {100, -8}, extent = {{-10, -10}, {10, 10}})));
      PTO.LinearPTO linearPTO annotation(
        Placement(transformation(origin = {40, -28}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion annotation(
        Placement(transformation(origin = {-18, -30}, extent = {{-10, -10}, {10, 10}})));
    equation
// Connections
      connect(linearPTO.frame_b, float.frame_a) annotation(
        Line(points = {{50, -28}, {58, -28}, {58, -16}, {60, -16}}, color = {95, 95, 95}));
  connect(linearPTO.frame_a, spar.frame_b) annotation(
        Line(points = {{30, -28}, {22, -28}, {22, -16}}, color = {95, 95, 95}));
  connect(freeMotion.frame_b, spar.frame_a) annotation(
        Line(points = {{-8, -30}, {2, -30}, {2, -16}}, color = {95, 95, 95}));
  connect(freeMotion.frame_a, world.frame_b) annotation(
        Line(points = {{-28, -30}, {-40, -30}, {-40, -18}}, color = {95, 95, 95}));
      annotation(
        Icon(graphics = {Line(points = {{-90, 0}, {-60, 20}, {-30, -20}, {0, 20}, {30, -20}, {60, 20}, {90, 0}}, color = {0, 0, 200}, thickness = 2, smooth = Smooth.Bezier), Ellipse(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
        Documentation(info = "<html>
        <p><b>1D Single-Body Wave Energy Converter (WEC) Model</b></p>
        <p>This model represents a simplified 1D single-body wave energy converter system, 
        focusing on the vertical motion of the body in response to wave excitation forces.</p>
        
        <p><b>Model Description</b></p>
        <p>The WEC consists of a hydrodynamic body constrained to move vertically using a prismatic joint. 
        The body is subjected to wave excitation forces generated by Regular (Linear) and Irregular (PM, Bretschneider, JONSWAP) wave profiles.</p>
        
        <p><b>Key Components</b></p>
        <ul>
          <li><code>world</code>: Defines the world coordinate system without gravity</li>
          <li><code>bodyHD6D</code>: Represents the hydrodynamic body of the WEC</li>
          <li><code>prismatic</code>: Allows vertical motion of the body</li>
          <li><code>Regular and Irregular Wave Profiles</code>: Generates regular and irregular wave excitation forces</li>
          <li><code>forceAndTorque</code>: Applies the excitation force to the body</li>
        </ul>
        
        <p><b>Assumptions and Simplifications</b></p>
        <ul>
          <li>The model considers only vertical motion (1D) of the WEC</li>
          <li>Gravity is not included in the world model</li>
          <li>The excitation force is applied as an external input based on the Pierson-Moskowitz or Regular wave profile</li>
        </ul>
        
        <p><b>Notes</b></p>
        <ul>
          <li>This model serves as a basic framework for WEC simulations and can be extended for more complex analyses</li>
          <li>Additional forces like radiation damping or PTO forces can be added to enhance the model's realism</li>
          <li>Ensure that the BodyHD6D component is properly configured for accurate results</li>
          <li>The wave parameters may need to be adjusted to represent specific sea states</li>
        </ul>
      </html>"),
        Diagram(coordinateSystem(extent = {{-80, 0}, {150, -40}})),
        experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-08, Interval = 0.05));
    end multibodyWEC;

    model multibodyCoupledWEC
      extends Modelica.Icons.Package;
      // World component (no gravity, Z-axis pointing downwards)
      inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity, n = {0, 0, -1}) "World coordinate system without gravity" annotation(
        Placement(transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}})));
      // Prismatic joint constraining motion in heave
      // Force and torque element (adapt wave output to a force and apply to the body)
      // Define hydrodynamic body
      inner Hydro.FilePath filePath annotation(
        Placement(transformation(origin = {134, -18}, extent = {{-10, -10}, {10, 10}})));
      inner Wave.Environment environment(n_omega = 100) annotation(
        Placement(transformation(origin = {102, -12}, extent = {{-10, -10}, {10, 10}})));
      Hydro.HydrodynamicBodyB2B spar(BodyIndex = 2) annotation(
        Placement(transformation(origin = {10, -12}, extent = {{-10, -10}, {10, 10}})));
      Hydro.HydrodynamicBodyB2B float(BodyIndex = 1) annotation(
        Placement(transformation(origin = {70, -16}, extent = {{-10, -10}, {10, 10}})));
      PTO.LinearPTO linearPTO annotation(
        Placement(transformation(origin = {38, -44}, extent = {{-10, -10}, {10, 10}})));
      Mooring.LinearMooring linearMooring annotation(
        Placement(transformation(origin = {-24, -46}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(n = {0, 0, 1}) annotation(
        Placement(transformation(origin = {-16, 2}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(n = {0, 0, 1}) annotation(
        Placement(transformation(origin = {42, 2}, extent = {{-10, -10}, {10, 10}})));
      inner Hydro.CouplingB2B couplingB2B annotation(
        Placement(transformation(origin = {92, -40}, extent = {{-10, -10}, {10, 10}})));
    equation
// Connections
      connect(spar.frame_b, linearPTO.frame_a) annotation(
        Line(points = {{20, -12}, {20, -14}, {28, -14}, {28, -44}}, color = {95, 95, 95}));
      connect(float.frame_a, linearPTO.frame_b) annotation(
        Line(points = {{60, -16}, {60, -30}, {48, -30}, {48, -44}}, color = {95, 95, 95}));
      connect(linearMooring.frame_a, spar.frame_a) annotation(
        Line(points = {{-34, -46}, {0, -46}, {0, -12}}, color = {95, 95, 95}));
      connect(prismatic.frame_b, spar.frame_a) annotation(
        Line(points = {{-6, 2}, {0, 2}, {0, -12}}, color = {95, 95, 95}));
      connect(prismatic.frame_a, world.frame_b) annotation(
        Line(points = {{-26, 2}, {-30, 2}, {-30, -20}}, color = {95, 95, 95}));
      connect(prismatic1.frame_b, float.frame_a) annotation(
        Line(points = {{52, 2}, {60, 2}, {60, -16}}, color = {95, 95, 95}));
      connect(prismatic1.frame_a, spar.frame_b) annotation(
        Line(points = {{32, 2}, {20, 2}, {20, -12}}, color = {95, 95, 95}));
      annotation(
        Icon(graphics = {Line(points = {{-90, 0}, {-60, 20}, {-30, -20}, {0, 20}, {30, -20}, {60, 20}, {90, 0}}, color = {0, 0, 200}, thickness = 2, smooth = Smooth.Bezier), Ellipse(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
        Documentation(info = "<html>
        <p><b>1D Single-Body Wave Energy Converter (WEC) Model</b></p>
        <p>This model represents a simplified 1D single-body wave energy converter system, 
        focusing on the vertical motion of the body in response to wave excitation forces.</p>
        
        <p><b>Model Description</b></p>
        <p>The WEC consists of a hydrodynamic body constrained to move vertically using a prismatic joint. 
        The body is subjected to wave excitation forces generated by Regular (Linear) and Irregular (PM, Bretschneider, JONSWAP) wave profiles.</p>
        
        <p><b>Key Components</b></p>
        <ul>
          <li><code>world</code>: Defines the world coordinate system without gravity</li>
          <li><code>bodyHD6D</code>: Represents the hydrodynamic body of the WEC</li>
          <li><code>prismatic</code>: Allows vertical motion of the body</li>
          <li><code>Regular and Irregular Wave Profiles</code>: Generates regular and irregular wave excitation forces</li>
          <li><code>forceAndTorque</code>: Applies the excitation force to the body</li>
        </ul>
        
        <p><b>Assumptions and Simplifications</b></p>
        <ul>
          <li>The model considers only vertical motion (1D) of the WEC</li>
          <li>Gravity is not included in the world model</li>
          <li>The excitation force is applied as an external input based on the Pierson-Moskowitz or Regular wave profile</li>
        </ul>
        
        <p><b>Notes</b></p>
        <ul>
          <li>This model serves as a basic framework for WEC simulations and can be extended for more complex analyses</li>
          <li>Additional forces like radiation damping or PTO forces can be added to enhance the model's realism</li>
          <li>Ensure that the BodyHD6D component is properly configured for accurate results</li>
          <li>The wave parameters may need to be adjusted to represent specific sea states</li>
        </ul>
      </html>"),
        Diagram(coordinateSystem(extent = {{-80, 0}, {150, -40}})),
        experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-08, Interval = 0.05));
    end multibodyCoupledWEC;

    model multibodyWEC_test
      extends Modelica.Icons.Package;
      // World component (no gravity, Z-axis pointing downwards)
      inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity, n = {0, 0, -1}) "World coordinate system without gravity" annotation(
        Placement(transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}})));
      // Prismatic joint constraining motion in heave
      // Force and torque element (adapt wave output to a force and apply to the body)
      // Define hydrodynamic body
      inner Hydro.FilePath fileDirectory annotation(
        Placement(transformation(origin = {134, -18}, extent = {{-10, -10}, {10, 10}})));
  inner Wave.Environment_new environment(waveSelector = "PiersonMoskowitz", frequencySelection = "random")  annotation(
        Placement(transformation(origin = {54, -24}, extent = {{-10, -10}, {10, 10}})));
  Hydro.HydrodynamicBody hydrodynamicBody(bodyIndex = 2, enableHydrostaticForce = false, enableRadiationForce = false, enableDampingDragForce = false, offset = {0, 0, 0, 0, 0, 0})  annotation(
        Placement(transformation(origin = {4, -28}, extent = {{-10, -10}, {10, 10}})));
    equation
// Connections
      annotation(
        Icon(graphics = {Line(points = {{-90, 0}, {-60, 20}, {-30, -20}, {0, 20}, {30, -20}, {60, 20}, {90, 0}}, color = {0, 0, 200}, thickness = 2, smooth = Smooth.Bezier), Ellipse(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
        Documentation(info = "<html>
        <p><b>1D Single-Body Wave Energy Converter (WEC) Model</b></p>
        <p>This model represents a simplified 1D single-body wave energy converter system, 
        focusing on the vertical motion of the body in response to wave excitation forces.</p>
        
        <p><b>Model Description</b></p>
        <p>The WEC consists of a hydrodynamic body constrained to move vertically using a prismatic joint. 
        The body is subjected to wave excitation forces generated by Regular (Linear) and Irregular (PM, Bretschneider, JONSWAP) wave profiles.</p>
        
        <p><b>Key Components</b></p>
        <ul>
          <li><code>world</code>: Defines the world coordinate system without gravity</li>
          <li><code>bodyHD6D</code>: Represents the hydrodynamic body of the WEC</li>
          <li><code>prismatic</code>: Allows vertical motion of the body</li>
          <li><code>Regular and Irregular Wave Profiles</code>: Generates regular and irregular wave excitation forces</li>
          <li><code>forceAndTorque</code>: Applies the excitation force to the body</li>
        </ul>
        
        <p><b>Assumptions and Simplifications</b></p>
        <ul>
          <li>The model considers only vertical motion (1D) of the WEC</li>
          <li>Gravity is not included in the world model</li>
          <li>The excitation force is applied as an external input based on the Pierson-Moskowitz or Regular wave profile</li>
        </ul>
        
        <p><b>Notes</b></p>
        <ul>
          <li>This model serves as a basic framework for WEC simulations and can be extended for more complex analyses</li>
          <li>Additional forces like radiation damping or PTO forces can be added to enhance the model's realism</li>
          <li>Ensure that the BodyHD6D component is properly configured for accurate results</li>
          <li>The wave parameters may need to be adjusted to represent specific sea states</li>
        </ul>
      </html>"),
        Diagram(coordinateSystem(extent = {{-80, 0}, {150, -40}})),
        experiment(StartTime = 0, StopTime = 250, Tolerance = 1e-08, Interval = 0.05));
    end multibodyWEC_test;

    model multibodyWECSingleDoF
      extends Modelica.Icons.Package;
      // World component (no gravity, Z-axis pointing downwards)
      inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity, n = {0, 0, -1}, label1 = "x", label2 = "z", enableAnimation = true) "World coordinate system without gravity" annotation(
        Placement(transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}})));
      // Prismatic joint constraining motion in heave
      // Force and torque element (adapt wave output to a force and apply to the body)
      // Define hydrodynamic body
      inner Hydro.FilePath fileDirectory(hydroCoeffFile = "/applications/Validation/RM3/RM3HydroCoeff.mat")  annotation(
        Placement(transformation(origin = {110, -26}, extent = {{-10, -10}, {10, 10}})));
      Hydro.HydrodynamicBody spar(enableRadiationForce = true, bodyIndex = 2, enableExcitationForce = true, I_11 = 94419615, I_22 = 94407091, I_33 = 28542225, enableHydrostaticForce = true, enableDampingDragForce = false, animationEnable = false, geometryFile = "/RM3/geometry/plate.stl", offset = {0, 0, 21.29, 0, 0, 0}, ra_CM = {0, 0, -21.29}) annotation(
        Placement(transformation(origin = {20, -16}, extent = {{-10, -10}, {10, 10}})));
      Hydro.HydrodynamicBody float(enableRadiationForce = true, bodyIndex = 1, enableExcitationForce = true, enableDampingDragForce = false, enableHydrostaticForce = true, I_11 = 20907301, I_22 = 21306091, I_33 = 37085481, geometryFile = "/RM3/geometry/float.stl", animationEnable = false, offset = {0, 0, 0.72, 0, 0, 0}, rCM_b = {0, 0, 0}, ra_CM = {0, 0, 20.57}) annotation(
        Placement(transformation(origin = {70, -16}, extent = {{-10, -10}, {10, 10}})));
  inner Wave.Environment_new environment(waveSelector = "Regular", frequencySelection = "equalEnergy")  annotation(
        Placement(transformation(origin = {132, -4}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Joints.FreeMotion freeMotion annotation(
        Placement(transformation(origin = {-6, -38}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(n = {0, 0, 1})  annotation(
        Placement(transformation(origin = {42, -34}, extent = {{-10, -10}, {10, 10}})));
    equation
// Connections
      connect(freeMotion.frame_b, spar.frame_a) annotation(
        Line(points = {{4, -38}, {10, -38}, {10, -16}}, color = {95, 95, 95}));
      connect(freeMotion.frame_a, world.frame_b) annotation(
        Line(points = {{-16, -38}, {-30, -38}, {-30, -20}}, color = {95, 95, 95}));
  connect(prismatic.frame_b, float.frame_a) annotation(
        Line(points = {{52, -34}, {60, -34}, {60, -16}}, color = {95, 95, 95}));
  connect(prismatic.frame_a, spar.frame_b) annotation(
        Line(points = {{32, -34}, {30, -34}, {30, -16}}, color = {95, 95, 95}));
      annotation(
        Icon(graphics = {Line(points = {{-90, 0}, {-60, 20}, {-30, -20}, {0, 20}, {30, -20}, {60, 20}, {90, 0}}, color = {0, 0, 200}, thickness = 2, smooth = Smooth.Bezier), Ellipse(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
        Documentation(info = "<html>
            <p><b>1D Single-Body Wave Energy Converter (WEC) Model</b></p>
            <p>This model represents a simplified 1D single-body wave energy converter system, 
            focusing on the vertical motion of the body in response to wave excitation forces.</p>
            
            <p><b>Model Description</b></p>
            <p>The WEC consists of a hydrodynamic body constrained to move vertically using a prismatic joint. 
            The body is subjected to wave excitation forces generated by Regular (Linear) and Irregular (PM, Bretschneider, JONSWAP) wave profiles.</p>
            
            <p><b>Key Components</b></p>
            <ul>
              <li><code>world</code>: Defines the world coordinate system without gravity</li>
              <li><code>bodyHD6D</code>: Represents the hydrodynamic body of the WEC</li>
              <li><code>prismatic</code>: Allows vertical motion of the body</li>
              <li><code>Regular and Irregular Wave Profiles</code>: Generates regular and irregular wave excitation forces</li>
              <li><code>forceAndTorque</code>: Applies the excitation force to the body</li>
            </ul>
            
            <p><b>Assumptions and Simplifications</b></p>
            <ul>
              <li>The model considers only vertical motion (1D) of the WEC</li>
              <li>Gravity is not included in the world model</li>
              <li>The excitation force is applied as an external input based on the Pierson-Moskowitz or Regular wave profile</li>
            </ul>
            
            <p><b>Notes</b></p>
            <ul>
              <li>This model serves as a basic framework for WEC simulations and can be extended for more complex analyses</li>
              <li>Additional forces like radiation damping or PTO forces can be added to enhance the model's realism</li>
              <li>Ensure that the BodyHD6D component is properly configured for accurate results</li>
              <li>The wave parameters may need to be adjusted to represent specific sea states</li>
            </ul>
          </html>"),
        Diagram(coordinateSystem(extent = {{-80, 0}, {150, -40}})),
        experiment(StartTime = 0, StopTime = 250, Tolerance = 1e-08, Interval = 0.1));
    end multibodyWECSingleDoF;

    model multibodyWECSingleDoF_mm
      extends Modelica.Icons.Package;
      // World component (no gravity, Z-axis pointing downwards)
      inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity, n = {0, 0, -1}, label1 = "x", label2 = "z", enableAnimation = true) "World coordinate system without gravity" annotation(
        Placement(transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}})));
      // Prismatic joint constraining motion in heave
      // Force and torque element (adapt wave output to a force and apply to the body)
      // Define hydrodynamic body
      inner Hydro.FilePath fileDirectory annotation(
        Placement(transformation(origin = {98, -30}, extent = {{-10, -10}, {10, 10}})));
      Hydro.HydrodynamicBody_mm spar(enableRadiationForce = false, bodyIndex = 2, enableExcitationForce = true, I_11 = 94419615, I_22 = 94407091, I_33 = 28542225, ra_CM = {0, 0, 0}, enableHydrostaticForce = true, enableDampingDragForce = false, rCM_b = {0, 0, 0}, animationEnable = true, geometryFile = "/RM3/geometry/plate.stl") annotation(
        Placement(transformation(origin = {12, -14}, extent = {{-10, -10}, {10, 10}})));
      Hydro.HydrodynamicBody_mm float(enableRadiationForce = true, bodyIndex = 1, enableExcitationForce = false, enableDampingDragForce = false, enableHydrostaticForce = true, I_11 = 20907301, I_22 = 21306091, I_33 = 37085481, ra_CM = {0, 0, 0}, rCM_b = {0, 0, 0}, I_32 = 4300, geometryFile = "/RM3/geometry/float.stl", animationEnable = false) annotation(
        Placement(transformation(origin = {70, -16}, extent = {{-10, -10}, {10, 10}})));
      inner Wave.Environment environment(waveSelector = "Regular", omegaPeak = 0.785, frequencySelection = "random", Hs = 2, Trmp = 100) annotation(
        Placement(transformation(origin = {98, -6}, extent = {{-10, -10}, {10, 10}})));
    equation
// Connections
      annotation(
        Icon(graphics = {Line(points = {{-90, 0}, {-60, 20}, {-30, -20}, {0, 20}, {30, -20}, {60, 20}, {90, 0}}, color = {0, 0, 200}, thickness = 2, smooth = Smooth.Bezier), Ellipse(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
        Documentation(info = "<html>
            <p><b>1D Single-Body Wave Energy Converter (WEC) Model</b></p>
            <p>This model represents a simplified 1D single-body wave energy converter system, 
            focusing on the vertical motion of the body in response to wave excitation forces.</p>
            
            <p><b>Model Description</b></p>
            <p>The WEC consists of a hydrodynamic body constrained to move vertically using a prismatic joint. 
            The body is subjected to wave excitation forces generated by Regular (Linear) and Irregular (PM, Bretschneider, JONSWAP) wave profiles.</p>
            
            <p><b>Key Components</b></p>
            <ul>
              <li><code>world</code>: Defines the world coordinate system without gravity</li>
              <li><code>bodyHD6D</code>: Represents the hydrodynamic body of the WEC</li>
              <li><code>prismatic</code>: Allows vertical motion of the body</li>
              <li><code>Regular and Irregular Wave Profiles</code>: Generates regular and irregular wave excitation forces</li>
              <li><code>forceAndTorque</code>: Applies the excitation force to the body</li>
            </ul>
            
            <p><b>Assumptions and Simplifications</b></p>
            <ul>
              <li>The model considers only vertical motion (1D) of the WEC</li>
              <li>Gravity is not included in the world model</li>
              <li>The excitation force is applied as an external input based on the Pierson-Moskowitz or Regular wave profile</li>
            </ul>
            
            <p><b>Notes</b></p>
            <ul>
              <li>This model serves as a basic framework for WEC simulations and can be extended for more complex analyses</li>
              <li>Additional forces like radiation damping or PTO forces can be added to enhance the model's realism</li>
              <li>Ensure that the BodyHD6D component is properly configured for accurate results</li>
              <li>The wave parameters may need to be adjusted to represent specific sea states</li>
            </ul>
          </html>"),
        Diagram(coordinateSystem(extent = {{-80, 0}, {150, -40}})),
        experiment(StartTime = 0, StopTime = 600, Tolerance = 1e-08, Interval = 0.02));
    end multibodyWECSingleDoF_mm;

    model RM3Visual
      import Modelica.Mechanics.MultiBody;
      // Define the world frame
      inner MultiBody.World world(animateGravity = true, animateGround = false) annotation(
        Placement(transformation(extent = {{-100, -20}, {-80, 0}})));
      // Fixed frame to attach the shape
      MultiBody.Parts.Fixed fixed(animation = false) annotation(
        Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
      // Visual shape (only basic shapes work)
      MultiBody.Visualizers.FixedShape customShape(shapeType = "file://C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/EWTEC/Regular/RM3/geometry/float.stl", color = {255, 255, 0}, length = 1, width = 1, height = 1, r_shape = {0, 0, -3}) annotation(
        Placement(transformation(extent = {{-20, -10}, {0, 10}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(shapeType = "file://C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox/EWTEC/Regular/RM3/geometry/plate.stl", r_shape = {0, 0, -25}, length = 1, width = 1, height = 1, color = {128, 128, 128}) annotation(
        Placement(transformation(origin = {0, -58}, extent = {{-10, -10}, {10, 10}})));
    equation
// Connect the fixed support to the shape
      connect(fixed.frame_b, customShape.frame_a);
      connect(fixedShape.frame_a, customShape.frame_a) annotation(
        Line(points = {{-10, -58}, {-20, -58}, {-20, 0}}, color = {95, 95, 95}));
      annotation(
        Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})));
    end RM3Visual;
    
    model OSWEC
      extends Modelica.Icons.Package;
      // World component (no gravity, Z-axis pointing downwards)
      inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity, n = {0, 0, -1}, label1 = "x", label2 = "z", enableAnimation = true) "World coordinate system without gravity" annotation(
        Placement(transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}})));
      // Prismatic joint constraining motion in heave
      // Force and torque element (adapt wave output to a force and apply to the body)
      // Define hydrodynamic body
      inner Hydro.FilePath fileDirectory(hydroCoeffFile = "/OSWECHydroCoeff.mat")  annotation(
        Placement(transformation(origin = {98, -30}, extent = {{-10, -10}, {10, 10}})));
  Hydro.HydrodynamicBody base(enableRadiationForce = true, bodyIndex = 2, enableExcitationForce = true, I_11 = 999, I_22 = 999, I_33 = 999, enableHydrostaticForce = true, enableDampingDragForce = false, animationEnable = false, geometryFile = "/RM3/geometry/plate.stl", offset = {0, 0, 10, 0, 0, 0}, ra_CM = {0, 0, -10}, rCM_b = {0, 0, 1.1}) annotation(
        Placement(transformation(origin = {20, -16}, extent = {{-10, -10}, {10, 10}})));
  Hydro.HydrodynamicBody flap(enableRadiationForce = true, bodyIndex = 1, enableExcitationForce = true, enableDampingDragForce = false, enableHydrostaticForce = true, I_11 = 1850000, I_22 = 1850000, I_33 = 1850000, geometryFile = "/RM3/geometry/flap.stl", animationEnable = false, offset = {0, 0, 3.9, 0, 0, 0}, rCM_b = {0, 0, 0}, ra_CM = {0, 0, 5}) annotation(
        Placement(transformation(origin = {70, -16}, extent = {{-10, -10}, {10, 10}})));
      inner Wave.Environment environment(waveSelector = "Regular", omegaPeak = 0.785, frequencySelection = "random", Hs = 2, Trmp = 100) annotation(
        Placement(transformation(origin = {98, -6}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Parts.Fixed fixed annotation(
        Placement(transformation(origin = {-16, -44}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(n = {0, 1, 0})  annotation(
        Placement(transformation(origin = {46, -40}, extent = {{-10, -10}, {10, 10}})));
    equation
// Connections
      connect(fixed.frame_b, base.frame_a) annotation(
        Line(points = {{-6, -44}, {10, -44}, {10, -16}}, color = {95, 95, 95}));
      connect(revolute.frame_a, base.frame_b) annotation(
        Line(points = {{36, -40}, {30, -40}, {30, -16}}, color = {95, 95, 95}));
      connect(revolute.frame_b, flap.frame_a) annotation(
        Line(points = {{56, -40}, {60, -40}, {60, -16}}, color = {95, 95, 95}));
      annotation(
        Icon(graphics = {Line(points = {{-90, 0}, {-60, 20}, {-30, -20}, {0, 20}, {30, -20}, {60, 20}, {90, 0}}, color = {0, 0, 200}, thickness = 2, smooth = Smooth.Bezier), Ellipse(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
        Documentation(info = "<html>
            <p><b>1D Single-Body Wave Energy Converter (WEC) Model</b></p>
            <p>This model represents a simplified 1D single-body wave energy converter system, 
            focusing on the vertical motion of the body in response to wave excitation forces.</p>
            
            <p><b>Model Description</b></p>
            <p>The WEC consists of a hydrodynamic body constrained to move vertically using a prismatic joint. 
            The body is subjected to wave excitation forces generated by Regular (Linear) and Irregular (PM, Bretschneider, JONSWAP) wave profiles.</p>
            
            <p><b>Key Components</b></p>
            <ul>
              <li><code>world</code>: Defines the world coordinate system without gravity</li>
              <li><code>bodyHD6D</code>: Represents the hydrodynamic body of the WEC</li>
              <li><code>prismatic</code>: Allows vertical motion of the body</li>
              <li><code>Regular and Irregular Wave Profiles</code>: Generates regular and irregular wave excitation forces</li>
              <li><code>forceAndTorque</code>: Applies the excitation force to the body</li>
            </ul>
            
            <p><b>Assumptions and Simplifications</b></p>
            <ul>
              <li>The model considers only vertical motion (1D) of the WEC</li>
              <li>Gravity is not included in the world model</li>
              <li>The excitation force is applied as an external input based on the Pierson-Moskowitz or Regular wave profile</li>
            </ul>
            
            <p><b>Notes</b></p>
            <ul>
              <li>This model serves as a basic framework for WEC simulations and can be extended for more complex analyses</li>
              <li>Additional forces like radiation damping or PTO forces can be added to enhance the model's realism</li>
              <li>Ensure that the BodyHD6D component is properly configured for accurate results</li>
              <li>The wave parameters may need to be adjusted to represent specific sea states</li>
            </ul>
          </html>"),
        Diagram(coordinateSystem(extent = {{-80, 0}, {150, -40}})),
        experiment(StartTime = 0, StopTime = 600, Tolerance = 1e-08, Interval = 0.02));
    end OSWEC;

    model Environment_Tester
  inner Wave.Environment_new environment(waveSelector = "PiersonMoskowitz", frequencySelection = "random")  annotation(
        Placement(transformation(origin = {-36, 2}, extent = {{-10, -10}, {10, 10}})));
  inner Hydro.FilePath fileDirectory annotation(
        Placement(transformation(origin = {58, 2}, extent = {{-10, -10}, {10, 10}})));
  Hydro.HydrodynamicBody hydrodynamicBody(enableHydrostaticForce = true, enableRadiationForce = true, enableDampingDragForce = false, offset = {0, 0, 0, 0, 0, 0})  annotation(
        Placement(transformation(origin = {-30, -48}, extent = {{-10, -10}, {10, 10}})));
    equation

    end Environment_Tester;
    annotation(
      Icon(graphics = {Polygon(points = {{-40, 40}, {40, 0}, {-40, -40}, {-40, 40}}, lineColor = {0, 0, 0}, fillColor = // Red color for the polygon
      {0, 0, 0}, fillPattern = // Red fill
      FillPattern.Solid)}),
      Documentation(info = "<html>
        <p><b>Wave Energy Converter (WEC) Examples</b></p>
        <p>This package contains example models for Wave Energy Converter (WEC) systems. 
        It provides a set of ready-to-use models that demonstrate various aspects of WEC modeling and simulation.</p>
        
        <p><b>Package Contents</b></p>
        <ul>
          <li><b>SingleBodyWEC1D</b>: A 1D model of a single-body wave energy converter. The hydrodynamic data from the Toroidal Float of the US DoE RM-3</li>
        </ul>
        
        <p><b>Usage</b></p>
        <p>The models in this package can be used as starting points for more complex WEC simulations 
        or as educational tools to understand the basic principles of WEC modeling.</p>
        
        <p><b>See Also</b></p>
        <p>For more detailed information on individual models, please refer to their respective documentation.</p>
      </html>"));
  end Example;

  package Models
    partial model physicalConstants "Defining pi and the acceleration due to gravity"
    protected
    end physicalConstants;

    partial model forceTorque "Declaring force and torque elements, inheriting forceTorque connector"
      extends OET.Connector.forceTorque_con;
      Real f[6] = cat(1, f_element, t_element);
      // should alter to make nDoF
    protected
      Modelica.Units.SI.Force f_element[3];
      Modelica.Units.SI.Torque t_element[3];
    end forceTorque;

    model positionSensorInput
      // Inheritance
      extends Hydrodynamic.Connector.absolutePosition_con;
    protected
      Real displacement[6] "Combined displacement vector [m, rad]";
    equation
// Combine linear and angular displacements into a single vector
      displacement = cat(1, u_abs, theta_abs);
    end positionSensorInput;

    model velocitySensorInput
      extends Hydrodynamic.Connector.absoluteVelocity_con;
    protected
      Real velocity[6] "Combined velocity vector [m/s, rad/s]";
    equation
// Combine linear and angular velocities into a single vector
      velocity = cat(1, v_abs, omega_abs);
    end velocitySensorInput;

    model accelerationSensorInput
      extends Hydrodynamic.Connector.absoluteAcceleration_con;
    protected
      Real acceleration[6] "Combined velocity vector [m/s, rad/s]";
    equation
// Combine linear and angular accelerations into a single vector
      velocity = cat(1, a_abs, alpha_abs);
    end accelerationSensorInput;

    model sensorInput
      extends Hydrodynamic.Connector.absolutePosition_con;
      extends Hydrodynamic.Connector.absoluteVelocity_con;
      extends Hydrodynamic.Connector.absoluteAcceleration_con;
    end sensorInput;

    model absolutePositionSensor
      // Inheritance
      extends Hydrodynamic.Connectors.Sensor.absolutePositionSensor_con;
      extends Hydrodynamic.Connectors.Sensor.positionOutput_con;
    equation
// Combine linear and angular displacements into a single vector
      displacement = cat(1, u_abs, theta_abs);
    end absolutePositionSensor;
  end Models;

  package Units
    type SpectrumEnergyDensity = Real(final quantity = "SpectrumEnergyDensity", final unit = "m^2 s/rad");
  end Units;

  package Internal
    package absoluteSensor
      package Models
        partial model absolutePositionSensor
          // Define connector to read translational and rotational positions
          extends OET.Internal.absoluteSensor.Connectors.absolutePositionSensor_con;
        protected
          Real displacement[6] "Combined displacement vector [m, rad]";
        equation
// Combine linear and angular displacements into a single vector
          displacement = cat(1, u_abs, theta_abs);
        end absolutePositionSensor;

        partial model absoluteVelocitySensor
          // Inheritance
          extends OET.Internal.absoluteSensor.Connectors.absoluteVelocitySensor_con;
        protected
          Real velocity[6] "Combined velocity vector [m/s, rad/s]";
        equation
// Combine linear and angular displacements into a single vector
          velocity = cat(1, v_abs, omega_abs);
        end absoluteVelocitySensor;

        model absoluteAccelerationSensor
          // Inheritance
          extends OET.Internal.absoluteSensor.Connectors.absoluteAccelerationSensor_con;
          extends OET.Internal.absoluteSensor.Connectors.accelerationOutput_con;
        equation
// Combine linear and angular displacements into a single vector
          acceleration = cat(1, a_abs, alpha_abs);
        end absoluteAccelerationSensor;

        model absoluteSensors
          extends OET.Internal.absoluteSensor.Models.absolutePositionSensor;
          extends OET.Internal.absoluteSensor.Models.absoluteVelocitySensor;
          extends OET.Internal.absoluteSensor.Models.absoluteAccelerationSensor;
        end absoluteSensors;

        partial model absolutePositionSensor_portB
          // Define connector to read translational and rotational positions
          extends Internal.absoluteSensor.Connectors.absolutePositionSensor_con;
          Modelica.Blocks.Interfaces.RealInput u_abs[3] "Linear displacement vector [m]" annotation(
            Placement(transformation(origin = {100, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 90), iconTransformation(origin = {100, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 90)));
          Modelica.Blocks.Interfaces.RealInput theta_abs[3] "Angular displacement vector [rad]" annotation(
            Placement(transformation(origin = {60, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 90), iconTransformation(origin = {60, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 90)));
        protected
          Real displacement[6] "Combined displacement vector [m, rad]";
        equation
// Combine linear and angular displacements into a single vector
          displacement = cat(1, absoluteDisplacement.u_abs, absoluteDisplacement.theta_abs);
        end absolutePositionSensor_portB;
      end Models;

      package Connectors
        connector absolutePositionSensor_con
          Modelica.Blocks.Interfaces.RealInput u_abs[3] "Linear displacement vector [m]" annotation(
            Placement(visible = true, transformation(origin = {100, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {100, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
          Modelica.Blocks.Interfaces.RealInput theta_abs[3] "Angular displacement vector [rad]" annotation(
            Placement(transformation(origin = {60, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {60, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
          annotation(
            Documentation(info = "<html>
        <p><strong>absolutePosition_con Connector</strong></p>
        <p>This connector is used to specify the absolute position and orientation of a component in a 3-dimensional space. It provides input ports for defining linear and angular displacements.</p>
        <p><strong>Ports:</strong></p>
        <ul>
          <li><strong>u_abs:</strong> A 3-dimensional vector representing linear displacement in meters. This vector describes the position of the component in space relative to a reference point.</li>
          <li><strong>theta_abs:</strong> A 3-dimensional vector representing angular displacement in radians. This vector describes the orientation of the component around each axis.</li>
        </ul>
        <p><strong>Usage:</strong></p>
        <p>Utilize this connector in models where precise positioning and orientation of components are required, such as in robotic arms, mechanical linkages, or spatial transformations.</p>
        </html>"));
        end absolutePositionSensor_con;

        connector positionOutput_con
          Modelica.Blocks.Interfaces.RealOutput displacement[6] "Total displacement vector [m, rad]" annotation(
            Placement(transformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}})));
        end positionOutput_con;

        connector positionInput_con
          Modelica.Blocks.Interfaces.RealInput displacement[6] "Total displacement vector [m, rad]" annotation(
            Placement(transformation(origin = {-120, 50}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 50}, extent = {{-20, -20}, {20, 20}})));
        end positionInput_con;

        connector absoluteVelocitySensor_con
          Modelica.Blocks.Interfaces.RealInput v_abs[3] "Linear velocity vector [m/s]" annotation(
            Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
          Modelica.Blocks.Interfaces.RealInput omega_abs[3] "Angular velocity vector [rad/s]" annotation(
            Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
          annotation(
            Documentation(info = "<html>
        <p><strong>absolutePosition_con Connector</strong></p>
        <p>This connector is used to specify the absolute position and orientation of a component in a 3-dimensional space. It provides input ports for defining linear and angular displacements.</p>
        <p><strong>Ports:</strong></p>
        <ul>
          <li><strong>u_abs:</strong> A 3-dimensional vector representing linear displacement in meters. This vector describes the position of the component in space relative to a reference point.</li>
          <li><strong>theta_abs:</strong> A 3-dimensional vector representing angular displacement in radians. This vector describes the orientation of the component around each axis.</li>
        </ul>
        <p><strong>Usage:</strong></p>
        <p>Utilize this connector in models where precise positioning and orientation of components are required, such as in robotic arms, mechanical linkages, or spatial transformations.</p>
        </html>"));
        end absoluteVelocitySensor_con;

        connector velocityOutput_con
          Modelica.Blocks.Interfaces.RealOutput velocity[6] "Total velocity vector [m/s, rad/s]" annotation(
            Placement(transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}})));
        end velocityOutput_con;

        connector velocityInput_con
          Modelica.Blocks.Interfaces.RealInput velocity[6] "Total velocity vector [m/s, rad/s]" annotation(
            Placement(transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}})));
        end velocityInput_con;

        connector absoluteAccelerationSensor_con
          Modelica.Blocks.Interfaces.RealInput a_abs[3] "Linear acceleration vector [m/s^2]" annotation(
            Placement(transformation(origin = {-60, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-60, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
          Modelica.Blocks.Interfaces.RealInput alpha_abs[3] "Angular velocity vector [rad/s^2]" annotation(
            Placement(transformation(origin = {-100, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-100, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
          annotation(
            Documentation(info = "<html>
        <p><strong>absolutePosition_con Connector</strong></p>
        <p>This connector is used to specify the absolute position and orientation of a component in a 3-dimensional space. It provides input ports for defining linear and angular displacements.</p>
        <p><strong>Ports:</strong></p>
        <ul>
          <li><strong>u_abs:</strong> A 3-dimensional vector representing linear displacement in meters. This vector describes the position of the component in space relative to a reference point.</li>
          <li><strong>theta_abs:</strong> A 3-dimensional vector representing angular displacement in radians. This vector describes the orientation of the component around each axis.</li>
        </ul>
        <p><strong>Usage:</strong></p>
        <p>Utilize this connector in models where precise positioning and orientation of components are required, such as in robotic arms, mechanical linkages, or spatial transformations.</p>
        </html>"));
        end absoluteAccelerationSensor_con;

        connector accelerationOutput_con
          Modelica.Blocks.Interfaces.RealOutput acceleration[6] "Total acceleration vector [m/s^2, rad/s^2]" annotation(
            Placement(transformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {110, -50}, extent = {{-10, -10}, {10, 10}})));
        end accelerationOutput_con;

        connector accelerationInput_con
          Modelica.Blocks.Interfaces.RealInput acceleration[6] "Total acceleration vector [m/s^2, rad/s^2]" annotation(
            Placement(transformation(origin = {-120, -50}, extent = {{-20, -20}, {20, 20}}), iconTransformation(origin = {-120, -50}, extent = {{-20, -20}, {20, 20}})));
        end accelerationInput_con;
      end Connectors;

      package Connector
        connector translationalPosition
          Modelica.Blocks.Interfaces.RealInput u_abs[3] "Linear displacement vector [m]";
          annotation(
            Placement(visible = true, transformation(origin = {100, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {100, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
          annotation(
            defaultComponentName = "TranslationalPosition",
            Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.16), graphics = {Rectangle(extent = {{-10, 10}, {10, -10}}, lineColor = {95, 95, 95}, lineThickness = 0.5), Rectangle(extent = {{-30, 100}, {30, -100}}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid)}),
            Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.16), graphics = {Text(extent = {{-140, -50}, {140, -90}}, textString = "%name"), Rectangle(extent = {{-12, 40}, {12, -40}}, fillColor = {192, 192, 192}, fillPattern = FillPattern.Solid)}));
        end translationalPosition;
      end Connector;
    end absoluteSensor;

    package Force
      partial model forceTorqueOneFrame "Declaring force and torque elements, inheriting forceTorque connector for one frame"
        // Inherit frame_b
        extends Modelica.Mechanics.MultiBody.Interfaces.PartialOneFrame_b;
        Real F[6] = cat(1, f_element, t_element);
        // should alter to make nDoF
      protected
        Modelica.Units.SI.Force f_element[3];
        Modelica.Units.SI.Torque t_element[3];
      equation
        frame_b.f = F[1:3];
        frame_b.t = F[4:6];
      end forceTorqueOneFrame;

      partial model forceTorqueTwoFrame "Declaring force and torque elements, inheriting forceTorque connector for one frame"
        // Inherit frame_a and frame_b
        extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
        Real F[6] = cat(1, f_element, t_element);
        // should alter to make nDoF
      protected
        Modelica.Units.SI.Force f_element[3];
        Modelica.Units.SI.Torque t_element[3];
      equation
        frame_a.f = -F[1:3];
        frame_a.t = -F[4:6];
        frame_b.f = F[1:3];
        frame_b.t = F[4:6];
      end forceTorqueTwoFrame;
    end Force;

    connector Frame_c "Coordinate system fixed to the component with one cut-force and cut-torque (filled rectangular icon)"
      extends Modelica.Mechanics.MultiBody.Interfaces.Frame;
      annotation(
        defaultComponentName = "frame_c",
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.16), graphics = {Rectangle(extent = {{-10, 10}, {10, -10}}, lineColor = {95, 95, 95}, lineThickness = 0.5), Rectangle(extent = {{-30, 100}, {30, -100}}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}, initialScale = 0.16), graphics = {Text(extent = {{-140, -50}, {140, -90}}, textString = "%name", rotation = 90), Rectangle(extent = {{-12, 40}, {12, -40}}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
        Documentation(info = "<html>
<p>
Basic definition of a coordinate system that is fixed to a mechanical
component. In the origin of the coordinate system the cut-force
and the cut-torque is acting.
This component has a filled rectangular icon.
</p>
</html>"));
    end Frame_c;

    partial model PartialThreeFrames "Base model for components providing two frame connectors + outer world + assert to guarantee that the component is connected"
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system a fixed to the component with one cut-force and cut-torque" annotation(
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Coordinate system b fixed to the component with one cut-force and cut-torque" annotation(
        Placement(transformation(extent = {{84, -16}, {116, 16}})));
      OET.Internal.Frame_c frame_c "Coordinate system c fixed to the component with one cut-force and cut-torque" annotation(
        Placement(transformation(extent = {{84, -16}, {116, 16}}, rotation = 90)));
    protected
      outer Modelica.Mechanics.MultiBody.World world;
    equation
      assert(cardinality(frame_a) > 0, "Connector frame_a of component is not connected");
      assert(cardinality(frame_b) > 0, "Connector frame_b of component is not connected");
      assert(cardinality(frame_c) > 0, "Connector frame_c of component is not connected");
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-136, -25}, {-100, -50}}, textColor = {128, 128, 128}, textString = "a"), Text(extent = {{100, -25}, {136, -50}}, textColor = {128, 128, 128}, textString = "b"), Text(extent = {{-18, 110}, {18, 135}}, textColor = {128, 128, 128}, textString = "c")}),
        Documentation(info = "<html>
    <p>
    This partial model provides two frame connectors, access to the world
    object and an assert to check that both frame connectors are connected.
    Therefore, inherit from this partial model if the two frame connectors are
    needed and if the two frame connectors should be connected for a correct model.
    </p>
    </html>"));
    end PartialThreeFrames;
  end Internal;

  package DataImport
    partial record FilePath "Define file name variables"
      parameter String filePath "File path" annotation(
        Dialog(group = "Body Data"));
      parameter String hydroCoeffFile "Hydro coefficient file name" annotation(
        Dialog(group = "Body Data"));
    protected
      parameter String fileDir = filePath + hydroCoeffFile "Full file directory";
    end FilePath;

    model massNoB2BData
      extends DataImport.multibodyData;
    //protected
      parameter Modelica.Units.SI.Mass M[1, 1] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.bodies.m" + bodyIndexString, 1, 1) "Total mass of the body (including ballast)";
      parameter Modelica.Units.SI.Mass Ainf[bodyDoF, bodyDoF] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Ainf" + bodyIndexString, bodyDoF, bodyDoF) "Added mass at maximum (cut-off) frequency";
      parameter Modelica.Units.SI.Mass m[3, 3] = diagonal({M[1, 1], M[1, 1], M[1, 1]}) "Mass matrix of the body (including ballast)";
      parameter Modelica.Units.SI.Mass Ainf11[3, 3] = Ainf[1:3, 1:3] "Upper left block";
      parameter Modelica.Units.SI.Mass Ainf12[3, 3] = Ainf[1:3, 4:6] "Upper right block";
      parameter Modelica.Units.SI.Mass Ainf21[3, 3] = Ainf[4:6, 1:3] "Lower left block";
      parameter Modelica.Units.SI.Mass Ainf22[3, 3] = Ainf[4:6, 4:6] "Lower right block";
    end massNoB2BData;

    model hydrostaticData
      extends DataImport.multibodyData;
    protected
      parameter Modelica.Units.SI.TranslationalSpringConstant Khs[bodyDoF, bodyDoF] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.hydrostatic.Khs" + bodyIndexString, bodyDoF, bodyDoF) "Hydrostatic stiffness";
    end hydrostaticData;

    partial model multibodyData
      extends DataImport.FilePath;
      extends DataImport.BodyIndex;
    protected
      parameter Real nbodies_read = scalar(Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.bodies.Nb", 1, 1)) "Number of bodies";
      parameter Integer nbodies = integer(nbodies_read) "Number of bodies";
      parameter Integer bodyDoF = 6 "Degrees-of-Freedom per body";
      // assuming all bodies are 6 DoF
      parameter Integer nDoF = nbodies*bodyDoF "Total Degrees-of-Freedom";
    end multibodyData;

    partial model frequencyData
      extends DataImport.FilePath;
    protected
      parameter Integer wDim[2] = Modelica.Utilities.Streams.readMatrixSize(fileDir, "hydro.parameters.w") "Dimensions of the frequency vector";
      parameter Real w[:] = vector(Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.parameters.w", wDim[1], 1)) "Angular frequency vector [rad/s]";
    end frequencyData;

    partial model physicalConstantData
      extends DataImport.FilePath;
    protected
      parameter Modelica.Units.SI.Density rho = scalar(Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.parameters.rho", 1, 1)) "Density of seawater [kg/m^3]" annotation(
        Dialog(group = "Environmental Parameters"));
    end physicalConstantData;

    model excitationData
      extends DataImport.multibodyData;
      extends DataImport.frequencyData;
    protected
      parameter Real F_excRe[bodyDoF, wDim[1]] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.excitation.spectralDecomp.re" + bodyIndexString, bodyDoF, wDim[1]) "Real part of excitation force coefficients";
      parameter Real F_excIm[bodyDoF, wDim[1]] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.excitation.spectralDecomp.im" + bodyIndexString, bodyDoF, wDim[1]) "Imaginary part of excitation force coefficients";
    end excitationData;

    partial model radiationDataB2B
      extends DataImport.multibodyData;
    protected
      parameter Real n_stateSpace[nDoF, nDoF] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.order", nDoF, nDoF) "State-space approximation for each mode";
      // probably don't need this
      parameter Integer n_state[2] = Modelica.Utilities.Streams.readMatrixSize(fileDir, "hydro.coefficients.radiation.stateSpace.A") "Number of states for all bodies";
      parameter Real n_states_full_read[1, nbodies] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.bodyOrder", 1, nbodies) "Number of states for all bodies";
      //parameter Integer n_states_full[1, nbodies] = integer(n_states_full_read);
      parameter Real A_full[n_state[1], n_state[1]] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.A", n_state[1], n_state[1]) "State matrix for all bodies";
      parameter Real B_full[n_state[1], nDoF] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.B", n_state[1], nDoF) "Input matrix for all bodies";
      parameter Real C_full[nDoF, n_state[1]] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.C", nDoF, n_state[1]) "Output matrix for all bodies";
      parameter Real D_full[nDoF, nDoF] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.D", nDoF, nDoF) "Feedforward matrix for all bodies";
      parameter Integer n_states = integer(n_states_full_read[1, bodyIndex]) "Number of states";
      Real A[n_states, n_states] = A_full[stateStart + 1:stateStart + n_states, stateStart + 1:stateStart + n_states] "State matrix";
      Real B[n_states, nDoF] = B_full[stateStart + 1:stateStart + n_states, :] "Input matrix";
      Real C[bodyDoF, n_states] = C_full[bodyDoF*(bodyIndex - 1) + 1:bodyDoF*bodyIndex, stateStart + 1:stateStart + n_states] "Output matrix";
      Real D[bodyDoF, nDoF] = D_full[bodyDoF*(bodyIndex - 1) + 1:bodyDoF*bodyIndex, :] "Feedforward matrix";
      parameter Real one[1, 1] = fill(1, 1, 1);
      parameter Real stateStartInter[(nbodies + 1), 1] = cat(1, one, transpose(n_states_full_read)) "Intermediate vector";
      parameter Integer stateStart = integer(sum(stateStartInter[1:bodyIndex]));
    end radiationDataB2B;

    partial model waveData
      extends DataImport.FilePath;
    protected
      parameter Modelica.Units.SI.Length d = scalar(Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.parameters.depth", 1, 1)) "Water depth [m]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      // allow user option to adjust in wave
      /*parameter Modelica.Units.SI.Angle heading = scalar(Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.parameters.heading", 1, 1)) "Wave Heading [theta]" annotation(
                                                              Dialog(group = "Wave Spectrum Parameters"));*/
      // use can adjust, but they shouldn't
    end waveData;

    partial model linearPTOData
      extends DataImport.FilePath;
    protected
      parameter Modelica.Units.SI.TranslationalSpringConstant Kpto[6, 6] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.pto.linear.kpto", 6, 6) "PTO stiffness";
      parameter Modelica.Units.SI.TranslationalDampingConstant Cpto[6, 6] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.pto.linear.cpto", 6, 6) "PTO damping";
    end linearPTOData;

    partial model linearMooringData
      extends OET.DataImport.FilePath;
    protected
      parameter Modelica.Units.SI.TranslationalSpringConstant Km[6, 6] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.mooring.linear.km", 6, 6) "Mooring stiffness";
      parameter Modelica.Units.SI.TranslationalDampingConstant Cm[6, 6] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.mooring.linear.cm", 6, 6) "Mooring damping";
    end linearMooringData;

    model radiationNoB2BData
      extends OET.DataImport.multibodyData;
    protected
      parameter Integer n_state[2] = Modelica.Utilities.Streams.readMatrixSize(fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.A" + bodyIndexString) "Number of states";
      parameter Real A[n_state[1], n_state[1]] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.A" + bodyIndexString, n_state[1], n_state[1]) "State matrix";
      parameter Real B[n_state[1], bodyDoF] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.B" + bodyIndexString, n_state[1], bodyDoF) "Input matrix";
      parameter Real C[bodyDoF, n_state[1]] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.C" + bodyIndexString, bodyDoF, n_state[1]) "Output matrix";
      parameter Real D[bodyDoF, bodyDoF] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.D" + bodyIndexString, bodyDoF, bodyDoF) "Feedforward matrix";
      /*
                          parameter Real A[n_state[1], n_state[1]] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Atest", n_state[1], n_state[1]) "State matrix";
                        parameter Real B[n_state[1], bodyDoF] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.Btest", n_state[1], bodyDoF) "Input matrix";
                        parameter Real C[bodyDoF, n_state[1]] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.C" + bodyIndexString, bodyDoF, n_state[1]) "Output matrix";
                        parameter Real D[bodyDoF, bodyDoF] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.noB2B.D" + bodyIndexString, bodyDoF, bodyDoF) "Feedforward matrix"; */
    end radiationNoB2BData;

    partial model massData_am
      //uncoupled only
      extends DataImport.multibodyData;
    protected
      parameter Modelica.Units.SI.Mass M_full[1, nbodies] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.bodies.m", 1, nbodies) "Total mass of the body (including ballast) for all bodies";
      parameter Modelica.Units.SI.Mass Ainf_full[nDoF, nDoF] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.Ainf", nDoF, nDoF) "Added mass at maximum (cut-off) frequency for all bodies";
      parameter Modelica.Units.SI.Mass M = M_full[1, bodyIndex] "Total mass of the body (including ballast)";
      parameter Modelica.Units.SI.Mass m[3, 3] = diagonal({M, M, M}) "Mass matrix of the body (including ballast)";
      parameter Modelica.Units.SI.Mass Ainf[bodyDoF, bodyDoF] = Ainf_full[bodyDoF*(bodyIndex - 1) + 1:bodyDoF*bodyIndex, bodyDoF*(bodyIndex - 1) + 1:bodyDoF*bodyIndex] "Added mass at maximum (cut-off) frequency";
      parameter Modelica.Units.SI.Mass Ainf11[3, 3] = Ainf[1:3, 1:3] "Upper left block";
      parameter Modelica.Units.SI.Mass Ainf12[3, 3] = Ainf[1:3, 4:6] "Upper right block";
      parameter Modelica.Units.SI.Mass Ainf21[3, 3] = Ainf[4:6, 1:3] "Lower left block";
      parameter Modelica.Units.SI.Mass Ainf22[3, 3] = Ainf[4:6, 4:6] "Lower right block";
    end massData_am;

    record BodyIndex "Define body index variable"
      parameter Integer bodyIndex = 1 "Body index corresponding to BEM results" annotation(
        Dialog(group = "Body Data"));
      parameter String bodyIndexString = String(bodyIndex);
    end BodyIndex;

    record GeometryFile "Define file name variables"
      parameter String geometryFile "Geometry file name" annotation(
        Dialog(group = "Body Data"));
    end GeometryFile;

    partial model spectrumImportData
      extends DataImport.FilePath;
      parameter Integer SDim[2] = Modelica.Utilities.Streams.readMatrixSize(fileDir, "hydro.wave.spectrumImport.w") "Dimensions of the frequency vector";
      parameter Integer n_omega = SDim[2];
      parameter Real omega[n_omega] = vector(Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.wave.spectrumImport.w", 1, n_omega)) "Angular frequency vector [rad/s]";
      parameter Real S[n_omega] = vector(Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.wave.spectrumImport.S", 1, n_omega)) "Spectral Density";
      parameter Real phi[n_omega] = vector(Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.wave.spectrumImport.phase", 1, n_omega)) "Phase vector";
    end spectrumImportData;

    partial model radiationDataTester
      extends DataImport.multibodyData;
      parameter Real n_stateSpace[nDoF, nDoF] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.order", nDoF, nDoF) "State-space approximation for each mode";
      // probably don't need this
      parameter Integer n_state[2] = Modelica.Utilities.Streams.readMatrixSize(fileDir, "hydro.coefficients.radiation.stateSpace.A") "Number of states for all bodies";
      parameter Real n_states_full_read[1, nbodies] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.bodyOrder", 1, nbodies) "Number of states for all bodies";
      parameter Real n_states_full_read_Uncoupled[1, nbodies] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.bodyOrderUncoupled", 1, nbodies) "Number of states for all bodies uncoupled";
      //parameter Integer n_states_full[1, nbodies] = integer(n_states_full_read);
      //parameter Integer n_states_full_Uncoupled[1,nbodies] = integer(n_states_full_read_Uncoupled);
      parameter Real A_full[n_state[1], n_state[1]] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.A", n_state[1], n_state[1]) "State matrix for all bodies";
      parameter Real B_full[n_state[1], nDoF] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.B", n_state[1], nDoF) "Input matrix for all bodies";
      parameter Real C_full[nDoF, n_state[1]] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.C", nDoF, n_state[1]) "Output matrix for all bodies";
      parameter Real D_full[nDoF, nDoF] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.coefficients.radiation.stateSpace.D", nDoF, nDoF) "Feedforward matrix for all bodies";
      parameter Integer n_states = integer(n_states_full_read[1, bodyIndex]) "Number of states";
      parameter Integer n_states_Uncoupled = integer(n_states_full_read_Uncoupled[1, bodyIndex]) "Number of states";
      Real A[n_states_Uncoupled, n_states_Uncoupled] = A_full[stateStart + 1:stateStart + n_states_Uncoupled, stateStart + 1:stateStart + n_states_Uncoupled];
      //Real A[n_states_Uncoupled, n_states_Uncoupled] = zeros(n_states_Uncoupled,n_states_Uncoupled) "State matrix";
      Real B[n_states_Uncoupled, bodyDoF] = B_full[stateStart + 1:stateStart + n_states_Uncoupled, bodyDoF*(bodyIndex - 1) + 1:bodyDoF*bodyIndex] "Input matrix";
      //Real B[n_states_Uncoupled, bodyDoF] = zeros(n_states_Uncoupled, bodyDoF) "Input matrix";
      Real C[bodyDoF, n_states_Uncoupled] = C_full[bodyDoF*(bodyIndex - 1) + 1:bodyDoF*bodyIndex, stateStart + 1:stateStart + n_states_Uncoupled] "Output matrix";
      //Real C[bodyDoF, n_states_Uncoupled] = zeros(bodyDoF, n_states_Uncoupled) "Output matrix";
      Real D[bodyDoF, bodyDoF] = D_full[bodyDoF*(bodyIndex - 1) + 1:bodyDoF*bodyIndex, bodyDoF*(bodyIndex - 1) + 1:bodyDoF*bodyIndex] "Feedforward matrix";
      //Real D[bodyDoF, bodyDoF] = zeros(bodyDoF, bodyDoF) "Feedforward matrix";
      parameter Real one[1, 1] = fill(1, 1, 1);
      parameter Real stateStartInter[(nbodies + 1), 1] = cat(1, one, transpose(n_states_full_read_Uncoupled)) "Intermediate vector";
      parameter Integer stateStart = integer(sum(stateStartInter[1:bodyIndex]));
    end radiationDataTester;

    model bodyData
      extends DataImport.multibodyData;
    
    protected
        parameter Modelica.Units.SI.Volume vol[1, 1] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.bodies.vol" + bodyIndexString, 1, 1) "Body volume";
    
        parameter Modelica.Units.SI.Height cg[3, 1] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.bodies.cg" + bodyIndexString, 3, 1) "Center of gravity"; 
        
        parameter Modelica.Units.SI.Height cb[3, 1] = Modelica.Utilities.Streams.readRealMatrix(fileDir, "hydro.bodies.cb" + bodyIndexString, 3, 1) "Center of buoyancy"; 
    equation

    end bodyData;
  end DataImport;

  package Hydro
    model HydrodynamicBody "6-Dimensional Hydrodynamic Forces and Moments Calculation"
      // Inheritance
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
      extends DataImport.GeometryFile(geometryFile = "None");
      extends DataImport.BodyIndex;
      // Simulation parameters w/ implicit connections
      outer OET.Hydro.FilePath fileDirectory;
      // Body data
      parameter Boolean animationEnable = false "Enable animation with stl geometry file" annotation(
        Dialog(group = "Body Data"));
      // Mass parameters
      Body body(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex, geometryFile = fileDirectory.filePath + geometryFile, ra_CM = ra_CM, rCM_b = rCM_b, ra_b = ra_b, I_11 = I_11, I_22 = I_22, I_33 = I_33, I_21 = I_21, I_31 = I_31, I_32 = I_32, r_0Init = r_0Init, v_0Init = v_0Init, a_0Init = a_0Init, angles_0Init = angles_0Init, w_0Init = w_0Init, z_0Init = z_0Init) annotation(
        Placement(transformation(origin = {0, -38}, extent = {{-12, -12}, {12, 12}})));
      parameter Modelica.Units.SI.Length ra_CM[3] = {0, 0, 0} "Position vector between joint A and the centre of mass" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Length rCM_b[3] = {0, 0, 0} "Position vector between the centre of mass and joint B" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Length ra_b[3] = ra_CM + rCM_b "Position vector between joint A and joint B" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_11 = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_22 = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_33 = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_21 = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_31 = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_32 = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Distance r_0Init[3] = {0, 0, 0} "Initial translational position vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.Velocity v_0Init[3] = {0, 0, 0} "Initial translational velocity vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.Acceleration a_0Init[3] = {0, 0, 0} "Initial translational acceleration vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.Angle angles_0Init[3] = {0, 0, 0} "Initial angular position vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.AngularVelocity w_0Init[3] = {0, 0, 0} "Initial angular velocity vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.AngularAcceleration z_0Init[3] = {0, 0, 0} "Initial angular acceleration vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      // Hydrostatic
      Hydrostatic hydrostatic(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex, enableHydrostaticForce = enableHydrostaticForce, offset = offset) if enableHydrostaticForce annotation(
        Placement(transformation(origin = {-80, 48}, extent = {{18, -18}, {-18, 18}})));
      parameter Boolean enableHydrostaticForce = true "Switch to enable/disable hydrostatic force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Hydrostatic"));
      parameter Real offset[6];
      // Radiation
      Radiation radiation(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex, enableRadiationForce = enableRadiationForce) if enableRadiationForce annotation(
        Placement(transformation(origin = {34, 48}, extent = {{-18, -18}, {18, 18}})));
      parameter Boolean enableRadiationForce = true "Switch to enable/disable radiation force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Radiation"));
      // Excitation
      Excitation excitation(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex) if enableExcitationForce annotation(
        Placement(transformation(origin = {-32, 48}, extent = {{18, -18}, {-18, 18}})));
      parameter Boolean enableExcitationForce = true "Switch to enable/disable excitation force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Excitation"));
      // Damping/drag
      DampingDrag dampingDrag(enableDampingDragForce = enableDampingDragForce) if enableDampingDragForce annotation(
        Placement(transformation(origin = {78, 48}, extent = {{-18, -18}, {18, 18}})));
      parameter Boolean enableDampingDragForce = true "Switch to enable/disable damping/drag force calculation" annotation(
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Damping/Drag"));
  // Sensor (validation)
    equation
//Conections
      connect(hydrostatic.frame_a, body.frame_c) annotation(
        Line(points = {{-62, 48}, {-56, 48}, {-56, -26}, {0, -26}}, color = {95, 95, 95}));
/*
        
          connect(body1.frame_a, frame_a) annotation(
        Line(points = {{-10, -38}, {-100, -38}, {-100, 0}}, color = {95, 95, 95}));
      connect(body1.frame_a, frame_b) annotation(
        Line(points = {{14, -38}, {100, -38}, {100, 0}}, color = {95, 95, 95}));
      connect(hydrostatic.frame_a, body1.frame_a) annotation(
        Line(points = {{-50, 50}, {-46, 50}, {-46, -26}, {2, -26}}, color = {95, 95, 95}));
      connect(excitation.frame_a, body1.frame_a) annotation(
        Line(points = {{-10, 54}, {-4, 54}, {-4, -26}, {2, -26}}, color = {95, 95, 95}));
      connect(radiation.frame_a, body1.frame_a) annotation(
        Line(points = {{18, 58}, {2, 58}, {2, -26}}, color = {95, 95, 95}));
      connect(dampingDrag.frame_a, body1.frame_a) annotation(
        Line(points = {{62, 54}, {58, 54}, {58, -26}, {2, -26}}, color = {95, 95, 95}));
      */
      connect(dampingDrag.frame_a, body.frame_c) annotation(
        Line(points = {{60, 48}, {56, 48}, {56, -26}, {0, -26}}, color = {95, 95, 95}));
      connect(radiation.frame_a, body.frame_c) annotation(
        Line(points = {{16, 48}, {0, 48}, {0, -26}}, color = {95, 95, 95}));
      connect(excitation.frame_a, body.frame_c) annotation(
        Line(points = {{-14, 48}, {0, 48}, {0, -26}}, color = {95, 95, 95}));
      connect(body.frame_a, frame_a) annotation(
        Line(points = {{-12, -38}, {-100, -38}, {-100, 0}}, color = {95, 95, 95}));
      connect(body.frame_b, frame_b) annotation(
        Line(points = {{12, -38}, {100, -38}, {100, 0}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 145}, {150, 105}}, textString = "%name", textColor = {0, 0, 255}), Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Hydro Body")}),
        Diagram);
    end HydrodynamicBody;

    model RadiationForceB2B "Radiation force and torque calculation"
      // Import hydro coefficients
      extends DataImport.radiationDataB2B;
      // Inherit frame_a
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialOneFrame_a;
      // Velocity connectors
      Modelica.Blocks.Interfaces.RealInput v_abs[3] "Linear velocity vector [m/s]" annotation(
        HideResult = true,
        Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput omega_abs[3] "Angular velocity vector [rad/s]" annotation(
        HideResult = true,
        Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector [N,Nm]";
      // Enable/disable radiation force
      parameter Boolean enableRadiationForce = true "Switch to enable/disable radiation force calculation" annotation(
        HideResult = true,
        Dialog(group = "Radiation Force Parameters"));
      Real velocityVector[nDoF];
    protected
      Real velocity[6] = cat(1, v_abs, omega_abs) "Combined velocity vector [m/s, rad/s]";
      Modelica.Units.SI.Force f_element[3];
      Modelica.Units.SI.Torque t_element[3];
      Real x[n_states] "Dummy variable state vector";
    initial equation
      x = zeros(n_states) "Initialize state vector to zero";
    equation
      for i in 1:bodyDoF loop
        velocityVector[bodyDoF*(bodyIndex - 1) + i] = velocity[i];
      end for;
// Use the switch to conditionally output the radiation force torque element
      if enableRadiationForce then
// Radiation state space
        der(x) = A*x + B*velocityVector;
        F = C*x + D*velocityVector;
      else
        x = zeros(n_states);
        F = zeros(6);
      end if;
      frame_a.f = f_element;
      frame_a.t = t_element;
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Radiation Force")}));
    end RadiationForceB2B;

    model HydrostaticForce "Hydrostatic Force and Torque Calculation"
      // Import hydro coefficients
      //extends DataImport.FilePath;
      //extends DataImport.BodyIndex;
      extends DataImport.massNoB2BData;
      extends DataImport.hydrostaticData;  
      extends DataImport.bodyData;
      extends DataImport.physicalConstantData;
      // Inherit frame_a
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialOneFrame_a;
      // Position connectors
      Modelica.Blocks.Interfaces.RealInput u_abs[3] "Linear displacement vector [m]" annotation(
        HideResult = true,
        Placement(visible = true, transformation(origin = {-100, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-100, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput theta_abs[3] "Angular displacement vector [rad]" annotation(
        HideResult = true,
        Placement(transformation(origin = {-60, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-60, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector [N,Nm]";
      parameter Boolean enableHydrostaticForce "Switch to enable/disable hydrostatic force calculation" annotation(
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Hydrostatic"));
      Real offset[6];
      // = {0,0,21.29,0,0,0};
      constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "Acceleration due to gravity [m/s^2]";
      //Modelica.Units.SI.Force fg = M[1,1]*g;
     // Modelica.Units.SI.Force fb = vol[1,1]*rho*g;
     // Modelica.Units.SI.Force Fg[3] = {0,0,fg};
     // Modelica.Units.SI.Force Fb[3] = {0,0,fb};
     // Modelica.Units.SI.Force Fnet[3] = Fg - Fb;
     // Modelica.Units.SI.Position cgbM[3,1] = cb - cg;
     // Modelica.Units.SI.Position cgb[3] = cgbM[:,1];
      //Modelica.Units.SI.Torque Tnet[3];
     // Real ll[3];
      
    protected
      Real displacement[6] = cat(1, u_abs, theta_abs) "Combined displacement vector [m, rad]";
      Modelica.Units.SI.Force f_element[3];
      Modelica.Units.SI.Torque t_element[3];
      //Real offset[6] = {0,0,0,0,0,0};
    equation
//ll = {cgb[3]*sin(theta_abs[2]),0,cgb[3]*cos(theta_abs[2])};
// Tnet = cross(Fb,-ll);
// Use the switch to conditionally output the hydrostatic force torque element
      if enableHydrostaticForce then
// Calculate the hydrostatic force/torque vector
        F = Khs*(displacement + offset);
      else
        F = zeros(6);
      end if;
      frame_a.f = f_element;
      frame_a.t = t_element;
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Hydrostatic Force")}));
    end HydrostaticForce;

    model DampingDragForce "Drag Force and Torque Calculation"
      // Inherit frame_a
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialOneFrame_a;
      parameter Boolean enableDampingDragForce = false "Switch to enable/disable damping drag force calculation" annotation(
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Damping/Drag"));
      // Velocity connectors
      Modelica.Blocks.Interfaces.RealInput v_abs[3] "Linear velocity vector [m/s]" annotation(
        HideResult = true,
        Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput omega_abs[3] "Angular velocity vector [rad/s]" annotation(
        HideResult = true,
        Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      // Damping coefficients
      parameter Real Cvtx = 0 "Translational damping coefficient for x-axis [-]" annotation(
        HideResult = true);
      parameter Real Cvty = 0 "Translational damping coefficient for y-axis [-]" annotation(
        HideResult = true);
      parameter Real Cvtz = 0 "Translational damping coefficient for z-axis [-]" annotation(
        HideResult = true);
      parameter Real Cvrx = 0 "Rotational damping coefficient for x-axis [-]" annotation(
        HideResult = true);
      parameter Real Cvry = 0 "Rotational damping coefficient for y-axis [-]" annotation(
        HideResult = true);
      parameter Real Cvrz = 1000 "Rotational damping coefficient for z-axis [-]" annotation(
        HideResult = true);
      parameter Real Cv[6, 6] = diagonal({Cvtx, Cvty, Cvtz, Cvrx, Cvry, Cvrz}) "Combined damping coefficient matrix";
      // Drag coefficients
      parameter Real Cdtx = 0 "Translational drag coefficient for x-axis [-]" annotation(
        HideResult = true);
      parameter Real Cdty = 0 "Translational drag coefficient for y-axis [-]" annotation(
        HideResult = true);
      parameter Real Cdtz = 0 "Translational drag coefficient for z-axis [-]" annotation(
        HideResult = true);
      parameter Real Cdrx = 0 "Rotational drag coefficient for x-axis [-]" annotation(
        HideResult = true);
      parameter Real Cdry = 0 "Rotational drag coefficient for y-axis [-]" annotation(
        HideResult = true);
      parameter Real Cdrz = 0 "Rotational drag coefficient for z-axis [-]" annotation(
        HideResult = true);
      parameter Real Cd[6, 6] = diagonal({Cdtx, Cdty, Cdtz, Cdrx, Cdry, Cdrz}) "Combined drag coefficient matrix";
      Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector [N,Nm]";
    protected
      Real velocity[6] = cat(1, v_abs, omega_abs) "Combined velocity vector [m/s, rad/s]";
      Modelica.Units.SI.Force f_element[3];
      Modelica.Units.SI.Torque t_element[3];
    equation
// Use the switch to conditionally output the damping drag force and torque
      if enableDampingDragForce then
// Calculate the damping/drag force/torque vector
        F = Cv*velocity + Cd*velocity.*abs(velocity);
      else
        F = zeros(6);
      end if;
      frame_a.f = f_element;
      frame_a.t = t_element;
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Damping/Drag Force")}));
    end DampingDragForce;

    model Excitation "Excitation Force"
      extends DataImport.FilePath;
      extends DataImport.BodyIndex;
      // Simulation parameters w/ implicit connections
      outer OET.Wave.Environment environment;
      // Frame_a connector
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed at body" annotation(
        HideResult = true,
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      parameter String waveSelector = environment.waveSelector;
      parameter String frequencySelection = environment.frequencySelection;
      // Regular
      ExcitationRegularWave excitationRegularWave(A = environment.regularWave.A, omegaPeak = environment.regularWave.omegaPeak, Trmp = environment.Trmp, ramp = environment.regularWave.ramp, filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex) if environment.waveSelector == "Regular" annotation(
        Placement(transformation(origin = {-4, -4}, extent = {{-10, -10}, {10, 10}})));
      //if environment.waveSelector == "Regular"
      // Irregular
      ExcitationIrregularWave excitationIrregularWaveRand(n_omega = environment.irregularWave.n_omega, omega = environment.irregularWave.RandomGen.omega, zeta = environment.irregularWave.RandomGen.zeta, phi = environment.irregularWave.RandomGen.phi, Trmp = environment.Trmp, ramp = environment.irregularWave.RandomGen.ramp, filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex) if (waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP") and frequencySelection == "random" annotation(
        Placement(transformation(origin = {-2, 42}, extent = {{-10, -10}, {10, 10}})));
        
      ExcitationIrregularWave excitationIrregularWaveEE(n_omega = environment.irregularWave.n_omega, omega = environment.irregularWave.EeGen.omega, zeta = environment.irregularWave.EeGen.zeta, phi = environment.irregularWave.EeGen.phi, Trmp = environment.Trmp, ramp = environment.irregularWave.EeGen.ramp, filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex) if (waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP") and frequencySelection == "equalEnergy" annotation(
        Placement(transformation(origin = {-10, 18}, extent = {{-10, -10}, {10, 10}})));
      //  if waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP"
      // Spectrum import
      ExcitationIrregularWave excitationSpectrumImport(n_omega = environment.spectrumImport.n_omega, omega = environment.spectrumImport.omega, zeta = environment.spectrumImport.zeta, phi = environment.spectrumImport.phi, Trmp = environment.Trmp, ramp = environment.spectrumImport.ramp, filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex) if waveSelector == "spectrumImport";
      //  if waveSelector == "spectrumImport"
    equation
      connect(excitationRegularWave.frame_a, frame_a) annotation(
        Line(points = {{-14, -4}, {-100, -4}, {-100, 0}}, color = {95, 95, 95}));
      connect(excitationIrregularWaveRand.frame_a, frame_a) annotation(
        Line(points = {{-12, 42}, {-100, 42}, {-100, 0}}, color = {95, 95, 95}));
      connect(excitationIrregularWaveEE.frame_a, frame_a) annotation(
        Line(points = {{-20, 18}, {-20, 42}, {-100, 42}, {-100, 0}}, color = {95, 95, 95}));    
      connect(excitationSpectrumImport.frame_a, frame_a) annotation(
        Line(points = {{-14, -36}, {-100, -36}, {-100, 0}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Excitation")}),
        Diagram(coordinateSystem(extent = {{-120, 60}, {20, -40}})));
    end Excitation;

    model FilePath "Block to locally change file name"
      extends DataImport.FilePath(filePath = "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox", hydroCoeffFile = "/RM3HydroCoeff.mat");
      annotation(
        defaultComponentName = "fileDirectory",
        defaultComponentPrefixes = "inner",
        missingInnerMessage = "No \"filepath\" component is defined. Drag the OET.Hydro.FilePath model into the top level of your model.");
    end FilePath;

    model ForceToqueSum
      extends Modelica.Blocks.Icons.Block;
      extends Connector.forceandTorque_con;
      extends Connector.forceTorqueSum_con;
      Real f[6];
    equation
      f = Fr + Fd + Fhs + Fex;
      F = f[1:3];
      T = f[4:6];
    end ForceToqueSum;

    model BodyShape "Rigid body with mass, inertia tensor, different shapes for animation, and two frame connectors (12 potential states)"
      extends DataImport.massData;
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed to the component with one cut-force and cut-torque" annotation(
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Coordinate system fixed to the component with one cut-force and cut-torque" annotation(
        Placement(transformation(extent = {{84, -16}, {116, 16}})));
      parameter Boolean animation = true "= true, if animation shall be enabled (show shape between frame_a and frame_b and optionally a sphere at the center of mass)";
      parameter Boolean animateSphere = true "= true, if mass shall be animated as sphere provided animation=true";
      parameter Modelica.Units.SI.Position r[3](start = {0, 0, 0}) "Vector from frame_a to frame_b resolved in frame_a";
      parameter Modelica.Units.SI.Position r_CM[3](start = {0, 0, 0}) "Vector from frame_a to center of mass, resolved in frame_a";
      parameter Modelica.Units.SI.Mass m(min = 0, start = 1) = M + Ainf[3, 3] "Mass of rigid body";
      parameter Modelica.Units.SI.Inertia I_11(min = 0) = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_22(min = 0) = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_33(min = 0) = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_21(min = -10000000) = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_31(min = -10000000) = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_32(min = -10000000) = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      Modelica.Units.SI.Position r_0[3](start = {0, 0, 0}, each stateSelect = if enforceStates then StateSelect.always else StateSelect.avoid) "Position vector from origin of world frame to origin of frame_a" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      Modelica.Units.SI.Velocity v_0[3](start = {0, 0, 0}, each stateSelect = if enforceStates then StateSelect.always else StateSelect.avoid) "Absolute velocity of frame_a, resolved in world frame (= der(r_0))" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      Modelica.Units.SI.Acceleration a_0[3](start = {0, 0, 0}) "Absolute acceleration of frame_a resolved in world frame (= der(v_0))" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      parameter Boolean angles_fixed = false "= true, if angles_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.Angle angles_start[3] = {0, 0, 0} "Initial values of angles to rotate world frame around 'sequence_start' axes into frame_a" annotation(
        Dialog(tab = "Initialization"));
      parameter Modelica.Mechanics.MultiBody.Types.RotationSequence sequence_start = {1, 2, 3} "Sequence of rotations to rotate world frame into frame_a at initial time" annotation(
        Evaluate = true,
        Dialog(tab = "Initialization"));
      parameter Boolean w_0_fixed = false "= true, if w_0_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.AngularVelocity w_0_start[3] = {0, 0, 0} "Initial or guess values of angular velocity of frame_a resolved in world frame" annotation(
        Dialog(tab = "Initialization"));
      parameter Boolean z_0_fixed = false "= true, if z_0_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.AngularAcceleration z_0_start[3] = {0, 0, 0} "Initial values of angular acceleration z_0 = der(w_0)" annotation(
        Dialog(tab = "Initialization"));
      parameter Modelica.Mechanics.MultiBody.Types.ShapeType shapeType = "cylinder" "Type of shape" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Units.SI.Position r_shape[3] = {0, 0, 0} "Vector from frame_a to shape origin, resolved in frame_a" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection = Modelica.Units.Conversions.to_unit1(r - r_shape) "Vector in length direction of shape, resolved in frame_a" annotation(
        Evaluate = true,
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Mechanics.MultiBody.Types.Axis widthDirection = {0, 1, 0} "Vector in width direction of shape, resolved in frame_a" annotation(
        Evaluate = true,
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Units.SI.Length length = Modelica.Math.Vectors.length(r - r_shape) "Length of shape" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Units.SI.Distance width = length/world.defaultWidthFraction "Width of shape" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Units.SI.Distance height = width "Height of shape" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Mechanics.MultiBody.Types.ShapeExtra extra = 0.0 "Additional parameter depending on shapeType (see docu of Visualizers.Advanced.Shape)" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      input Modelica.Mechanics.MultiBody.Types.Color color = Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor "Color of shape" annotation(
        Dialog(colorSelector = true, tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Units.SI.Diameter sphereDiameter = 2*width "Diameter of sphere" annotation(
        Dialog(tab = "Animation", group = "if animation = true and animateSphere = true", enable = animation and animateSphere));
      input Modelica.Mechanics.MultiBody.Types.Color sphereColor = color "Color of sphere of mass" annotation(
        Dialog(colorSelector = true, tab = "Animation", group = "if animation = true and animateSphere = true", enable = animation and animateSphere));
      input Modelica.Mechanics.MultiBody.Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient "Reflection of ambient light (= 0: light is completely absorbed)" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Boolean enforceStates = false "= true, if absolute variables of body object shall be used as states (StateSelect.always)" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced"));
      parameter Boolean useQuaternions = true "= true, if quaternions shall be used as potential states otherwise use 3 angles as potential states" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced"));
      parameter Modelica.Mechanics.MultiBody.Types.RotationSequence sequence_angleStates = {1, 2, 3} "Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced", enable = not useQuaternions));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation frameTranslation(r = r, animation = false) annotation(
        Placement(transformation(extent = {{-20, -20}, {20, 20}})));
      Modelica.Mechanics.MultiBody.Parts.Body body(r_CM = r_CM, m = m, I_11 = I_11, I_22 = I_22, I_33 = I_33, I_21 = I_21, I_31 = I_31, I_32 = I_32, animation = false, sequence_start = sequence_start, angles_fixed = angles_fixed, angles_start = angles_start, w_0_fixed = w_0_fixed, w_0_start = w_0_start, z_0_fixed = z_0_fixed, z_0_start = z_0_start, useQuaternions = useQuaternions, sequence_angleStates = sequence_angleStates, enforceStates = false) annotation(
        Placement(transformation(extent = {{-27.3333, -70.3333}, {13, -30}})));
    protected
      outer Modelica.Mechanics.MultiBody.World world;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape1(shapeType = shapeType, color = color, specularCoefficient = specularCoefficient, length = length, width = width, height = height, lengthDirection = lengthDirection, widthDirection = widthDirection, r_shape = r_shape, extra = extra, r = frame_a.r_0, R = frame_a.R) if world.enableAnimation and animation;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape2(shapeType = "sphere", color = sphereColor, specularCoefficient = specularCoefficient, length = sphereDiameter, width = sphereDiameter, height = sphereDiameter, lengthDirection = {1, 0, 0}, widthDirection = {0, 1, 0}, r_shape = r_CM - {1, 0, 0}*sphereDiameter/2, r = frame_a.r_0, R = frame_a.R) if world.enableAnimation and animation and animateSphere;
    equation
      r_0 = frame_a.r_0;
      v_0 = der(r_0);
      a_0 = der(v_0);
      connect(frame_a, frameTranslation.frame_a) annotation(
        Line(points = {{-100, 0}, {-20, 0}}, color = {95, 95, 95}, thickness = 0.5));
      connect(frame_b, frameTranslation.frame_b) annotation(
        Line(points = {{100, 0}, {20, 0}}, color = {95, 95, 95}, thickness = 0.5));
      connect(frame_a, body.frame_a) annotation(
        Line(points = {{-100, 0}, {-60, 0}, {-60, -50.1666}, {-27.3333, -50.1666}}, color = {95, 95, 95}, thickness = 0.5));
      annotation(
        Documentation(info = "<html>
        <p>
        <strong>Rigid body</strong> with mass and inertia tensor and <strong>two frame connectors</strong>.
        All parameter vectors have to be resolved in frame_a.
        The <strong>inertia tensor</strong> has to be defined with respect to a
        coordinate system that is parallel to frame_a with the
        origin at the center of mass of the body. The coordinate system <strong>frame_b</strong>
        is always parallel to <strong>frame_a</strong>.
        </p>
        <p>
        By default, this component is visualized by any <strong>shape</strong> that can be
        defined with Modelica.Mechanics.MultiBody.Visualizers.FixedShape. This shape is placed
        between frame_a and frame_b (default: length(shape) = Frames.length(r)).
        Additionally a <strong>sphere</strong> may be visualized that has
        its center at the center of mass.
        Note, that
        the animation may be switched off via parameter animation = <strong>false</strong>.
        </p>
        <p>
        <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Parts/BodyShape.png\" alt=\"Parts.BodyShape\">
        </p>
        
        <p>
        The following shapes can be defined via parameter <strong>shapeType</strong>,
        e.g., shapeType=\"cone\":
        </p>
        
        <p>
        <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Visualizers/FixedShape.png\" alt=\"Visualizers.FixedShape\">
        </p>
        
        <p>
        A BodyShape component has potential states. For details of these
        states and of the \"Advanced\" menu parameters, see model
        <a href=\"modelica://Modelica.Mechanics.MultiBody.Parts.Body\">MultiBody.Parts.Body</a>.
        </p>
        </html>"),
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 110}, {150, 70}}, textString = "%name", textColor = {0, 0, 255}), Text(extent = {{-150, -100}, {150, -70}}, textString = "r=%r"), Rectangle(extent = {{-100, 30}, {101, -30}}, lineColor = {0, 24, 48}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {0, 127, 255}, radius = 10), Ellipse(extent = {{-60, 60}, {60, -60}}, lineColor = {0, 24, 48}, fillPattern = FillPattern.Sphere, fillColor = {0, 127, 255}), Text(extent = {{-50, 24}, {55, -27}}, textString = "%m"), Text(extent = {{55, 12}, {91, -13}}, textString = "b"), Text(extent = {{-92, 13}, {-56, -12}}, textString = "a")}),
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-100, 9}, {-100, 43}}, color = {128, 128, 128}), Line(points = {{100, 0}, {100, 44}}, color = {128, 128, 128}), Line(points = {{-100, 40}, {90, 40}}, color = {135, 135, 135}), Polygon(points = {{90, 44}, {90, 36}, {100, 40}, {90, 44}}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid), Text(extent = {{-22, 68}, {20, 40}}, textColor = {128, 128, 128}, textString = "r"), Line(points = {{-100, -10}, {-100, -90}}, color = {128, 128, 128}), Line(points = {{-100, -84}, {-10, -84}}, color = {128, 128, 128}), Polygon(points = {{-10, -80}, {-10, -88}, {0, -84}, {-10, -80}}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid), Text(extent = {{-82, -66}, {-56, -84}}, textColor = {128, 128, 128}, textString = "r_CM"), Line(points = {{0, -46}, {0, -90}}, color = {128, 128, 128})}));
    end BodyShape;

    model Hydrostatic "Hydrostatic force"
      extends DataImport.FilePath;
      extends DataImport.BodyIndex;
      parameter Boolean enableHydrostaticForce "Switch to enable/disable hydrostatic force calculation" annotation(
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Hydrostatic"));
      // Frame_a connector
      parameter Real offset[6];
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed at body" annotation(
        HideResult = true,
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_r = true, get_angles = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world) annotation(
        Placement(transformation(origin = {1, 53}, extent = {{-15, -15}, {15, 15}})));
      HydrostaticForce hydrostaticForce(enableHydrostaticForce = enableHydrostaticForce, filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex, offset = offset) annotation(
        Placement(transformation(origin = {2, 0}, extent = {{-18, -18}, {18, 18}})));
    equation
      connect(absoluteSensor.frame_a, frame_a) annotation(
        Line(points = {{-14, 54}, {-100, 54}, {-100, 0}}, color = {95, 95, 95}));
      connect(absoluteSensor.r, hydrostaticForce.u_abs) annotation(
        Line(points = {{-14, 36}, {-16, 36}, {-16, 21}}, color = {0, 0, 127}, thickness = 0.5));
      connect(absoluteSensor.angles, hydrostaticForce.theta_abs) annotation(
        Line(points = {{4, 36}, {-9, 36}, {-9, 21}}, color = {0, 0, 127}, thickness = 0.5));
      connect(hydrostaticForce.frame_a, frame_a) annotation(
        Line(points = {{-16, 0}, {-100, 0}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Hydrostatic")}),
        Diagram);
    end Hydrostatic;

    model DampingDrag "Damping/Drag Force"
      parameter Boolean enableDampingDragForce = true "Switch to enable/disable damping/drag force calculation" annotation(
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Damping/Drag"));
      // Frame_a connector
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed at body" annotation(
        HideResult = true,
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      DampingDragForce dampingDragForce(enableDampingDragForce = enableDampingDragForce) annotation(
        Placement(transformation(origin = {1, -1}, extent = {{-13, -13}, {13, 13}})));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_v = true, get_w = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world) annotation(
        HideResult = true,
        Placement(transformation(origin = {0, 64}, extent = {{-12, -12}, {12, 12}})));
    equation
      connect(absoluteSensor.frame_a, frame_a) annotation(
        Line(points = {{-12, 64}, {-100, 64}, {-100, 0}}, color = {95, 95, 95}));
      connect(absoluteSensor.v, dampingDragForce.v_abs) annotation(
        Line(points = {{-8, 50}, {-2, 50}, {-2, 14}}, color = {0, 0, 127}, thickness = 0.5));
      connect(absoluteSensor.w, dampingDragForce.omega_abs) annotation(
        Line(points = {{8, 50}, {4, 50}, {4, 14}}, color = {0, 0, 127}, thickness = 0.5));
      connect(dampingDragForce.frame_a, frame_a) annotation(
        Line(points = {{-12, 0}, {-100, 0}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Damping/Drag")}),
        Diagram);
    end DampingDrag;

    model RadiationForce "Radiation force and torque calculation"
      // Import hydro coefficients
      extends DataImport.FilePath;
      extends DataImport.BodyIndex;
      extends DataImport.radiationNoB2BData;
      // Inherit frame_a
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialOneFrame_a;
      // Velocity connectors
      Modelica.Blocks.Interfaces.RealInput v_abs[3] "Linear velocity vector [m/s]" annotation(
        HideResult = true,
        Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput omega_abs[3] "Angular velocity vector [rad/s]" annotation(
        HideResult = true,
        Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector [N,Nm]";
      parameter Boolean enableRadiationForce = true "Switch to enable/disable radiation force calculation" annotation(
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Radiation"));
      // protected here
      Real velocity[6] = cat(1, v_abs, omega_abs) "Combined velocity vector [m/s, rad/s]";
      // Real rt = Frames.resolve2(frame_a.R, frame_a.r_0);
      // Real vtl[6] =
      // Real velocity[6] = cat(1, v_abs, omega_abs) "Combined velocity vector [m/s, rad/s]";
      Modelica.Units.SI.Force f_element[3];
      Modelica.Units.SI.Torque t_element[3];
      Real x[n_state[1]] "Dummy variable state vector";
    protected
    initial equation
      x = zeros(n_state[1]) "Initialize state vector to zero";
    equation
// Use the switch to conditionally output the hydrostatic force torque element
//if enableRadiationForce then
// Calculate the hydrostatic force/torque vector
      der(x) = A*x + B*velocity;
//der(x) = B*velocityDummy;
      F = C*x + D*velocity;
//else
//x = zeros(n_states_Uncoupled);
//F = zeros(6);
//end if;
      frame_a.f = f_element;
      frame_a.t = t_element;
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Radiation Force")}),
        Diagram(coordinateSystem(extent = {{-120, 140}, {40, -20}})));
    end RadiationForce;

    model Radiation "Radiation Force"
      extends DataImport.FilePath;
      extends DataImport.BodyIndex;
      parameter Boolean enableRadiationForce "Switch to enable/disable radiation force calculation" annotation(
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Radiation"));
      // Frame_a connector
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed at body" annotation(
        HideResult = true,
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_v = true, get_w = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world) annotation(
        HideResult = true,
        Placement(transformation(origin = {1, 53}, extent = {{-15, -15}, {15, 15}}, rotation = -0)));
      RadiationForce radiationForce(enableRadiationForce = enableRadiationForce, filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex) annotation(
        Placement(transformation(origin = {0, -20}, extent = {{-18, -18}, {18, 18}})));
    equation
      connect(absoluteSensor.frame_a, frame_a) annotation(
        Line(points = {{-14, 54}, {-100, 54}, {-100, 0}}, color = {95, 95, 95}));
      connect(absoluteSensor.v, radiationForce.v_abs) annotation(
        Line(points = {{-14, 36}, {-14, 1}, {-4, 1}}, color = {0, 0, 127}, thickness = 0.5));
      connect(absoluteSensor.w, radiationForce.omega_abs) annotation(
        Line(points = {{4, 36}, {4, 1}}, color = {0, 0, 127}, thickness = 0.5));
      connect(radiationForce.frame_a, frame_a) annotation(
        Line(points = {{-18, -20}, {-58, -20}, {-58, 0}, {-100, 0}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Radiation")}),
        Diagram);
    end Radiation;

    model CouplingB2B
      extends OET.DataImport.multibodyData;
      outer OET.Hydro.FilePath filePath;
      Real velocityCoupled[12] "Vector containing velocities of all hydrodynamic bodies";
      redeclare parameter String fileName = filePath.FileName;
      annotation(
        defaultComponentName = "coupledB2B",
        defaultComponentPrefixes = "inner",
        missingInnerMessage = "No \"coupledB2B\" component is defined. Drag the OET.Hydro.CoupledB2B model into the top level of your model.");
    end CouplingB2B;

    model RadiationB2B
      parameter String fileName annotation(
        HideResult = true);
      parameter Integer bodyIndex "Index of body corresponding to that of BEM (1, 2, 3, etc)" annotation(
        HideResult = true,
        Dialog(group = "Hydro Data"));
      Real velocityVector[12];
      //will need to generalize
      parameter Boolean enableRadiationForce = true "Switch to enable/disable radiation force calculation" annotation(
        HideResult = true,
        Dialog(group = "Radiation Force Parameters"));
      // Frame_a connector
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed at body" annotation(
        HideResult = true,
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_v = true, get_w = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world) annotation(
        HideResult = true,
        Placement(transformation(origin = {1, 53}, extent = {{-15, -15}, {15, 15}}, rotation = -0)));
      RadiationForceB2B radiationForce(enableRadiationForce = enableRadiationForce, fileName = fileName, bodyIndex = bodyIndex, velocityVector = velocityVector) annotation(
        Placement(transformation(origin = {2, 0}, extent = {{-18, -18}, {18, 18}})));
    equation
      connect(absoluteSensor.frame_a, frame_a) annotation(
        Line(points = {{-14, 54}, {-100, 54}, {-100, 0}}, color = {95, 95, 95}));
      connect(absoluteSensor.v, radiationForce.v_abs) annotation(
        Line(points = {{-14, 36}, {-16, 36}, {-16, 21}}, color = {0, 0, 127}, thickness = 0.5));
      connect(absoluteSensor.w, radiationForce.omega_abs) annotation(
        Line(points = {{4, 36}, {-9, 36}, {-9, 21}}, color = {0, 0, 127}, thickness = 0.5));
      connect(radiationForce.frame_a, frame_a) annotation(
        Line(points = {{-16, 0}, {-100, 0}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Radiation")}),
        Diagram);
    end RadiationB2B;

    model HydrodynamicBodyB2B "6-Dimensional Hydrodynamic Forces and Moments Calculation"
      // Inheritance
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
      //extends Hydrodynamic.HydroDataImport.massData;
      /* This should be removed from here and included in the definition of the body in HydrodynamicBody, but is okay in the interim */
      // BodyShape parameters
      outer Hydro.FilePath filePath;
      outer Hydro.CouplingB2B couplingB2B;
      parameter Integer BodyIndex "Index of body corresponding to that of BEM (1, 2, 3, etc)" annotation(
        Dialog(group = "Hydro Data"));
      /* Removing mass definition here and adding it to a custom bodyShape model
                                                                      parameter Modelica.Units.SI.Mass m = M + Ainf[3, 3] "Mass of the body" annotation(
                                                                        Dialog(group = "Body")); /*
                                                                      /* The mass is only valid when motion is constrained in heave. This line is also repeated in the PTO force code base to determine the control gain */
      parameter Modelica.Units.SI.Position r[3] = {0, 0, 0} "Position vector" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Position r_CM[3] = {0, 0, 0} "Center of mass position vector" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_11 = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_22 = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_33 = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_21 = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_31 = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_32 = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Body"));
      Hydro.BodyShape bodyShape(r = r, I_11 = I_11, I_22 = I_22, I_33 = I_33, I_21 = I_21, I_31 = I_31, I_32 = I_32, fileName = filePath.FileName) annotation(
        Placement(transformation(origin = {10, -84}, extent = {{-10, -10}, {10, 10}})));
      // Hydrostatic force parameters
      parameter Boolean enableHydrostaticForce = true "Switch to enable/disable hydrostatic force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Hydrostatic Force Parameters"));
      // Radiation force paramters
      parameter Boolean enableRadiationForce = true "Switch to enable/disable 6D radiation force calculation" annotation(
        Dialog(group = "Radiation Force Parameters"));
      /* 
                                                                            parameter Real Kpx = 0.0 "Proportional gain for x-axis translation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter Real Kpy = 0.0 "Proportional gain for y-axis translation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter Real Kprx = 0.0 "Proportional gain for x-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter Real Kpry = 0.0 "Proportional gain for y-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter Real Kprz = 0.0 "Proportional gain for z-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter TranslationalSpringConstant Kix = 0.0 "Integral gain for x-axis translation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter TranslationalSpringConstant Kiy = 0.0 "Integral gain for y-axis translation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter RotationalSpringConstant Kirx = 0.0 "Integral gain for x-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter RotationalSpringConstant Kiry = 0.0 "Integral gain for y-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter RotationalSpringConstant Kirz = 0.0 "Integral gain for z-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                
                                                                         */
      /*
                                              // Damping coefficients
                                                parameter Real Cvtx = 0.01 "Translational damping coefficient for x-axis [-]" annotation(HideResult = true);
                                                parameter Real Cvty = 0.01 "Translational damping coefficient for y-axis [-]" annotation(HideResult = true);
                                                parameter Real Cvtz = 0.01 "Translational damping coefficient for z-axis [-]" annotation(HideResult = true);
                                                parameter Real Cvrx = 0.01 "Rotational damping coefficient for x-axis [-]" annotation(HideResult = true);
                                                parameter Real Cvry = 0.01 "Rotational damping coefficient for y-axis [-]" annotation(HideResult = true);
                                                parameter Real Cvrz = 0.01 "Rotational damping coefficient for z-axis [-]" annotation(HideResult = true);
                                                
                                                // Drag coefficients
                                                parameter Real Cdtx = 0.01 "Translational drag coefficient for x-axis [-]" annotation(HideResult = true);
                                                parameter Real Cdty = 0.01 "Translational drag coefficient for y-axis [-]" annotation(HideResult = true);
                                                parameter Real Cdtz = 0.01 "Translational drag coefficient for z-axis [-]" annotation(HideResult = true);
                                                parameter Real Cdrx = 0.01 "Rotational drag coefficient for x-axis [-]" annotation(HideResult = true);
                                                parameter Real Cdry = 0.01 "Rotational drag coefficient for y-axis [-]" annotation(HideResult = true);
                                                parameter Real Cdrz = 0.01 "Rotational drag coefficient for z-axis [-]" annotation(HideResult = true);
                                                */
      Hydrostatic hydrostatic(fileName = filePath.FileName, bodyIndex = BodyIndex) annotation(
        Placement(transformation(origin = {4, 36}, extent = {{-10, -10}, {10, 10}})));
      Excitation excitation(fileName = filePath.FileName, bodyIndex = BodyIndex) annotation(
        Placement(transformation(origin = {8, -10}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world) annotation(
        Placement(transformation(origin = {-54, 60}, extent = {{-10, -10}, {10, 10}})));
      DampingDrag dampingDrag annotation(
        Placement(transformation(origin = {74, 52}, extent = {{-10, -10}, {10, 10}})));
      RadiationB2B radiation(fileName = filePath.FileName, bodyIndex = BodyIndex, velocityVector = couplingB2B.velocityCoupled) annotation(
        Placement(transformation(origin = {48, -26}, extent = {{-10, -10}, {10, 10}})));
    equation
//Conections
      connect(excitation.frame_a, bodyShape.frame_a) annotation(
        Line(points = {{-2, -10}, {0, -10}, {0, -84}}, color = {95, 95, 95}));
      connect(hydrostatic.frame_a, bodyShape.frame_a) annotation(
        Line(points = {{-6, 36}, {-16, 36}, {-16, -84}, {0, -84}}, color = {95, 95, 95}));
      connect(bodyShape.frame_b, frame_b) annotation(
        Line(points = {{20, -84}, {62, -84}, {62, 0}, {102, 0}}, color = {95, 95, 95}));
      connect(bodyShape.frame_a, frame_a) annotation(
        Line(points = {{0, -84}, {-76, -84}, {-76, 0}, {-102, 0}}, color = {95, 95, 95}));
      connect(absoluteSensor.frame_a, frame_a) annotation(
        Line(points = {{-64, 60}, {-102, 60}, {-102, 0}}, color = {95, 95, 95}));
      connect(dampingDrag.frame_a, bodyShape.frame_a) annotation(
        Line(points = {{64, 52}, {-28, 52}, {-28, -84}, {0, -84}}, color = {95, 95, 95}));
      connect(radiation.frame_a, bodyShape.frame_a) annotation(
        Line(points = {{38, -26}, {-46, -26}, {-46, -84}, {0, -84}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 145}, {150, 105}}, textString = "%name", textColor = {0, 0, 255}), Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Hydro Body")}),
        Diagram);
    end HydrodynamicBodyB2B;

    model BodyMass "Rigid body with mass, inertia tensor and one frame connector (12 potential states)"
      import Modelica.Mechanics.MultiBody.Types;
      import Modelica.Mechanics.MultiBody.Frames;
      import Modelica.Units.Conversions.to_unit1;
      extends DataImport.FilePath;
      extends DataImport.BodyIndex;
      extends DataImport.massNoB2BData;
      parameter Modelica.Units.SI.Position r_CM[3](start = {0, 0, 0}) = {0, 0, 0} "Vector from frame_a to center of mass, resolved in frame_a";
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed at body" annotation(
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      // parameter Modelica.Units.SI.Mass m(min = 0, start = 1) "Mass of rigid body";
      parameter Modelica.Units.SI.Inertia I_11(min = 0) = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_22(min = 0) = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_33(min = 0) = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_21(min = -Modelica.Constants.inf) = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_31(min = -Modelica.Constants.inf) = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_32(min = -Modelica.Constants.inf) = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      Modelica.Units.SI.Position r_0[3](start = {0, 0, 0}, each stateSelect = if enforceStates then StateSelect.always else StateSelect.avoid) "Position vector from origin of world frame to origin of frame_a" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      Modelica.Units.SI.Velocity v_0[3](start = {0, 0, 0}, each stateSelect = if enforceStates then StateSelect.always else StateSelect.avoid) "Absolute velocity of frame_a, resolved in world frame (= der(r_0))" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      Modelica.Units.SI.Acceleration a_0[3](start = {0, 0, 0}) "Absolute acceleration of frame_a resolved in world frame (= der(v_0))" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      Modelica.Units.SI.Position r[3](start = {0, 0, 0}, each stateSelect = if enforceStates then StateSelect.always else StateSelect.avoid) "Position vector from origin of world frame to origin of frame_a in local frame" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      Modelica.Units.SI.Velocity v[3](start = {0, 0, 0}, each stateSelect = if enforceStates then StateSelect.always else StateSelect.avoid) "Absolute velocity of frame_a, resolved in local frame (= der(r))" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      Modelica.Units.SI.Acceleration a[3](start = {0, 0, 0}) "Absolute acceleration of frame_a resolved in local frame (= der(v))" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      parameter Boolean angles_fixed = false "= true, if angles_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.Angle angles_start[3] = {0, 0, 0} "Initial values of angles to rotate world frame around 'sequence_start' axes into frame_a" annotation(
        Dialog(tab = "Initialization"));
      parameter Types.RotationSequence sequence_start = {1, 2, 3} "Sequence of rotations to rotate world frame into frame_a at initial time" annotation(
        Evaluate = true,
        Dialog(tab = "Initialization"));
      parameter Boolean w_0_fixed = false "= true, if w_0_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.AngularVelocity w_0_start[3] = {0, 0, 0} "Initial or guess values of angular velocity of frame_a resolved in world frame" annotation(
        Dialog(tab = "Initialization"));
      parameter Boolean z_0_fixed = false "= true, if z_0_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.AngularAcceleration z_0_start[3] = {0, 0, 0} "Initial values of angular acceleration z_0 = der(w_0)" annotation(
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.Diameter sphereDiameter = world.defaultBodyDiameter "Diameter of sphere" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      input Types.Color sphereColor = Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor "Color of sphere" annotation(
        Dialog(colorSelector = true, tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Units.SI.Diameter cylinderDiameter = sphereDiameter/Types.Defaults.BodyCylinderDiameterFraction "Diameter of cylinder" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      input Types.Color cylinderColor = sphereColor "Color of cylinder" annotation(
        Dialog(colorSelector = true, tab = "Animation", group = "if animation = true", enable = animation));
      input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient "Reflection of ambient light (= 0: light is completely absorbed)" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Boolean enforceStates = false "= true, if absolute variables of body object shall be used as states (StateSelect.always)" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced"));
      parameter Boolean useQuaternions = true "= true, if quaternions shall be used as potential states otherwise use 3 angles as potential states" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced"));
      parameter Types.RotationSequence sequence_angleStates = {1, 2, 3} "Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced", enable = not useQuaternions));
      final parameter Modelica.Units.SI.Inertia I[3, 3] = [I_11, I_21, I_31; I_21, I_22, I_32; I_31, I_32, I_33] "Inertia tensor";
      final parameter Frames.Orientation R_start = Modelica.Mechanics.MultiBody.Frames.axesRotations(sequence_start, angles_start, zeros(3)) "Orientation object from world frame to frame_a at initial time";
      Modelica.Units.SI.AngularVelocity w_a[3](start = Frames.resolve2(R_start, w_0_start), fixed = fill(w_0_fixed, 3), each stateSelect = if enforceStates then (if useQuaternions then StateSelect.always else StateSelect.never) else StateSelect.avoid) "Absolute angular velocity of frame_a resolved in frame_a";
      Modelica.Units.SI.AngularAcceleration z_a[3](start = Frames.resolve2(R_start, z_0_start), fixed = fill(z_0_fixed, 3)) "Absolute angular acceleration of frame_a resolved in frame_a";
      Modelica.Units.SI.Acceleration g_0[3] "Gravity acceleration resolved in world frame";
      Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector [N,Nm]";
      Real aCheck[3];
      Real vCheck[3];
      Real f_iner[3];
      Real t_iner[3];
    protected
      Modelica.Units.SI.Force f_element[3];
      Modelica.Units.SI.Torque t_element[3];
      parameter Boolean animation = false "= true, if animation shall be enabled (show cylinder and sphere)";
      outer Modelica.Mechanics.MultiBody.World world;
      // Declarations for quaternions (dummies, if quaternions are not used)
      parameter Frames.Quaternions.Orientation Q_start = Frames.to_Q(R_start) "Quaternion orientation object from world frame to frame_a at initial time";
      Frames.Quaternions.Orientation Q(start = Q_start, each stateSelect = if enforceStates then (if useQuaternions then StateSelect.prefer else StateSelect.never) else StateSelect.avoid) "Quaternion orientation object from world frame to frame_a (dummy value, if quaternions are not used as states)";
      // Declaration for 3 angles
      parameter Modelica.Units.SI.Angle phi_start[3] = if sequence_start[1] == sequence_angleStates[1] and sequence_start[2] == sequence_angleStates[2] and sequence_start[3] == sequence_angleStates[3] then angles_start else Frames.axesRotationsAngles(R_start, sequence_angleStates) "Potential angle states at initial time";
      Modelica.Units.SI.Angle phi[3](start = phi_start, each stateSelect = if enforceStates then (if useQuaternions then StateSelect.never else StateSelect.always) else StateSelect.avoid) "Dummy or 3 angles to rotate world frame into frame_a of body";
      Modelica.Units.SI.AngularVelocity phi_d[3](each stateSelect = if enforceStates then (if useQuaternions then StateSelect.never else StateSelect.always) else StateSelect.avoid) "= der(phi)";
      Modelica.Units.SI.AngularAcceleration phi_dd[3] "= der(phi_d)";
      // Declarations for animation
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape cylinder(shapeType = "cylinder", color = cylinderColor, specularCoefficient = specularCoefficient, length = if Modelica.Math.Vectors.length(r_CM) > sphereDiameter/2 then Modelica.Math.Vectors.length(r_CM) - (if cylinderDiameter > 1.1*sphereDiameter then sphereDiameter/2 else 0) else 0, width = cylinderDiameter, height = cylinderDiameter, lengthDirection = to_unit1(r_CM), widthDirection = {0, 1, 0}, r = frame_a.r_0, R = frame_a.R) if world.enableAnimation and animation;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape sphere(shapeType = "sphere", color = sphereColor, specularCoefficient = specularCoefficient, length = sphereDiameter, width = sphereDiameter, height = sphereDiameter, lengthDirection = {1, 0, 0}, widthDirection = {0, 1, 0}, r_shape = r_CM - {1, 0, 0}*sphereDiameter/2, r = frame_a.r_0, R = frame_a.R) if world.enableAnimation and animation and sphereDiameter > 0;
    initial equation
      if angles_fixed then
// Initialize positional variables
        if not Connections.isRoot(frame_a.R) then
// frame_a.R is computed somewhere else
          zeros(3) = Frames.Orientation.equalityConstraint(frame_a.R, R_start);
        elseif useQuaternions then
// frame_a.R is computed from quaternions Q
          zeros(3) = Frames.Quaternions.Orientation.equalityConstraint(Q, Q_start);
        else
// frame_a.R is computed from the 3 angles 'phi'
          phi = phi_start;
        end if;
      end if;
    equation
      if enforceStates then
        Connections.root(frame_a.R);
      else
        Connections.potentialRoot(frame_a.R);
      end if;
      r_0 = frame_a.r_0;
      if not Connections.isRoot(frame_a.R) then
// Body does not have states
// Dummies
        Q = {0, 0, 0, 1};
        phi = zeros(3);
        phi_d = zeros(3);
        phi_dd = zeros(3);
      elseif useQuaternions then
// Use Quaternions as states (with dynamic state selection)
        frame_a.R = Frames.from_Q(Q, Frames.Quaternions.angularVelocity2(Q, der(Q)));
        {0} = Frames.Quaternions.orientationConstraint(Q);
// Dummies
        phi = zeros(3);
        phi_d = zeros(3);
        phi_dd = zeros(3);
      else
// Use Cardan angles as states
        phi_d = der(phi);
        phi_dd = der(phi_d);
        frame_a.R = Frames.axesRotations(sequence_angleStates, phi, phi_d);
// Dummies
        Q = {0, 0, 0, 1};
      end if;
// gravity acceleration at center of mass resolved in world frame
      g_0 = world.gravityAcceleration(frame_a.r_0 + Frames.resolve1(frame_a.R, r_CM));
// translational kinematic differential equations
      v_0 = der(frame_a.r_0);
      a_0 = der(v_0);
      r = Frames.resolve2(frame_a.R, r_0);
//v = Frames.resolve2(frame_a.R, v_0);
//a = Frames.resolve2(frame_a.R, a_0);
      vCheck = der(r);
      aCheck = der(v);
      a = Frames.resolve2(frame_a.R, a_0);
      v = Frames.resolve2(frame_a.R, v_0);
// rotational kinematic differential equations
      w_a = Frames.angularVelocity2(frame_a.R);
      z_a = der(w_a);
/* Newton/Euler equations with respect to center of mass
                    a_CM = a_a ;
                    f_CM = m*a_CM;
                    t_CM = I*z_a + cross(w_a, I*w_a);
               frame_a.f = f_CM
               frame_a.t = t_CM;
            Inserting the first three equations in the last two results in:
          */
// Note a now defined as local translational acceleration
      f_iner = (m + Ainf11)*a + Ainf12*z_a;
      t_iner = (I + Ainf22)*z_a  + cross(w_a, (I + Ainf22)*w_a) + Ainf21*a; // may need to readd Ainf22 into crossporudct with I
      f_element = f_iner;
      t_element = t_iner;
      frame_a.f = f_element;
      frame_a.t = t_element;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 30}, {-3, -30}}, lineColor = {0, 24, 48}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {0, 127, 255}, radius = 10), Text(extent = {{150, -100}, {-150, -70}}, textString = "m=%m"), Text(extent = {{-150, 110}, {150, 70}}, textString = "%name", textColor = {0, 0, 255}), Ellipse(extent = {{-20, 60}, {100, -60}}, lineColor = {0, 24, 48}, fillPattern = FillPattern.Sphere, fillColor = {0, 127, 255})}),
        Documentation(info = "<html>
        <p>
        <strong>Rigid body</strong> with mass and inertia tensor.
        All parameter vectors have to be resolved in frame_a.
        The <strong>inertia tensor</strong> has to be defined with respect to a
        coordinate system that is parallel to frame_a with the
        origin at the center of mass of the body.
        </p>
        <p>
        By default, this component is visualized by a <strong>cylinder</strong> located
        between frame_a and the center of mass and by a <strong>sphere</strong> that has
        its center at the center of mass. If the cylinder length is smaller as
        the radius of the sphere, e.g., since frame_a is located at the
        center of mass, the cylinder is not displayed. Note, that
        the animation may be switched off via parameter animation = <strong>false</strong>.
        </p>
        <p>
        <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Parts/Body.png\" alt=\"Parts.Body\">
        </p>
        
        <p>
        <strong>States of Body Components</strong>
        </p>
        <p>
        Every body has potential states. If possible a tool will select
        the states of joints and not the states of bodies because this is
        usually the most efficient choice. In this case the position, orientation,
        velocity and angular velocity of frame_a of the body will be computed
        by the component that is connected to frame_a. However, if a body is moving
        freely in space, variables of the body have to be used as states. The potential
        states of the body are:
        </p>
        <ul>
        <li> The <strong>position vector</strong> frame_a.r_0 from the origin of the
             world frame to the origin of frame_a of the body, resolved in
             the world frame and the <strong>absolute velocity</strong> v_0 of the origin of
             frame_a, resolved in the world frame (= der(frame_a.r_0)).
        </li>
        <li> If parameter <strong>useQuaternions</strong> in the \"Advanced\" menu
             is <strong>true</strong> (this is the default), then <strong>4 quaternions</strong>
             are potential states. Additionally, the coordinates of the
             absolute angular velocity vector of the
             body are 3 potential states.<br>
             If <strong>useQuaternions</strong> in the \"Advanced\" menu
             is <strong>false</strong>, then <strong>3 angles</strong> and the derivatives of
             these angles are potential states. The orientation of frame_a
             is computed by rotating the world frame along the axes defined
             in parameter vector \"sequence_angleStates\" (default = {1,2,3}, i.e.,
             the Cardan angle sequence) around the angles used as potential states.
             For example, the default is to rotate the x-axis of the world frame
             around angles[1], the new y-axis around angles[2] and the new z-axis
             around angles[3], arriving at frame_a.
         </li>
        </ul>
        <p>
        The quaternions have the slight disadvantage that there is a
        non-linear constraint equation between the 4 quaternions.
        Therefore, at least one non-linear equation has to be solved
        during simulation. A tool might, however, analytically solve this
        simple constraint equation. Using the 3 angles as states has the
        disadvantage that there is a singular configuration in which a
        division by zero will occur. If it is possible to determine in advance
        for an application class that this singular configuration is outside
        of the operating region, the 3 angles might be used as potential
        states by setting <strong>useQuaternions</strong> = <strong>false</strong>.
        </p>
        <p>
        In text books about 3-dimensional mechanics often 3 angles and the
        angular velocity are used as states. This is not the case here, since
        3 angles and their derivatives are used as potential states
        (if useQuaternions = false). The reason
        is that for real-time simulation the discretization formula of the
        integrator might be \"inlined\" and solved together with the body equations.
        By appropriate symbolic transformation the performance is
        drastically increased if angles and their
        derivatives are used as states, instead of angles and the angular
        velocity.
        </p>
        <p>
        Whether or not variables of the body are used as states is usually
        automatically selected by the Modelica translator. If parameter
        <strong>enforceStates</strong> is set to <strong>true</strong> in the \"Advanced\" menu,
        then body variables are forced to be used as states according
        to the setting of parameters \"useQuaternions\" and
        \"sequence_angleStates\".
        </p>
        </html>"));
    end BodyMass;

    model Body
      extends DataImport.FilePath;
      extends DataImport.GeometryFile;
      extends DataImport.BodyIndex;
      extends Internal.PartialThreeFrames;
      parameter Modelica.Units.SI.Distance r_0Init[3] = {0, 0, 0} "Initial translational position vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.Velocity v_0Init[3] = {0, 0, 0} "Initial translational velocity vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.Acceleration a_0Init[3] = {0, 0, 0} "Initial translational acceleration vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.Angle angles_0Init[3] = {0, 0, 0} "Initial angular position vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.AngularVelocity w_0Init[3] = {0, 0, 0} "Initial angular velocity vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.AngularAcceleration z_0Init[3] = {0, 0, 0} "Initial angular acceleration vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Boolean animationEnable = false "Enable animation with stl geometry file" annotation(
        Dialog(group = "Body Data"));
      parameter String file = "file://";
      parameter String geometryDirectory = "file://" + "C:/Users/thogan1/Documents/GitHub/OceanEngineeringToolbox" + "/RM3/geometry/float.stl";
      // Mass
      BodyMass body(filePath = filePath, hydroCoeffFile = hydroCoeffFile, bodyIndex = bodyIndex, I_11 = I_11, I_22 = I_22, I_33 = I_33, I_21 = I_21, I_31 = I_31, I_32 = I_32, r_CM = {0, 0, 0}, r_0(start = r_0Init), v_0(start = v_0Init), a_0(start = a_0Init), angles_start = angles_0Init, w_0_start = w_0Init, z_0_start = z_0Init, useQuaternions = true) annotation(
        Placement(transformation(origin = {0, -46}, extent = {{-12, -12}, {12, 12}}, rotation = -90)));
      parameter Modelica.Units.SI.Length ra_CM[3] = {0, 0, 0} "Position vector between joint A and the centre of mass" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Length rCM_b[3] = {0, 0, 0} "Position vector between the centre of mass and joint B" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Length ra_b[3] = ra_CM + rCM_b "Position vector between joint A and joint B" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_11 = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_22 = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_33 = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_21 = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_31 = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_32 = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = ra_CM, animation = false) annotation(
        Placement(transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = rCM_b, animation = false) annotation(
        Placement(transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(length = 1, width = 1, height = 1, animation = true, shapeType = geometryDirectory, color = {255, 255, 0}) annotation(
        Placement(transformation(origin = {40, -36}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world, animation = false) annotation(
        Placement(transformation(origin = {50, 52}, extent = {{-10, -10}, {10, 10}})));
    equation
      connect(body.frame_a, frame_c) annotation(
        Line(points = {{0, -34}, {0, 100}}, color = {95, 95, 95}));
      connect(fixedTranslation1.frame_a, body.frame_a) annotation(
        Line(points = {{50, 0}, {0, 0}, {0, -34}}, color = {95, 95, 95}));
      connect(fixedTranslation.frame_b, body.frame_a) annotation(
        Line(points = {{-40, 0}, {0, 0}, {0, -34}}, color = {95, 95, 95}));
      connect(fixedTranslation1.frame_b, frame_b) annotation(
        Line(points = {{70, 0}, {100, 0}}, color = {95, 95, 95}));
      connect(fixedTranslation.frame_a, frame_a) annotation(
        Line(points = {{-60, 0}, {-100, 0}}, color = {95, 95, 95}));
      connect(fixedShape.frame_a, body.frame_a) annotation(
        Line(points = {{30, -36}, {0, -36}, {0, -34}}, color = {95, 95, 95}));
      connect(absoluteSensor.frame_a, body.frame_a) annotation(
        Line(points = {{40, 52}, {0, 52}, {0, -34}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 145}, {150, 105}}, textString = "%name", textColor = {0, 0, 255}), Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Body")}),
        Diagram);
    end Body;

    model HydrodynamicBody_test "6-Dimensional Hydrodynamic Forces and Moments Calculation"
      // Inheritance
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
      extends DataImport.GeometryFile(geometryFile = "None");
      extends DataImport.BodyIndex;
      // Simulation parameters w/ implicit connections
      outer Hydro.FilePath fileDirectory;
      // Body data
      parameter Boolean animationEnable = false "Enable animation with stl geometry file" annotation(
        Dialog(group = "Body Data"));
      // Mass parameters
      Body body(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex, geometryFile = geometryFile, ra_CM = ra_CM, rCM_b = rCM_b, ra_b = ra_b, I_11 = I_11, I_22 = I_22, I_33 = I_33, I_21 = I_21, I_31 = I_31, I_32 = I_32) annotation(
        Placement(transformation(origin = {2, -38}, extent = {{-12, -12}, {12, 12}})));
      parameter Modelica.Units.SI.Length ra_CM[3] = {0, 0, 0} "Position vector between joint A and the centre of mass" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Length rCM_b[3] = {0, 0, 0} "Position vector between the centre of mass and joint B" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Length ra_b[3] = ra_CM + rCM_b "Position vector between joint A and joint B" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_11 = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_22 = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_33 = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_21 = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_31 = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_32 = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      // Hydrostatic
      Hydrostatic hydrostatic(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex, enableHydrostaticForce = enableHydrostaticForce) if enableHydrostaticForce annotation(
        Placement(transformation(origin = {-65, 49}, extent = {{15, -15}, {-15, 15}}, rotation = -0)));
      parameter Boolean enableHydrostaticForce = true "Switch to enable/disable hydrostatic force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Hydrostatic"));
      // Radiation
      parameter Boolean enableRadiationForce = true "Switch to enable/disable radiation force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Radiation"));
      // Excitation
      parameter Boolean enableExcitationForce = true "Switch to enable/disable excitation force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Excitation"));
      // Damping/drag
      DampingDrag dampingDrag(enableDampingDragForce = enableDampingDragForce) if enableDampingDragForce annotation(
        Placement(transformation(origin = {76, 54}, extent = {{-14, -14}, {14, 14}})));
      parameter Boolean enableDampingDragForce = false "Switch to enable/disable damping/drag force calculation" annotation(
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Damping/Drag"));
      // Sensor (validation)
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world) annotation(
        Placement(transformation(origin = {-80, -82}, extent = {{-10, -10}, {10, 10}})));
    equation
//Conections
      connect(absoluteSensor.frame_a, frame_a) annotation(
        Line(points = {{-90, -82}, {-100, -82}, {-100, 0}}, color = {95, 95, 95}));
      connect(body.frame_a, frame_a) annotation(
        Line(points = {{-10, -38}, {-100, -38}, {-100, 0}}, color = {95, 95, 95}));
      connect(body.frame_b, frame_b) annotation(
        Line(points = {{14, -38}, {100, -38}, {100, 0}}, color = {95, 95, 95}));
      connect(hydrostatic.frame_a, body.frame_c) annotation(
        Line(points = {{-50, 50}, {-46, 50}, {-46, -26}, {2, -26}}, color = {95, 95, 95}));
      connect(dampingDrag.frame_a, body.frame_c) annotation(
        Line(points = {{62, 54}, {58, 54}, {58, -26}, {2, -26}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 145}, {150, 105}}, textString = "%name", textColor = {0, 0, 255}), Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Hydro Body")}),
        Diagram);
    end HydrodynamicBody_test;

    model ExcitationIrregularWave "Excitation Force"
      extends DataImport.FilePath;
      extends DataImport.BodyIndex;
      extends DataImport.excitationData;
      extends DataImport.physicalConstantData;
      // Frame_a connector
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed at body" annotation(
        HideResult = true,
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      // Parameters to call
      parameter Integer n_omega "Number of frequency components (default is 100 for irregular)" annotation(
        Dialog(group = "Simulation Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation";
      parameter Modelica.Units.SI.Length zeta[n_omega] "Wave amplitude component";
      parameter Real phi[n_omega] "Wave components phase shift";
      parameter Modelica.Units.SI.Time Trmp "Interval for ramping up of waves during start phase [s]" annotation(
        Dialog(group = "Simulation Parameters"));
      parameter Boolean enableExcitationForce = true "Switch to enable/disable hydrostatic force calculation" annotation(
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Excitation"));
      Real ExcCoeffRe[bodyDoF, n_omega] "Real component of excitation coefficient for frequency components" annotation(
        HideResult = true);
      Real ExcCoeffIm[bodyDoF, n_omega] "Imaginary component of excitation coefficient for frequency components" annotation(
        HideResult = true);
      Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector [N,Nm]";
      Real ramp "Ramping function" annotation(
        HideResult = true);
    protected
      Modelica.Units.SI.Force f_element[3];
      Modelica.Units.SI.Torque t_element[3];
      // Physical constants
      constant Real pi = Modelica.Constants.pi "Mathematical constant pi";
      constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "Acceleration due to gravity [m/s^2]";
    equation
// Interpolate excitation coefficients (Re & Im) for each frequency component and for each DoF
      for i in 1:bodyDoF loop
        for j in 1:n_omega loop
          ExcCoeffRe[i, j] = Modelica.Math.Vectors.interpolate(w, F_excRe[i, :], omega[j])*rho*g;
          ExcCoeffIm[i, j] = Modelica.Math.Vectors.interpolate(w, F_excIm[i, :], omega[j])*rho*g;
        end for;
      end for;
// Calculate the excitation force
      for i in 1:bodyDoF loop
// Calculate and apply ramping to the excitation force
// if time < Trmp then
// Ramp up the excitation force during the initial phase
        F[i] = ramp.*sum((ExcCoeffRe[i].*zeta.*cos(omega*time - phi)) - (ExcCoeffIm[i].*zeta.*sin(omega*time - phi))).*ramp; // move into first loop
//else
// Apply full excitation force after the ramping period
//F[i] = sum((ExcCoeffRe[i].*zeta.*cos(omega*time - phi)) - (ExcCoeffIm[i].*zeta.*sin(omega*time - phi)));
//end if;
      end for;
// Assign excitation force to output
      frame_a.f = -f_element;
      frame_a.t = -t_element;
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Irregular Wave")}),
        Diagram);
    end ExcitationIrregularWave;

    model ExcitationRegularWave "Excitation Force"
      extends DataImport.FilePath;
      extends DataImport.BodyIndex;
      extends DataImport.excitationData;
      extends DataImport.physicalConstantData;
      // Frame_a connector
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed at body" annotation(
        HideResult = true,
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      // Parameters to call
      parameter Modelica.Units.SI.AngularFrequency omegaPeak = 0.9423 "Peak spectral frequency" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.Height A "Wave amplitude";
      parameter Modelica.Units.SI.Time Trmp "Interval for ramping up of waves during start phase [s]" annotation(
        Dialog(group = "Simulation Parameters"));
      parameter Boolean enableExcitationForce = true "Switch to enable/disable hydrostatic force calculation" annotation(
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Excitation"));
      Real ExcCoeffRe[bodyDoF] "Real component of excitation coefficient" annotation(
        HideResult = true);
      Real ExcCoeffIm[bodyDoF] "Imaginary component of excitation coefficient" annotation(
        HideResult = true);
      Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector [N,Nm]";
      Real ramp "Ramping function" annotation(
        HideResult = true);
    protected
      // This is a bug, for some reason
      // I have to multiply by ramp at front and end
      Modelica.Units.SI.Force f_element[3];
      Modelica.Units.SI.Torque t_element[3];
      // Physical constants
      constant Real pi = Modelica.Constants.pi "Mathematical constant pi";
      constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "Acceleration due to gravity [m/s^2]";
    equation
// Interpolate excitation coefficients (Re & Im) for each frequency component and for each DoF
      for i in 1:bodyDoF loop
        ExcCoeffRe[i] = Modelica.Math.Vectors.interpolate(w, F_excRe[i], omegaPeak)*rho*g;
        ExcCoeffIm[i] = Modelica.Math.Vectors.interpolate(w, F_excIm[i], omegaPeak)*rho*g;
      end for;
      F = (ramp.*(ExcCoeffRe.*A*cos(omegaPeak*time)) - (ExcCoeffIm.*A*sin(omegaPeak*time)).*ramp);
/*
    // Calculate the excitation force
        for i in 1:bodyDoF loop
    // Calculate and apply ramping to the excitation force
          if time < Trmp then
    // Ramp up the excitation force during the initial phase
            F[i] = ramp*(ExcCoeffRe[i].*A*cos(omegaPeak*time)) - (ExcCoeffIm[i].*A*sin(omegaPeak*time));
            test_force[i] = (ExcCoeffRe[i].*A*cos(omegaPeak*time)) - (ExcCoeffIm[i].*A*sin(omegaPeak*time));
          else
    // Apply full excitation force after the ramping period
            F[i] = (ExcCoeffRe[i].*A*cos(omegaPeak*time)) - (ExcCoeffIm[i].*A*sin(omegaPeak*time));
            test_force[i] = 0;
          end if;
        end for;
        
        */
// Assign excitation force to output
//frame_a.f[3] = 0;
//frame_a.f[1] = 0;
//frame_a.f[2] = -f_element[2];
      frame_a.f = -f_element;
frame_a.t = -t_element;
//frame_a.t[3] = 0;
//frame_a.t[1] = 0;
//frame_a.t[2] = -t_element[2];
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Regular Wave")}),
        Diagram(coordinateSystem(extent = {{-120, 20}, {-40, -60}})));
    end ExcitationRegularWave;

    model ExcitationSpectrumImport "Excitation Force"
      /* Identical to Irregular but double naming requires variable names to be unique, even with conditional declaration*/
      extends DataImport.FilePath;
      extends DataImport.BodyIndex;
      extends DataImport.excitationData;
      extends DataImport.physicalConstantData;
      // Frame_a connector
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed at body" annotation(
        HideResult = true,
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      // Parameters to call
      parameter Integer n_omega = 100 "Number of frequency components (default is 100 for irregular)" annotation(
        Dialog(group = "Simulation Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation";
      parameter Modelica.Units.SI.Length zeta[n_omega] "Wave amplitude component";
      parameter Real phi[n_omega] "Wave components phase shift";
      parameter Modelica.Units.SI.Time Trmp "Interval for ramping up of waves during start phase [s]" annotation(
        Dialog(group = "Simulation Parameters"));
      parameter Boolean enableExcitationForce "Switch to enable/disable hydrostatic force calculation" annotation(
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Excitation"));
      Real ExcCoeffRe[bodyDoF, n_omega] "Real component of excitation coefficient for frequency components" annotation(
        HideResult = true);
      Real ExcCoeffIm[bodyDoF, n_omega] "Imaginary component of excitation coefficient for frequency components" annotation(
        HideResult = true);
      Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector [N,Nm]";
    protected
      Modelica.Units.SI.Force f_element[3];
      Modelica.Units.SI.Torque t_element[3];
      // Physical constants
      constant Real pi = Modelica.Constants.pi "Mathematical constant pi";
      constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "Acceleration due to gravity [m/s^2]";
    equation
// Interpolate excitation coefficients (Re & Im) for each frequency component and for each DoF
      for i in 1:bodyDoF loop
        for j in 1:n_omega loop
          ExcCoeffRe[i, j] = Modelica.Math.Vectors.interpolate(w, F_excRe[i, :], omega[j])*rho*g;
          ExcCoeffIm[i, j] = Modelica.Math.Vectors.interpolate(w, F_excIm[i, :], omega[j])*rho*g;
        end for;
      end for;
      if enableExcitationForce then
// Calculate the excitation force
        for i in 1:bodyDoF loop
// Calculate and apply ramping to the excitation force
          if time < Trmp then
// Ramp up the excitation force during the initial phase
            F[i] = 0.5*(1 + cos(pi + (pi*time/Trmp)))*sum((ExcCoeffRe[i].*zeta.*cos(omega*time - phi)) - (ExcCoeffIm[i].*zeta.*sin(omega*time - phi)));
          else
// Apply full excitation force after the ramping period
            F[i] = sum((ExcCoeffRe[i].*zeta.*cos(omega*time - phi)) - (ExcCoeffIm[i].*zeta.*sin(omega*time - phi)));
          end if;
        end for;
      else
        F = zeros(6);
      end if;
// Assign excitation force to output
      frame_a.f = f_element;
      frame_a.t = t_element;
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Spectrum Import")}),
        Diagram);
    end ExcitationSpectrumImport;

    model HydrodynamicBody_am "6-Dimensional Hydrodynamic Forces and Moments Calculation"
      // Inheritance
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
      extends DataImport.GeometryFile(geometryFile = "None");
      extends DataImport.BodyIndex;
      // Simulation parameters w/ implicit connections
      outer Hydro.FilePath fileDirectory;
      // Body data
      parameter Boolean animationEnable = false "Enable animation with stl geometry file" annotation(
        Dialog(group = "Body Data"));
      // Mass parameters
      parameter Modelica.Units.SI.Length ra_CM[3] = {0, 0, 0} "Position vector between joint A and the centre of mass" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Length rCM_b[3] = {0, 0, 0} "Position vector between the centre of mass and joint B" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Length ra_b[3] = ra_CM + rCM_b "Position vector between joint A and joint B" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_11 = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_22 = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_33 = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_21 = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_31 = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_32 = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Distance r_0Init[3] = {0, 0, 0} "Initial translational position vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.Velocity v_0Init[3] = {0, 0, 0} "Initial translational velocity vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.Acceleration a_0Init[3] = {0, 0, 0} "Initial translational acceleration vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.Angle angles_0Init[3] = {0, 0, 0} "Initial angular position vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.AngularVelocity w_0Init[3] = {0, 0, 0} "Initial angular velocity vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.AngularAcceleration z_0Init[3] = {0, 0, 0} "Initial angular acceleration vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      // Hydrostatic
      Hydrostatic hydrostatic(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex, enableHydrostaticForce = enableHydrostaticForce) if enableHydrostaticForce annotation(
        Placement(transformation(origin = {-80, 48}, extent = {{18, -18}, {-18, 18}})));
      parameter Boolean enableHydrostaticForce = true "Switch to enable/disable hydrostatic force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Hydrostatic"));
      // Radiation
      Radiation radiation(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex, enableRadiationForce = enableRadiationForce) if enableRadiationForce annotation(
        Placement(transformation(origin = {34, 48}, extent = {{-18, -18}, {18, 18}})));
      parameter Boolean enableRadiationForce = true "Switch to enable/disable radiation force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Radiation"));
      // Excitation
      Excitation excitation(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex) if enableExcitationForce annotation(
        Placement(transformation(origin = {-32, 48}, extent = {{18, -18}, {-18, 18}})));
      parameter Boolean enableExcitationForce = true "Switch to enable/disable excitation force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Excitation"));
      // Damping/drag
      DampingDrag dampingDrag(enableDampingDragForce = enableDampingDragForce) if enableDampingDragForce annotation(
        Placement(transformation(origin = {78, 48}, extent = {{-18, -18}, {18, 18}})));
      parameter Boolean enableDampingDragForce = true "Switch to enable/disable damping/drag force calculation" annotation(
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Damping/Drag"));
      // Sensor (validation)
      BodyMass bodyMass(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex, r_CM = {0, 0, 0}, I_11 = I_11, I_22 = I_22, I_33 = I_33, I_21 = I_21, I_31 = I_31, I_32 = I_32) annotation(
        Placement(transformation(origin = {8, -20}, extent = {{-10, -10}, {10, 10}})));
    equation
//Conections
/*
            
              connect(body1.frame_a, frame_a) annotation(
            Line(points = {{-10, -38}, {-100, -38}, {-100, 0}}, color = {95, 95, 95}));
          connect(body1.frame_a, frame_b) annotation(
            Line(points = {{14, -38}, {100, -38}, {100, 0}}, color = {95, 95, 95}));
          connect(hydrostatic.frame_a, body1.frame_a) annotation(
            Line(points = {{-50, 50}, {-46, 50}, {-46, -26}, {2, -26}}, color = {95, 95, 95}));
          connect(excitation.frame_a, body1.frame_a) annotation(
            Line(points = {{-10, 54}, {-4, 54}, {-4, -26}, {2, -26}}, color = {95, 95, 95}));
          connect(radiation.frame_a, body1.frame_a) annotation(
            Line(points = {{18, 58}, {2, 58}, {2, -26}}, color = {95, 95, 95}));
          connect(dampingDrag.frame_a, body1.frame_a) annotation(
            Line(points = {{62, 54}, {58, 54}, {58, -26}, {2, -26}}, color = {95, 95, 95}));
          */
      connect(bodyMass.frame_a, frame_a) annotation(
        Line(points = {{-2, -20}, {-100, -20}, {-100, 0}}, color = {95, 95, 95}));
      connect(bodyMass.frame_a, frame_b) annotation(
        Line(points = {{-2, -20}, {100, -20}, {100, 0}}, color = {95, 95, 95}));
      connect(hydrostatic.frame_a, bodyMass.frame_a) annotation(
        Line(points = {{-62, 48}, {-2, 48}, {-2, -20}}, color = {95, 95, 95}));
      connect(excitation.frame_a, bodyMass.frame_a) annotation(
        Line(points = {{-14, 48}, {-2, 48}, {-2, -20}}, color = {95, 95, 95}));
      connect(radiation.frame_a, bodyMass.frame_a) annotation(
        Line(points = {{16, 48}, {-2, 48}, {-2, -20}}, color = {95, 95, 95}));
      connect(dampingDrag.frame_a, bodyMass.frame_a) annotation(
        Line(points = {{60, 48}, {-2, 48}, {-2, -20}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 145}, {150, 105}}, textString = "%name", textColor = {0, 0, 255}), Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Hydro Body")}),
        Diagram);
    end HydrodynamicBody_am;

    model HydrodynamicBody_mm "6-Dimensional Hydrodynamic Forces and Moments Calculation"
      // Inheritance
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
      extends DataImport.GeometryFile(geometryFile = "None");
      extends DataImport.BodyIndex;
      // Simulation parameters w/ implicit connections
      outer Hydro.FilePath fileDirectory;
      // Body data
      parameter Boolean animationEnable = false "Enable animation with stl geometry file" annotation(
        Dialog(group = "Body Data"));
      // Mass parameters
      parameter Modelica.Units.SI.Length ra_CM[3] = {0, 0, 0} "Position vector between joint A and the centre of mass" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Length rCM_b[3] = {0, 0, 0} "Position vector between the centre of mass and joint B" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Length ra_b[3] = ra_CM + rCM_b "Position vector between joint A and joint B" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_11 = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_22 = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_33 = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_21 = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_31 = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Inertia I_32 = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Mass"));
      parameter Modelica.Units.SI.Distance r_0Init[3] = {0, 0, 0} "Initial translational position vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.Velocity v_0Init[3] = {0, 0, 0} "Initial translational velocity vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.Acceleration a_0Init[3] = {0, 0, 0} "Initial translational acceleration vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.Angle angles_0Init[3] = {0, 0, 0} "Initial angular position vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.AngularVelocity w_0Init[3] = {0, 0, 0} "Initial angular velocity vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      parameter Modelica.Units.SI.AngularAcceleration z_0Init[3] = {0, 0, 0} "Initial angular acceleration vector between word and centre of mass" annotation(
        Dialog(tab = "Initial Conditions"));
      // Hydrostatic
      Hydrostatic hydrostatic(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex, enableHydrostaticForce = enableHydrostaticForce) if enableHydrostaticForce annotation(
        Placement(transformation(origin = {-80, 48}, extent = {{18, -18}, {-18, 18}})));
      parameter Boolean enableHydrostaticForce = true "Switch to enable/disable hydrostatic force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Hydrostatic"));
      // Radiation
      Radiation radiation(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex, enableRadiationForce = enableRadiationForce) if enableRadiationForce annotation(
        Placement(transformation(origin = {34, 48}, extent = {{-18, -18}, {18, 18}})));
      parameter Boolean enableRadiationForce = true "Switch to enable/disable radiation force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Radiation"));
      // Excitation
      Excitation excitation(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile, bodyIndex = bodyIndex) if enableExcitationForce annotation(
        Placement(transformation(origin = {-32, 48}, extent = {{18, -18}, {-18, 18}})));
      parameter Boolean enableExcitationForce = true "Switch to enable/disable excitation force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Excitation"));
      // Damping/drag
      DampingDrag dampingDrag(enableDampingDragForce = enableDampingDragForce) if enableDampingDragForce annotation(
        Placement(transformation(origin = {78, 48}, extent = {{-18, -18}, {18, 18}})));
      parameter Boolean enableDampingDragForce = true "Switch to enable/disable damping/drag force calculation" annotation(
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Damping/Drag"));
      // Sensor (validation)
      Modelica.Mechanics.MultiBody.Parts.Body body(m = 1000000, I_11 = I_11, I_22 = I_22, I_33 = I_33, I_21 = I_21, I_31 = I_31, I_32 = I_32) annotation(
        Placement(transformation(origin = {-8, -34}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Forces.WorldForceAndTorque forceAndTorque annotation(
        Placement(transformation(origin = {-56, -58}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Sources.Cosine cosine[3](amplitude = {526000, 1, 1500000}, f = {0.1, 0.1, 0.1}) annotation(
        Placement(transformation(origin = {-124, -34}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Sources.Cosine cosine1[3](amplitude = {6, 4100000, 0.01}, f = {0.1, 0.10, 0.1}) annotation(
        Placement(transformation(origin = {-152, -82}, extent = {{-10, -10}, {10, 10}})));
    equation
//Conections
/*
            
              connect(body1.frame_a, frame_a) annotation(
            Line(points = {{-10, -38}, {-100, -38}, {-100, 0}}, color = {95, 95, 95}));
          connect(body1.frame_a, frame_b) annotation(
            Line(points = {{14, -38}, {100, -38}, {100, 0}}, color = {95, 95, 95}));
          connect(hydrostatic.frame_a, body1.frame_a) annotation(
            Line(points = {{-50, 50}, {-46, 50}, {-46, -26}, {2, -26}}, color = {95, 95, 95}));
          connect(excitation.frame_a, body1.frame_a) annotation(
            Line(points = {{-10, 54}, {-4, 54}, {-4, -26}, {2, -26}}, color = {95, 95, 95}));
          connect(radiation.frame_a, body1.frame_a) annotation(
            Line(points = {{18, 58}, {2, 58}, {2, -26}}, color = {95, 95, 95}));
          connect(dampingDrag.frame_a, body1.frame_a) annotation(
            Line(points = {{62, 54}, {58, 54}, {58, -26}, {2, -26}}, color = {95, 95, 95}));
          */
      connect(body.frame_a, frame_a) annotation(
        Line(points = {{-18, -34}, {-100, -34}, {-100, 0}}, color = {95, 95, 95}));
      connect(body.frame_a, frame_b) annotation(
        Line(points = {{-18, -34}, {100, -34}, {100, 0}}, color = {95, 95, 95}));
      connect(hydrostatic.frame_a, body.frame_a) annotation(
        Line(points = {{-62, 48}, {-18, 48}, {-18, -34}}, color = {95, 95, 95}));
      connect(excitation.frame_a, body.frame_a) annotation(
        Line(points = {{-14, 48}, {-18, 48}, {-18, -34}}, color = {95, 95, 95}));
      connect(radiation.frame_a, body.frame_a) annotation(
        Line(points = {{16, 48}, {-18, 48}, {-18, -34}}, color = {95, 95, 95}));
      connect(dampingDrag.frame_a, body.frame_a) annotation(
        Line(points = {{60, 48}, {-18, 48}, {-18, -34}}, color = {95, 95, 95}));
      connect(forceAndTorque.frame_b, body.frame_a) annotation(
        Line(points = {{-46, -58}, {-18, -58}, {-18, -34}}, color = {95, 95, 95}));
      connect(cosine1.y, forceAndTorque.torque) annotation(
        Line(points = {{-140, -82}, {-68, -82}, {-68, -52}}, color = {0, 0, 127}));
      connect(cosine.y, forceAndTorque.force) annotation(
        Line(points = {{-112, -34}, {-68, -34}, {-68, -64}}, color = {0, 0, 127}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 145}, {150, 105}}, textString = "%name", textColor = {0, 0, 255}), Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Hydro Body")}),
        Diagram);
    end HydrodynamicBody_mm;

    model Buoyancy
      extends DataImport.massNoB2BData;
      extends DataImport.bodyData;
      extends DataImport.physicalConstantData;
      // Inherit frame_a
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialOneFrame_a;
    
      
    
      constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "Acceleration due to gravity [m/s^2]";
      Modelica.Units.SI.Force fg = M[1,1]*g;
      Modelica.Units.SI.Force fb = vol[1,1]*rho*g;
      Modelica.Units.SI.Force Fg[3] = {0,0,fg};
      Modelica.Units.SI.Force Fb[3] = {0,0,fb};
      Modelica.Units.SI.Force Fnet[3] = Fg - Fb;
      Modelica.Units.SI.Position cgbM[3,1] = cb - cg;
      Modelica.Units.SI.Position cgb[3] = cgbM[:,1];
      Modelica.Units.SI.Torque Tnet[3] = cross(Fb,cgb);
      
    equation
    
    
      frame_a.f = Fnet;
      frame_a.t = Tnet;

    end Buoyancy;
  end Hydro;

  package Wave
    partial model waveParameters "Top-level wave parameter class"
      // Inheritance
      //extends DataImport.physicalConstantData; // can remove
      //extends DataImport.excitationData; // can remove
      //extends Models.forceTorque; // can remove
      extends DataImport.waveData;
      extends DataImport.frequencyData;
      // need to add
      extends Models.physicalConstants;
      // Wave selection
      parameter String waveSelector = "PiersonMoskowitz" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "Linear", choice = "Bretschneider", choice = "PiersonMoskowitz", choice = "JONSWAP"));
      parameter Integer n_omega = 1 "Number of frequency components (default is 100 for irregular)" annotation(
        Dialog(group = "Simulation Parameters", enable = waveSelector <> "Linear"));
      parameter Modelica.Units.SI.Length Hs = 2.5 "Significant Wave Height [m]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omega_peak = 0.9423 "Peak spectral frequency [rad/s]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      Modelica.Units.SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation [rad/s]";
      /*
                                                                  parameter Modelica.Units.SI.Length d = 100 "Water depth [m]" annotation(
                                                                    Dialog(group = "Wave Spectrum Parameters")); // Removing because now reading
                                                                    */
      parameter Modelica.Units.SI.Time Trmp = 200 "Interval for ramping up of waves during start phase [s]" annotation(
        Dialog(group = "Simulation Parameters"));
      Modelica.Units.SI.Length SSE "Sea surface elevation [m]";
      Modelica.Units.SI.Length zeta[n_omega] "Wave amplitude component [m]";
      parameter Real epsilon[n_omega] = Wave.WaveFunctions.RandomFrequencyFunctions.randomNumberGen(localSeed1, globalSeed1, n_omega) "Wave components phase shift";
    protected
      // Derived parameters
      parameter Integer localSeed1 = 614757 "Local random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection"));
      // readd , enable = frequencySelection == "random"
      parameter Integer globalSeed1 = 40020 "Global random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection"));
      // readd , enable = frequencySelection == "random"
      Modelica.Units.SI.Time Tp[n_omega] "Wave period components [s]" annotation(
        HideResult = true);
      Modelica.Units.SI.WaveNumber k[n_omega] "Wave number component [1/m]";
      //Real F_exc[nDoF] "6D excitation force [N]";
    equation
// Calculate wave parameters
      Tp = 2*pi./omega;
      k = Wave.WaveFunctions.WaveParameterFunctions.waveNumber(d, omega);
// Calculate sea surface elevation (SSE) as the sum of all wave components
// may need to readd for regular SSE = sum(zeta.*cos(omega*time - 2*pi*epsilon));
      annotation(
        Documentation(info = "<html>
              <p>This model implements the linear Airy wave theory to calculate wave elevation profiles and associated excitation forces.</p>
              <p>Key features:</p>
              <ul>
                <li>Calculates sea surface elevation (SSE) based on wave parameters</li>
                <li>Computes excitation force using interpolated coefficients from hydrodynamic data</li>
                <li>Applies a ramping function to the excitation force during the initial phase</li>
                <li>Outputs the excitation force as a 3D vector (vertical component only)</li>
              </ul>
              <p>The model requires hydrodynamic coefficient data to be provided in a .mat file.</p>
            </html>"),
        Diagram(coordinateSystem(extent = {{100, 20}, {120, -20}})));
    end waveParameters;

    package regularWave
      /* Package for regular wave elevation profile and excitation force calculations */

      model LinearWave "Implementation of linear Airy wave model"
        // Inherit from waveParameters class, modifying the number of frequency components
        extends OET.Wave.waveParameters(n_omega = 1, epsilon = fill(0, n_omega));
      equation
// Calculate wave amplityde
        zeta[n_omega] = Hs/2 "Wave amplitude [m]";
// Assign peak amplitude to the scalar frequency
        omega[n_omega] = omega_peak;
        annotation(
          Documentation(info = "<html>
            <p>This model implements the linear Airy wave theory to calculate wave elevation profiles and associated excitation forces.</p>
            <p>Key features:</p>
            <ul>
              <li>Calculates sea surface elevation (SSE) based on wave parameters</li>
              <li>Computes excitation force using interpolated coefficients from hydrodynamic data</li>
              <li>Applies a ramping function to the excitation force during the initial phase</li>
              <li>Outputs the excitation force as a 3D vector (vertical component only)</li>
            </ul>
            <p>The model requires hydrodynamic coefficient data to be provided in a .mat file.</p>
          </html>"),
          Icon(graphics = {Line(points = {{-90, 0}, {-60, 20}, {-30, -20}, {0, 20}, {30, -20}, {60, 20}, {90, 0}}, color = {0, 0, 200}, thickness = 2, smooth = Smooth.Bezier), Text(extent = {{-100, 50}, {100, -150}}, textString = "Linear Wave", fontName = "Arial")}),
          experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-08, Interval = 0.05));
      end LinearWave;
      annotation(
        Documentation(info = "<html>
          <p>This package contains models for generating regular wave profiles and calculating associated excitation forces.</p>
          <p>The package currently includes:</p>
          <ul>
            <li>LinearWave: A model implementing the linear Airy wave theory</li>
          </ul>
        </html>"),
        Icon(graphics = {Line(points = {{-90, 0}, {-60, 20}, {-30, -20}, {0, 20}, {30, -20}, {60, 20}, {90, 0}}, color = {0, 0, 200}, thickness = 2, smooth = Smooth.Bezier), Text(extent = {{-90, -70}, {90, -90}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "Regular Wave")}));
    end regularWave;

    package WaveFunctions
      package EqualEnergyFrequencyFunctions
        function equalEnergyFrequencySelector
          // Can lead to errors if n_omega and n_omega_int are not selected properly, need to make more rubust
          input Real omegaMin "Minimum frequency [rad/s]";
          input Real omegaMax "Maximum frequency [rad/s]";
          parameter input Integer n_omega "Number of frequency compenents to define the output spectrum";
          parameter input Integer n_omega_int "Number of steps to define the intermediate spectrum";
          input Real omega_int[n_omega_int] "Integration frquencies for the intermediate spectrum";
          input Real S_int[n_omega_int] "Intermediate spectrum";
          output Real omega[n_omega] "Output vector of selected frequency components [rad/s]";
          //output Real S[n_omega] "Output spectrum";
        protected
          Real S[n_omega] "Output spectrum";
          Real domega = Wave.WaveFunctions.SpectrumFunctions.Calculations.frequencyStepGenerator(omegaMin = omegaMin, omegaMax = omegaMax, n_omega = n_omega_int) "Frequency step for the intermediate spectrum";
          Real cumEnergy_int[n_omega_int] "Vector of cumulative spectrum interval areas in the intermediate spectrum";
          Real totEnergy "Total energy in the spectrum";
          Real energy_int "Energy in current interval for the intermediate spectrum";
          Real meanEnergy "Mean energy per interval in output spectrum";
          Real cumEnergy "Vector of cumulative sprectrum interval areas in the output spectrum";
        algorithm
          cumEnergy := 0;
          cumEnergy_int[1] := 0;
          omega[1] := omegaMin;
          omega[end] := omegaMax;
          S[1] := S_int[1];
          S[end] := S_int[end];
// Finding the energy in the current interval to determine the current cumulative energy
          for i in 2:n_omega_int loop
            energy_int := OET.Wave.WaveFunctions.SpectrumFunctions.Calculations.trapezoidalIntegration(S_int[i - 1], S_int[i], domega);
            cumEnergy_int[i] := cumEnergy_int[i - 1] + energy_int;
          end for;
          totEnergy := cumEnergy_int[end];
// Finding the total energy by taking the last step of the cumulative energy
          meanEnergy := totEnergy/(n_omega - 1);
/*Adding the desired mean energy to the energy to the culmulative energy at the current step so that the output frequency and spectrum can be interpolated from the intermediate spectrum */
          for i in 2:(n_omega - 1) loop
            cumEnergy := cumEnergy + meanEnergy;
            omega[i] := Modelica.Math.Vectors.interpolate(cumEnergy_int, omega_int, cumEnergy);
            S[i] := Modelica.Math.Vectors.interpolate(omega_int, S_int, omega[i]);
          end for;
        end equalEnergyFrequencySelector;
      end EqualEnergyFrequencyFunctions;

      package RandomFrequencyFunctions
        function randomFrequencySelector "Function to randomly select frequency components within a specified range"
          parameter input Real omegaMin "Minimum frequency [rad/s]";
          parameter input Real omegaMax "Maximum frequency [rad/s]";
          parameter input Integer localSeed "Local seed for random number generation";
          parameter input Integer globalSeed "Global seed for random number generation";
          parameter input Integer n_omega "Number of frequency components";
          output Real omega[n_omega] "Output vector of selected frequency components [rad/s]";
        protected
          Real epsilon[n_omega] = Wave.WaveFunctions.RandomFrequencyFunctions.randomVectorGenerator(localSeed, globalSeed, n_omega) "Random vector for frequency perturbation";
          constant Real scalarShift = 0.5 "Scaler to shift randon vector between -0.5 and 0.5";
          Real omegaDefault[n_omega] = omegaMin:domega:omegaMax "Reference frequency vector [rad/s]";
          parameter Real domega = Wave.WaveFunctions.SpectrumFunctions.Calculations.frequencyStepGenerator(omegaMin = omegaMin, omegaMax = omegaMax, n_omega = (n_omega - 1)) "Step size";
        algorithm
          omega[1] := omegaMin;
          for i in 2:n_omega - 1 loop
            omega[i] := omegaDefault[i] + (epsilon[i] - scalarShift)*domega;
          end for;
          omega[end] := omegaMax;
          annotation(
            Documentation(info = "<html>
            <p>Syntax: omega = frequencySelector(OmegaMin, omega_max, epsilon)</p>
            <p>Description: This function selects frequency components within a specified range, using a random phase vector to perturb the frequencies. This ensures a good distribution of frequencies for irregular wave generation.</p>
            <p>Inputs:</p>
            <ul>
              <li><code>OmegaMin</code>: Minimum frequency [rad/s]</li>
              <li><code>omega_max</code>: Maximum frequency [rad/s]</li>
              <li><code>epsilon</code>: Random phase vector for frequency perturbation</li>
            </ul>
            <p>Outputs:</p>
            <ul>
              <li><code>omega</code>: Output vector of selected frequency components [rad/s]</li>
            </ul>
            <p>Algorithm: The function creates a reference frequency vector and then perturbs it using the random phase vector, ensuring the first and last frequencies are exactly omega_min and omega_max.</p>
          </html>"),
            Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-90, 50}, {90, -50}}, textString = "ω(ε)", textStyle = {TextStyle.Bold})}));
        end randomFrequencySelector;

        function randomVectorGenerator "Function to generate a vector random numbers using XOR shift 64 algorithm"
          input Integer localSeed "Local seed for random number generation";
          input Integer globalSeed "Global seed for random number generation";
          constant input Integer n "Number of random numbers to generate";
          output Real r[n] "Vector of generated random numbers";
        protected
          Integer state[2](each start = 0, each fixed = true) "State vector for XOR shift algorithm";
        algorithm
          state := Modelica.Math.Random.Generators.Xorshift64star.initialState(localSeed, globalSeed);
          for i in 1:n loop
            (r[i], state) := Modelica.Math.Random.Generators.Xorshift64star.random(state);
          end for;
          annotation(
            Documentation(info = "<html>
            <p>Syntax: r64 = randomNumberGen(ls, gs, n)</p>
            <p>Description: This function generates a vector of random numbers using the Xorshift64star algorithm, which is known for its efficiency and good statistical properties.</p>
            <p>Inputs:</p>
            <ul>
              <li><code>ls</code>: Local seed for random number generation (default: 614657)</li>
              <li><code>gs</code>: Global seed for random number generation (default: 30020)</li>
              <li><code>n</code>: Number of random numbers to generate (default: 100)</li>
            </ul>
            <p>Outputs:</p>
            <ul>
              <li><code>r64</code>: Vector of generated random numbers</li>
            </ul>
            <p>Algorithm: The function uses the Xorshift64star algorithm to generate random numbers based on the provided seeds.</p>
          </html>"),
            Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-90, 50}, {90, -50}}, textString = "RNG", textStyle = {TextStyle.Bold})}));
        end randomVectorGenerator;
      end RandomFrequencyFunctions;

      package SpectrumFunctions
        function spectrumGenerator_PiersonMoskowitz "Function to generate modified Pierson-Moskowitz spectrum"
          /* Calculates spectral values for given frequencies based on significant wave height and peak wave frequency */
          extends OET.Wave.WaveFunctions.SpectrumFunctions.spectrumIO;
        protected
          // Physical constants
          constant Real pi = Modelica.Constants.pi "Mathematical constant pi";
          Real beta[n_omega] "Exponential term";
        algorithm
          beta := exp(-1.25*(omegaPeak./omega).^4);
          S := 5/16*Hs^2*omegaPeak^(4).*omega.^(-5).*beta;
          annotation(
            Documentation(info = "<html>
            <p>Syntax: spec = spectrumGenerator_PM(Hs, omega)</p>
            <p>Description: This function generates the Pierson-Moskowitz spectrum, which is suitable for fully developed seas. It calculates spectral values for given frequencies based on the significant wave height.</p>
            <p>Inputs:</p>
            <ul>
              <li><code>Hs</code>: Significant wave height [m] (default: 1)</li>
              <li><code>omega</code>: Array of frequency components [rad/s]</li>
            </ul>
            <p>Outputs:</p>
            <ul>
              <li><code>spec</code>: Array of spectral values for input frequencies [m^2s]</li>
            </ul>
            <p>Algorithm: The function calculates spectral values using the Pierson-Moskowitz formula: S(ω) = 0.0081*g^2/ω^5 * exp(-0.0358*(g/(Hs*ω^2))^2)</p>
          </html>"),
            Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-90, 50}, {90, -50}}, textString = "PM", textStyle = {TextStyle.Bold})}));
        end spectrumGenerator_PiersonMoskowitz;

        function spectrumGenerator_JONSWAP "Function to generate JONSWAP (Joint North Sea Wave Project) spectrum"
          /* Calculates spectral values based on significant wave height, peak frequency, spectral width, and peak shape parameters */
          extends OET.Wave.WaveFunctions.SpectrumFunctions.spectrumIO;
          input Real sigmaA "Minimum spectral width parameter";
          input Real sigmaB "Maximum spectral width parameter";
          input Real gamma "Peak enhancement factor for JONSWAP spectrum";
        protected
          // Physical constants
          constant Real pi = Modelica.Constants.pi "Mathematical constant pi";
          Real lambda "Normalizing parameter";
          Real alpha[n_omega] "Peak shape parameter exponent";
          Real sigma[n_omega] "Spectral width parameter";
          Real b "Exponent for peak enhancement factor";
          Real Spm[n_omega] "Pierson-Moskowitz spectrum";
        algorithm
          Spm := OET.Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator_PiersonMoskowitz(Hs = Hs, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega);
          lambda := 1 - 0.287*log(gamma);
          for i in 1:n_omega loop
            if omega[i] <= omegaPeak then
              sigma[i] := sigmaA;
            else
              sigma[i] := sigmaB;
            end if;
            alpha[i] := exp(-0.5*((omega[i] - omegaPeak)/(sigma[i]*omegaPeak))^2);
            S[i] := lambda*Spm[i]*gamma^alpha[i];
          end for;
          annotation(
            Documentation(info = "<html>
            <p>Syntax: spec = spectrumGenerator_JONSWAP(Hs, omega, omega_peak, spectralWidth_min, spectralWidth_max)</p>
            <p>Description: This function generates the JONSWAP (Joint North Sea Wave Project) spectrum, which is suitable for developing seas with fetch limitations. It calculates spectral values based on significant wave height, peak frequency, and spectral width parameters.</p>
            <p>Inputs:</p>
            <ul>
              <li><code>Hs</code>: Significant wave height [m] (default: 1)</li>
              <li><code>omega</code>: Array of frequency components [rad/s]</li>
              <li><code>omega_peak</code>: Peak spectral frequency [rad/s] (default: 0.9423)</li>
              <li><code>spectralWidth_min</code>: Minimum spectral width parameter</li>
              <li><code>spectralWidth_max</code>: Maximum spectral width parameter</li>
            </ul>
            <p>Outputs:</p>
            <ul>
              <li><code>spec</code>: Array of spectral values for input frequencies [m^2s]</li>
            </ul>
            <p>Algorithm: The function calculates spectral values using the JONSWAP formula, which is an extension of the Pierson-Moskowitz spectrum with additional parameters to account for fetch-limited seas.</p>
          </html>"),
            Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-90, 50}, {90, -50}}, textString = "JONSWAP", textStyle = {TextStyle.Bold})}));
        end spectrumGenerator_JONSWAP;

        package Calculations
          function frequencyStepGenerator
            input Real omegaMin;
            input Real omegaMax;
            constant input Integer n_omega;
            output Real domega = (omegaMax - omegaMin)/n_omega "Frequency step size";
          end frequencyStepGenerator;

          function integrationFrequencyGen
            input Real omegaMin "Minimum frequency [rad/s]";
            input Real omegaMax "Maximum frequency [rad/s]";
            constant input Integer n_omega_int "Number of frequency compenents defining the spectrum";
            output Real omega_int[n_omega_int];
            // = omega_min:domega_int:omega_max "Frequencies for spectrum generation and integration";
          protected
            Real domega_int = (omegaMax - omegaMin)/(n_omega_int) "Frequency step size";
          algorithm
            omega_int[1] := omegaMin;
            omega_int[end] := omegaMax;
            for i in 2:n_omega_int - 1 loop
              omega_int[i] := omega_int[i - 1] + domega_int;
            end for;
          end integrationFrequencyGen;

          function trapezoidalIntegration
            input Real y1;
            input Real y2;
            input Real domega;
            output Real Area;
          algorithm
            Area := 0.5*domega*(y1 + y2);
          end trapezoidalIntegration;

          function frequencyStepDifference
            input Modelica.Units.SI.AngularVelocity omega[n_omega];
            input Integer n_omega;
            output Modelica.Units.SI.AngularVelocity domega[n_omega];
          protected
            Modelica.Units.SI.AngularVelocity omegaMin;
            Modelica.Units.SI.AngularVelocity omegaMax;
          algorithm
            omegaMin := omega[1];
            omegaMax := omega[end];
            domega[1] := OET.Wave.WaveFunctions.SpectrumFunctions.Calculations.frequencyStepGenerator(omegaMin, omegaMax, n_omega);
            for i in 2:n_omega loop
              domega[i] := omega[i] - omega[i - 1];
            end for;
          end frequencyStepDifference;
        end Calculations;

        function spectrumGenerator
          import Wave.WaveFunctions.SpectrumFunctions;
          extends spectrumIO;
          input String waveSelector "Wave Generation Selector";
          // JONSWAP parameters
          input Real gamma "Peak enhancement factor, the mean typical value is 3.3";
          input Real sigmaA "Lower spectral bound for JONSWAP";
          input Real sigmaB "Upper spectral bound for JONSWAP";
        algorithm
          if waveSelector == "PiersonMoskowitz" then
            S := spectrumGenerator_PiersonMoskowitz(Hs = Hs, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega);
          elseif waveSelector == "JONSWAP" then
            S := spectrumGenerator_JONSWAP(Hs = Hs, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega, sigmaA = sigmaA, sigmaB = sigmaB, gamma = gamma);
          end if;
        end spectrumGenerator;

        partial model spectrumIO "Common input/output parameters for spectrum generation"
          input Real Hs "Significant wave height [m]";
          input Real omegaPeak "Peak spectral frequency [rad/s]" annotation(
            Dialog(group = "Wave Spectrum Parameters"));
          input Real omega[n_omega] "Array of frequency components [rad/s]";
          parameter input Integer n_omega "Number of frequency components (default is 100 for irregular)";
          output Real S[n_omega] "Array of spectral values for input frequencies [m^2s]";
        end spectrumIO;
      end SpectrumFunctions;

      package WaveParameterFunctions
        function waveNumber "Function to iteratively compute the wave number from frequency components"
          /* Uses the dispersion relationship for water waves to calculate wave numbers
                                                                                                                                                                   This function implements an iterative method to solve the implicit dispersion equation */
          input Real d "Water depth [m]";
          input Real omega[:] "Array of wave frequency components [rad/s]";
          output Real k[size(omega, 1)] "Array of wave number components [rad/m]";
        protected
          constant Real g = Modelica.Constants.g_n "Gravitational acceleration [m/s^2]";
          constant Real pi = Modelica.Constants.pi "Mathematical constant pi";
          parameter Integer n = size(omega, 1) "Number of frequency components";
          Real T[size(omega, 1)] "Array of wave period components [s]";
          Real L0[size(omega, 1)] "Array of deepwater wavelength components [m]";
          Real L1(start = 0, fixed = true) "Temporary variable for wavelength iteration [m]";
          Real L1c(start = 0, fixed = true) "Temporary variable for wavelength iteration comparison [m]";
          Real L[size(omega, 1)] "Array of iterated wavelength components [m]";
        algorithm
          T := 2*pi./omega;
          L0 := g*T.^2/(2*pi);
          for i in 1:size(omega, 1) loop
            L1 := L0[i];
            L1c := 0;
            while abs(L1c - L1) > 0.001 loop
// could also be a return
              L1c := L1;
              L[i] := g*T[i]^2/(2*pi)*tanh(2*pi/L1*d);
              L1 := L[i];
            end while;
          end for;
          k := 2*pi./L;
          annotation(
            Documentation(info = "<html>
              <p>Syntax: k = waveNumber(d, omega)</p>
              <p>Description: This function calculates wave numbers for given frequencies and water depth using the dispersion relationship for water waves. It employs an iterative method to solve the implicit dispersion equation.</p>
              <p>Inputs:</p>
              <ul>
                <li><code>d</code>: Water depth [m]</li>
                <li><code>omega</code>: Array of wave frequency components [rad/s]</li>
              </ul>
              <p>Outputs:</p>
              <ul>
                <li><code>k</code>: Array of wave number components [rad/m]</li>
              </ul>
              <p>Algorithm:</p>
              <ol>
                <li>Calculate wave periods from frequencies</li>
                <li>Calculate deepwater wavelengths</li>
                <li>Iterate to solve the dispersion equation for each frequency component</li>
                <li>Convert wavelengths to wave numbers</li>
              </ol>
            </html>"),
            Icon(graphics = {Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-90, 50}, {90, -50}}, textString = "k(ω)", textStyle = {TextStyle.Bold}), Line(points = {{-80, -80}, {80, 80}}, color = {0, 0, 255}, thickness = 0.5)}),
            Diagram(graphics = {Text(extent = {{-100, 80}, {100, 40}}, textString = "Wave Number Calculation"), Line(points = {{-80, 0}, {80, 0}}, color = {0, 0, 255}), Line(points = {{0, -80}, {0, 80}}, color = {0, 0, 255}), Text(extent = {{-60, -20}, {60, -60}}, textString = "k = 2π/L")}),
            experiment(StopTime = 1.0, Tolerance = 1e-06));
        end waveNumber;
      end WaveParameterFunctions;

      function spectrumFrequencySelector
        input String waveSelector;
        output Integer n_omega;
      algorithm
        if waveSelector == "Linear" then
          n_omega := 1;
        else
          n_omega := 100;
        end if;
      end spectrumFrequencySelector;

      function waveNumber "Implicit wave number calculation with the dispersion relationship, using the deep water wave number as an initial guess"
        input Modelica.Units.SI.Length d "Water depth";
        input Modelica.Units.SI.Frequency omega[n_omega] "Wave frequency components";
        input Integer n_omega "Number of frequency components";
        output Modelica.Units.SI.WaveNumber k[n_omega] "Wave number components";
      protected
        constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "Gravitational acceleration";
        constant Real pi = Modelica.Constants.pi "Mathmatical constant pi";
        parameter Real tolerance = 0.001 "Tolerance to end loop";
        Modelica.Units.SI.WaveNumber kL[n_omega] "Wave number looping variable";
        parameter Integer maxIter = 100 "Maximum number of allowable iterations";
        parameter Integer counter "Counter variable";
        Modelica.Units.SI.WaveNumber k0[n_omega] "Deep water wave number";
      algorithm
// Initial guess using deep water wave number
        k0 := omega.^2/g;
        counter := 1;
        kL := zeros(n_omega);
        k := k0;
        while max(abs(k - kL)) >= tolerance and counter < maxIter loop
          kL := k;
          k := (omega.^2)./(g.*tanh(k.*d));
          counter := counter + 1;
        end while;
      end waveNumber;
    end WaveFunctions;

    package irregularWave
      /* Package for irregular wave elevation profile and excitation force calculations */

      model BretschneiderWave "Implementation of Bretschneider wave spectrum for irregular wave generation"
        extends Wave.IrregularWave.irregularWaveParameters(fileName = filePath.FileName);
        outer OET.Hydro.FilePath filePath;
      equation
        if frequencySelection == "equalEnergy" then
          S_int = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator_BRT(Hs, omega_int, omega_peak) "Spectral values for frequency components [m^2-s/rad]";
        elseif frequencySelection == "random" then
          S = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator_BRT(Hs, omega, omega_peak) "Spectral values for frequency components [m^2-s/rad]";
        end if;
        annotation(
          Documentation(info = "<html>
          <h4>Pierson-Moskowitz Wave Spectrum Model</h4>
          <p>This model implements the Pierson-Moskowitz (PM) wave spectrum to generate irregular waves and calculate associated excitation forces.</p>
          <p>Key features:</p>
          <ul>
            <li>Generates a wave spectrum based on the PM formulation</li>
            <li>Discretizes the spectrum into multiple frequency components</li>
            <li>Calculates sea surface elevation (SSE) based on superposition of wave components</li>
            <li>Computes excitation force using interpolated coefficients from hydrodynamic data</li>
            <li>Applies a ramping function to the excitation force during the initial phase</li>
            <li>Outputs the excitation force as a 3D vector (vertical component only)</li>
          </ul>
          <p>The model requires hydrodynamic coefficient data to be provided in a .mat file.</p>
          <h4>Usage Notes:</h4>
          <ul>
            <li>Adjust the spectrum parameters (Hs, omega_peak, etc.) to model different sea states</li>
            <li>The number of frequency components (n_omega) affects the smoothness of the generated waves</li>
            <li>Random seeds can be changed to generate different realizations of the same sea state</li>
          </ul>
        </html>"),
          Icon(graphics = {Line(points = {{-80, 0}, {-60, 20}, {-40, -20}, {-20, 10}, {0, -10}, {20, 30}, {40, -30}, {60, 15}, {80, -15}}, color = {0, 0, 255}, thickness = 2, smooth = Smooth.Bezier), Text(extent = {{-100, 50}, {100, -150}}, textString = " Pierson Moskowitz ", fontName = "Arial")}, coordinateSystem(initialScale = 0.1)),
          experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-08, Interval = 0.05));
      end BretschneiderWave;

      model PiersonMoskowitzWave "Implementation of Pierson-Moskowitz (PM) wave spectrum for irregular wave generation"
        extends Wave.IrregularWave.irregularWaveParameters(fileName = filePath.FileName);
        outer OET.Hydro.FilePath filePath;
      equation
        if frequencySelection == "equalEnergy" then
          S_int = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator_PM(Hs, omega_int) "Spectral values for frequency components [m^2-s/rad]";
        elseif frequencySelection == "random" then
          S = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator_PM(Hs, omega) "Spectral values for frequency components [m^2-s/rad]";
        end if;
        annotation(
          Documentation(info = "<html>
            <h4>Pierson-Moskowitz Wave Spectrum Model</h4>
            <p>This model implements the Pierson-Moskowitz (PM) wave spectrum to generate irregular waves and calculate associated excitation forces.</p>
            <p>Key features:</p>
            <ul>
              <li>Generates a wave spectrum based on the PM formulation</li>
              <li>Discretizes the spectrum into multiple frequency components</li>
              <li>Calculates sea surface elevation (SSE) based on superposition of wave components</li>
              <li>Computes excitation force using interpolated coefficients from hydrodynamic data</li>
              <li>Applies a ramping function to the excitation force during the initial phase</li>
              <li>Outputs the excitation force as a 3D vector (vertical component only)</li>
            </ul>
            <p>The model requires hydrodynamic coefficient data to be provided in a .mat file.</p>
            <h4>Usage Notes:</h4>
            <ul>
              <li>Adjust the spectrum parameters (Hs, omega_peak, etc.) to model different sea states</li>
              <li>The number of frequency components (n_omega) affects the smoothness of the generated waves</li>
              <li>Random seeds can be changed to generate different realizations of the same sea state</li>
            </ul>
          </html>"),
          Icon(graphics = {Line(points = {{-80, 0}, {-60, 20}, {-40, -20}, {-20, 10}, {0, -10}, {20, 30}, {40, -30}, {60, 15}, {80, -15}}, color = {0, 0, 255}, thickness = 2, smooth = Smooth.Bezier), Text(extent = {{-100, 50}, {100, -150}}, textString = " Pierson Moskowitz ", fontName = "Arial")}, coordinateSystem(initialScale = 0.1)),
          experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-08, Interval = 0.05));
      end PiersonMoskowitzWave;

      model JONSWAPWave "Implementation of JONSWAP wave spectrum for irregular wave generation"
        extends Wave.IrregularWave.irregularWaveParameters(fileName = filePath.FileName);
        outer OET.Hydro.FilePath filePath;
        // JONSWAP parameters
        parameter Real spectralWidth_min = 0.07 "Lower spectral bound for JONSWAP" annotation(
          Dialog(group = "Spectrum Parameters"));
        parameter Real spectralWidth_max = 0.09 "Upper spectral bound for JONSWAP" annotation(
          Dialog(group = "Spectrum Parameters"));
      equation
        if frequencySelection == "equalEnergy" then
          S_int = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator_JONSWAP(Hs, omega_int, omega_peak, spectralWidth_min, spectralWidth_max) "Spectral values for frequency components [m^2-s/rad]";
        elseif frequencySelection == "random" then
          S = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator_JONSWAP(Hs, omega, omega_peak, spectralWidth_min, spectralWidth_max) "Spectral values for frequency components [m^2-s/rad]";
        end if;
        annotation(
          Documentation(info = "<html>
          <h4>JONSWAP Wave Spectrum Model</h4>
          <p>This model implements the JONSWAP (Joint North Sea Wave Project) wave spectrum to generate irregular waves and calculate associated excitation forces.</p>
          <p>Key features:</p>
          <ul>
            <li>Generates a wave spectrum based on the JONSWAP formulation</li>
            <li>Discretizes the spectrum into multiple frequency components</li>
            <li>Calculates sea surface elevation (SSE) based on superposition of wave components</li>
            <li>Computes excitation force using interpolated coefficients from hydrodynamic data</li>
            <li>Applies a ramping function to the excitation force during the initial phase</li>
            <li>Outputs the excitation force as a 3D vector (vertical component only)</li>
          </ul>
          <p>The model requires hydrodynamic coefficient data to be provided in a .mat file.</p>
          <h4>Usage Notes:</h4>
          <ul>
            <li>Adjust the spectrum parameters (Hs, omega_peak, etc.) to model different sea states</li>
            <li>The number of frequency components (n_omega) affects the smoothness of the generated waves</li>
            <li>Random seeds can be changed to generate different realizations of the same sea state</li>
            <li>JONSWAP spectrum is particularly suitable for modeling developing seas and storm conditions</li>
          </ul>
        </html>"),
          Icon(graphics = {Line(points = {{-80, 0}, {-60, 20}, {-40, -20}, {-20, 10}, {0, -10}, {20, 30}, {40, -30}, {60, 15}, {80, -15}}, color = {0, 0, 255}, thickness = 2, smooth = Smooth.Bezier), Text(extent = {{-100, 50}, {100, -150}}, textString = " JONSWAP ", fontName = "Arial")}),
          experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-08, Interval = 0.05));
      end JONSWAPWave;

      partial model irregularWaveParameters "Irregular wave parameter class"
        // Inhertiance from the top-level wave parameter class, modifying the phase shift components
        extends Wave.waveParameters(epsilon = Wave.WaveFunctions.RandomFrequencyFunctions.randomNumberGen(localSeed1, globalSeed1, n_omega));
        // Irregular wave spectrum parameters
        parameter String frequencySelection = "random" annotation(
          Dialog(group = "Wave Spectrum Parameters"),
          choices(choice = "random", choice = "equalEnergy"));
        parameter Modelica.Units.SI.AngularFrequency omega_min = w[1] "Lowest frequency component [rad/s]" annotation(
          Dialog(group = "Wave Spectrum Parameters"));
        parameter Modelica.Units.SI.AngularFrequency omega_max = w[end] "Highest frequency component [rad/s]" annotation(
          Dialog(group = "Wave Spectrum Parameters"));
        // Random freqeuncy selection paramters (will be disabled if user opts to use equal energy method)
        parameter Integer localSeed = 614657 "Local random seed for frequency selection" annotation(
          Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
        parameter Integer globalSeed = 30020 "Global random seed for frequency selection" annotation(
          Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
        parameter Integer localSeed1 = 614757 "Local random seed for phase shifts" annotation(
          Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
        parameter Integer globalSeed1 = 40020 "Global random seed for phase shifts" annotation(
          Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
        // Equal Energy Parameters
        parameter Integer n_omega_int = 500 "Number of frequency components for spectrum generation and integration (equal energy only)" annotation(
          Dialog(group = "Equal Energy Frequency Selection", enable = frequencySelection == "equalEnergy"));
      protected
        // Random phase shift
        parameter Real rnd_shft[n_omega] = WaveProfile.WaveFunctions.RandomFrequencyFunctions.randomNumberGen(localSeed, globalSeed, n_omega) "Random shifts for frequency selection";
        // Frequency selection and wave spectrum
        Modelica.Units.SI.AngularFrequency domega "Frequency step size [rad/s]";
        Units.SpectrumEnergyDensity S[n_omega] "Wave energy spectrum [m^2 s/rad]";
        Modelica.Units.SI.AngularFrequency omega_int[n_omega_int] "Integration frequency step size (equal energy only) [rad/s]";
        Units.SpectrumEnergyDensity S_int[n_omega_int] "Integratation wave energy spectrum [m^2 s/rad]";
      equation
// Calculate wave parameter
        domega = WaveProfile.WaveFunctions.SpectrumFunctions.Calculations.frequencyStepGen(omega, n_omega);
        zeta = sqrt(2*S*domega);
// Select equal energy or random frequency selection
        if frequencySelection == "equalEnergy" then
          omega_int = Wave.WaveFunctions.SpectrumFunctions.Calculations.integrationFrequencyGen(omega_min, omega_max, n_omega_int);
          (omega, S) = Wave.WaveFunctions.EqualEnergyFrequencyFunctions.equalEnergyFrequencySelector(omega_min, omega_max, n_omega, n_omega_int, omega_int, S_int);
        elseif frequencySelection == "random" then
          omega = Wave.WaveFunctions.RandomFrequencyFunctions.randomFrequencySelector(omega_min, omega_max, rnd_shft) "Selected frequency components [rad/s]";
          omega_int = zeros(n_omega_int);
          S_int = zeros(n_omega_int);
        end if;
        annotation(
          Documentation(info = "<html>
            <p><b>Bretschneider Wave Spectrum Model</b></p>
            <p>This model implements the Bretschneider wave spectrum to generate irregular waves and calculate associated excitation forces.</p>
            <p><b>Key features:</b></p>
            <ul>
              <li>Generates a wave spectrum based on the Bretschneider formulation</li>
              <li>Discretizes the spectrum into multiple frequency components</li>
              <li>Calculates sea surface elevation (SSE) based on superposition of wave components</li>
              <li>Computes excitation force using interpolated coefficients from hydrodynamic data</li>
              <li>Applies a ramping function to the excitation force during the initial phase</li>
              <li>Outputs the excitation force as a 3D vector (vertical component only)</li>
            </ul>
            <p>The model requires hydrodynamic coefficient data to be provided in a .mat file.</p>
            <p><b>Usage Notes:</b></p>
            <ul>
              <li>Adjust the spectrum parameters (Hs, omega_peak, etc.) to model different sea states</li>
              <li>The number of frequency components (n_omega) affects the smoothness of the generated waves</li>
              <li>Random seeds can be changed to generate different realizations of the same sea state</li>
            </ul>
          </html>"),
          Icon(graphics = {Line(points = {{-80, 0}, {-60, 20}, {-40, -20}, {-20, 10}, {0, -10}, {20, 30}, {40, -30}, {60, 15}, {80, -15}}, color = {0, 0, 255}, thickness = 2, smooth = Smooth.Bezier), Text(extent = {{-100, 50}, {100, -150}}, textString = " Bretschneider ", fontName = "Arial")}, coordinateSystem(initialScale = 0.1)),
          experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-08, Interval = 0.05),
          Diagram(coordinateSystem(extent = {{100, 20}, {120, -20}})));
      end irregularWaveParameters;
      annotation(
        Documentation(info = "<html>
      <p><strong>IrregularWave Package</strong></p>
      <p>This package provides models for generating irregular wave profiles and calculating associated excitation forces using various wave spectra commonly used in ocean engineering and naval architecture.</p>
      <p><em>Included Models:</em></p>
      <ul>
        <p><strong>PiersonMoskowitzWave:</strong> Implements the Pierson-Moskowitz spectrum, suitable for fully developed seas.</p>
        <p><strong>BretschneiderWave:</strong> Implements the Bretschneider spectrum, a two-parameter spectrum also known as the modified Pierson-Moskowitz spectrum.</p>
        <p><strong>JonswapWave:</strong> Implements the JONSWAP (Joint North Sea Wave Project) spectrum, particularly useful for modeling developing seas and storm conditions.</p>
      </ul>
      <p>Each model provides options for customizing sea state parameters and offers both wave elevation profiles and excitation force calculations.</p>
    </html>"),
        Icon(graphics = {Line(points = {{-80, 0}, {-60, 20}, {-40, -20}, {-20, 10}, {0, -10}, {20, 30}, {40, -30}, {60, 15}, {80, -15}}, color = {0, 0, 255}, thickness = 2, smooth = Smooth.Bezier), Text(extent = {{-90, -70}, {90, -90}}, lineColor = {0, 0, 255}, fillColor = {0, 0, 255}, fillPattern = FillPattern.Solid, textString = "Irregular Wave")}));
    end irregularWave;

    model RegularWave
      constant Integer n_omega = 1 "Number of frequency components (default is 100 for irregular)" annotation(
        Dialog(group = "Simulation Parameters"));
      parameter Modelica.Units.SI.Height Hs = 2.5 "Significant Wave Height" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omegaPeak = 0.9423 "Peak spectral frequency" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.Distance A = Hs/2 "Wave amplitude";
      Modelica.Units.SI.Distance SSE "Sea surface elevation";
      Real ramp "Ramping function" annotation(
        HideResult = true);
      Modelica.Units.SI.Time Trmp "Interval for ramping up of waves during start phase [s]" annotation(
        HideResult = true);
    protected
      constant Real pi = Modelica.Constants.pi "Mathematical constant pi";
    equation
      if time < Trmp then
        ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
      else
        ramp = 1;
      end if; 
      SSE = ramp.*(A*cos(omegaPeak*time));
      annotation(
        defaultComponentName = "regularWave",
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Regular Wave")}),
        Diagram);
    end RegularWave;

    model IrregularWave
      extends DataImport.FilePath;
      extends DataImport.waveData;
      extends DataImport.frequencyData;
      // Physical constants
      constant Real pi = Modelica.Constants.pi "Mathematical constant pi";
      constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "Acceleration due to gravity [m/s^2]";
      // Wave basic characteristics
      parameter String waveSelector = "PiersonMoskowitz" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "PiersonMoskowitz", choice = "JONSWAP"));
      constant Integer n_omega = 100 "Number of frequency components (default is 100 for irregular)" annotation(
        Dialog(group = "Simulation Parameters", enable = waveSelector <> "Linear"));
      parameter Modelica.Units.SI.Length Hs = 2.5 "Significant Wave Height" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omegaPeak = 0.9423 "Peak spectral frequency" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      Real ramp "Ramping function" annotation(
        HideResult = true);
      Modelica.Units.SI.Time Trmp "Interval for ramping up of waves during start phase [s]" annotation(
        HideResult = true);
      parameter String frequencySelection = "random" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "random", choice = "equalEnergy"));
      Modelica.Units.SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation";
      Modelica.Units.SI.Distance zeta[n_omega] "Wave amplitude component";
      Modelica.Units.SI.Distance SSE "Sea surface elevation";
      // Irregular wave spectrum parameters
      parameter Modelica.Units.SI.AngularFrequency omegaMin = w[1] "Lowest frequency component" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omegaMax = w[end] "Highest frequency component" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      // Intermediate calculations
      Real phi[n_omega] = 2*pi.*Wave.WaveFunctions.RandomFrequencyFunctions.randomVectorGenerator(localSeedPhase, globalSeedPhase, n_omega) "Wave components phase shift";
      Modelica.Units.SI.WaveNumber k[n_omega] = Wave.WaveFunctions.WaveParameterFunctions.waveNumber(d, omega) "Wave number component";
      Modelica.Units.SI.Time Tp[n_omega] "Wave period components" annotation(
        HideResult = true);
      Units.SpectrumEnergyDensity S[n_omega] "Wave energy spectrum";
      // Random phase selection
      parameter Integer localSeedPhase = 614757 "Local random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Phase Selection"));
      // readd , enable = frequencySelection == "random"
      parameter Integer globalSeedPhase = 40020 "Global random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Phase Selection"));
      Modelica.Units.SI.AngularFrequency domega[n_omega] "Frequency step size [rad/s]";
      Units.SpectrumEnergyDensity S_int[n_omega_int] "Integratation wave energy spectrum [m^2*s/rad]";
    protected
      // Random frequency selection
      parameter Integer localSeedFrequency = 614657 "Local random seed for frequency selection" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
      parameter Integer globalSeedFrequency = 30020 "Global random seed for frequency selection" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
      // Equal Energy Parameters
      parameter Integer n_omega_int = 500 "Number of frequency components for spectrum generation and integration" annotation(
        HideResult = true,
        Dialog(group = "Equal Energy Frequency Selection", enable = frequencySelection == "equalEnergy"));
      // if frequencySelection == "equalEnergy"
      //Modelica.Units.SI.AngularFrequency domega "Frequency step size [rad/s]";
      Modelica.Units.SI.AngularFrequency omega_int[n_omega_int] "Integration frequency step size (equal energy only) [rad/s]";
      //Units.SpectrumEnergyDensity S_int[n_omega_int] "Integratation wave energy spectrum [m^2*s/rad]";
      // Derived parameters
      // JONSWAP parameters
      parameter Real gamma = 3.3 "Peak enhancement factor for JONSWAP spectrum. The mean typical value is 3.3" annotation(
        HideResult = true,
        Dialog(group = "Spectrum", enable = waveSelector == "JONSWAP"));
      parameter Real sigmaA = 0.07 "Lower spectral bound for JONSWAP" annotation(
        HideResult = true,
        Dialog(group = "Spectrum", enable = waveSelector == "JONSWAP"));
      parameter Real sigmaB = 0.09 "Upper spectral bound for JONSWAP" annotation(
        HideResult = true,
        Dialog(group = "Spectrum", enable = waveSelector == "JONSWAP"));
    equation
// Calculate wave parameters
      Tp = 2*pi./omega;
      zeta = sqrt(2*S.*domega);
// Equal energy
      if frequencySelection == "equalEnergy" then
        omega_int = Wave.WaveFunctions.SpectrumFunctions.Calculations.integrationFrequencyGen(omegaMin, omegaMax, n_omega_int);
        S_int = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator(waveSelector = waveSelector, Hs = Hs, omegaPeak = omegaPeak, omega = omega_int, n_omega = n_omega_int, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB);
        (omega, S) = Wave.WaveFunctions.EqualEnergyFrequencyFunctions.equalEnergyFrequencySelector(omegaMin, omegaMax, n_omega, n_omega_int, omega_int, S_int);
        domega = OET.Wave.WaveFunctions.SpectrumFunctions.Calculations.frequencyStepDifference(omega = omega, n_omega = n_omega);
// Random
      elseif frequencySelection == "random" then
        omega = Wave.WaveFunctions.RandomFrequencyFunctions.randomFrequencySelector(omegaMin, omegaMax, localSeedFrequency, globalSeedFrequency, n_omega);
        S = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator(waveSelector = waveSelector, Hs = Hs, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB);
// Non conditional additions
        S_int = zeros(n_omega_int);
        omega_int = zeros(n_omega_int);
        domega = fill(Wave.WaveFunctions.SpectrumFunctions.Calculations.frequencyStepGenerator(omegaMin, omegaMax, n_omega), n_omega);
      end if;
      if time < Trmp then
        ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
      else
        ramp = 1;
      end if;
      SSE = ramp.*sum(zeta.*cos(omega*time - phi));
      annotation(
        defaultComponentName = "irregularWave",
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Irregular Wave")}),
        Diagram);
    end IrregularWave;

    model Environment
      outer OET.Hydro.FilePath fileDirectory;
      // All
      parameter String waveSelector annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "Regular", choice = "PiersonMoskowitz", choice = "JONSWAP", choice = "spectrumImport"));
      parameter String frequencySelection = "random" annotation(
        Dialog(group = "Wave Spectrum Parameters", enable = (waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP")),
        choices(choice = "random", choice = "equalEnergy"));
      parameter Modelica.Units.SI.Height Hs = 2.5 "Significant Wave Height [m]" annotation(
        Dialog(group = "Wave Spectrum Parameters", enable = waveSelector <> "spectrumImport"));
      parameter Modelica.Units.SI.AngularFrequency omegaPeak = 0.9423 "Peak spectral frequency [rad/s]" annotation(
        Dialog(group = "Wave Spectrum Parameters", enable = waveSelector <> "spectrumImport"));
      parameter Modelica.Units.SI.Time Trmp = 50 "Interval for ramping up of waves during start phase [s]" annotation(
        Dialog(group = "Simulation Parameters"));
      Modelica.Units.SI.Length SSE "Sea surface elevation [m]";
      /*
                              // Regular
                              Modelica.Units.SI.Height A = regularWave.A "Wave amplitude";
                              */
      /*
                              // Irregular
                              constant Integer n_omega = irregularWave.n_omega  "Number of frequency components"; // if waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP"
                              Modelica.Units.SI.AngularFrequency omega[n_omega] = irregularWave.omega"Frequency components selected for simulation [rad/s]";
                              Modelica.Units.SI.Length zeta[n_omega] = irregularWave.zeta "Wave amplitude component [m]";
                              Real phi[n_omega] = irregularWave.phi "Wave components phase shift";
                             */
      /*
                              // Spectrum Import
                              parameter Integer n_omegaS = spectrumImport.n_omega  "Number of frequency components"; // if waveSelector == "spectrumImport"
                              Modelica.Units.SI.AngularFrequency omegaS[n_omegaS] = spectrumImport.omega"Frequency components selected for simulation [rad/s]";
                              Modelica.Units.SI.Length zetaS[n_omegaS] = spectrumImport.zeta "Wave amplitude component [m]";
                              Real phiS[n_omegaS] = spectrumImport.phi "Wave components phase shift";
                              // Models
                              
                              */
      RegularWave regularWave(Hs = Hs, omegaPeak = omegaPeak, Trmp = Trmp) if waveSelector == "Regular" annotation(
        Placement(transformation(origin = {-26, 10}, extent = {{-10, -10}, {10, 10}})));
      //  //if waveSelector == "Regular"
      IrregularWave_test irregularWave(Hs = Hs, omegaPeak = omegaPeak, Trmp = Trmp, frequencySelection = frequencySelection, waveSelector = waveSelector, filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile) if waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP" annotation(
        Placement(transformation(origin = {30, 6}, extent = {{-10, -10}, {10, 10}})));
      // if waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP"
      SpectrumImport spectrumImport(Trmp = Trmp, filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile) if waveSelector == "spectrumImport" annotation(
        Placement(transformation(origin = {-14, -30}, extent = {{-10, -10}, {10, 10}})));
      // if waveSelector == "spectrumImport"
    equation
      if waveSelector == "Regular" then
//  A = regularWave.A;
        SSE = regularWave.SSE;
      elseif waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP" then
//omega = irregularWave.omega;
//zeta = irregularWave.zeta;
// phi = irregularWave.phi;
        SSE = irregularWave.SSE;
    //
elseif waveSelector == "spectrumImport" then
//omegaS = spectrumImport.omega;
//zetaS = spectrumImport.zeta;
//phiS = spectrumImport.phi;
        SSE = spectrumImport.SSE;
      end if;
      annotation(
        defaultComponentName = "environment",
        defaultComponentPrefixes = "inner",
        missingInnerMessage = "No \"environment\" component is defined. Drag the OET.Wave.Environment model into the top level of your model.",
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Environment")}),
        Diagram);
    end Environment;

    model SpectrumImport
      extends DataImport.FilePath;
      extends DataImport.spectrumImportData;
      // Parameters
      parameter Modelica.Units.SI.AngularFrequency omegaMin = omega[1] "Lowest frequency component" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omegaMax = omega[end] "Highest frequency component" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      Modelica.Units.SI.Distance SSE "Sea surface elevation";
      Modelica.Units.SI.Distance zeta[n_omega] = sqrt(2*S*domega) "Wave amplitude component [m]";
      Modelica.Units.SI.AngularFrequency domega = Wave.WaveFunctions.SpectrumFunctions.Calculations.frequencyStepGenerator(omegaMin = omegaMin, omegaMax = omegaMax, n_omega = n_omega) "Frequency step size";
      Real ramp "Ramping function" annotation(
        HideResult = true);
      Modelica.Units.SI.Time Trmp "Interval for ramping up of waves during start phase [s]" annotation(
        HideResult = true);
    protected
      constant Real pi = Modelica.Constants.pi "Mathematical constant pi";
    equation
      if time < Trmp then
        ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
      else
        ramp = 1;
      end if;
      SSE = ramp.*sum(zeta.*cos(omega*time - phi));
      annotation(
        defaultComponentName = "spectrumImport",
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Spectrum Import")}),
        Diagram);
    end SpectrumImport;

    model Environment_backup
      extends DataImport.FilePath;
      outer Hydro.FilePath fileDirectory;
      // All
      parameter String waveSelector = "Regular" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "Linear", choice = "PiersonMoskowitz", choice = "JONSWAP", choice = "spectrumImport"));
      parameter String frequencySelection = "random" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "random", choice = "equalEnergy"));
      parameter Modelica.Units.SI.Height Hs = 2.5 "Significant Wave Height [m]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omegaPeak = 0.9423 "Peak spectral frequency [rad/s]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.Time Trmp = 50 "Interval for ramping up of waves during start phase [s]" annotation(
        Dialog(group = "Simulation Parameters"));
      Modelica.Units.SI.Length SSE "Sea surface elevation [m]";
      // Regular
      Modelica.Units.SI.Height A "Wave amplitude";
      // Irregular
      constant Integer n_omega = irregularWave.n_omega if waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP" "Number of frequency components";
      Modelica.Units.SI.AngularFrequency omega[n_omega] = irregularWave.omega if waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP" "Frequency components selected for simulation [rad/s]";
      Modelica.Units.SI.Length zeta[n_omega] = irregularWave.zeta if waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP" "Wave amplitude component [m]";
      Real phi[n_omega] = irregularWave.phi if waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP" "Wave components phase shift";
      // Spectrum Import
      constant Integer n_omegaS = spectrumImport.n_omega if waveSelector == "spectrumImport" "Number of frequency components";
      Modelica.Units.SI.AngularFrequency omegaS[n_omegaS] = spectrumImport.omega if waveSelector == "spectrumImport" "Frequency components selected for simulation [rad/s]";
      Modelica.Units.SI.Length zetaS[n_omegaS] = spectrumImport.zeta if waveSelector == "spectrumImport" "Wave amplitude component [m]";
      Real phiS[n_omegaS] = spectrumImport.phi if waveSelector == "spectrumImport" "Wave components phase shift";
      // Models
      RegularWave regularWave(Hs = Hs, omegaPeak = omegaPeak) if waveSelector == "Regular" annotation(
        Placement(transformation(origin = {-26, 10}, extent = {{-10, -10}, {10, 10}})));
      IrregularWave irregularWave(Hs = Hs, omegaPeak = omegaPeak, frequencySelection = frequencySelection, filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile) if waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP" annotation(
        Placement(transformation(origin = {30, 6}, extent = {{-10, -10}, {10, 10}})));
      SpectrumImport spectrumImport(filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile) if waveSelector == "spectrumImport" annotation(
        Placement(transformation(origin = {-14, -30}, extent = {{-10, -10}, {10, 10}})));
    equation
      if waveSelector == "Regular" then
        A = regularWave.A;
        SSE = RegularWave.SSE;
      elseif waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP" then
        omega = irregularWave.omega;
        zeta = irregularWave.zeta;
        phi = irregularWave.phi;
        SSE = irregularWave.SSE;
      elseif waveSelector == "spectrumImport" then
        omegaS = spectrumImport.omega;
        zetaS = spectrumImport.zeta;
        phiS = spectrumImport.phi;
        SSE = spectrumImport.SSE;
      end if;
      annotation(
        defaultComponentName = "environment",
        defaultComponentPrefixes = "inner",
        missingInnerMessage = "No \"environment\" component is defined. Drag the OET.Wave.Environment model into the top level of your model.",
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Environment")}),
        Diagram);
    end Environment_backup;

    model IrregularWave_test
    
      extends DataImport.FilePath;
      extends DataImport.waveData;
      extends DataImport.frequencyData;
      // Physical constants
      constant Real pi = Modelica.Constants.pi "Mathematical constant pi";
      constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "Acceleration due to gravity [m/s^2]";
      // Wave basic characteristics
      parameter String waveSelector = "PiersonMoskowitz" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "PiersonMoskowitz", choice = "JONSWAP"));
      constant Integer n_omega = 100 "Number of frequency components (default is 100 for irregular)" annotation(
        Dialog(group = "Simulation Parameters", enable = waveSelector <> "Linear"));
      parameter Modelica.Units.SI.Length Hs = 2.5 "Significant Wave Height" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omegaPeak = 0.9423 "Peak spectral frequency" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      Real ramp "Ramping function" annotation(
        HideResult = true);
      parameter Modelica.Units.SI.Time Trmp "Interval for ramping up of waves during start phase [s]" annotation(
        HideResult = true);
      parameter String frequencySelection = "random" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "random", choice = "equalEnergy"));
      parameter Modelica.Units.SI.AngularFrequency omega[n_omega] = Wave.WaveFunctions.RandomFrequencyFunctions.randomFrequencySelector(omegaMin, omegaMax, localSeedFrequency, globalSeedFrequency, n_omega) "Frequency components selected for simulation";
     parameter Modelica.Units.SI.Distance zeta[n_omega] = sqrt(2*S.*domega)"Wave amplitude component";
      Modelica.Units.SI.Distance SSE "Sea surface elevation";
      // Irregular wave spectrum parameters
      parameter Modelica.Units.SI.AngularFrequency omegaMin = w[1] "Lowest frequency component" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omegaMax = w[end] "Highest frequency component" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      // Intermediate calculations
     parameter Real phi[n_omega] = 2*pi.*Wave.WaveFunctions.RandomFrequencyFunctions.randomVectorGenerator(localSeedPhase, globalSeedPhase, n_omega) "Wave components phase shift";
     parameter Modelica.Units.SI.WaveNumber k[n_omega] = Wave.WaveFunctions.WaveParameterFunctions.waveNumber(d, omega) "Wave number component";
      parameter Modelica.Units.SI.Time Tp[n_omega] = 2*pi./omega"Wave period components" annotation(
        HideResult = true);
      parameter Units.SpectrumEnergyDensity S[n_omega] = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator(waveSelector = waveSelector, Hs = Hs, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB) "Wave energy spectrum";
      // Random phase selection
      parameter Integer localSeedPhase = 614757 "Local random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Phase Selection"));
      // readd , enable = frequencySelection == "random"
      parameter Integer globalSeedPhase = 40020 "Global random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Phase Selection"));
      parameter Modelica.Units.SI.AngularFrequency domega[n_omega] = fill(Wave.WaveFunctions.SpectrumFunctions.Calculations.frequencyStepGenerator(omegaMin, omegaMax, n_omega), n_omega) "Frequency step size [rad/s]";
      parameter Units.SpectrumEnergyDensity S_int[n_omega_int] = zeros(n_omega_int) "Integratation wave energy spectrum [m^2*s/rad]";
    protected
      // Random frequency selection
      parameter Integer localSeedFrequency = 614657 "Local random seed for frequency selection" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
      parameter Integer globalSeedFrequency = 30020 "Global random seed for frequency selection" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
      // Equal Energy Parameters
      parameter Integer n_omega_int = 500 "Number of frequency components for spectrum generation and integration" annotation(
        HideResult = true,
        Dialog(group = "Equal Energy Frequency Selection", enable = frequencySelection == "equalEnergy"));
      // if frequencySelection == "equalEnergy"
      //Modelica.Units.SI.AngularFrequency domega "Frequency step size [rad/s]";
      parameter Modelica.Units.SI.AngularFrequency omega_int[n_omega_int] = zeros(n_omega_int) "Integration frequency step size (equal energy only) [rad/s]";
      //Units.SpectrumEnergyDensity S_int[n_omega_int] "Integratation wave energy spectrum [m^2*s/rad]";
      // Derived parameters
      // JONSWAP parameters
      parameter Real gamma = 3.3 "Peak enhancement factor for JONSWAP spectrum. The mean typical value is 3.3" annotation(
        HideResult = true,
        Dialog(group = "Spectrum", enable = waveSelector == "JONSWAP"));
      parameter Real sigmaA = 0.07 "Lower spectral bound for JONSWAP" annotation(
        HideResult = true,
        Dialog(group = "Spectrum", enable = waveSelector == "JONSWAP"));
      parameter Real sigmaB = 0.09 "Upper spectral bound for JONSWAP" annotation(
        HideResult = true,
        Dialog(group = "Spectrum", enable = waveSelector == "JONSWAP"));
    equation
    
    
      if time < Trmp then
        ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
      else
        ramp = 1;
      end if;
      SSE = ramp.*sum(zeta.*cos(omega*time - phi));
      annotation(
        defaultComponentName = "irregularWave",
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Irregular Wave")}),
        Diagram);

    end IrregularWave_test;

    partial model waveParameters_test
      // Inheritance
      //extends DataImport.physicalConstantData; // can remove
      //extends DataImport.excitationData; // can remove
      //extends Models.forceTorque; // can remove
      extends DataImport.waveData;
      extends DataImport.frequencyData;
      // need to add
      extends Models.physicalConstants;
      // Wave selection
      parameter String waveSelector = "PiersonMoskowitz" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "Linear", choice = "Bretschneider", choice = "PiersonMoskowitz", choice = "JONSWAP"));
      parameter Integer n_omega = 1 "Number of frequency components (default is 100 for irregular)" annotation(
        Dialog(group = "Simulation Parameters", enable = waveSelector <> "Linear"));
      parameter Modelica.Units.SI.Length Hs = 2.5 "Significant Wave Height [m]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omega_peak = 0.9423 "Peak spectral frequency [rad/s]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      Modelica.Units.SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation [rad/s]";
      /*
                                                                  parameter Modelica.Units.SI.Length d = 100 "Water depth [m]" annotation(
                                                                    Dialog(group = "Wave Spectrum Parameters")); // Removing because now reading
                                                                    */
      parameter Modelica.Units.SI.Time Trmp = 200 "Interval for ramping up of waves during start phase [s]" annotation(
        Dialog(group = "Simulation Parameters"));
      Modelica.Units.SI.Length SSE "Sea surface elevation [m]";
      Modelica.Units.SI.Length zeta[n_omega] "Wave amplitude component [m]";
      parameter Real epsilon[n_omega] = Wave.WaveFunctions.RandomFrequencyFunctions.randomNumberGen(localSeed1, globalSeed1, n_omega) "Wave components phase shift";
    protected
      // Derived parameters
      parameter Integer localSeed1 = 614757 "Local random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection"));
      // readd , enable = frequencySelection == "random"
      parameter Integer globalSeed1 = 40020 "Global random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection"));
      // readd , enable = frequencySelection == "random"
      Modelica.Units.SI.Time Tp[n_omega] "Wave period components [s]" annotation(
        HideResult = true);
      Modelica.Units.SI.WaveNumber k[n_omega] "Wave number component [1/m]";
      //Real F_exc[nDoF] "6D excitation force [N]";
    equation
// Calculate wave parameters
      Tp = 2*pi./omega;
      k = Wave.WaveFunctions.WaveParameterFunctions.waveNumber(d, omega);
// Calculate sea surface elevation (SSE) as the sum of all wave components
// may need to readd for regular SSE = sum(zeta.*cos(omega*time - 2*pi*epsilon));
      annotation(
        Documentation(info = "<html>
              <p>This model implements the linear Airy wave theory to calculate wave elevation profiles and associated excitation forces.</p>
              <p>Key features:</p>
              <ul>
                <li>Calculates sea surface elevation (SSE) based on wave parameters</li>
                <li>Computes excitation force using interpolated coefficients from hydrodynamic data</li>
                <li>Applies a ramping function to the excitation force during the initial phase</li>
                <li>Outputs the excitation force as a 3D vector (vertical component only)</li>
              </ul>
              <p>The model requires hydrodynamic coefficient data to be provided in a .mat file.</p>
            </html>"),
        Diagram(coordinateSystem(extent = {{100, 20}, {120, -20}})));
    
    

    end waveParameters_test;

    model IrregularWave_new
    
    
      extends DataImport.FilePath;
      extends DataImport.waveData;
      extends DataImport.frequencyData;
      // Physical constants
      constant Real pi = Modelica.Constants.pi "Mathematical constant pi";
      constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "Acceleration due to gravity [m/s^2]";
      // Wave basic characteristics
      parameter String waveSelector = "PiersonMoskowitz" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "PiersonMoskowitz", choice = "JONSWAP"));
      constant Integer n_omega = 100 "Number of frequency components (default is 100 for irregular)" annotation(
        Dialog(group = "Simulation Parameters", enable = waveSelector <> "Linear"));
      parameter Modelica.Units.SI.Length Hs = 2.5 "Significant Wave Height" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omegaPeak = 0.9423 "Peak spectral frequency" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      Real ramp "Ramping function" annotation(
        HideResult = true);
      parameter Modelica.Units.SI.Time Trmp "Interval for ramping up of waves during start phase [s]" annotation(
        HideResult = true);
      parameter String frequencySelection = "random" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "random", choice = "equalEnergy"));
      parameter Modelica.Units.SI.AngularFrequency omega[n_omega] = Wave.WaveFunctions.RandomFrequencyFunctions.randomFrequencySelector(omegaMin, omegaMax, localSeedFrequency, globalSeedFrequency, n_omega) "Frequency components selected for simulation";
     parameter Modelica.Units.SI.Distance zeta[n_omega] = sqrt(2*S.*domega)"Wave amplitude component";
      Modelica.Units.SI.Distance SSE "Sea surface elevation";
      // Irregular wave spectrum parameters
      parameter Modelica.Units.SI.AngularFrequency omegaMin = w[1] "Lowest frequency component" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omegaMax = w[end] "Highest frequency component" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      // Intermediate calculations
     parameter Real phi[n_omega] = 2*pi.*Wave.WaveFunctions.RandomFrequencyFunctions.randomVectorGenerator(localSeedPhase, globalSeedPhase, n_omega) "Wave components phase shift";
     parameter Modelica.Units.SI.WaveNumber k[n_omega] = Wave.WaveFunctions.WaveParameterFunctions.waveNumber(d, omega) "Wave number component";
      parameter Modelica.Units.SI.Time Tp[n_omega] = 2*pi./omega"Wave period components" annotation(
        HideResult = true);
      parameter Units.SpectrumEnergyDensity S[n_omega] = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator(waveSelector = waveSelector, Hs = Hs, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB) "Wave energy spectrum";
      // Random phase selection
      parameter Integer localSeedPhase = 614757 "Local random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Phase Selection"));
      // readd , enable = frequencySelection == "random"
      parameter Integer globalSeedPhase = 40020 "Global random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Phase Selection"));
      parameter Modelica.Units.SI.AngularFrequency domega[n_omega] = fill(Wave.WaveFunctions.SpectrumFunctions.Calculations.frequencyStepGenerator(omegaMin, omegaMax, n_omega), n_omega) "Frequency step size [rad/s]";
      parameter Units.SpectrumEnergyDensity S_int[n_omega_int] = zeros(n_omega_int) "Integratation wave energy spectrum [m^2*s/rad]";
    protected
      // Random frequency selection
      parameter Integer localSeedFrequency = 614657 "Local random seed for frequency selection" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
      parameter Integer globalSeedFrequency = 30020 "Global random seed for frequency selection" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
      // Equal Energy Parameters
      parameter Integer n_omega_int = 500 "Number of frequency components for spectrum generation and integration" annotation(
        HideResult = true,
        Dialog(group = "Equal Energy Frequency Selection", enable = frequencySelection == "equalEnergy"));
      // if frequencySelection == "equalEnergy"
      //Modelica.Units.SI.AngularFrequency domega "Frequency step size [rad/s]";
      parameter Modelica.Units.SI.AngularFrequency omega_int[n_omega_int] = zeros(n_omega_int) "Integration frequency step size (equal energy only) [rad/s]";
      //Units.SpectrumEnergyDensity S_int[n_omega_int] "Integratation wave energy spectrum [m^2*s/rad]";
      // Derived parameters
      // JONSWAP parameters
      parameter Real gamma = 3.3 "Peak enhancement factor for JONSWAP spectrum. The mean typical value is 3.3" annotation(
        HideResult = true,
        Dialog(group = "Spectrum", enable = waveSelector == "JONSWAP"));
      parameter Real sigmaA = 0.07 "Lower spectral bound for JONSWAP" annotation(
        HideResult = true,
        Dialog(group = "Spectrum", enable = waveSelector == "JONSWAP"));
      parameter Real sigmaB = 0.09 "Upper spectral bound for JONSWAP" annotation(
        HideResult = true,
        Dialog(group = "Spectrum", enable = waveSelector == "JONSWAP"));
    equation
    
    
      if time < Trmp then
        ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
      else
        ramp = 1;
      end if;
      SSE = ramp.*sum(zeta.*cos(omega*time - phi));
      annotation(
        defaultComponentName = "irregularWave",
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Irregular Wave")}),
        Diagram);
    
    
    

    end IrregularWave_new;

    package newStuff
    model randomGen
      // Physical constants
      constant Real pi = Modelica.Constants.pi "Mathematical constant pi";
      constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "Acceleration due to gravity [m/s^2]";
        parameter Modelica.Units.SI.Length d = 1000 ;//remove this
        parameter String waveSelector = "PiersonMoskowitz";
        constant Integer n_omega "Number of frequency components (default is 100 for irregular)";
        parameter Modelica.Units.SI.Length Hs = 2.5 "Significant Wave Height";
        parameter Modelica.Units.SI.AngularFrequency omegaPeak = 0.9423 "Peak spectral frequency";
        Real ramp "Ramping function";
        parameter Modelica.Units.SI.Time Trmp "Interval for ramping up of waves during start phase [s]";
        parameter String frequencySelection = "random";
        parameter Modelica.Units.SI.AngularFrequency omega[n_omega] = Wave.WaveFunctions.RandomFrequencyFunctions.randomFrequencySelector(omegaMin, omegaMax, localSeedFrequency, globalSeedFrequency, n_omega) "Frequency components selected for simulation";
        parameter Modelica.Units.SI.Distance zeta[n_omega] = sqrt(2*S.*domega) "Wave amplitude component";
        Modelica.Units.SI.Distance SSE "Sea surface elevation";
        // Irregular wave spectrum parameters
        parameter Modelica.Units.SI.AngularFrequency omegaMin = w[1] "Lowest frequency component";
        parameter Modelica.Units.SI.AngularFrequency omegaMax = w[end] "Highest frequency component";
        // Intermediate calculations
        parameter Real phi[n_omega] = 2*pi.*Wave.WaveFunctions.RandomFrequencyFunctions.randomVectorGenerator(localSeedPhase, globalSeedPhase, n_omega) "Wave components phase shift";
        parameter Modelica.Units.SI.WaveNumber k[n_omega] = Wave.WaveFunctions.WaveParameterFunctions.waveNumber(d, omega) "Wave number component";
        parameter Modelica.Units.SI.Time Tp[n_omega] = 2*pi./omega "Wave period components";
        parameter Units.SpectrumEnergyDensity S[n_omega] = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator(waveSelector = waveSelector, Hs = Hs, omegaPeak = omegaPeak, omega = omega, n_omega = n_omega, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB) "Wave energy spectrum";
        // Random phase selection
        parameter Integer localSeedPhase = 614757 "Local random seed for phase shifts";
        // readd , enable = frequencySelection == "random"
        parameter Integer globalSeedPhase = 40020 "Global random seed for phase shifts";
      // Random frequency selection
      parameter Integer localSeedFrequency = 614657 "Local random seed for frequency selection";
      parameter Integer globalSeedFrequency = 30020 "Global random seed for frequency selection";
        parameter Modelica.Units.SI.AngularFrequency domega[n_omega] = fill(Wave.WaveFunctions.SpectrumFunctions.Calculations.frequencyStepGenerator(omegaMin, omegaMax, n_omega), n_omega) "Frequency step size [rad/s]";
        // Derived parameters
        // JONSWAP parameters
        parameter Real gamma = 3.3 "Peak enhancement factor for JONSWAP spectrum. The mean typical value is 3.3";
        parameter Real sigmaA = 0.07 "Lower spectral bound for JONSWAP";
        parameter Real sigmaB = 0.09 "Upper spectral bound for JONSWAP";
      equation
        if time < Trmp then
          ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
        else
          ramp = 1;
        end if;
        SSE = ramp.*sum(zeta.*cos(omega*time - phi));
        
          annotation(
        defaultComponentName = "RandomGen");
      end randomGen;

      model IrregularWaves_new
      
        extends DataImport.FilePath;
        extends DataImport.waveData;
        extends DataImport.frequencyData;
        // Physical constants
        constant Real pi = Modelica.Constants.pi "Mathematical constant pi";
        constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "Acceleration due to gravity [m/s^2]";
        // Wave basic characteristics
        parameter String waveSelector = "PiersonMoskowitz" annotation(
          Dialog(group = "Wave Spectrum Parameters"),
          choices(choice = "PiersonMoskowitz", choice = "JONSWAP"));
        constant Integer n_omega = 100 "Number of frequency components (default is 100 for irregular)" annotation(
          Dialog(group = "Simulation Parameters", enable = waveSelector <> "Linear"));
        parameter Modelica.Units.SI.Length Hs = 2.5 "Significant Wave Height" annotation(
          Dialog(group = "Wave Spectrum Parameters"));
        parameter Modelica.Units.SI.AngularFrequency omegaPeak = 0.9423 "Peak spectral frequency" annotation(
          Dialog(group = "Wave Spectrum Parameters"));
        //Real ramp "Ramping function" annotation(
        // HideResult = true);
        parameter Modelica.Units.SI.Time Trmp "Interval for ramping up of waves during start phase [s]" annotation(
          HideResult = true);
        parameter String frequencySelection = "random" annotation(
          Dialog(group = "Wave Spectrum Parameters"),
          choices(choice = "random", choice = "equalEnergy"));
        parameter Modelica.Units.SI.AngularFrequency omega[n_omega] = Wave.WaveFunctions.RandomFrequencyFunctions.randomFrequencySelector(omegaMin, omegaMax, localSeedFrequency, globalSeedFrequency, n_omega) "Frequency components selected for simulation";
       //parameter Modelica.Units.SI.Distance zeta[n_omega]"Wave amplitude component";
        Modelica.Units.SI.Distance SSE "Sea surface elevation";
        // Irregular wave spectrum parameters
        parameter Modelica.Units.SI.AngularFrequency omegaMin = w[1] "Lowest frequency component" annotation(
          Dialog(group = "Wave Spectrum Parameters"));
        parameter Modelica.Units.SI.AngularFrequency omegaMax = w[end] "Highest frequency component" annotation(
          Dialog(group = "Wave Spectrum Parameters"));
        // Intermediate calculations
        //parameter Real phi[n_omega] "Wave components phase shift";
        //parameter Modelica.Units.SI.WaveNumber k[n_omega] "Wave number component";
        //parameter Modelica.Units.SI.Time Tp[n_omega] "Wave period components" //(
        //HideResult = true);
        //parameter Units.SpectrumEnergyDensity S[n_omega] "Wave energy spectrum";
        // Random phase selection
        parameter Integer localSeedPhase = 614757 "Local random seed for phase shifts" annotation(
          HideResult = true,
          Dialog(group = "Random Phase Selection"));
        // readd , enable = frequencySelection == "random"
        parameter Integer globalSeedPhase = 40020 "Global random seed for phase shifts" annotation(
          HideResult = true,
          Dialog(group = "Random Phase Selection"));
       // parameter Modelica.Units.SI.AngularFrequency domega[n_omega] "Frequency step size [rad/s]";
        //parameter Units.SpectrumEnergyDensity S_int[n_omega_int] "Integratation wave energy spectrum [m^2*s/rad]";
        // ***********************
  randomGen RandomGen(omegaMin = omegaMin, omegaMax = omegaMax, localSeedFrequency = localSeedFrequency, globalSeedFrequency = globalSeedFrequency, localSeedPhase = localSeedPhase, globalSeedPhase = globalSeedPhase, n_omega = n_omega, waveSelector = waveSelector, Hs = Hs, omegaPeak = omegaPeak, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB, Trmp = Trmp) if frequencySelection == "random" annotation(
          Placement(transformation(origin = {-48, -2}, extent = {{-10, -10}, {10, 10}})));
  // **********************
        // Random frequency selection
        parameter Integer localSeedFrequency = 614657 "Local random seed for frequency selection" annotation(
          HideResult = true,
          Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
        parameter Integer globalSeedFrequency = 30020 "Global random seed for frequency selection" annotation(
          HideResult = true,
          Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
        // Equal Energy Parameters
        parameter Integer n_omega_int = 500 "Number of frequency components for spectrum generation and integration" annotation(
          HideResult = true,
          Dialog(group = "Equal Energy Frequency Selection", enable = frequencySelection == "equalEnergy"));
        // if frequencySelection == "equalEnergy"
        //Modelica.Units.SI.AngularFrequency domega "Frequency step size [rad/s]";
        // parameter Modelica.Units.SI.AngularFrequency omega_int[n_omega_int] = zeros(n_omega_int) "Integration frequency step size (equal energy only) [rad/s]";
        //Units.SpectrumEnergyDensity S_int[n_omega_int] "Integratation wave energy spectrum [m^2*s/rad]";
        // Derived parameters
        // JONSWAP parameters
        parameter Real gamma = 3.3 "Peak enhancement factor for JONSWAP spectrum. The mean typical value is 3.3" annotation(
          HideResult = true,
          Dialog(group = "Spectrum", enable = waveSelector == "JONSWAP"));
        parameter Real sigmaA = 0.07 "Lower spectral bound for JONSWAP" annotation(
          HideResult = true,
          Dialog(group = "Spectrum", enable = waveSelector == "JONSWAP"));
        parameter Real sigmaB = 0.09 "Upper spectral bound for JONSWAP" annotation(
          HideResult = true,
          Dialog(group = "Spectrum", enable = waveSelector == "JONSWAP"));
  eeGen EeGen(omegaMin = omegaMin, omegaMax = omegaMax, localSeedFrequency = localSeedFrequency, globalSeedFrequency = globalSeedFrequency, localSeedPhase = localSeedPhase, globalSeedPhase = globalSeedPhase, n_omega = n_omega, waveSelector = waveSelector, Hs = Hs, omegaPeak = omegaPeak, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB, Trmp = Trmp) if frequencySelection == "equalEnergy" annotation(
          Placement(transformation(origin = {20, -14}, extent = {{-10, -10}, {10, 10}})));
      
      equation
        if frequencySelection == "random" then
      
        SSE = RandomGen.SSE;
      
        elseif frequencySelection == "equalEnergy" then
          SSE = EeGen.SSE;
        
        end if;
        annotation(
          defaultComponentName = "irregularWave",
          Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Irregular Wave")}),
          Diagram);
      
      

      end IrregularWaves_new;

      model eeGen
      // Physical constants
        constant Real pi = Modelica.Constants.pi "Mathematical constant pi";
        constant Modelica.Units.SI.Acceleration g = Modelica.Constants.g_n "Acceleration due to gravity [m/s^2]";
          parameter Modelica.Units.SI.Length d = 1000 ;//remove this
          parameter String waveSelector = "PiersonMoskowitz";
          constant Integer n_omega "Number of frequency components (default is 100 for irregular)";
          parameter Modelica.Units.SI.Length Hs = 2.5 "Significant Wave Height";
          parameter Modelica.Units.SI.AngularFrequency omegaPeak = 0.9423 "Peak spectral frequency";
          Real ramp "Ramping function";
          parameter Modelica.Units.SI.Time Trmp "Interval for ramping up of waves during start phase [s]";
          parameter String frequencySelection = "random";
          parameter Modelica.Units.SI.AngularFrequency omega[n_omega] = Wave.WaveFunctions.EqualEnergyFrequencyFunctions.equalEnergyFrequencySelector(omegaMin, omegaMax, n_omega, n_omega_int, omega_int, S_int) "Frequency components selected for simulation";
          parameter Modelica.Units.SI.Distance zeta[n_omega] = sqrt(2*S.*domega) "Wave amplitude component";
          Modelica.Units.SI.Distance SSE "Sea surface elevation";
          // Irregular wave spectrum parameters
          parameter Modelica.Units.SI.AngularFrequency omegaMin = w[1] "Lowest frequency component";
          parameter Modelica.Units.SI.AngularFrequency omegaMax = w[end] "Highest frequency component";
          // Intermediate calculations
          parameter Real phi[n_omega] = 2*pi.*Wave.WaveFunctions.RandomFrequencyFunctions.randomVectorGenerator(localSeedPhase, globalSeedPhase, n_omega) "Wave components phase shift";
         parameter Modelica.Units.SI.WaveNumber k[n_omega] = Wave.WaveFunctions.WaveParameterFunctions.waveNumber(d, omega) "Wave number component";
          parameter Modelica.Units.SI.Time Tp[n_omega] = 2*pi./omega "Wave period components";
          parameter Units.SpectrumEnergyDensity S[n_omega] = Wave.newStuff.spectrumInterpolator(n_omega = n_omega, n_omega_int = n_omega_int, omega_int = omega_int, S_int = S_int, omega = omega) "Wave energy spectrum";
          // Random phase selection
            parameter Integer n_omega_int = 500 "Number of frequency components for spectrum generation and integration" annotation(
          HideResult = true,
          Dialog(group = "Equal Energy Frequency Selection", enable = frequencySelection == "equalEnergy"));
        // if frequencySelection == "equalEnergy"
        //Modelica.Units.SI.AngularFrequency domega "Frequency step size [rad/s]";
        parameter Modelica.Units.SI.AngularFrequency omega_int[n_omega_int] = Wave.WaveFunctions.SpectrumFunctions.Calculations.integrationFrequencyGen(omegaMin, omegaMax, n_omega_int) "Integration frequency step size (equal energy only) [rad/s]";
        parameter Units.SpectrumEnergyDensity S_int[n_omega_int] = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator(waveSelector = waveSelector, Hs = Hs, omegaPeak = omegaPeak, omega = omega_int, n_omega = n_omega_int, gamma = gamma, sigmaA = sigmaA, sigmaB = sigmaB) "Integratation wave energy spectrum [m^2*s/rad]";
          parameter Integer localSeedPhase = 614757 "Local random seed for phase shifts";
          // readd , enable = frequencySelection == "random"
          parameter Integer globalSeedPhase = 40020 "Global random seed for phase shifts";
        // Random frequency selection
        parameter Integer localSeedFrequency = 614657 "Local random seed for frequency selection";
        parameter Integer globalSeedFrequency = 30020 "Global random seed for frequency selection";
          parameter Modelica.Units.SI.AngularFrequency domega[n_omega] = OET.Wave.WaveFunctions.SpectrumFunctions.Calculations.frequencyStepDifference(omega = omega, n_omega = n_omega) "Frequency step size [rad/s]";
          // Derived parameters
        // JONSWAP parameters
          parameter Real gamma = 3.3 "Peak enhancement factor for JONSWAP spectrum. The mean typical value is 3.3";
          parameter Real sigmaA = 0.07 "Lower spectral bound for JONSWAP";
          parameter Real sigmaB = 0.09 "Upper spectral bound for JONSWAP";
        equation
          if time < Trmp then
            ramp = 0.5*(1 + cos(pi + (pi*time/Trmp)));
// Ramp up the excitation force during the initial phase
          else
            ramp = 1;
          end if;
          SSE = ramp.*sum(zeta.*cos(omega*time - phi));
      
        annotation(
          defaultComponentName = "EeGen");
      end eeGen;

      function spectrumInterpolator
        parameter input Integer n_omega "Number of frequency compenents to define the output spectrum";
        parameter input Integer n_omega_int "Number of steps to define the intermediate spectrum";
        input Real omega_int[n_omega_int] "Integration frquencies for the intermediate spectrum";
        input Real S_int[n_omega_int] "Intermediate spectrum";
        input Real omega[n_omega] "Output vector of selected frequency components [rad/s]";
        output Real S[n_omega] "Output spectrum";
      
      algorithm
        S[1] := S_int[1];
        S[end] := S_int[end];
        for i in 2:(n_omega - 1) loop
          S[i] := Modelica.Math.Vectors.interpolate(omega_int, S_int, omega[i]);
        end for;

      end spectrumInterpolator;
      
      
      
      
      
      
    end newStuff;
    
    model Environment_new
      outer Hydro.FilePath fileDirectory;
      // All
      parameter String waveSelector annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "Regular", choice = "PiersonMoskowitz", choice = "JONSWAP", choice = "spectrumImport"));
      parameter String frequencySelection = "random" annotation(
        Dialog(group = "Wave Spectrum Parameters", enable = (waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP")),
        choices(choice = "random", choice = "equalEnergy"));
      parameter Modelica.Units.SI.Height Hs = 2.5 "Significant Wave Height [m]" annotation(
        Dialog(group = "Wave Spectrum Parameters", enable = waveSelector <> "spectrumImport"));
      parameter Modelica.Units.SI.AngularFrequency omegaPeak = 0.9423 "Peak spectral frequency [rad/s]" annotation(
        Dialog(group = "Wave Spectrum Parameters", enable = waveSelector <> "spectrumImport"));
      parameter Modelica.Units.SI.Time Trmp = 50 "Interval for ramping up of waves during start phase [s]" annotation(
        Dialog(group = "Simulation Parameters"));
      Modelica.Units.SI.Length SSE "Sea surface elevation [m]";
      /*
                                    // Regular
                                    Modelica.Units.SI.Height A = regularWave.A "Wave amplitude";
                                    */
      /*
                                    // Irregular
                                    constant Integer n_omega = irregularWave.n_omega  "Number of frequency components"; // if waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP"
                                    Modelica.Units.SI.AngularFrequency omega[n_omega] = irregularWave.omega"Frequency components selected for simulation [rad/s]";
                                    Modelica.Units.SI.Length zeta[n_omega] = irregularWave.zeta "Wave amplitude component [m]";
                                    Real phi[n_omega] = irregularWave.phi "Wave components phase shift";
                                   */
      /*
                                    // Spectrum Import
                                    parameter Integer n_omegaS = spectrumImport.n_omega  "Number of frequency components"; // if waveSelector == "spectrumImport"
                                    Modelica.Units.SI.AngularFrequency omegaS[n_omegaS] = spectrumImport.omega"Frequency components selected for simulation [rad/s]";
                                    Modelica.Units.SI.Length zetaS[n_omegaS] = spectrumImport.zeta "Wave amplitude component [m]";
                                    Real phiS[n_omegaS] = spectrumImport.phi "Wave components phase shift";
                                    // Models
                                    
                                    */
      RegularWave regularWave(Hs = Hs, omegaPeak = omegaPeak, Trmp = Trmp) if waveSelector == "Regular" annotation(
        Placement(transformation(origin = {-26, 10}, extent = {{-10, -10}, {10, 10}})));
      //  //if waveSelector == "Regular"
      newStuff.IrregularWaves_new irregularWave(Hs = Hs, omegaPeak = omegaPeak, Trmp = Trmp, frequencySelection = frequencySelection, waveSelector = waveSelector, filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile) if waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP" annotation(
        Placement(transformation(origin = {30, 6}, extent = {{-10, -10}, {10, 10}})));
      // if waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP"
      SpectrumImport spectrumImport(Trmp = Trmp, filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile) if waveSelector == "spectrumImport" annotation(
        Placement(transformation(origin = {-14, -30}, extent = {{-10, -10}, {10, 10}})));
      // if waveSelector == "spectrumImport"
    equation
      if waveSelector == "Regular" then
//  A = regularWave.A;
        SSE = regularWave.SSE;
      elseif waveSelector == "PiersonMoskowitz" or waveSelector == "JONSWAP" then
//omega = irregularWave.omega;
//zeta = irregularWave.zeta;
//phi = irregularWave.phi;
        SSE = irregularWave.SSE;
    //
elseif waveSelector == "spectrumImport" then
//omegaS = spectrumImport.omega;
//zetaS = spectrumImport.zeta;
//phiS = spectrumImport.phi;
        SSE = spectrumImport.SSE;
      end if;
      annotation(
        defaultComponentName = "environment",
        defaultComponentPrefixes = "inner",
        missingInnerMessage = "No \"environment\" component is defined. Drag the OET.Wave.Environment model into the top level of your model.",
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Environment")}),
        Diagram);
    end Environment_new;
  end Wave;

  package Mooring
    model LinearMooringForce
      // Import hydro coefficients
      extends DataImport.FilePath;
      extends DataImport.linearMooringData;
      // Inherit frame_a
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialOneFrame_a;
      // Position connectors
      Modelica.Blocks.Interfaces.RealInput u_abs[3] "Linear displacement vector [m]" annotation(
        HideResult = true,
        Placement(transformation(origin = {-100, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-100, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput theta_abs[3] "Angular displacement vector [rad]" annotation(
        HideResult = true,
        Placement(transformation(origin = {-60, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-60, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      // Velocity connectors
      Modelica.Blocks.Interfaces.RealInput v_abs[3] "Linear velocity vector [m/s]" annotation(
        HideResult = true,
        Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput omega_abs[3] "Angular velocity vector [rad/s]" annotation(
        HideResult = true,
        Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      parameter Boolean enableLinearMooringForce = true "Switch to enable/disable linear mooring force calculation" annotation(
        HideResult = true,
        choices(checkBox = true),
        Dialog(group = "Linear Mooring Force Parameters"));
      Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector [N,Nm]";
    protected
      Real displacement[6] = cat(1, u_abs, theta_abs) "Combined displacement vector [m, rad]";
      Real velocity[6] = cat(1, v_abs, omega_abs) "Combined velocity vector [m/s, rad/s]";
      Modelica.Units.SI.Force f_element[3];
      Modelica.Units.SI.Torque t_element[3];
    equation
// Use the switch to conditionally output the hydrostatic force torque element
      if enableLinearMooringForce then
// Calculate the linear mooring force/torque vector
        F = Cm*velocity + Km*displacement;
      else
        F = zeros(6);
      end if;
      frame_a.f = f_element;
      frame_a.t = t_element;
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Mooring Force")}));
    end LinearMooringForce;

    model LinearMooring
      outer OET.Hydro.FilePath fileDirectory;
      parameter Boolean enableLinearMooringForce = true "Switch to enable/disable linear mooring force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Linear Mooring Force Parameters"));
      LinearMooringForce linearMooringForce(enableLinearMooringForce = enableLinearMooringForce, filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile) annotation(
        Placement(transformation(origin = {2, -10}, extent = {{-18, -18}, {18, 18}})));
      // Frame_a connector
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed at body" annotation(
        HideResult = true,
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_r = true, get_angles = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world, get_w = true, get_v = true) annotation(
        HideResult = true,
        Placement(transformation(origin = {1, 53}, extent = {{-15, -15}, {15, 15}}, rotation = -0)));
    equation
      connect(linearMooringForce.frame_a, frame_a) annotation(
        Line(points = {{-16, -10}, {-16, -1}, {-100, -1}, {-100, 0}}, color = {95, 95, 95}));
      connect(linearMooringForce.u_abs, absoluteSensor.r) annotation(
        Line(points = {{-16, 11}, {-16, 14}, {-14, 14}, {-14, 36}}, color = {0, 0, 127}, thickness = 0.5));
      connect(absoluteSensor.v, linearMooringForce.v_abs) annotation(
        Line(points = {{-8, 36}, {-8, 26.5}, {-2, 26.5}, {-2, 11}}, color = {0, 0, 127}, thickness = 0.5));
      connect(absoluteSensor.angles, linearMooringForce.theta_abs) annotation(
        Line(points = {{4, 36}, {4, 24}, {-9, 24}, {-9, 11}}, color = {0, 0, 127}, thickness = 0.5));
      connect(absoluteSensor.w, linearMooringForce.omega_abs) annotation(
        Line(points = {{10, 36}, {10, 25.5}, {6, 25.5}, {6, 11}}, color = {0, 0, 127}, thickness = 0.5));
      connect(absoluteSensor.frame_a, frame_a) annotation(
        Line(points = {{-14, 54}, {-100, 54}, {-100, 0}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 145}, {150, 105}}, textString = "%name", textColor = {0, 0, 255}), Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Linear Mooring")}),
        Diagram);
    end LinearMooring;
  end Mooring;

  package PTO
    model LinearPTOForce
      // Import hydro coefficients
      extends DataImport.FilePath;
      //extends DataImport.linearPTOData;
      // Inherit frame_b
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
      // Body 1
      // Position connectors
      Modelica.Blocks.Interfaces.RealInput u_abs1[3] "Linear displacement vector [m]" annotation(
        HideResult = true,
        Placement(transformation(origin = {-100, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-100, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput theta_abs1[3] "Angular displacement vector [rad]" annotation(
        HideResult = true,
        Placement(transformation(origin = {-60, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-60, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      // Velocity connectors
      Modelica.Blocks.Interfaces.RealInput v_abs1[3] "Linear velocity vector [m/s]" annotation(
        HideResult = true,
        Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput omega_abs1[3] "Angular velocity vector [rad/s]" annotation(
        HideResult = true,
        Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      // Body 2
      // Position connectors
      Modelica.Blocks.Interfaces.RealInput u_abs2[3] "Linear displacement vector [m]" annotation(
        HideResult = true,
        Placement(transformation(origin = {100, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 90), iconTransformation(origin = {100, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput theta_abs2[3] "Angular displacement vector [rad]" annotation(
        HideResult = true,
        Placement(transformation(origin = {60, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 90), iconTransformation(origin = {60, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 90)));
      // Velocity connectors
      Modelica.Blocks.Interfaces.RealInput v_abs2[3] "Linear velocity vector [m/s]" annotation(
        HideResult = true,
        Placement(transformation(origin = {20, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 90), iconTransformation(origin = {20, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 90)));
      Modelica.Blocks.Interfaces.RealInput omega_abs2[3] "Angular velocity vector [rad/s]" annotation(
        HideResult = true,
        Placement(transformation(origin = {-20, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 90), iconTransformation(origin = {-20, -115}, extent = {{-15, -15}, {15, 15}}, rotation = 90)));
      // Enable/disable dampingdrag force
      parameter Boolean enableLinearPTOForce = true "Switch to enable/disable linear PTO force calculation" annotation(
        choices(checkBox = true),
        HideResult = true,
        Dialog(group = "Linear PTO Force Parameters"));
      // I should eventually inherit these
      Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector [N,Nm]";
      parameter Real Cpto[6] = {0, 0, 1, 0, 0, 0};
      parameter Real Kpto[6] = {0, 0, 0, 0, 0, 0};
      //protected
      Real displacement1[6] = cat(1, u_abs1, theta_abs1) "Combined displacement vector [m, rad]";
      Real velocity1[6] = cat(1, v_abs1, omega_abs1) "Combined velocity vector [m/s, rad/s]";
      Real displacement2[6] = cat(1, u_abs2, theta_abs2) "Combined displacement vector [m, rad]";
      Real velocity2[6] = cat(1, v_abs2, omega_abs2) "Combined velocity vector [m/s, rad/s]";
      Modelica.Units.SI.Force f_element[3];
      Modelica.Units.SI.Torque t_element[3];
    equation
// Use the switch to conditionally output the damping drag force and torque
      if enableLinearPTOForce then
// Calculate the PTO force/torque vector
        F = Cpto.*(abs(velocity1) - abs(velocity2)) + Kpto.*(displacement1 - displacement2);
      else
        F = zeros(6);
      end if;
      frame_a.f = -f_element;
      frame_a.t = -t_element;
      frame_b.f = f_element;
      frame_b.t = t_element;
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "PTO Force")}));
    end LinearPTOForce;

    model LinearPTO
      outer OET.Hydro.FilePath fileDirectory;
      LinearPTOForce linearPTOForce(enableLinearPTOForce = enableLinearPTOForce, filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile) annotation(
        Placement(transformation(extent = {{-16, -16}, {16, 16}})));
      parameter Boolean enableLinearPTOForce = true "Switch to enable/disable Linear PTO force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Linear PTO Force Parameters"));
      // Frame_ and frame_b connectors
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed to the component with one cut-force and cut-torque" annotation(
        HideResult = true,
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Coordinate system fixed at body" annotation(
        HideResult = true,
        Placement(transformation(extent = {{84, -16}, {116, 16}})));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world, get_r = true, get_v = true, get_w = true, get_angles = true) annotation(
        HideResult = true,
        Placement(transformation(origin = {0, 54}, extent = {{-14, -14}, {14, 14}}, rotation = -0)));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor1(get_angles = true, get_r = true, get_v = true, get_w = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world) annotation(
        HideResult = true,
        Placement(transformation(origin = {2, -60}, extent = {{-14, -14}, {14, 14}}, rotation = -180)));
    equation
      connect(absoluteSensor1.frame_a, frame_b) annotation(
        Line(points = {{16, -60}, {100, -60}, {100, 0}}, color = {95, 95, 95}));
      connect(absoluteSensor.frame_a, frame_a) annotation(
        Line(points = {{-14, 54}, {-100, 54}, {-100, 0}}, color = {95, 95, 95}));
      connect(absoluteSensor1.r, linearPTOForce.u_abs2) annotation(
        Line(points = {{16, -44}, {16, -18}}, color = {0, 0, 127}, thickness = 0.5));
      connect(absoluteSensor1.v, linearPTOForce.v_abs2) annotation(
        Line(points = {{10, -44}, {10, -38}, {3, -38}, {3, -18}}, color = {0, 0, 127}, thickness = 0.5));
      connect(absoluteSensor1.angles, linearPTOForce.theta_abs2) annotation(
        Line(points = {{0, -44}, {0, -34}, {10, -34}, {10, -18}}, color = {0, 0, 127}, thickness = 0.5));
      connect(absoluteSensor1.w, linearPTOForce.omega_abs2) annotation(
        Line(points = {{-6, -44}, {-6, -18}, {-3, -18}}, color = {0, 0, 127}, thickness = 0.5));
      connect(absoluteSensor.r, linearPTOForce.u_abs1) annotation(
        Line(points = {{-14, 38}, {-14, 26}, {-16, 26}, {-16, 18}}, color = {0, 0, 127}, thickness = 0.5));
      connect(absoluteSensor.v, linearPTOForce.v_abs1) annotation(
        Line(points = {{-8, 38}, {-8, 34}, {-3, 34}, {-3, 18}}, color = {0, 0, 127}, thickness = 0.5));
      connect(absoluteSensor.angles, linearPTOForce.theta_abs1) annotation(
        Line(points = {{2, 38}, {4, 38}, {4, 28}, {-10, 28}, {-10, 18}}, color = {0, 0, 127}, thickness = 0.5));
      connect(absoluteSensor.w, linearPTOForce.omega_abs1) annotation(
        Line(points = {{8, 38}, {8, 18}, {3, 18}}, color = {0, 0, 127}, thickness = 0.5));
      connect(linearPTOForce.frame_a, frame_a) annotation(
        Line(points = {{-16, 0}, {-100, 0}}, color = {95, 95, 95}));
      connect(linearPTOForce.frame_b, frame_b) annotation(
        Line(points = {{16, 0}, {100, 0}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 145}, {150, 105}}, textString = "%name", textColor = {0, 0, 255}), Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Linear PTO")}),
        Diagram);
    end LinearPTO;

    model LinearPTO_Rel
      outer Hydro.FilePath fileDirectory;
      LinearPTOForce_Rel linearPTOForce(enableLinearPTOForce = enableLinearPTOForce, filePath = fileDirectory.filePath, hydroCoeffFile = fileDirectory.hydroCoeffFile) annotation(
        Placement(transformation(extent = {{-16, -16}, {16, 16}})));
      parameter Boolean enableLinearPTOForce = true "Switch to enable/disable Linear PTO force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Linear PTO Force Parameters"));
      // Frame_ and frame_b connectors
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed to the component with one cut-force and cut-torque" annotation(
        HideResult = true,
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Coordinate system fixed at body" annotation(
        HideResult = true,
        Placement(transformation(extent = {{84, -16}, {116, 16}})));
      Modelica.Mechanics.MultiBody.Sensors.RelativeSensor relativeSensor(get_r_rel = true, get_v_rel = true, get_a_rel = false, get_w_rel = true, get_z_rel = false, get_angles = true) annotation(
        Placement(transformation(origin = {0, 58}, extent = {{-12, -12}, {12, 12}})));
    equation
      connect(linearPTOForce.frame_a, frame_a) annotation(
        Line(points = {{-16, 0}, {-100, 0}}, color = {95, 95, 95}));
      connect(linearPTOForce.frame_b, frame_b) annotation(
        Line(points = {{16, 0}, {100, 0}}, color = {95, 95, 95}));
      connect(relativeSensor.frame_a, frame_a) annotation(
        Line(points = {{-12, 58}, {-100, 58}, {-100, 0}}, color = {95, 95, 95}));
      connect(relativeSensor.frame_b, frame_b) annotation(
        Line(points = {{12, 58}, {100, 58}, {100, 0}}, color = {95, 95, 95}));
      connect(relativeSensor.r_rel, linearPTOForce.u_rel) annotation(
        Line(points = {{-12, 44}, {-16, 44}, {-16, 18}}, color = {0, 0, 127}, thickness = 0.5));
      connect(relativeSensor.angles, linearPTOForce.theta_rel) annotation(
        Line(points = {{2, 44}, {-10, 44}, {-10, 18}}, color = {0, 0, 127}, thickness = 0.5));
      connect(relativeSensor.v_rel, linearPTOForce.v_rel) annotation(
        Line(points = {{-8, 44}, {-4, 44}, {-4, 18}}, color = {0, 0, 127}, thickness = 0.5));
      connect(relativeSensor.w_rel, linearPTOForce.omega_rel) annotation(
        Line(points = {{8, 44}, {4, 44}, {4, 18}}, color = {0, 0, 127}, thickness = 0.5));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 145}, {150, 105}}, textString = "%name", textColor = {0, 0, 255}), Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Linear PTO")}),
        Diagram);
    end LinearPTO_Rel;

    model LinearPTOForce_Rel
      // Import hydro coefficients
      extends DataImport.FilePath;
      //extends DataImport.linearPTOData;
      // Inherit frame_b
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
      // Body 1
      // Position connectors
      Modelica.Blocks.Interfaces.RealInput u_rel[3] "Linear displacement vector [m]" annotation(
        HideResult = true,
        Placement(transformation(origin = {-100, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-100, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput theta_rel[3] "Angular displacement vector [rad]" annotation(
        HideResult = true,
        Placement(transformation(origin = {-60, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-60, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      // Velocity connectors
      Modelica.Blocks.Interfaces.RealInput v_rel[3] "Linear velocity vector [m/s]" annotation(
        HideResult = true,
        Placement(transformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {-20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      Modelica.Blocks.Interfaces.RealInput omega_rel[3] "Angular velocity vector [rad/s]" annotation(
        HideResult = true,
        Placement(transformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270), iconTransformation(origin = {20, 115}, extent = {{-15, -15}, {15, 15}}, rotation = 270)));
      // Enable/disable dampingdrag force
      parameter Boolean enableLinearPTOForce = true "Switch to enable/disable linear PTO force calculation" annotation(
        choices(checkBox = true),
        HideResult = true,
        Dialog(group = "Linear PTO Force Parameters"));
      // I should eventually inherit these
      Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector [N,Nm]";
      parameter Real Cpto[6] = {0, 0, 1200000, 0, 0, 0};
      parameter Real Kpto[6] = {0, 0, 0, 0, 0, 0};
      //protected
      Real displacement[6] = cat(1, u_rel, theta_rel) "Combined displacement vector [m, rad]";
      Real velocity[6] = cat(1, v_rel, omega_rel) "Combined velocity vector [m/s, rad/s]";
      Modelica.Units.SI.Force f_element[3];
      Modelica.Units.SI.Torque t_element[3];
    equation
// Use the switch to conditionally output the damping drag force and torque
      if enableLinearPTOForce then
// Calculate the PTO force/torque vector
        F = Cpto.*velocity + Kpto.*displacement;
      else
        F = zeros(6);
      end if;
      frame_a.f = -f_element;
      frame_a.t = -t_element;
      frame_b.f = f_element;
      frame_b.t = t_element;
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "PTO Force")}));
    end LinearPTOForce_Rel;

    model LinearPTO_mod
    
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
    
  Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(n = {0, 0, 1}, useAxisFlange = true)  annotation(
        Placement(transformation(origin = {4, -28}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Mechanics.Translational.Components.SpringDamper springDamper(c = 0, d = 1200000)  annotation(
        Placement(transformation(origin = {2, 10}, extent = {{-10, -10}, {10, 10}})));
    equation
  connect(springDamper.flange_a, prismatic.support) annotation(
        Line(points = {{-8, 10}, {0, 10}, {0, -22}}, color = {0, 127, 0}));
  connect(springDamper.flange_b, prismatic.axis) annotation(
        Line(points = {{12, 10}, {12, -22}}, color = {0, 127, 0}));
  connect(prismatic.frame_b, frame_a) annotation(
        Line(points = {{14, -28}, {-100, -28}, {-100, 0}}, color = {95, 95, 95}));
  connect(prismatic.frame_a, frame_b) annotation(
        Line(points = {{-6, -28}, {100, -28}, {100, 0}}, color = {95, 95, 95}));
    end LinearPTO_mod;
    
    model LinearPTOForce_mod
      // Import hydro coefficients
      extends DataImport.FilePath;
      //extends DataImport.linearPTOData;
      // Inherit frame_b
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
    // Enable/disable dampingdrag force
      parameter Boolean enableLinearPTOForce = true "Switch to enable/disable linear PTO force calculation" annotation(
        choices(checkBox = true),
        HideResult = true,
        Dialog(group = "Linear PTO Force Parameters"));
      // I should eventually inherit these
      Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector [N,Nm]";
      parameter Real Cpto = 100;
      parameter Real Kpto = 0;
      //protected
      Real displacement "Combined displacement vector [m, rad]";
      Real velocity "Combined velocity vector [m/s, rad/s]";
    
    
      Modelica.Units.SI.Force f_element[3];
      Modelica.Units.SI.Torque t_element[3];
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute(useAxisFlange = true)  annotation(
        Placement(transformation(origin = {8, -18}, extent = {{-10, -10}, {10, 10}})));
    equation
// Use the switch to conditionally output the damping drag force and torque
      if enableLinearPTOForce then
// Calculate the PTO force/torque vector
        F = Cpto.*(abs(velocity1) - abs(velocity2)) + Kpto.*(displacement1 - displacement2);
      else
        F = zeros(6);
      end if;
      frame_a.f = -f_element;
      frame_a.t = -t_element;
      frame_b.f = f_element;
      frame_b.t = t_element;
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "PTO Force")}));
    end LinearPTOForce_mod;
  end PTO;

  package Experimental
    model multibodyWEC_er
      extends Modelica.Icons.Package;
      // World component (no gravity, Z-axis pointing downwards)
      inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity, n = {0, 0, -1}) "World coordinate system without gravity" annotation(
        Placement(transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}})));
      // Prismatic joint constraining motion in heave
      // Force and torque element (adapt wave output to a force and apply to the body)
      // Define hydrodynamic body
      inner Hydro.FilePath filePath annotation(
        Placement(transformation(origin = {134, -18}, extent = {{-10, -10}, {10, 10}})));
      inner Wave.Environment environment(n_omega = 100, waveSelector = "PiersonMoskowitz") annotation(
        Placement(transformation(origin = {52, 22}, extent = {{-10, -10}, {10, 10}})));
      HydrodynamicBody_er hydrodynamicBody(BodyIndex = 2, enableRadiationForce = true, r = {0, 0, 0}, r_CM = {0, 0, 0}) annotation(
        Placement(transformation(origin = {10, -12}, extent = {{-10, -10}, {10, 10}})));
      HydrodynamicBody_er hydrodynamicBody1(BodyIndex = 1, enableRadiationForce = true, r = {0, 0, 0}, r_CM = {0, 0, 0}) annotation(
        Placement(transformation(origin = {70, -16}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(n = {0, 0, 1}) annotation(
        Placement(transformation(origin = {40, -32}, extent = {{-10, -10}, {10, 10}})));
    equation
// Connections
      connect(prismatic.frame_b, hydrodynamicBody1.frame_a) annotation(
        Line(points = {{50, -32}, {60, -32}, {60, -16}}, color = {95, 95, 95}));
      connect(prismatic.frame_a, hydrodynamicBody.frame_b) annotation(
        Line(points = {{30, -32}, {20, -32}, {20, -12}}, color = {95, 95, 95}));
      annotation(
        Icon(graphics = {Line(points = {{-90, 0}, {-60, 20}, {-30, -20}, {0, 20}, {30, -20}, {60, 20}, {90, 0}}, color = {0, 0, 200}, thickness = 2, smooth = Smooth.Bezier), Ellipse(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
        Documentation(info = "<html>
        <p><b>1D Single-Body Wave Energy Converter (WEC) Model</b></p>
        <p>This model represents a simplified 1D single-body wave energy converter system, 
        focusing on the vertical motion of the body in response to wave excitation forces.</p>
        
        <p><b>Model Description</b></p>
        <p>The WEC consists of a hydrodynamic body constrained to move vertically using a prismatic joint. 
        The body is subjected to wave excitation forces generated by Regular (Linear) and Irregular (PM, Bretschneider, JONSWAP) wave profiles.</p>
        
        <p><b>Key Components</b></p>
        <ul>
          <li><code>world</code>: Defines the world coordinate system without gravity</li>
          <li><code>bodyHD6D</code>: Represents the hydrodynamic body of the WEC</li>
          <li><code>prismatic</code>: Allows vertical motion of the body</li>
          <li><code>Regular and Irregular Wave Profiles</code>: Generates regular and irregular wave excitation forces</li>
          <li><code>forceAndTorque</code>: Applies the excitation force to the body</li>
        </ul>
        
        <p><b>Assumptions and Simplifications</b></p>
        <ul>
          <li>The model considers only vertical motion (1D) of the WEC</li>
          <li>Gravity is not included in the world model</li>
          <li>The excitation force is applied as an external input based on the Pierson-Moskowitz or Regular wave profile</li>
        </ul>
        
        <p><b>Notes</b></p>
        <ul>
          <li>This model serves as a basic framework for WEC simulations and can be extended for more complex analyses</li>
          <li>Additional forces like radiation damping or PTO forces can be added to enhance the model's realism</li>
          <li>Ensure that the BodyHD6D component is properly configured for accurate results</li>
          <li>The wave parameters may need to be adjusted to represent specific sea states</li>
        </ul>
      </html>"),
        Diagram(coordinateSystem(extent = {{-80, 0}, {150, -40}})),
        experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-08, Interval = 0.05));
    end multibodyWEC_er;

    model HydrodynamicBody_er "6-Dimensional Hydrodynamic Forces and Moments Calculation"
      // Inheritance
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
      //extends Hydrodynamic.HydroDataImport.massData;
      /* This should be removed from here and included in the definition of the body in HydrodynamicBody, but is okay in the interim */
      // BodyShape parameters
      outer Hydro.FilePath filePath;
      parameter Integer BodyIndex "Index of body corresponding to that of BEM (1, 2, 3, etc)" annotation(
        Dialog(group = "Hydro Data"));
      /* Removing mass definition here and adding it to a custom bodyShape model
                                                                      parameter Modelica.Units.SI.Mass m = M + Ainf[3, 3] "Mass of the body" annotation(
                                                                        Dialog(group = "Body")); /*
                                                                      /* The mass is only valid when motion is constrained in heave. This line is also repeated in the PTO force code base to determine the control gain */
      parameter Modelica.Units.SI.Position r[3] "Position vector" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Position r_CM[3] "Center of mass position vector" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_11 = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_22 = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_33 = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_21 = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_31 = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_32 = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Body"));
      BodyShape_er bodyShape(r = r, r_CM = r_CM, I_11 = I_11, I_22 = I_22, I_33 = I_33, I_21 = I_21, I_31 = I_31, I_32 = I_32, fileName = filePath.FileName, bodyIndex = BodyIndex, useQuaternions = false, angles_fixed = false, w_0_fixed = false, z_0_fixed = false) annotation(
        Placement(transformation(origin = {12, -84}, extent = {{-10, -10}, {10, 10}})));
      // Hydrostatic force parameters
      parameter Boolean enableHydrostaticForce = true "Switch to enable/disable hydrostatic force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Hydrostatic Force Parameters"));
      // Radiation force paramters
      parameter Boolean enableRadiationForce = true "Switch to enable/disable 6D radiation force calculation" annotation(
        Dialog(group = "Radiation Force Parameters"));
      /* 
                                                                                        parameter Real Kpx = 0.0 "Proportional gain for x-axis translation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter Real Kpy = 0.0 "Proportional gain for y-axis translation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter Real Kprx = 0.0 "Proportional gain for x-axis rotation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter Real Kpry = 0.0 "Proportional gain for y-axis rotation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter Real Kprz = 0.0 "Proportional gain for z-axis rotation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter TranslationalSpringConstant Kix = 0.0 "Integral gain for x-axis translation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter TranslationalSpringConstant Kiy = 0.0 "Integral gain for y-axis translation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter RotationalSpringConstant Kirx = 0.0 "Integral gain for x-axis rotation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter RotationalSpringConstant Kiry = 0.0 "Integral gain for y-axis rotation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter RotationalSpringConstant Kirz = 0.0 "Integral gain for z-axis rotation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                            
                                                                                     */
      /*
                                                          // Damping coefficients
                                                            parameter Real Cvtx = 0.01 "Translational damping coefficient for x-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cvty = 0.01 "Translational damping coefficient for y-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cvtz = 0.01 "Translational damping coefficient for z-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cvrx = 0.01 "Rotational damping coefficient for x-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cvry = 0.01 "Rotational damping coefficient for y-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cvrz = 0.01 "Rotational damping coefficient for z-axis [-]" annotation(HideResult = true);
                                                            
                                                            // Drag coefficients
                                                            parameter Real Cdtx = 0.01 "Translational drag coefficient for x-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cdty = 0.01 "Translational drag coefficient for y-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cdtz = 0.01 "Translational drag coefficient for z-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cdrx = 0.01 "Rotational drag coefficient for x-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cdry = 0.01 "Rotational drag coefficient for y-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cdrz = 0.01 "Rotational drag coefficient for z-axis [-]" annotation(HideResult = true);
                                                            */
      Hydro.DampingDrag dampingDrag annotation(
        Placement(transformation(origin = {74, 52}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world, get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = true) annotation(
        Placement(transformation(origin = {-66, 38}, extent = {{-10, -10}, {10, 10}})));
      Hydro.Excitation excitation(fileName = filePath.FileName, bodyIndex = BodyIndex) annotation(
        Placement(transformation(origin = {28, 8}, extent = {{-10, -10}, {10, 10}})));
    equation
//Conections
      connect(bodyShape.frame_b, frame_b) annotation(
        Line(points = {{22, -84}, {62, -84}, {62, 0}, {102, 0}}, color = {95, 95, 95}));
      connect(bodyShape.frame_a, frame_a) annotation(
        Line(points = {{2, -84}, {-76, -84}, {-76, 0}, {-102, 0}}, color = {95, 95, 95}));
      connect(dampingDrag.frame_a, bodyShape.frame_a) annotation(
        Line(points = {{64, 52}, {-28, 52}, {-28, -84}, {2, -84}}, color = {95, 95, 95}));
      connect(absoluteSensor.frame_a, frame_a) annotation(
        Line(points = {{-76, 38}, {-100, 38}, {-100, 0}}, color = {95, 95, 95}));
      connect(excitation.frame_a, bodyShape.frame_a) annotation(
        Line(points = {{18, 8}, {2, 8}, {2, -84}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 145}, {150, 105}}, textString = "%name", textColor = {0, 0, 255}), Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Hydro Body")}),
        Diagram);
    end HydrodynamicBody_er;

    model BodyShape_er "Rigid body with mass, inertia tensor, different shapes for animation, and two frame connectors (12 potential states)"
      extends OET.DataImport.massData;
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed to the component with one cut-force and cut-torque" annotation(
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b "Coordinate system fixed to the component with one cut-force and cut-torque" annotation(
        Placement(transformation(extent = {{84, -16}, {116, 16}})));
      parameter Boolean animation = true "= true, if animation shall be enabled (show shape between frame_a and frame_b and optionally a sphere at the center of mass)";
      parameter Boolean animateSphere = true "= true, if mass shall be animated as sphere provided animation=true";
      parameter Modelica.Units.SI.Position r[3] "Vector from frame_a to frame_b resolved in frame_a";
      parameter Modelica.Units.SI.Position r_CM[3] "Vector from frame_a to center of mass, resolved in frame_a";
      parameter Modelica.Units.SI.Mass m(min = 0, start = 1) = M + Ainf[3, 3] "Mass of rigid body";
      parameter Modelica.Units.SI.Inertia I_11(min = 0) = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_22(min = 0) = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_33(min = 0) = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_21(min = -10000000) = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_31(min = -10000000) = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_32(min = -10000000) = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      Modelica.Units.SI.Position r_0[3](start = {0, 0, 0}, each stateSelect = if enforceStates then StateSelect.always else StateSelect.avoid) "Position vector from origin of world frame to origin of frame_a" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      Modelica.Units.SI.Velocity v_0[3](start = {0, 0, 0}, each stateSelect = if enforceStates then StateSelect.always else StateSelect.avoid) "Absolute velocity of frame_a, resolved in world frame (= der(r_0))" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      Modelica.Units.SI.Acceleration a_0[3](start = {0, 0, 0}) "Absolute acceleration of frame_a resolved in world frame (= der(v_0))" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      parameter Boolean angles_fixed = false "= true, if angles_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.Angle angles_start[3] = {0, 0, 0} "Initial values of angles to rotate world frame around 'sequence_start' axes into frame_a" annotation(
        Dialog(tab = "Initialization"));
      parameter Modelica.Mechanics.MultiBody.Types.RotationSequence sequence_start = {1, 2, 3} "Sequence of rotations to rotate world frame into frame_a at initial time" annotation(
        Evaluate = true,
        Dialog(tab = "Initialization"));
      parameter Boolean w_0_fixed = false "= true, if w_0_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.AngularVelocity w_0_start[3] = {0, 0, 0} "Initial or guess values of angular velocity of frame_a resolved in world frame" annotation(
        Dialog(tab = "Initialization"));
      parameter Boolean z_0_fixed = false "= true, if z_0_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.AngularAcceleration z_0_start[3] = {0, 0, 0} "Initial values of angular acceleration z_0 = der(w_0)" annotation(
        Dialog(tab = "Initialization"));
      parameter Modelica.Mechanics.MultiBody.Types.ShapeType shapeType = "cylinder" "Type of shape" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Units.SI.Position r_shape[3] = {0, 0, 0} "Vector from frame_a to shape origin, resolved in frame_a" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection = Modelica.Units.Conversions.to_unit1(r - r_shape) "Vector in length direction of shape, resolved in frame_a" annotation(
        Evaluate = true,
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Mechanics.MultiBody.Types.Axis widthDirection = {0, 1, 0} "Vector in width direction of shape, resolved in frame_a" annotation(
        Evaluate = true,
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Units.SI.Length length = Modelica.Math.Vectors.length(r - r_shape) "Length of shape" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Units.SI.Distance width = length/world.defaultWidthFraction "Width of shape" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Units.SI.Distance height = width "Height of shape" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Mechanics.MultiBody.Types.ShapeExtra extra = 0.0 "Additional parameter depending on shapeType (see docu of Visualizers.Advanced.Shape)" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      input Modelica.Mechanics.MultiBody.Types.Color color = Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor "Color of shape" annotation(
        Dialog(colorSelector = true, tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Units.SI.Diameter sphereDiameter = 2*width "Diameter of sphere" annotation(
        Dialog(tab = "Animation", group = "if animation = true and animateSphere = true", enable = animation and animateSphere));
      input Modelica.Mechanics.MultiBody.Types.Color sphereColor = color "Color of sphere of mass" annotation(
        Dialog(colorSelector = true, tab = "Animation", group = "if animation = true and animateSphere = true", enable = animation and animateSphere));
      input Modelica.Mechanics.MultiBody.Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient "Reflection of ambient light (= 0: light is completely absorbed)" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Boolean enforceStates = false "= true, if absolute variables of body object shall be used as states (StateSelect.always)" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced"));
      parameter Boolean useQuaternions = true "= true, if quaternions shall be used as potential states otherwise use 3 angles as potential states" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced"));
      parameter Modelica.Mechanics.MultiBody.Types.RotationSequence sequence_angleStates = {1, 2, 3} "Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced", enable = not useQuaternions));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation frameTranslation(r = r, animation = false) annotation(
        Placement(transformation(extent = {{-20, -20}, {20, 20}})));
      Modelica.Mechanics.MultiBody.Parts.Body body(r_CM = r_CM, m = m, I_11 = I_11, I_22 = I_22, I_33 = I_33, I_21 = I_21, I_31 = I_31, I_32 = I_32, animation = false, sequence_start = sequence_start, angles_fixed = angles_fixed, angles_start = angles_start, w_0_fixed = w_0_fixed, w_0_start = w_0_start, z_0_fixed = z_0_fixed, z_0_start = z_0_start, useQuaternions = useQuaternions, sequence_angleStates = sequence_angleStates, enforceStates = false) annotation(
        Placement(transformation(extent = {{-27.3333, -70.3333}, {13, -30}})));
    protected
      outer Modelica.Mechanics.MultiBody.World world;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape1(shapeType = shapeType, color = color, specularCoefficient = specularCoefficient, length = length, width = width, height = height, lengthDirection = lengthDirection, widthDirection = widthDirection, r_shape = r_shape, extra = extra, r = frame_a.r_0, R = frame_a.R) if world.enableAnimation and animation;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape2(shapeType = "sphere", color = sphereColor, specularCoefficient = specularCoefficient, length = sphereDiameter, width = sphereDiameter, height = sphereDiameter, lengthDirection = {1, 0, 0}, widthDirection = {0, 1, 0}, r_shape = r_CM - {1, 0, 0}*sphereDiameter/2, r = frame_a.r_0, R = frame_a.R) if world.enableAnimation and animation and animateSphere;
    equation
      r_0 = frame_a.r_0;
      v_0 = der(r_0);
      a_0 = der(v_0);
      connect(frame_a, frameTranslation.frame_a) annotation(
        Line(points = {{-100, 0}, {-20, 0}}, color = {95, 95, 95}, thickness = 0.5));
      connect(frame_b, frameTranslation.frame_b) annotation(
        Line(points = {{100, 0}, {20, 0}}, color = {95, 95, 95}, thickness = 0.5));
      connect(frame_a, body.frame_a) annotation(
        Line(points = {{-100, 0}, {-60, 0}, {-60, -50.1666}, {-27.3333, -50.1666}}, color = {95, 95, 95}, thickness = 0.5));
      annotation(
        Documentation(info = "<html>
          <p>
          <strong>Rigid body</strong> with mass and inertia tensor and <strong>two frame connectors</strong>.
          All parameter vectors have to be resolved in frame_a.
          The <strong>inertia tensor</strong> has to be defined with respect to a
          coordinate system that is parallel to frame_a with the
          origin at the center of mass of the body. The coordinate system <strong>frame_b</strong>
          is always parallel to <strong>frame_a</strong>.
          </p>
          <p>
          By default, this component is visualized by any <strong>shape</strong> that can be
          defined with Modelica.Mechanics.MultiBody.Visualizers.FixedShape. This shape is placed
          between frame_a and frame_b (default: length(shape) = Frames.length(r)).
          Additionally a <strong>sphere</strong> may be visualized that has
          its center at the center of mass.
          Note, that
          the animation may be switched off via parameter animation = <strong>false</strong>.
          </p>
          <p>
          <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Parts/BodyShape.png\" alt=\"Parts.BodyShape\">
          </p>
          
          <p>
          The following shapes can be defined via parameter <strong>shapeType</strong>,
          e.g., shapeType=\"cone\":
          </p>
          
          <p>
          <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Visualizers/FixedShape.png\" alt=\"Visualizers.FixedShape\">
          </p>
          
          <p>
          A BodyShape component has potential states. For details of these
          states and of the \"Advanced\" menu parameters, see model
          <a href=\"modelica://Modelica.Mechanics.MultiBody.Parts.Body\">MultiBody.Parts.Body</a>.
          </p>
          </html>"),
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 110}, {150, 70}}, textString = "%name", textColor = {0, 0, 255}), Text(extent = {{-150, -100}, {150, -70}}, textString = "r=%r"), Rectangle(extent = {{-100, 30}, {101, -30}}, lineColor = {0, 24, 48}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {0, 127, 255}, radius = 10), Ellipse(extent = {{-60, 60}, {60, -60}}, lineColor = {0, 24, 48}, fillPattern = FillPattern.Sphere, fillColor = {0, 127, 255}), Text(extent = {{-50, 24}, {55, -27}}, textString = "%m"), Text(extent = {{55, 12}, {91, -13}}, textString = "b"), Text(extent = {{-92, 13}, {-56, -12}}, textString = "a")}),
        Diagram(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Line(points = {{-100, 9}, {-100, 43}}, color = {128, 128, 128}), Line(points = {{100, 0}, {100, 44}}, color = {128, 128, 128}), Line(points = {{-100, 40}, {90, 40}}, color = {135, 135, 135}), Polygon(points = {{90, 44}, {90, 36}, {100, 40}, {90, 44}}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid), Text(extent = {{-22, 68}, {20, 40}}, textColor = {128, 128, 128}, textString = "r"), Line(points = {{-100, -10}, {-100, -90}}, color = {128, 128, 128}), Line(points = {{-100, -84}, {-10, -84}}, color = {128, 128, 128}), Polygon(points = {{-10, -80}, {-10, -88}, {0, -84}, {-10, -80}}, lineColor = {128, 128, 128}, fillColor = {128, 128, 128}, fillPattern = FillPattern.Solid), Text(extent = {{-82, -66}, {-56, -84}}, textColor = {128, 128, 128}, textString = "r_CM"), Line(points = {{0, -46}, {0, -90}}, color = {128, 128, 128})}));
    end BodyShape_er;

    model pooker "Simple pendulum with one revolute joint and one body"
      extends Modelica.Icons.Example;
      inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.UniformGravity) annotation(
        Placement(transformation(extent = {{-60, -10}, {-40, 10}})));
      Modelica.Mechanics.MultiBody.Joints.Revolute rev(n = {0, 0, 1}, useAxisFlange = true, phi(fixed = true), w(fixed = true)) annotation(
        Placement(transformation(extent = {{-20, -10}, {0, 10}})));
      Modelica.Mechanics.Rotational.Components.Damper damper(d = 0.1) annotation(
        Placement(transformation(extent = {{-20, 30}, {0, 50}})));
      OET.Experimental.Bood body(m = 1.0, r_CM = {0, 0, 0}) annotation(
        Placement(transformation(origin = {48, 0}, extent = {{20, -10}, {40, 10}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = {1, 0, 0}) annotation(
        Placement(transformation(origin = {42, 0}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world, get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = true) annotation(
        Placement(transformation(origin = {46, -76}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor1(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world, get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = true) annotation(
        Placement(transformation(origin = {94, -58}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = {1, 0, 0}) annotation(
        Placement(transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}})));
    equation
      connect(world.frame_b, rev.frame_a) annotation(
        Line(points = {{-40, 0}, {-20, 0}}, color = {95, 95, 95}, thickness = 0.5));
      connect(damper.flange_b, rev.axis) annotation(
        Line(points = {{0, 40}, {0, 20}, {-10, 20}, {-10, 10}}));
      connect(rev.support, damper.flange_a) annotation(
        Line(points = {{-16, 10}, {-16, 20}, {-20, 20}, {-20, 40}}));
      connect(fixedTranslation.frame_b, body.frame_a) annotation(
        Line(points = {{52, 0}, {68, 0}}, color = {95, 95, 95}));
      connect(absoluteSensor.frame_a, fixedTranslation.frame_a) annotation(
        Line(points = {{36, -76}, {36, -38}, {32, -38}, {32, 0}}, color = {95, 95, 95}));
      connect(absoluteSensor1.frame_a, fixedTranslation.frame_b) annotation(
        Line(points = {{84, -58}, {84, -29}, {52, -29}, {52, 0}}, color = {95, 95, 95}));
      connect(fixedTranslation1.frame_a, rev.frame_b) annotation(
        Line(points = {{20, 30}, {0, 30}, {0, 0}}, color = {95, 95, 95}));
      connect(fixedTranslation1.frame_b, fixedTranslation.frame_a) annotation(
        Line(points = {{40, 30}, {32, 30}, {32, 0}}, color = {95, 95, 95}));
      annotation(
        experiment(StopTime = 5),
        Documentation(info = "<html>
  <p>
  This simple model demonstrates that by just dragging components
  default animation is defined that shows the structure of the
  assembled system.
  </p>
  <blockquote>
  <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Examples/Elementary/Pendulum.png\"
  alt=\"model Examples.Elementary.Pendulum\">
  </blockquote>
  </html>"),
        uses(Modelica(version = "4.0.0")));
    end pooker;

    model Bood "Rigid body with mass, inertia tensor and one frame connector (12 potential states)"
      import Modelica.Mechanics.MultiBody.Types;
      import Modelica.Mechanics.MultiBody.Frames;
      import Modelica.Units.Conversions.to_unit1;
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed at body" annotation(
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      parameter Boolean animation = true "= true, if animation shall be enabled (show cylinder and sphere)";
      parameter Modelica.Units.SI.Position r_CM[3](start = {0, 0, 0}) "Vector from frame_a to center of mass, resolved in frame_a";
      parameter Modelica.Units.SI.Mass m(min = 0, start = 1) "Mass of rigid body";
      parameter Modelica.Units.SI.Inertia I_11(min = 0) = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_22(min = 0) = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_33(min = 0) = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_21(min = -100000000000) = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_31(min = -100000000000) = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_32(min = -100000000000) = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      Modelica.Units.SI.Position r_0[3](start = {0, 0, 0}, each stateSelect = if enforceStates then StateSelect.always else StateSelect.avoid) "Position vector from origin of world frame to origin of frame_a" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      Modelica.Units.SI.Velocity v_0[3](start = {0, 0, 0}, each stateSelect = if enforceStates then StateSelect.always else StateSelect.avoid) "Absolute velocity of frame_a, resolved in world frame (= der(r_0))" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      Modelica.Units.SI.Acceleration a_0[3](start = {0, 0, 0}) "Absolute acceleration of frame_a resolved in world frame (= der(v_0))" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      parameter Boolean angles_fixed = false "= true, if angles_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.Angle angles_start[3] = {0, 0, 0} "Initial values of angles to rotate world frame around 'sequence_start' axes into frame_a" annotation(
        Dialog(tab = "Initialization"));
      parameter Types.RotationSequence sequence_start = {1, 2, 3} "Sequence of rotations to rotate world frame into frame_a at initial time" annotation(
        Evaluate = true,
        Dialog(tab = "Initialization"));
      parameter Boolean w_0_fixed = false "= true, if w_0_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.AngularVelocity w_0_start[3] = {0, 0, 0} "Initial or guess values of angular velocity of frame_a resolved in world frame" annotation(
        Dialog(tab = "Initialization"));
      parameter Boolean z_0_fixed = false "= true, if z_0_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.AngularAcceleration z_0_start[3] = {0, 0, 0} "Initial values of angular acceleration z_0 = der(w_0)" annotation(
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.Diameter sphereDiameter = world.defaultBodyDiameter "Diameter of sphere" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      input Types.Color sphereColor = Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor "Color of sphere" annotation(
        Dialog(colorSelector = true, tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Units.SI.Diameter cylinderDiameter = sphereDiameter/Types.Defaults.BodyCylinderDiameterFraction "Diameter of cylinder" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      input Types.Color cylinderColor = sphereColor "Color of cylinder" annotation(
        Dialog(colorSelector = true, tab = "Animation", group = "if animation = true", enable = animation));
      input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient "Reflection of ambient light (= 0: light is completely absorbed)" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Boolean enforceStates = false "= true, if absolute variables of body object shall be used as states (StateSelect.always)" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced"));
      parameter Boolean useQuaternions = true "= true, if quaternions shall be used as potential states otherwise use 3 angles as potential states" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced"));
      parameter Types.RotationSequence sequence_angleStates = {1, 2, 3} "Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced", enable = not useQuaternions));
      final parameter Modelica.Units.SI.Inertia I[3, 3] = [I_11, I_21, I_31; I_21, I_22, I_32; I_31, I_32, I_33] "Inertia tensor";
      final parameter Frames.Orientation R_start = Modelica.Mechanics.MultiBody.Frames.axesRotations(sequence_start, angles_start, zeros(3)) "Orientation object from world frame to frame_a at initial time";
      Modelica.Units.SI.AngularVelocity w_a[3](start = Frames.resolve2(R_start, w_0_start), fixed = fill(w_0_fixed, 3), each stateSelect = if enforceStates then (if useQuaternions then StateSelect.always else StateSelect.never) else StateSelect.avoid) "Absolute angular velocity of frame_a resolved in frame_a";
      Modelica.Units.SI.AngularAcceleration z_a[3](start = Frames.resolve2(R_start, z_0_start), fixed = fill(z_0_fixed, 3)) "Absolute angular acceleration of frame_a resolved in frame_a";
      Modelica.Units.SI.Acceleration g_0[3] "Gravity acceleration resolved in world frame";
    protected
      outer Modelica.Mechanics.MultiBody.World world;
      // Declarations for quaternions (dummies, if quaternions are not used)
      parameter Frames.Quaternions.Orientation Q_start = Frames.to_Q(R_start) "Quaternion orientation object from world frame to frame_a at initial time";
      Frames.Quaternions.Orientation Q(start = Q_start, each stateSelect = if enforceStates then (if useQuaternions then StateSelect.prefer else StateSelect.never) else StateSelect.avoid) "Quaternion orientation object from world frame to frame_a (dummy value, if quaternions are not used as states)";
      // Declaration for 3 angles
      parameter Modelica.Units.SI.Angle phi_start[3] = if sequence_start[1] == sequence_angleStates[1] and sequence_start[2] == sequence_angleStates[2] and sequence_start[3] == sequence_angleStates[3] then angles_start else Frames.axesRotationsAngles(R_start, sequence_angleStates) "Potential angle states at initial time";
      Modelica.Units.SI.Angle phi[3](start = phi_start, each stateSelect = if enforceStates then (if useQuaternions then StateSelect.never else StateSelect.always) else StateSelect.avoid) "Dummy or 3 angles to rotate world frame into frame_a of body";
      Modelica.Units.SI.AngularVelocity phi_d[3](each stateSelect = if enforceStates then (if useQuaternions then StateSelect.never else StateSelect.always) else StateSelect.avoid) "= der(phi)";
      Modelica.Units.SI.AngularAcceleration phi_dd[3] "= der(phi_d)";
      // Declarations for animation
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape cylinder(shapeType = "cylinder", color = cylinderColor, specularCoefficient = specularCoefficient, length = if Modelica.Math.Vectors.length(r_CM) > sphereDiameter/2 then Modelica.Math.Vectors.length(r_CM) - (if cylinderDiameter > 1.1*sphereDiameter then sphereDiameter/2 else 0) else 0, width = cylinderDiameter, height = cylinderDiameter, lengthDirection = to_unit1(r_CM), widthDirection = {0, 1, 0}, r = frame_a.r_0, R = frame_a.R) if world.enableAnimation and animation;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape sphere(shapeType = "sphere", color = sphereColor, specularCoefficient = specularCoefficient, length = sphereDiameter, width = sphereDiameter, height = sphereDiameter, lengthDirection = {1, 0, 0}, widthDirection = {0, 1, 0}, r_shape = r_CM - {1, 0, 0}*sphereDiameter/2, r = frame_a.r_0, R = frame_a.R) if world.enableAnimation and animation and sphereDiameter > 0;
    initial equation
      if angles_fixed then
// Initialize positional variables
        if not Connections.isRoot(frame_a.R) then
// frame_a.R is computed somewhere else
          zeros(3) = Frames.Orientation.equalityConstraint(frame_a.R, R_start);
        elseif useQuaternions then
// frame_a.R is computed from quaternions Q
          zeros(3) = Frames.Quaternions.Orientation.equalityConstraint(Q, Q_start);
        else
// frame_a.R is computed from the 3 angles 'phi'
          phi = phi_start;
        end if;
      end if;
    equation
      if enforceStates then
        Connections.root(frame_a.R);
      else
        Connections.potentialRoot(frame_a.R);
      end if;
      r_0 = frame_a.r_0;
      if not Connections.isRoot(frame_a.R) then
// Body does not have states
// Dummies
        Q = {0, 0, 0, 1};
        phi = zeros(3);
        phi_d = zeros(3);
        phi_dd = zeros(3);
      elseif useQuaternions then
// Use Quaternions as states (with dynamic state selection)
        frame_a.R = Frames.from_Q(Q, Frames.Quaternions.angularVelocity2(Q, der(Q)));
        {0} = Frames.Quaternions.orientationConstraint(Q);
// Dummies
        phi = zeros(3);
        phi_d = zeros(3);
        phi_dd = zeros(3);
      else
// Use Cardan angles as states
        phi_d = der(phi);
        phi_dd = der(phi_d);
        frame_a.R = Frames.axesRotations(sequence_angleStates, phi, phi_d);
// Dummies
        Q = {0, 0, 0, 1};
      end if;
// gravity acceleration at center of mass resolved in world frame
      g_0 = world.gravityAcceleration(frame_a.r_0 + Frames.resolve1(frame_a.R, r_CM));
// translational kinematic differential equations
      v_0 = der(frame_a.r_0);
      a_0 = der(v_0);
// rotational kinematic differential equations
      w_a = Frames.angularVelocity2(frame_a.R);
      z_a = der(w_a);
/* Newton/Euler equations with respect to center of mass
              a_CM = a_a + cross(z_a, r_CM) + cross(w_a, cross(w_a, r_CM));
              f_CM = m*(a_CM - g_a);
              t_CM = I*z_a + cross(w_a, I*w_a);
         frame_a.f = f_CM
         frame_a.t = t_CM + cross(r_CM, f_CM);
      Inserting the first three equations in the last two results in:
    */
/*frame_a.f = m*(Frames.resolve2(frame_a.R, a_0 - g_0) + cross(z_a, r_CM) + cross(w_a, cross(w_a, r_CM)));
    frame_a.t = I*z_a + cross(w_a, I*w_a) + cross(r_CM, frame_a.f);*/
      frame_a.f = m*(Frames.resolve2(frame_a.R, a_0 - g_0));
      frame_a.t = I*z_a + cross(w_a, I*w_a);
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 30}, {-3, -30}}, lineColor = {0, 24, 48}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {0, 127, 255}, radius = 10), Text(extent = {{150, -100}, {-150, -70}}, textString = "m=%m"), Text(extent = {{-150, 110}, {150, 70}}, textString = "%name", textColor = {0, 0, 255}), Ellipse(extent = {{-20, 60}, {100, -60}}, lineColor = {0, 24, 48}, fillPattern = FillPattern.Sphere, fillColor = {0, 127, 255})}),
        Documentation(info = "<html>
  <p>
  <strong>Rigid body</strong> with mass and inertia tensor.
  All parameter vectors have to be resolved in frame_a.
  The <strong>inertia tensor</strong> has to be defined with respect to a
  coordinate system that is parallel to frame_a with the
  origin at the center of mass of the body.
  </p>
  <p>
  By default, this component is visualized by a <strong>cylinder</strong> located
  between frame_a and the center of mass and by a <strong>sphere</strong> that has
  its center at the center of mass. If the cylinder length is smaller as
  the radius of the sphere, e.g., since frame_a is located at the
  center of mass, the cylinder is not displayed. Note, that
  the animation may be switched off via parameter animation = <strong>false</strong>.
  </p>
  <p>
  <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Parts/Body.png\" alt=\"Parts.Body\">
  </p>
  
  <p>
  <strong>States of Body Components</strong>
  </p>
  <p>
  Every body has potential states. If possible a tool will select
  the states of joints and not the states of bodies because this is
  usually the most efficient choice. In this case the position, orientation,
  velocity and angular velocity of frame_a of the body will be computed
  by the component that is connected to frame_a. However, if a body is moving
  freely in space, variables of the body have to be used as states. The potential
  states of the body are:
  </p>
  <ul>
  <li> The <strong>position vector</strong> frame_a.r_0 from the origin of the
       world frame to the origin of frame_a of the body, resolved in
       the world frame and the <strong>absolute velocity</strong> v_0 of the origin of
       frame_a, resolved in the world frame (= der(frame_a.r_0)).
  </li>
  <li> If parameter <strong>useQuaternions</strong> in the \"Advanced\" menu
       is <strong>true</strong> (this is the default), then <strong>4 quaternions</strong>
       are potential states. Additionally, the coordinates of the
       absolute angular velocity vector of the
       body are 3 potential states.<br>
       If <strong>useQuaternions</strong> in the \"Advanced\" menu
       is <strong>false</strong>, then <strong>3 angles</strong> and the derivatives of
       these angles are potential states. The orientation of frame_a
       is computed by rotating the world frame along the axes defined
       in parameter vector \"sequence_angleStates\" (default = {1,2,3}, i.e.,
       the Cardan angle sequence) around the angles used as potential states.
       For example, the default is to rotate the x-axis of the world frame
       around angles[1], the new y-axis around angles[2] and the new z-axis
       around angles[3], arriving at frame_a.
   </li>
  </ul>
  <p>
  The quaternions have the slight disadvantage that there is a
  non-linear constraint equation between the 4 quaternions.
  Therefore, at least one non-linear equation has to be solved
  during simulation. A tool might, however, analytically solve this
  simple constraint equation. Using the 3 angles as states has the
  disadvantage that there is a singular configuration in which a
  division by zero will occur. If it is possible to determine in advance
  for an application class that this singular configuration is outside
  of the operating region, the 3 angles might be used as potential
  states by setting <strong>useQuaternions</strong> = <strong>false</strong>.
  </p>
  <p>
  In text books about 3-dimensional mechanics often 3 angles and the
  angular velocity are used as states. This is not the case here, since
  3 angles and their derivatives are used as potential states
  (if useQuaternions = false). The reason
  is that for real-time simulation the discretization formula of the
  integrator might be \"inlined\" and solved together with the body equations.
  By appropriate symbolic transformation the performance is
  drastically increased if angles and their
  derivatives are used as states, instead of angles and the angular
  velocity.
  </p>
  <p>
  Whether or not variables of the body are used as states is usually
  automatically selected by the Modelica translator. If parameter
  <strong>enforceStates</strong> is set to <strong>true</strong> in the \"Advanced\" menu,
  then body variables are forced to be used as states according
  to the setting of parameters \"useQuaternions\" and
  \"sequence_angleStates\".
  </p>
  </html>"),
        uses(Modelica(version = "4.0.0")));
    end Bood;

    model HydrodynamicBody_cm "6-Dimensional Hydrodynamic Forces and Moments Calculation"
      // Inheritance
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
      //extends Hydrodynamic.HydroDataImport.massData;
      /* This should be removed from here and included in the definition of the body in HydrodynamicBody, but is okay in the interim */
      // BodyShape parameters
      outer Hydro.FilePath filePath;
      parameter Integer BodyIndex "Index of body corresponding to that of BEM (1, 2, 3, etc)" annotation(
        Dialog(group = "Hydro Data"));
      /* Removing mass definition here and adding it to a custom bodyShape model
                                                                      parameter Modelica.Units.SI.Mass m = M + Ainf[3, 3] "Mass of the body" annotation(
                                                                        Dialog(group = "Body")); /*
                                                                      /* The mass is only valid when motion is constrained in heave. This line is also repeated in the PTO force code base to determine the control gain */
      parameter Modelica.Units.SI.Position r[3] = {0, 0, 0} "Position vector" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Position r_CM[3] = {0, 0, 0} "Center of mass position vector" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_11 = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_22 = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_33 = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_21 = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_31 = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_32 = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Body"));
      // Hydrostatic force parameters
      parameter Boolean enableHydrostaticForce = true "Switch to enable/disable hydrostatic force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Hydrostatic Force Parameters"));
      // Radiation force paramters
      parameter Boolean enableRadiationForce = true "Switch to enable/disable 6D radiation force calculation" annotation(
        Dialog(group = "Radiation Force Parameters"));
      /* 
                                                                            parameter Real Kpx = 0.0 "Proportional gain for x-axis translation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter Real Kpy = 0.0 "Proportional gain for y-axis translation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter Real Kprx = 0.0 "Proportional gain for x-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter Real Kpry = 0.0 "Proportional gain for y-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter Real Kprz = 0.0 "Proportional gain for z-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter TranslationalSpringConstant Kix = 0.0 "Integral gain for x-axis translation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter TranslationalSpringConstant Kiy = 0.0 "Integral gain for y-axis translation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter RotationalSpringConstant Kirx = 0.0 "Integral gain for x-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter RotationalSpringConstant Kiry = 0.0 "Integral gain for y-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter RotationalSpringConstant Kirz = 0.0 "Integral gain for z-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                
                                                                         */
      /*
                                              // Damping coefficients
                                                parameter Real Cvtx = 0.01 "Translational damping coefficient for x-axis [-]" annotation(HideResult = true);
                                                parameter Real Cvty = 0.01 "Translational damping coefficient for y-axis [-]" annotation(HideResult = true);
                                                parameter Real Cvtz = 0.01 "Translational damping coefficient for z-axis [-]" annotation(HideResult = true);
                                                parameter Real Cvrx = 0.01 "Rotational damping coefficient for x-axis [-]" annotation(HideResult = true);
                                                parameter Real Cvry = 0.01 "Rotational damping coefficient for y-axis [-]" annotation(HideResult = true);
                                                parameter Real Cvrz = 0.01 "Rotational damping coefficient for z-axis [-]" annotation(HideResult = true);
                                                
                                                // Drag coefficients
                                                parameter Real Cdtx = 0.01 "Translational drag coefficient for x-axis [-]" annotation(HideResult = true);
                                                parameter Real Cdty = 0.01 "Translational drag coefficient for y-axis [-]" annotation(HideResult = true);
                                                parameter Real Cdtz = 0.01 "Translational drag coefficient for z-axis [-]" annotation(HideResult = true);
                                                parameter Real Cdrx = 0.01 "Rotational drag coefficient for x-axis [-]" annotation(HideResult = true);
                                                parameter Real Cdry = 0.01 "Rotational drag coefficient for y-axis [-]" annotation(HideResult = true);
                                                parameter Real Cdrz = 0.01 "Rotational drag coefficient for z-axis [-]" annotation(HideResult = true);
                                                */
      Hydro.Hydrostatic hydrostatic(fileName = filePath.FileName, bodyIndex = BodyIndex) annotation(
        Placement(transformation(origin = {-60, 0}, extent = {{-14, -14}, {14, 14}})));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world) annotation(
        Placement(transformation(origin = {-54, 60}, extent = {{-10, -10}, {10, 10}})));
      Hydro.DampingDrag dampingDrag annotation(
        Placement(transformation(origin = {57, -3}, extent = {{-13, -13}, {13, 13}})));
      BodyCM_am bodyCM(animationEnable = animationEnable, ra_CM = ra_CM, rCM_b = rCM_b, ra_b = ra_CM + rCM_b, fileName = filePath.FileName, bodyIndex = BodyIndex) annotation(
        Placement(transformation(origin = {0, -66}, extent = {{-10, -10}, {10, 10}})));
      parameter Boolean animationEnable = false;
      parameter Real ra_CM[3] = {0, 0, 0};
      parameter Real rCM_b[3] = {0, 0, 0};
      parameter Real ra_b[3] = ra_CM + rCM_b;
    equation
//Conections
      connect(hydrostatic.frame_a, bodyCM.frame_c) annotation(
        Line(points = {{-74, 0}, {-74, -56}, {0, -56}}, color = {95, 95, 95}));
      connect(dampingDrag.frame_a, bodyCM.frame_c) annotation(
        Line(points = {{44, -2}, {42, -2}, {42, -56}, {0, -56}}, color = {95, 95, 95}));
      connect(bodyCM.frame_a, frame_a) annotation(
        Line(points = {{-10, -66}, {-100, -66}, {-100, 0}}, color = {95, 95, 95}));
      connect(bodyCM.frame_b, frame_b) annotation(
        Line(points = {{10, -66}, {100, -66}, {100, 0}}, color = {95, 95, 95}));
      connect(absoluteSensor.frame_a, bodyCM.frame_c) annotation(
        Line(points = {{-64, 60}, {0, 60}, {0, -56}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 145}, {150, 105}}, textString = "%name", textColor = {0, 0, 255}), Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Hydro Body")}),
        Diagram);
    end HydrodynamicBody_cm;

    model multibodyWEC_cm
      extends Modelica.Icons.Package;
      // World component (no gravity, Z-axis pointing downwards)
      inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity, n = {0, 0, -1}) "World coordinate system without gravity" annotation(
        Placement(transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}})));
      // Prismatic joint constraining motion in heave
      // Force and torque element (adapt wave output to a force and apply to the body)
      // Define hydrodynamic body
      inner Hydro.FilePath filePath annotation(
        Placement(transformation(origin = {134, -18}, extent = {{-10, -10}, {10, 10}})));
      inner Wave.Environment environment(n_omega = 100) annotation(
        Placement(transformation(origin = {52, 22}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(n = {0, 0, 1}) annotation(
        Placement(transformation(origin = {42, 2}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Forces.WorldForce force annotation(
        Placement(transformation(origin = {-16, 32}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Sources.Sine sine[3](amplitude = {1000, 1000, 1000000}, f = {0.1, 0.1, 0.1}) annotation(
        Placement(transformation(origin = {-52, 34}, extent = {{-10, -10}, {10, 10}})));
      HydrodynamicBody_cm hydrodynamicBody_cm(BodyIndex = 2, ra_CM = {0, 0, 1}, rCM_b = {0, 0, 1}) annotation(
        Placement(transformation(origin = {14, -24}, extent = {{-10, -10}, {10, 10}})));
      HydrodynamicBody_cm hydrodynamicBody_cm1(BodyIndex = 1) annotation(
        Placement(transformation(origin = {72, -28}, extent = {{-10, -10}, {10, 10}})));
      Mooring.LinearMooring linearMooring annotation(
        Placement(transformation(origin = {-34, -60}, extent = {{-10, -10}, {10, 10}})));
    equation
// Connections
      connect(sine.y, force.force) annotation(
        Line(points = {{-40, 34}, {-28, 34}, {-28, 32}}, color = {0, 0, 127}));
      connect(force.frame_b, hydrodynamicBody_cm.frame_a) annotation(
        Line(points = {{-6, 32}, {4, 32}, {4, -24}}, color = {95, 95, 95}));
      connect(hydrodynamicBody_cm.frame_b, prismatic1.frame_a) annotation(
        Line(points = {{24, -24}, {32, -24}, {32, 2}}, color = {95, 95, 95}));
      connect(hydrodynamicBody_cm1.frame_a, prismatic1.frame_b) annotation(
        Line(points = {{62, -28}, {52, -28}, {52, 2}}, color = {95, 95, 95}));
      connect(linearMooring.frame_a, hydrodynamicBody_cm.frame_a) annotation(
        Line(points = {{-44, -60}, {4, -60}, {4, -24}}, color = {95, 95, 95}));
      annotation(
        Icon(graphics = {Line(points = {{-90, 0}, {-60, 20}, {-30, -20}, {0, 20}, {30, -20}, {60, 20}, {90, 0}}, color = {0, 0, 200}, thickness = 2, smooth = Smooth.Bezier), Ellipse(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
        Documentation(info = "<html>
        <p><b>1D Single-Body Wave Energy Converter (WEC) Model</b></p>
        <p>This model represents a simplified 1D single-body wave energy converter system, 
        focusing on the vertical motion of the body in response to wave excitation forces.</p>
        
        <p><b>Model Description</b></p>
        <p>The WEC consists of a hydrodynamic body constrained to move vertically using a prismatic joint. 
        The body is subjected to wave excitation forces generated by Regular (Linear) and Irregular (PM, Bretschneider, JONSWAP) wave profiles.</p>
        
        <p><b>Key Components</b></p>
        <ul>
          <li><code>world</code>: Defines the world coordinate system without gravity</li>
          <li><code>bodyHD6D</code>: Represents the hydrodynamic body of the WEC</li>
          <li><code>prismatic</code>: Allows vertical motion of the body</li>
          <li><code>Regular and Irregular Wave Profiles</code>: Generates regular and irregular wave excitation forces</li>
          <li><code>forceAndTorque</code>: Applies the excitation force to the body</li>
        </ul>
        
        <p><b>Assumptions and Simplifications</b></p>
        <ul>
          <li>The model considers only vertical motion (1D) of the WEC</li>
          <li>Gravity is not included in the world model</li>
          <li>The excitation force is applied as an external input based on the Pierson-Moskowitz or Regular wave profile</li>
        </ul>
        
        <p><b>Notes</b></p>
        <ul>
          <li>This model serves as a basic framework for WEC simulations and can be extended for more complex analyses</li>
          <li>Additional forces like radiation damping or PTO forces can be added to enhance the model's realism</li>
          <li>Ensure that the BodyHD6D component is properly configured for accurate results</li>
          <li>The wave parameters may need to be adjusted to represent specific sea states</li>
        </ul>
      </html>"),
        Diagram(coordinateSystem(extent = {{-80, 0}, {150, -40}})),
        experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-08, Interval = 0.05));
    end multibodyWEC_cm;

    model Body_cm "Rigid body with mass, inertia tensor and one frame connector (12 potential states)"
      import Modelica.Mechanics.MultiBody.Types;
      import Modelica.Mechanics.MultiBody.Frames;
      import Modelica.Units.Conversions.to_unit1;
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed at body" annotation(
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      parameter Boolean animation = true "= true, if animation shall be enabled (show cylinder and sphere)";
      parameter Modelica.Units.SI.Position r_CM[3](start = {0, 0, 0}) "Vector from frame_a to center of mass, resolved in frame_a";
      parameter Modelica.Units.SI.Mass m(min = 0, start = 1) "Mass of rigid body";
      parameter Modelica.Units.SI.Inertia I_11(min = 0) = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_22(min = 0) = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_33(min = 0) = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_21(min = -Modelica.Constants.inf) = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_31(min = -Modelica.Constants.inf) = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_32(min = -Modelica.Constants.inf) = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      Modelica.Units.SI.Position r_0[3](start = {0, 0, 0}, each stateSelect = if enforceStates then StateSelect.always else StateSelect.avoid) "Position vector from origin of world frame to origin of frame_a" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      Modelica.Units.SI.Velocity v_0[3](start = {0, 0, 0}, each stateSelect = if enforceStates then StateSelect.always else StateSelect.avoid) "Absolute velocity of frame_a, resolved in world frame (= der(r_0))" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      Modelica.Units.SI.Acceleration a_0[3](start = {0, 0, 0}) "Absolute acceleration of frame_a resolved in world frame (= der(v_0))" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      parameter Boolean angles_fixed = false "= true, if angles_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.Angle angles_start[3] = {0, 0, 0} "Initial values of angles to rotate world frame around 'sequence_start' axes into frame_a" annotation(
        Dialog(tab = "Initialization"));
      parameter Types.RotationSequence sequence_start = {1, 2, 3} "Sequence of rotations to rotate world frame into frame_a at initial time" annotation(
        Evaluate = true,
        Dialog(tab = "Initialization"));
      parameter Boolean w_0_fixed = false "= true, if w_0_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.AngularVelocity w_0_start[3] = {0, 0, 0} "Initial or guess values of angular velocity of frame_a resolved in world frame" annotation(
        Dialog(tab = "Initialization"));
      parameter Boolean z_0_fixed = false "= true, if z_0_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.AngularAcceleration z_0_start[3] = {0, 0, 0} "Initial values of angular acceleration z_0 = der(w_0)" annotation(
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.Diameter sphereDiameter = world.defaultBodyDiameter "Diameter of sphere" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      input Types.Color sphereColor = Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor "Color of sphere" annotation(
        Dialog(colorSelector = true, tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Units.SI.Diameter cylinderDiameter = sphereDiameter/Types.Defaults.BodyCylinderDiameterFraction "Diameter of cylinder" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      input Types.Color cylinderColor = sphereColor "Color of cylinder" annotation(
        Dialog(colorSelector = true, tab = "Animation", group = "if animation = true", enable = animation));
      input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient "Reflection of ambient light (= 0: light is completely absorbed)" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Boolean enforceStates = false "= true, if absolute variables of body object shall be used as states (StateSelect.always)" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced"));
      parameter Boolean useQuaternions = true "= true, if quaternions shall be used as potential states otherwise use 3 angles as potential states" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced"));
      parameter Types.RotationSequence sequence_angleStates = {1, 2, 3} "Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced", enable = not useQuaternions));
      final parameter Modelica.Units.SI.Inertia I[3, 3] = [I_11, I_21, I_31; I_21, I_22, I_32; I_31, I_32, I_33] "Inertia tensor";
      final parameter Frames.Orientation R_start = Modelica.Mechanics.MultiBody.Frames.axesRotations(sequence_start, angles_start, zeros(3)) "Orientation object from world frame to frame_a at initial time";
      Modelica.Units.SI.AngularVelocity w_a[3](start = Frames.resolve2(R_start, w_0_start), fixed = fill(w_0_fixed, 3), each stateSelect = if enforceStates then (if useQuaternions then StateSelect.always else StateSelect.never) else StateSelect.avoid) "Absolute angular velocity of frame_a resolved in frame_a";
      Modelica.Units.SI.AngularAcceleration z_a[3](start = Frames.resolve2(R_start, z_0_start), fixed = fill(z_0_fixed, 3)) "Absolute angular acceleration of frame_a resolved in frame_a";
      Modelica.Units.SI.Acceleration g_0[3] "Gravity acceleration resolved in world frame";
    protected
      outer Modelica.Mechanics.MultiBody.World world;
      // Declarations for quaternions (dummies, if quaternions are not used)
      parameter Frames.Quaternions.Orientation Q_start = Frames.to_Q(R_start) "Quaternion orientation object from world frame to frame_a at initial time";
      Frames.Quaternions.Orientation Q(start = Q_start, each stateSelect = if enforceStates then (if useQuaternions then StateSelect.prefer else StateSelect.never) else StateSelect.avoid) "Quaternion orientation object from world frame to frame_a (dummy value, if quaternions are not used as states)";
      // Declaration for 3 angles
      parameter Modelica.Units.SI.Angle phi_start[3] = if sequence_start[1] == sequence_angleStates[1] and sequence_start[2] == sequence_angleStates[2] and sequence_start[3] == sequence_angleStates[3] then angles_start else Frames.axesRotationsAngles(R_start, sequence_angleStates) "Potential angle states at initial time";
      Modelica.Units.SI.Angle phi[3](start = phi_start, each stateSelect = if enforceStates then (if useQuaternions then StateSelect.never else StateSelect.always) else StateSelect.avoid) "Dummy or 3 angles to rotate world frame into frame_a of body";
      Modelica.Units.SI.AngularVelocity phi_d[3](each stateSelect = if enforceStates then (if useQuaternions then StateSelect.never else StateSelect.always) else StateSelect.avoid) "= der(phi)";
      Modelica.Units.SI.AngularAcceleration phi_dd[3] "= der(phi_d)";
      // Declarations for animation
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape cylinder(shapeType = "cylinder", color = cylinderColor, specularCoefficient = specularCoefficient, length = if Modelica.Math.Vectors.length(r_CM) > sphereDiameter/2 then Modelica.Math.Vectors.length(r_CM) - (if cylinderDiameter > 1.1*sphereDiameter then sphereDiameter/2 else 0) else 0, width = cylinderDiameter, height = cylinderDiameter, lengthDirection = to_unit1(r_CM), widthDirection = {0, 1, 0}, r = frame_a.r_0, R = frame_a.R) if world.enableAnimation and animation;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape sphere(shapeType = "sphere", color = sphereColor, specularCoefficient = specularCoefficient, length = sphereDiameter, width = sphereDiameter, height = sphereDiameter, lengthDirection = {1, 0, 0}, widthDirection = {0, 1, 0}, r_shape = r_CM - {1, 0, 0}*sphereDiameter/2, r = frame_a.r_0, R = frame_a.R) if world.enableAnimation and animation and sphereDiameter > 0;
    initial equation
      if angles_fixed then
// Initialize positional variables
        if not Connections.isRoot(frame_a.R) then
// frame_a.R is computed somewhere else
          zeros(3) = Frames.Orientation.equalityConstraint(frame_a.R, R_start);
        elseif useQuaternions then
// frame_a.R is computed from quaternions Q
          zeros(3) = Frames.Quaternions.Orientation.equalityConstraint(Q, Q_start);
        else
// frame_a.R is computed from the 3 angles 'phi'
          phi = phi_start;
        end if;
      end if;
    equation
      if enforceStates then
        Connections.root(frame_a.R);
      else
        Connections.potentialRoot(frame_a.R);
      end if;
      r_0 = frame_a.r_0;
      if not Connections.isRoot(frame_a.R) then
// Body does not have states
// Dummies
        Q = {0, 0, 0, 1};
        phi = zeros(3);
        phi_d = zeros(3);
        phi_dd = zeros(3);
      elseif useQuaternions then
// Use Quaternions as states (with dynamic state selection)
        frame_a.R = Frames.from_Q(Q, Frames.Quaternions.angularVelocity2(Q, der(Q)));
        {0} = Frames.Quaternions.orientationConstraint(Q);
// Dummies
        phi = zeros(3);
        phi_d = zeros(3);
        phi_dd = zeros(3);
      else
// Use Cardan angles as states
        phi_d = der(phi);
        phi_dd = der(phi_d);
        frame_a.R = Frames.axesRotations(sequence_angleStates, phi, phi_d);
// Dummies
        Q = {0, 0, 0, 1};
      end if;
// gravity acceleration at center of mass resolved in world frame
      g_0 = world.gravityAcceleration(frame_a.r_0 + Frames.resolve1(frame_a.R, r_CM));
// translational kinematic differential equations
      v_0 = der(frame_a.r_0);
      a_0 = der(v_0);
// rotational kinematic differential equations
      w_a = Frames.angularVelocity2(frame_a.R);
      z_a = der(w_a);
/* Newton/Euler equations with respect to center of mass
                a_CM = a_a + cross(z_a, r_CM) + cross(w_a, cross(w_a, r_CM));
                f_CM = m*(a_CM - g_a);
                t_CM = I*z_a + cross(w_a, I*w_a);
           frame_a.f = f_CM
           frame_a.t = t_CM + cross(r_CM, f_CM);
        Inserting the first three equations in the last two results in:
      */
      frame_a.f = m*(Frames.resolve2(frame_a.R, a_0 - g_0) + cross(z_a, r_CM) + cross(w_a, cross(w_a, r_CM)));
      frame_a.t = I*z_a + cross(w_a, I*w_a) + cross(r_CM, frame_a.f);
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 30}, {-3, -30}}, lineColor = {0, 24, 48}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {0, 127, 255}, radius = 10), Text(extent = {{150, -100}, {-150, -70}}, textString = "m=%m"), Text(extent = {{-150, 110}, {150, 70}}, textString = "%name", textColor = {0, 0, 255}), Ellipse(extent = {{-20, 60}, {100, -60}}, lineColor = {0, 24, 48}, fillPattern = FillPattern.Sphere, fillColor = {0, 127, 255})}),
        Documentation(info = "<html>
    <p>
    <strong>Rigid body</strong> with mass and inertia tensor.
    All parameter vectors have to be resolved in frame_a.
    The <strong>inertia tensor</strong> has to be defined with respect to a
    coordinate system that is parallel to frame_a with the
    origin at the center of mass of the body.
    </p>
    <p>
    By default, this component is visualized by a <strong>cylinder</strong> located
    between frame_a and the center of mass and by a <strong>sphere</strong> that has
    its center at the center of mass. If the cylinder length is smaller as
    the radius of the sphere, e.g., since frame_a is located at the
    center of mass, the cylinder is not displayed. Note, that
    the animation may be switched off via parameter animation = <strong>false</strong>.
    </p>
    <p>
    <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Parts/Body.png\" alt=\"Parts.Body\">
    </p>
    
    <p>
    <strong>States of Body Components</strong>
    </p>
    <p>
    Every body has potential states. If possible a tool will select
    the states of joints and not the states of bodies because this is
    usually the most efficient choice. In this case the position, orientation,
    velocity and angular velocity of frame_a of the body will be computed
    by the component that is connected to frame_a. However, if a body is moving
    freely in space, variables of the body have to be used as states. The potential
    states of the body are:
    </p>
    <ul>
    <li> The <strong>position vector</strong> frame_a.r_0 from the origin of the
         world frame to the origin of frame_a of the body, resolved in
         the world frame and the <strong>absolute velocity</strong> v_0 of the origin of
         frame_a, resolved in the world frame (= der(frame_a.r_0)).
    </li>
    <li> If parameter <strong>useQuaternions</strong> in the \"Advanced\" menu
         is <strong>true</strong> (this is the default), then <strong>4 quaternions</strong>
         are potential states. Additionally, the coordinates of the
         absolute angular velocity vector of the
         body are 3 potential states.<br>
         If <strong>useQuaternions</strong> in the \"Advanced\" menu
         is <strong>false</strong>, then <strong>3 angles</strong> and the derivatives of
         these angles are potential states. The orientation of frame_a
         is computed by rotating the world frame along the axes defined
         in parameter vector \"sequence_angleStates\" (default = {1,2,3}, i.e.,
         the Cardan angle sequence) around the angles used as potential states.
         For example, the default is to rotate the x-axis of the world frame
         around angles[1], the new y-axis around angles[2] and the new z-axis
         around angles[3], arriving at frame_a.
     </li>
    </ul>
    <p>
    The quaternions have the slight disadvantage that there is a
    non-linear constraint equation between the 4 quaternions.
    Therefore, at least one non-linear equation has to be solved
    during simulation. A tool might, however, analytically solve this
    simple constraint equation. Using the 3 angles as states has the
    disadvantage that there is a singular configuration in which a
    division by zero will occur. If it is possible to determine in advance
    for an application class that this singular configuration is outside
    of the operating region, the 3 angles might be used as potential
    states by setting <strong>useQuaternions</strong> = <strong>false</strong>.
    </p>
    <p>
    In text books about 3-dimensional mechanics often 3 angles and the
    angular velocity are used as states. This is not the case here, since
    3 angles and their derivatives are used as potential states
    (if useQuaternions = false). The reason
    is that for real-time simulation the discretization formula of the
    integrator might be \"inlined\" and solved together with the body equations.
    By appropriate symbolic transformation the performance is
    drastically increased if angles and their
    derivatives are used as states, instead of angles and the angular
    velocity.
    </p>
    <p>
    Whether or not variables of the body are used as states is usually
    automatically selected by the Modelica translator. If parameter
    <strong>enforceStates</strong> is set to <strong>true</strong> in the \"Advanced\" menu,
    then body variables are forced to be used as states according
    to the setting of parameters \"useQuaternions\" and
    \"sequence_angleStates\".
    </p>
    </html>"));
    end Body_cm;

    model Body_cm_am "Rigid body with mass, inertia tensor and one frame connector (12 potential states)"
      import Modelica.Mechanics.MultiBody.Types;
      import Modelica.Mechanics.MultiBody.Frames;
      import Modelica.Units.Conversions.to_unit1;
      extends DataImport.massData_am;
      parameter String fileName annotation(
        HideResult = true);
      parameter Integer bodyIndex "Index of body corresponding to that of BEM (1, 2, 3, etc)" annotation(
        HideResult = true,
        Dialog(group = "Hydro Data"));
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed at body" annotation(
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      parameter Boolean animation = true "= true, if animation shall be enabled (show cylinder and sphere)";
      parameter Modelica.Units.SI.Position r_CM[3](start = {0, 0, 0}) "Vector from frame_a to center of mass, resolved in frame_a";
      // parameter Modelica.Units.SI.Mass m(min = 0, start = 1) "Mass of rigid body";
      parameter Modelica.Units.SI.Inertia I_11(min = 0) = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_22(min = 0) = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_33(min = 0) = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_21(min = -Modelica.Constants.inf) = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_31(min = -Modelica.Constants.inf) = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      parameter Modelica.Units.SI.Inertia I_32(min = -Modelica.Constants.inf) = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
      Modelica.Units.SI.Position r_0[3](start = {0, 0, 0}, each stateSelect = if enforceStates then StateSelect.always else StateSelect.avoid) "Position vector from origin of world frame to origin of frame_a" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      Modelica.Units.SI.Velocity v_0[3](start = {0, 0, 0}, each stateSelect = if enforceStates then StateSelect.always else StateSelect.avoid) "Absolute velocity of frame_a, resolved in world frame (= der(r_0))" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      Modelica.Units.SI.Acceleration a_0[3](start = {0, 0, 0}) "Absolute acceleration of frame_a resolved in world frame (= der(v_0))" annotation(
        Dialog(tab = "Initialization", showStartAttribute = true));
      parameter Boolean angles_fixed = false "= true, if angles_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.Angle angles_start[3] = {0, 0, 0} "Initial values of angles to rotate world frame around 'sequence_start' axes into frame_a" annotation(
        Dialog(tab = "Initialization"));
      parameter Types.RotationSequence sequence_start = {1, 2, 3} "Sequence of rotations to rotate world frame into frame_a at initial time" annotation(
        Evaluate = true,
        Dialog(tab = "Initialization"));
      parameter Boolean w_0_fixed = false "= true, if w_0_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.AngularVelocity w_0_start[3] = {0, 0, 0} "Initial or guess values of angular velocity of frame_a resolved in world frame" annotation(
        Dialog(tab = "Initialization"));
      parameter Boolean z_0_fixed = false "= true, if z_0_start are used as initial values, else as guess values" annotation(
        Evaluate = true,
        choices(checkBox = true),
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.AngularAcceleration z_0_start[3] = {0, 0, 0} "Initial values of angular acceleration z_0 = der(w_0)" annotation(
        Dialog(tab = "Initialization"));
      parameter Modelica.Units.SI.Diameter sphereDiameter = world.defaultBodyDiameter "Diameter of sphere" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      input Types.Color sphereColor = Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor "Color of sphere" annotation(
        Dialog(colorSelector = true, tab = "Animation", group = "if animation = true", enable = animation));
      parameter Modelica.Units.SI.Diameter cylinderDiameter = sphereDiameter/Types.Defaults.BodyCylinderDiameterFraction "Diameter of cylinder" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      input Types.Color cylinderColor = sphereColor "Color of cylinder" annotation(
        Dialog(colorSelector = true, tab = "Animation", group = "if animation = true", enable = animation));
      input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient "Reflection of ambient light (= 0: light is completely absorbed)" annotation(
        Dialog(tab = "Animation", group = "if animation = true", enable = animation));
      parameter Boolean enforceStates = false "= true, if absolute variables of body object shall be used as states (StateSelect.always)" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced"));
      parameter Boolean useQuaternions = true "= true, if quaternions shall be used as potential states otherwise use 3 angles as potential states" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced"));
      parameter Types.RotationSequence sequence_angleStates = {1, 2, 3} "Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states" annotation(
        Evaluate = true,
        Dialog(tab = "Advanced", enable = not useQuaternions));
      final parameter Modelica.Units.SI.Inertia I[3, 3] = [I_11, I_21, I_31; I_21, I_22, I_32; I_31, I_32, I_33] "Inertia tensor";
      final parameter Frames.Orientation R_start = Modelica.Mechanics.MultiBody.Frames.axesRotations(sequence_start, angles_start, zeros(3)) "Orientation object from world frame to frame_a at initial time";
      Modelica.Units.SI.AngularVelocity w_a[3](start = Frames.resolve2(R_start, w_0_start), fixed = fill(w_0_fixed, 3), each stateSelect = if enforceStates then (if useQuaternions then StateSelect.always else StateSelect.never) else StateSelect.avoid) "Absolute angular velocity of frame_a resolved in frame_a";
      Modelica.Units.SI.AngularAcceleration z_a[3](start = Frames.resolve2(R_start, z_0_start), fixed = fill(z_0_fixed, 3)) "Absolute angular acceleration of frame_a resolved in frame_a";
      Modelica.Units.SI.Acceleration g_0[3] "Gravity acceleration resolved in world frame";
    protected
      outer Modelica.Mechanics.MultiBody.World world;
      // Declarations for quaternions (dummies, if quaternions are not used)
      parameter Frames.Quaternions.Orientation Q_start = Frames.to_Q(R_start) "Quaternion orientation object from world frame to frame_a at initial time";
      Frames.Quaternions.Orientation Q(start = Q_start, each stateSelect = if enforceStates then (if useQuaternions then StateSelect.prefer else StateSelect.never) else StateSelect.avoid) "Quaternion orientation object from world frame to frame_a (dummy value, if quaternions are not used as states)";
      // Declaration for 3 angles
      parameter Modelica.Units.SI.Angle phi_start[3] = if sequence_start[1] == sequence_angleStates[1] and sequence_start[2] == sequence_angleStates[2] and sequence_start[3] == sequence_angleStates[3] then angles_start else Frames.axesRotationsAngles(R_start, sequence_angleStates) "Potential angle states at initial time";
      Modelica.Units.SI.Angle phi[3](start = phi_start, each stateSelect = if enforceStates then (if useQuaternions then StateSelect.never else StateSelect.always) else StateSelect.avoid) "Dummy or 3 angles to rotate world frame into frame_a of body";
      Modelica.Units.SI.AngularVelocity phi_d[3](each stateSelect = if enforceStates then (if useQuaternions then StateSelect.never else StateSelect.always) else StateSelect.avoid) "= der(phi)";
      Modelica.Units.SI.AngularAcceleration phi_dd[3] "= der(phi_d)";
      // Declarations for animation
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape cylinder(shapeType = "cylinder", color = cylinderColor, specularCoefficient = specularCoefficient, length = if Modelica.Math.Vectors.length(r_CM) > sphereDiameter/2 then Modelica.Math.Vectors.length(r_CM) - (if cylinderDiameter > 1.1*sphereDiameter then sphereDiameter/2 else 0) else 0, width = cylinderDiameter, height = cylinderDiameter, lengthDirection = to_unit1(r_CM), widthDirection = {0, 1, 0}, r = frame_a.r_0, R = frame_a.R) if world.enableAnimation and animation;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape sphere(shapeType = "sphere", color = sphereColor, specularCoefficient = specularCoefficient, length = sphereDiameter, width = sphereDiameter, height = sphereDiameter, lengthDirection = {1, 0, 0}, widthDirection = {0, 1, 0}, r_shape = r_CM - {1, 0, 0}*sphereDiameter/2, r = frame_a.r_0, R = frame_a.R) if world.enableAnimation and animation and sphereDiameter > 0;
    initial equation
      if angles_fixed then
// Initialize positional variables
        if not Connections.isRoot(frame_a.R) then
// frame_a.R is computed somewhere else
          zeros(3) = Frames.Orientation.equalityConstraint(frame_a.R, R_start);
        elseif useQuaternions then
// frame_a.R is computed from quaternions Q
          zeros(3) = Frames.Quaternions.Orientation.equalityConstraint(Q, Q_start);
        else
// frame_a.R is computed from the 3 angles 'phi'
          phi = phi_start;
        end if;
      end if;
    equation
      if enforceStates then
        Connections.root(frame_a.R);
      else
        Connections.potentialRoot(frame_a.R);
      end if;
      r_0 = frame_a.r_0;
      if not Connections.isRoot(frame_a.R) then
// Body does not have states
// Dummies
        Q = {0, 0, 0, 1};
        phi = zeros(3);
        phi_d = zeros(3);
        phi_dd = zeros(3);
      elseif useQuaternions then
// Use Quaternions as states (with dynamic state selection)
        frame_a.R = Frames.from_Q(Q, Frames.Quaternions.angularVelocity2(Q, der(Q)));
        {0} = Frames.Quaternions.orientationConstraint(Q);
// Dummies
        phi = zeros(3);
        phi_d = zeros(3);
        phi_dd = zeros(3);
      else
// Use Cardan angles as states
        phi_d = der(phi);
        phi_dd = der(phi_d);
        frame_a.R = Frames.axesRotations(sequence_angleStates, phi, phi_d);
// Dummies
        Q = {0, 0, 0, 1};
      end if;
// gravity acceleration at center of mass resolved in world frame
      g_0 = world.gravityAcceleration(frame_a.r_0 + Frames.resolve1(frame_a.R, r_CM));
// translational kinematic differential equations
      v_0 = der(frame_a.r_0);
      a_0 = Frames.resolve2(frame_a.R, der(v_0));
// rotational kinematic differential equations
      w_a = Frames.angularVelocity2(frame_a.R);
      z_a = der(w_a);
/* Newton/Euler equations with respect to center of mass
                    a_CM = a_a + cross(z_a, r_CM) + cross(w_a, cross(w_a, r_CM));
                    f_CM = m*(a_CM - g_a);
                    t_CM = I*z_a + cross(w_a, I*w_a);
               frame_a.f = f_CM
               frame_a.t = t_CM + cross(r_CM, f_CM);
            Inserting the first three equations in the last two results in:
          */
/*
      frame_a.f = m*(Frames.resolve2(frame_a.R, a_0 - g_0) + cross(z_a, r_CM) + cross(w_a, cross(w_a, r_CM)));
      frame_a.t = I*z_a + cross(w_a, I*w_a) + cross(r_CM, frame_a.f); */
// Note a_0 now defined as local translational acceleration
      frame_a.f = (m + Ainf11)*a_0 + Ainf12*z_a;
      frame_a.t = (I + Ainf22)*z_a + cross(w_a, (I + Ainf22)*w_a) + Ainf21*a_0;
      annotation(
        Icon(coordinateSystem(preserveAspectRatio = true, extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, 30}, {-3, -30}}, lineColor = {0, 24, 48}, fillPattern = FillPattern.HorizontalCylinder, fillColor = {0, 127, 255}, radius = 10), Text(extent = {{150, -100}, {-150, -70}}, textString = "m=%m"), Text(extent = {{-150, 110}, {150, 70}}, textString = "%name", textColor = {0, 0, 255}), Ellipse(extent = {{-20, 60}, {100, -60}}, lineColor = {0, 24, 48}, fillPattern = FillPattern.Sphere, fillColor = {0, 127, 255})}),
        Documentation(info = "<html>
        <p>
        <strong>Rigid body</strong> with mass and inertia tensor.
        All parameter vectors have to be resolved in frame_a.
        The <strong>inertia tensor</strong> has to be defined with respect to a
        coordinate system that is parallel to frame_a with the
        origin at the center of mass of the body.
        </p>
        <p>
        By default, this component is visualized by a <strong>cylinder</strong> located
        between frame_a and the center of mass and by a <strong>sphere</strong> that has
        its center at the center of mass. If the cylinder length is smaller as
        the radius of the sphere, e.g., since frame_a is located at the
        center of mass, the cylinder is not displayed. Note, that
        the animation may be switched off via parameter animation = <strong>false</strong>.
        </p>
        <p>
        <img src=\"modelica://Modelica/Resources/Images/Mechanics/MultiBody/Parts/Body.png\" alt=\"Parts.Body\">
        </p>
        
        <p>
        <strong>States of Body Components</strong>
        </p>
        <p>
        Every body has potential states. If possible a tool will select
        the states of joints and not the states of bodies because this is
        usually the most efficient choice. In this case the position, orientation,
        velocity and angular velocity of frame_a of the body will be computed
        by the component that is connected to frame_a. However, if a body is moving
        freely in space, variables of the body have to be used as states. The potential
        states of the body are:
        </p>
        <ul>
        <li> The <strong>position vector</strong> frame_a.r_0 from the origin of the
             world frame to the origin of frame_a of the body, resolved in
             the world frame and the <strong>absolute velocity</strong> v_0 of the origin of
             frame_a, resolved in the world frame (= der(frame_a.r_0)).
        </li>
        <li> If parameter <strong>useQuaternions</strong> in the \"Advanced\" menu
             is <strong>true</strong> (this is the default), then <strong>4 quaternions</strong>
             are potential states. Additionally, the coordinates of the
             absolute angular velocity vector of the
             body are 3 potential states.<br>
             If <strong>useQuaternions</strong> in the \"Advanced\" menu
             is <strong>false</strong>, then <strong>3 angles</strong> and the derivatives of
             these angles are potential states. The orientation of frame_a
             is computed by rotating the world frame along the axes defined
             in parameter vector \"sequence_angleStates\" (default = {1,2,3}, i.e.,
             the Cardan angle sequence) around the angles used as potential states.
             For example, the default is to rotate the x-axis of the world frame
             around angles[1], the new y-axis around angles[2] and the new z-axis
             around angles[3], arriving at frame_a.
         </li>
        </ul>
        <p>
        The quaternions have the slight disadvantage that there is a
        non-linear constraint equation between the 4 quaternions.
        Therefore, at least one non-linear equation has to be solved
        during simulation. A tool might, however, analytically solve this
        simple constraint equation. Using the 3 angles as states has the
        disadvantage that there is a singular configuration in which a
        division by zero will occur. If it is possible to determine in advance
        for an application class that this singular configuration is outside
        of the operating region, the 3 angles might be used as potential
        states by setting <strong>useQuaternions</strong> = <strong>false</strong>.
        </p>
        <p>
        In text books about 3-dimensional mechanics often 3 angles and the
        angular velocity are used as states. This is not the case here, since
        3 angles and their derivatives are used as potential states
        (if useQuaternions = false). The reason
        is that for real-time simulation the discretization formula of the
        integrator might be \"inlined\" and solved together with the body equations.
        By appropriate symbolic transformation the performance is
        drastically increased if angles and their
        derivatives are used as states, instead of angles and the angular
        velocity.
        </p>
        <p>
        Whether or not variables of the body are used as states is usually
        automatically selected by the Modelica translator. If parameter
        <strong>enforceStates</strong> is set to <strong>true</strong> in the \"Advanced\" menu,
        then body variables are forced to be used as states according
        to the setting of parameters \"useQuaternions\" and
        \"sequence_angleStates\".
        </p>
        </html>"));
    end Body_cm_am;

    model BodyCM_am
      extends OET.Internal.PartialThreeFrames;
      parameter Boolean animationEnable = false;
      //parameter String fileName = "float.stl";
      //parameter String filePath = "c:Users/"; // re add in shapetype
      parameter Real ra_CM[3] = {0, 0, 0};
      parameter Real rCM_b[3] = {0, 0, 0};
      parameter Real ra_b[3] = ra_CM + rCM_b;
      parameter String fileName annotation(
        HideResult = true);
      parameter Integer bodyIndex "Index of body corresponding to that of BEM (1, 2, 3, etc)" annotation(
        HideResult = true,
        Dialog(group = "Hydro Data"));
      Experimental.Body_cm_am body(fileName = fileName, bodyIndex = bodyIndex) annotation(
        Placement(transformation(origin = {0, -46}, extent = {{-12, -12}, {12, 12}}, rotation = -90)));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation(r = ra_CM) annotation(
        Placement(transformation(origin = {-50, 0}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Parts.FixedTranslation fixedTranslation1(r = rCM_b) annotation(
        Placement(transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(length = 1, width = 1, height = 1, animation = animationEnable) annotation(
        Placement(transformation(origin = {40, -36}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = true) annotation(
        Placement(transformation(origin = {50, 52}, extent = {{-10, -10}, {10, 10}})));
    equation
      connect(body.frame_a, frame_c) annotation(
        Line(points = {{0, -34}, {0, 100}}, color = {95, 95, 95}));
      connect(fixedTranslation1.frame_a, body.frame_a) annotation(
        Line(points = {{50, 0}, {0, 0}, {0, -34}}, color = {95, 95, 95}));
      connect(fixedTranslation.frame_b, body.frame_a) annotation(
        Line(points = {{-40, 0}, {0, 0}, {0, -34}}, color = {95, 95, 95}));
      connect(fixedTranslation1.frame_b, frame_b) annotation(
        Line(points = {{70, 0}, {100, 0}}, color = {95, 95, 95}));
      connect(fixedTranslation.frame_a, frame_a) annotation(
        Line(points = {{-60, 0}, {-100, 0}}, color = {95, 95, 95}));
      connect(fixedShape.frame_a, body.frame_a) annotation(
        Line(points = {{30, -36}, {0, -36}, {0, -34}}, color = {95, 95, 95}));
      connect(absoluteSensor.frame_a, body.frame_a) annotation(
        Line(points = {{40, 52}, {0, 52}, {0, -34}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 145}, {150, 105}}, textString = "%name", textColor = {0, 0, 255}), Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Body")}),
        Diagram);
    end BodyCM_am;

    model Environment_fn
      extends DataImport.waveData;
      extends Models.physicalConstants;
      outer OET.Hydro.FilePath filePath;
      redeclare parameter String fileName = filePath.FileName;
      redeclare parameter Integer bodyIndex = 1;
      parameter Modelica.Units.SI.Time Trmp = 200 "Interval for ramping up of waves during start phase [s]" annotation(
        Dialog(group = "Simulation Parameters"));
      Modelica.Units.SI.Length SSE "Sea surface elevation [m]";
      // Wave selection
      parameter String waveSelector = "PiersonMoskowitz" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "Linear", choice = "Bretschneider", choice = "PiersonMoskowitz", choice = "JONSWAP"));
      parameter Integer n_omega = 100 "Number of frequency components (default is 100 for irregular)" annotation(
        Dialog(group = "Simulation Parameters", enable = waveSelector <> "Linear"));
      parameter Modelica.Units.SI.Length Hs = 2.5 "Significant Wave Height [m]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omega_peak = 0.9423 "Peak spectral frequency [rad/s]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter String frequencySelection = "equalEnergy" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "random", choice = "equalEnergy"));
      Modelica.Units.SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation [rad/s]";
      Modelica.Units.SI.Length zeta[n_omega] "Wave amplitude component [m]";
      Real epsilon[n_omega];
      // = Wave.WaveFunctions.RandomFrequencyFunctions.randomNumberGen(localSeed1, globalSeed1, n_omega) "Wave components phase shift";
    equation
      if waveSelector == "Linear" then
// Calculate wave amplityde
        zeta[n_omega] = Hs/2 "Wave amplitude [m]";
// Assign peak amplitude to the scalar frequency
        omega[n_omega] = omega_peak;
        epsilon[n_omega] = 0;
      else
        (zeta, epsilon, omega) = EnvironmentFunc_fn(frequencySelection = frequencySelection, Trmp = Trmp, d = d, waveSelector = waveSelector, n_omega = n_omega, Hs = Hs, omega_peak = omega_peak, FileName = filePath.FileName);
      end if;
      SSE = sum(zeta.*cos(omega*time - 2*pi*epsilon));
    end Environment_fn;

    function EnvironmentFunc_fn
      extends DataImport.frequencyData;
      // need to add
      extends Models.physicalConstants;
      input String frequencySelection;
      input Real Trmp;
      input Real d;
      input String waveSelector;
      input Integer n_omega;
      input Real Hs;
      input Real omega_peak;
      input String FileName;
      output Modelica.Units.SI.Length zeta[n_omega];
      output Real epsilon[n_omega] = Wave.WaveFunctions.RandomFrequencyFunctions.randomNumberGen(localSeed1, globalSeed1, n_omega);
      output Modelica.Units.SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation [rad/s]";
    protected
      // Irregular wave spectrum parameters
      parameter Modelica.Units.SI.AngularFrequency omega_min = w[1] "Lowest frequency component [rad/s]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omega_max = w[end] "Highest frequency component [rad/s]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      // Random freqeuncy selection paramters (will be disabled if user opts to use equal energy method)
      parameter Integer localSeed = 614657 "Local random seed for frequency selection" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
      parameter Integer globalSeed = 30020 "Global random seed for frequency selection" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
      // Equal Energy Parameters
      parameter Integer n_omega_int = 500 "Number of frequency components for spectrum generation and integration (equal energy only)" annotation(
        HideResult = true,
        Dialog(group = "Equal Energy Frequency Selection", enable = frequencySelection == "equalEnergy"));
      Units.SpectrumEnergyDensity S[n_omega] "Wave energy spectrum [m^2*s/rad]";
      // Random phase shift
      Real rnd_shft[n_omega] "Random shifts for frequency selection";
      // Frequency selection and wave spectrum
      Modelica.Units.SI.AngularFrequency domega "Frequency step size [rad/s]";
      //unit issue here
      Modelica.Units.SI.AngularFrequency omega_int[n_omega_int] "Integration frequency step size (equal energy only) [rad/s]";
      Units.SpectrumEnergyDensity S_int[n_omega_int] "Integratation wave energy spectrum [m^2*s/rad]";
      redeclare parameter String fileName = FileName;
      redeclare parameter Integer bodyIndex = 1;
      // Wave selection
      // Derived parameters
      parameter Integer localSeed1 = 614757 "Local random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection"));
      // readd , enable = frequencySelection == "random"
      parameter Integer globalSeed1 = 40020 "Global random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection"));
      // readd , enable = frequencySelection == "random"
      Modelica.Units.SI.Time Tp[n_omega] "Wave period components [s]" annotation(
        HideResult = true);
      Modelica.Units.SI.WaveNumber k[n_omega] "Wave number component [1/m]";
      //Real F_exc[nDoF] "6D excitation force [N]";
    algorithm
// Calculate wave parameters
      Tp := 2*pi./omega;
      k := Wave.WaveFunctions.WaveParameterFunctions.waveNumber(d, omega);
      rnd_shft := Wave.WaveFunctions.RandomFrequencyFunctions.randomNumberGen(localSeed, globalSeed, n_omega);
// Calculate wave parameter
      domega := Wave.WaveFunctions.SpectrumFunctions.Calculations.frequencyStepGen(omega, n_omega);
      zeta := sqrt(2*S*domega);
// Select equal energy or random frequency selection
      if frequencySelection == "equalEnergy" then
        omega_int := Wave.WaveFunctions.SpectrumFunctions.Calculations.integrationFrequencyGen(omega_min, omega_max, n_omega_int);
        S_int := Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator(waveSelector = waveSelector, Hs = Hs, omega_peak = omega_peak, omega = omega_int, n_omega = n_omega_int);
        (omega, S) := Wave.WaveFunctions.EqualEnergyFrequencyFunctions.equalEnergyFrequencySelector(omega_min, omega_max, n_omega, n_omega_int, omega_int, S_int);
      elseif frequencySelection == "random" then
        omega := Wave.WaveFunctions.RandomFrequencyFunctions.randomFrequencySelector(omega_min, omega_max, rnd_shft, n_omega) "Selected frequency components [rad/s]";
        S := Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator(waveSelector = waveSelector, Hs = Hs, omega_peak = omega_peak, omega = omega, n_omega = n_omega);
        omega_int := zeros(n_omega_int);
        S_int := zeros(n_omega_int);
      end if;
    end EnvironmentFunc_fn;

    model Excitation_fn
      extends DataImport.excitationData;
      extends Models.physicalConstants;
      extends DataImport.physicalConstantData;
      // Simulation parameters w/ implicit connections
      outer Wave.Environment environment;
      // Frame_a connector
      Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a "Coordinate system fixed at body" annotation(
        HideResult = true,
        Placement(transformation(extent = {{-116, -16}, {-84, 16}})));
      parameter Boolean enableExcitationForce = true "Switch to enable/disable hydrostatic force calculation" annotation(
        HideResult = true,
        Dialog(group = "Excitation Force Parameters"));
      Real ExcCoeffRe[bodyDoF, environment.n_omega] "Real component of excitation coefficient for frequency components" annotation(
        HideResult = true);
      Real ExcCoeffIm[bodyDoF, environment.n_omega] "Imaginary component of excitation coefficient for frequency components" annotation(
        HideResult = true);
      Real F[6] = cat(1, f_element, t_element) "Combined force and torque vector [N,Nm]";
    protected
      Modelica.Units.SI.Force f_element[3];
      Modelica.Units.SI.Torque t_element[3];
    equation
// Interpolate excitation coefficients (Re & Im) for each frequency component and for each DoF
      for i in 1:bodyDoF loop
        for j in 1:environment.n_omega loop
          ExcCoeffRe[i, j] = Modelica.Math.Vectors.interpolate(w, F_excRe[i, :], environment.omega[j])*rho*g;
          ExcCoeffIm[i, j] = Modelica.Math.Vectors.interpolate(w, F_excIm[i, :], environment.omega[j])*rho*g;
        end for;
      end for;
      if enableExcitationForce then
// Calculate the excitation force
        for i in 1:bodyDoF loop
// Calculate and apply ramping to the excitation force
          if time < environment.Trmp then
// Ramp up the excitation force during the initial phase
            F[i] = 0.5*(1 + cos(pi + (pi*time/environment.Trmp)))*sum((ExcCoeffRe[i].*environment.zeta.*cos(environment.omega*time - 2*pi*environment.epsilon)) - (ExcCoeffIm[i].*environment.zeta.*sin(environment.omega*time - 2*pi*environment.epsilon)));
          else
// Apply full excitation force after the ramping period
            F[i] = sum((ExcCoeffRe[i].*environment.zeta.*cos(environment.omega*time - 2*pi*environment.epsilon)) - (ExcCoeffIm[i].*environment.zeta.*sin(environment.omega*time - 2*pi*environment.epsilon)));
          end if;
        end for;
      else
        F = zeros(6);
      end if;
// Assign excitation force to output
      frame_a.f = f_element;
      frame_a.t = t_element;
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Excitationc")}),
        Diagram);
    end Excitation_fn;

    model multibodyWEC_fn
      extends Modelica.Icons.Package;
      // World component (no gravity, Z-axis pointing downwards)
      inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity, n = {0, 0, -1}) "World coordinate system without gravity" annotation(
        Placement(transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}})));
      // Prismatic joint constraining motion in heave
      // Force and torque element (adapt wave output to a force and apply to the body)
      // Define hydrodynamic body
      inner Hydro.FilePath filePath annotation(
        Placement(transformation(origin = {134, -18}, extent = {{-10, -10}, {10, 10}})));
      HydrodynamicBody_fn hydrodynamicBody(BodyIndex = 2, enableRadiationForce = true, r = {0, 0, 0}, r_CM = {0, 0, 0}) annotation(
        Placement(transformation(origin = {10, -12}, extent = {{-10, -10}, {10, 10}})));
      HydrodynamicBody_fn hydrodynamicBody1(BodyIndex = 1, enableRadiationForce = true, r = {0, 0, 0}, r_CM = {0, 0, 0}) annotation(
        Placement(transformation(origin = {70, -16}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(n = {0, 0, 1}) annotation(
        Placement(transformation(origin = {40, -32}, extent = {{-10, -10}, {10, 10}})));
      inner Experimental.Environment_fnV2 environment annotation(
        Placement(transformation(origin = {94, 32}, extent = {{-10, -10}, {10, 10}})));
    equation
// Connections
      connect(prismatic.frame_b, hydrodynamicBody1.frame_a) annotation(
        Line(points = {{50, -32}, {60, -32}, {60, -16}}, color = {95, 95, 95}));
      connect(prismatic.frame_a, hydrodynamicBody.frame_b) annotation(
        Line(points = {{30, -32}, {20, -32}, {20, -12}}, color = {95, 95, 95}));
      annotation(
        Icon(graphics = {Line(points = {{-90, 0}, {-60, 20}, {-30, -20}, {0, 20}, {30, -20}, {60, 20}, {90, 0}}, color = {0, 0, 200}, thickness = 2, smooth = Smooth.Bezier), Ellipse(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
        Documentation(info = "<html>
        <p><b>1D Single-Body Wave Energy Converter (WEC) Model</b></p>
        <p>This model represents a simplified 1D single-body wave energy converter system, 
        focusing on the vertical motion of the body in response to wave excitation forces.</p>
        
        <p><b>Model Description</b></p>
        <p>The WEC consists of a hydrodynamic body constrained to move vertically using a prismatic joint. 
        The body is subjected to wave excitation forces generated by Regular (Linear) and Irregular (PM, Bretschneider, JONSWAP) wave profiles.</p>
        
        <p><b>Key Components</b></p>
        <ul>
          <li><code>world</code>: Defines the world coordinate system without gravity</li>
          <li><code>bodyHD6D</code>: Represents the hydrodynamic body of the WEC</li>
          <li><code>prismatic</code>: Allows vertical motion of the body</li>
          <li><code>Regular and Irregular Wave Profiles</code>: Generates regular and irregular wave excitation forces</li>
          <li><code>forceAndTorque</code>: Applies the excitation force to the body</li>
        </ul>
        
        <p><b>Assumptions and Simplifications</b></p>
        <ul>
          <li>The model considers only vertical motion (1D) of the WEC</li>
          <li>Gravity is not included in the world model</li>
          <li>The excitation force is applied as an external input based on the Pierson-Moskowitz or Regular wave profile</li>
        </ul>
        
        <p><b>Notes</b></p>
        <ul>
          <li>This model serves as a basic framework for WEC simulations and can be extended for more complex analyses</li>
          <li>Additional forces like radiation damping or PTO forces can be added to enhance the model's realism</li>
          <li>Ensure that the BodyHD6D component is properly configured for accurate results</li>
          <li>The wave parameters may need to be adjusted to represent specific sea states</li>
        </ul>
      </html>"),
        Diagram(coordinateSystem(extent = {{-80, 0}, {150, -40}})),
        experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-08, Interval = 0.05));
    end multibodyWEC_fn;

    model HydrodynamicBody_fn "6-Dimensional Hydrodynamic Forces and Moments Calculation"
      // Inheritance
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
      //extends Hydrodynamic.HydroDataImport.massData;
      /* This should be removed from here and included in the definition of the body in HydrodynamicBody, but is okay in the interim */
      // BodyShape parameters
      outer Hydro.FilePath filePath;
      parameter Integer BodyIndex "Index of body corresponding to that of BEM (1, 2, 3, etc)" annotation(
        Dialog(group = "Hydro Data"));
      /* Removing mass definition here and adding it to a custom bodyShape model
                                                                      parameter Modelica.Units.SI.Mass m = M + Ainf[3, 3] "Mass of the body" annotation(
                                                                        Dialog(group = "Body")); /*
                                                                      /* The mass is only valid when motion is constrained in heave. This line is also repeated in the PTO force code base to determine the control gain */
      parameter Modelica.Units.SI.Position r[3] "Position vector" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Position r_CM[3] "Center of mass position vector" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_11 = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_22 = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_33 = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_21 = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_31 = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_32 = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Body"));
      BodyShape_er bodyShape(r = r, r_CM = r_CM, I_11 = I_11, I_22 = I_22, I_33 = I_33, I_21 = I_21, I_31 = I_31, I_32 = I_32, fileName = filePath.FileName, bodyIndex = BodyIndex, useQuaternions = false, angles_fixed = false, w_0_fixed = false, z_0_fixed = false) annotation(
        Placement(transformation(origin = {12, -84}, extent = {{-10, -10}, {10, 10}})));
      // Hydrostatic force parameters
      parameter Boolean enableHydrostaticForce = true "Switch to enable/disable hydrostatic force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Hydrostatic Force Parameters"));
      // Radiation force paramters
      parameter Boolean enableRadiationForce = true "Switch to enable/disable 6D radiation force calculation" annotation(
        Dialog(group = "Radiation Force Parameters"));
      /* 
                                                                                        parameter Real Kpx = 0.0 "Proportional gain for x-axis translation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter Real Kpy = 0.0 "Proportional gain for y-axis translation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter Real Kprx = 0.0 "Proportional gain for x-axis rotation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter Real Kpry = 0.0 "Proportional gain for y-axis rotation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter Real Kprz = 0.0 "Proportional gain for z-axis rotation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter TranslationalSpringConstant Kix = 0.0 "Integral gain for x-axis translation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter TranslationalSpringConstant Kiy = 0.0 "Integral gain for y-axis translation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter RotationalSpringConstant Kirx = 0.0 "Integral gain for x-axis rotation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter RotationalSpringConstant Kiry = 0.0 "Integral gain for y-axis rotation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                                                        parameter RotationalSpringConstant Kirz = 0.0 "Integral gain for z-axis rotation" annotation(
                                                                                          Dialog(group = "PTO Parameters"));
                                                            
                                                                                     */
      /*
                                                          // Damping coefficients
                                                            parameter Real Cvtx = 0.01 "Translational damping coefficient for x-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cvty = 0.01 "Translational damping coefficient for y-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cvtz = 0.01 "Translational damping coefficient for z-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cvrx = 0.01 "Rotational damping coefficient for x-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cvry = 0.01 "Rotational damping coefficient for y-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cvrz = 0.01 "Rotational damping coefficient for z-axis [-]" annotation(HideResult = true);
                                                            
                                                            // Drag coefficients
                                                            parameter Real Cdtx = 0.01 "Translational drag coefficient for x-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cdty = 0.01 "Translational drag coefficient for y-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cdtz = 0.01 "Translational drag coefficient for z-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cdrx = 0.01 "Rotational drag coefficient for x-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cdry = 0.01 "Rotational drag coefficient for y-axis [-]" annotation(HideResult = true);
                                                            parameter Real Cdrz = 0.01 "Rotational drag coefficient for z-axis [-]" annotation(HideResult = true);
                                                            */
      Hydro.DampingDrag dampingDrag annotation(
        Placement(transformation(origin = {74, 52}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world, get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = true) annotation(
        Placement(transformation(origin = {-66, 38}, extent = {{-10, -10}, {10, 10}})));
      Excitation_fn excitation_fn(fileName = filePath.FileName, bodyIndex = BodyIndex) annotation(
        Placement(transformation(origin = {16, 12}, extent = {{-10, -10}, {10, 10}})));
      Hydro.Hydrostatic hydrostatic(fileName = filePath.FileName, bodyIndex = BodyIndex) annotation(
        Placement(transformation(origin = {20, -24}, extent = {{-10, -10}, {10, 10}})));
      Hydro.Radiation radiation(fileName = filePath.FileName, bodyIndex = BodyIndex) annotation(
        Placement(transformation(origin = {-36, -26}, extent = {{-10, -10}, {10, 10}})));
    equation
//Conections
      connect(bodyShape.frame_b, frame_b) annotation(
        Line(points = {{22, -84}, {62, -84}, {62, 0}, {102, 0}}, color = {95, 95, 95}));
      connect(bodyShape.frame_a, frame_a) annotation(
        Line(points = {{2, -84}, {-76, -84}, {-76, 0}, {-102, 0}}, color = {95, 95, 95}));
      connect(dampingDrag.frame_a, bodyShape.frame_a) annotation(
        Line(points = {{64, 52}, {-28, 52}, {-28, -84}, {2, -84}}, color = {95, 95, 95}));
      connect(absoluteSensor.frame_a, frame_a) annotation(
        Line(points = {{-76, 38}, {-100, 38}, {-100, 0}}, color = {95, 95, 95}));
      connect(excitation_fn.frame_a, bodyShape.frame_a) annotation(
        Line(points = {{6, 12}, {2, 12}, {2, -84}}, color = {95, 95, 95}));
      connect(hydrostatic.frame_a, bodyShape.frame_a) annotation(
        Line(points = {{10, -24}, {2, -24}, {2, -84}}, color = {95, 95, 95}));
      connect(radiation.frame_a, bodyShape.frame_a) annotation(
        Line(points = {{-46, -26}, {2, -26}, {2, -84}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 145}, {150, 105}}, textString = "%name", textColor = {0, 0, 255}), Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Hydro Body")}),
        Diagram);
    end HydrodynamicBody_fn;

    model Environment_fnV2
      extends DataImport.waveData;
      extends Models.physicalConstants;
      extends DataImport.frequencyData;
      outer Hydro.FilePath filePath;
      redeclare parameter String fileName = filePath.FileName;
      redeclare parameter Integer bodyIndex = 1;
      parameter Modelica.Units.SI.Time Trmp = 200 "Interval for ramping up of waves during start phase [s]" annotation(
        Dialog(group = "Simulation Parameters"));
      Modelica.Units.SI.Length SSE "Sea surface elevation [m]";
      // Wave selection
      parameter String waveSelector = "PiersonMoskowitz" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "Linear", choice = "Bretschneider", choice = "PiersonMoskowitz", choice = "JONSWAP"));
      parameter Integer n_omega = 100 "Number of frequency components (default is 100 for irregular)" annotation(
        Dialog(group = "Simulation Parameters", enable = waveSelector <> "Linear"));
      parameter Modelica.Units.SI.Length Hs = 2.5 "Significant Wave Height [m]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omega_peak = 0.9423 "Peak spectral frequency [rad/s]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter String frequencySelection = "random" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "random", choice = "equalEnergy"));
      Modelica.Units.SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation [rad/s]";
      Modelica.Units.SI.Length zeta[n_omega] "Wave amplitude component [m]";
      Real epsilon[n_omega];
      // = Wave.WaveFunctions.RandomFrequencyFunctions.randomNumberGen(localSeed1, globalSeed1, n_omega) "Wave components phase shift";
    protected
      // Irregular wave spectrum parameters
      parameter Modelica.Units.SI.AngularFrequency omega_min = w[1] "Lowest frequency component [rad/s]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omega_max = w[end] "Highest frequency component [rad/s]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      // Random freqeuncy selection paramters (will be disabled if user opts to use equal energy method)
      parameter Integer localSeed = 614657 "Local random seed for frequency selection" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
      parameter Integer globalSeed = 30020 "Global random seed for frequency selection" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
      // Equal Energy Parameters
      parameter Integer n_omega_int = 500 "Number of frequency components for spectrum generation and integration (equal energy only)" annotation(
        HideResult = true,
        Dialog(group = "Equal Energy Frequency Selection", enable = frequencySelection == "equalEnergy"));
      Units.SpectrumEnergyDensity S[n_omega] "Wave energy spectrum [m^2*s/rad]";
      // Random phase shift
      Real rnd_shft[n_omega] "Random shifts for frequency selection";
      // Frequency selection and wave spectrum
      Modelica.Units.SI.AngularFrequency domega "Frequency step size [rad/s]";
      //unit issue here
      Modelica.Units.SI.AngularFrequency omega_int[n_omega_int] "Integration frequency step size (equal energy only) [rad/s]";
      Units.SpectrumEnergyDensity S_int[n_omega_int] "Integratation wave energy spectrum [m^2*s/rad]";
      // Derived parameters
      parameter Integer localSeed1 = 614757 "Local random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection"));
      // readd , enable = frequencySelection == "random"
      parameter Integer globalSeed1 = 40020 "Global random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection"));
      // readd , enable = frequencySelection == "random"
      Modelica.Units.SI.Time Tp[n_omega] "Wave period components [s]" annotation(
        HideResult = true);
      Modelica.Units.SI.WaveNumber k[n_omega] "Wave number component [1/m]";
    equation
      if waveSelector == "Linear" then
// Calculate wave amplityde
        zeta[n_omega] = Hs/2 "Wave amplitude [m]";
// Assign peak amplitude to the scalar frequency
        omega[n_omega] = omega_peak;
        epsilon[n_omega] = 0;
        Tp[n_omega] = 0;
        k[n_omega] = 0;
        S_int = zeros(n_omega_int);
        S[n_omega] = 0;
        rnd_shft[n_omega] = 0;
        domega = 0;
        omega_int = zeros(n_omega_int);
      else
// Calculate wave parameters
        Tp = 2*pi./omega;
        k = Wave.WaveFunctions.WaveParameterFunctions.waveNumber(d, omega);
        epsilon = Wave.WaveFunctions.RandomFrequencyFunctions.randomNumberGen(localSeed1, globalSeed1, n_omega);
        rnd_shft = Wave.WaveFunctions.RandomFrequencyFunctions.randomNumberGen(localSeed, globalSeed, n_omega);
// Calculate wave parameter
        domega = Wave.WaveFunctions.SpectrumFunctions.Calculations.frequencyStepGen(omega, n_omega);
        zeta = sqrt(2*S*domega);
// Select equal energy or random frequency selection
        if frequencySelection == "equalEnergy" then
          omega_int = Wave.WaveFunctions.SpectrumFunctions.Calculations.integrationFrequencyGen(omega_min, omega_max, n_omega_int);
          S_int = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator(waveSelector = waveSelector, Hs = Hs, omega_peak = omega_peak, omega = omega_int, n_omega = n_omega_int);
          (omega, S) = Wave.WaveFunctions.EqualEnergyFrequencyFunctions.equalEnergyFrequencySelector(omega_min, omega_max, n_omega, n_omega_int, omega_int, S_int);
        elseif frequencySelection == "random" then
          omega = Wave.WaveFunctions.RandomFrequencyFunctions.randomFrequencySelector(omega_min, omega_max, rnd_shft, n_omega) "Selected frequency components [rad/s]";
          S = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator(waveSelector = waveSelector, Hs = Hs, omega_peak = omega_peak, omega = omega, n_omega = n_omega);
          omega_int = zeros(n_omega_int);
          S_int = zeros(n_omega_int);
        end if;
      end if;
      SSE = sum(zeta.*cos(omega*time - 2*pi*epsilon));
    end Environment_fnV2;

    model multibodyWEC_full
      extends Modelica.Icons.Package;
      // World component (no gravity, Z-axis pointing downwards)
      inner Modelica.Mechanics.MultiBody.World world(gravityType = Modelica.Mechanics.MultiBody.Types.GravityTypes.NoGravity, n = {0, 0, -1}) "World coordinate system without gravity" annotation(
        Placement(transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}})));
      // Prismatic joint constraining motion in heave
      // Force and torque element (adapt wave output to a force and apply to the body)
      // Define hydrodynamic body
      inner Hydro.FilePath filePath annotation(
        Placement(transformation(origin = {134, -18}, extent = {{-10, -10}, {10, 10}})));
      inner Experimental.Environment_fnV2 environment annotation(
        Placement(transformation(origin = {52, 22}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(n = {0, 0, 1}) annotation(
        Placement(transformation(origin = {42, 2}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Mechanics.MultiBody.Forces.WorldForce force annotation(
        Placement(transformation(origin = {-16, 32}, extent = {{-10, -10}, {10, 10}})));
      Modelica.Blocks.Sources.Sine sine[3](amplitude = {1000, 1000, 1000000}, f = {0.1, 0.1, 0.1}) annotation(
        Placement(transformation(origin = {-52, 34}, extent = {{-10, -10}, {10, 10}})));
      HydrodynamicBody_full hydrodynamicBody_cm(BodyIndex = 2, ra_CM = {0, 0, 0}, rCM_b = {0, 0, 0}) annotation(
        Placement(transformation(origin = {14, -24}, extent = {{-10, -10}, {10, 10}})));
      HydrodynamicBody_full hydrodynamicBody_cm1(BodyIndex = 1) annotation(
        Placement(transformation(origin = {72, -28}, extent = {{-10, -10}, {10, 10}})));
      Mooring.LinearMooring linearMooring annotation(
        Placement(transformation(origin = {-34, -60}, extent = {{-10, -10}, {10, 10}})));
    equation
// Connections
      connect(sine.y, force.force) annotation(
        Line(points = {{-40, 34}, {-28, 34}, {-28, 32}}, color = {0, 0, 127}));
      connect(force.frame_b, hydrodynamicBody_cm.frame_a) annotation(
        Line(points = {{-6, 32}, {4, 32}, {4, -24}}, color = {95, 95, 95}));
      connect(hydrodynamicBody_cm.frame_b, prismatic1.frame_a) annotation(
        Line(points = {{24, -24}, {32, -24}, {32, 2}}, color = {95, 95, 95}));
      connect(hydrodynamicBody_cm1.frame_a, prismatic1.frame_b) annotation(
        Line(points = {{62, -28}, {52, -28}, {52, 2}}, color = {95, 95, 95}));
      connect(linearMooring.frame_a, hydrodynamicBody_cm.frame_a) annotation(
        Line(points = {{-44, -60}, {4, -60}, {4, -24}}, color = {95, 95, 95}));
      annotation(
        Icon(graphics = {Line(points = {{-90, 0}, {-60, 20}, {-30, -20}, {0, 20}, {30, -20}, {60, 20}, {90, 0}}, color = {0, 0, 200}, thickness = 2, smooth = Smooth.Bezier), Ellipse(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 0}, fillColor = {0, 0, 0}, fillPattern = FillPattern.Solid)}),
        Documentation(info = "<html>
            <p><b>1D Single-Body Wave Energy Converter (WEC) Model</b></p>
            <p>This model represents a simplified 1D single-body wave energy converter system, 
            focusing on the vertical motion of the body in response to wave excitation forces.</p>
            
            <p><b>Model Description</b></p>
            <p>The WEC consists of a hydrodynamic body constrained to move vertically using a prismatic joint. 
            The body is subjected to wave excitation forces generated by Regular (Linear) and Irregular (PM, Bretschneider, JONSWAP) wave profiles.</p>
            
            <p><b>Key Components</b></p>
            <ul>
              <li><code>world</code>: Defines the world coordinate system without gravity</li>
              <li><code>bodyHD6D</code>: Represents the hydrodynamic body of the WEC</li>
              <li><code>prismatic</code>: Allows vertical motion of the body</li>
              <li><code>Regular and Irregular Wave Profiles</code>: Generates regular and irregular wave excitation forces</li>
              <li><code>forceAndTorque</code>: Applies the excitation force to the body</li>
            </ul>
            
            <p><b>Assumptions and Simplifications</b></p>
            <ul>
              <li>The model considers only vertical motion (1D) of the WEC</li>
              <li>Gravity is not included in the world model</li>
              <li>The excitation force is applied as an external input based on the Pierson-Moskowitz or Regular wave profile</li>
            </ul>
            
            <p><b>Notes</b></p>
            <ul>
              <li>This model serves as a basic framework for WEC simulations and can be extended for more complex analyses</li>
              <li>Additional forces like radiation damping or PTO forces can be added to enhance the model's realism</li>
              <li>Ensure that the BodyHD6D component is properly configured for accurate results</li>
              <li>The wave parameters may need to be adjusted to represent specific sea states</li>
            </ul>
          </html>"),
        Diagram(coordinateSystem(extent = {{-80, 0}, {150, -40}})),
        experiment(StartTime = 0, StopTime = 500, Tolerance = 1e-08, Interval = 0.05));
    end multibodyWEC_full;

    model HydrodynamicBody_full "6-Dimensional Hydrodynamic Forces and Moments Calculation"
      // Inheritance
      extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
      //extends Hydrodynamic.HydroDataImport.massData;
      /* This should be removed from here and included in the definition of the body in HydrodynamicBody, but is okay in the interim */
      // BodyShape parameters
      outer Hydro.FilePath filePath;
      parameter Integer BodyIndex "Index of body corresponding to that of BEM (1, 2, 3, etc)" annotation(
        Dialog(group = "Hydro Data"));
      /* Removing mass definition here and adding it to a custom bodyShape model
                                                                      parameter Modelica.Units.SI.Mass m = M + Ainf[3, 3] "Mass of the body" annotation(
                                                                        Dialog(group = "Body")); /*
                                                                      /* The mass is only valid when motion is constrained in heave. This line is also repeated in the PTO force code base to determine the control gain */
      parameter Modelica.Units.SI.Position r[3] = {0, 0, 0} "Position vector" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Position r_CM[3] = {0, 0, 0} "Center of mass position vector" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_11 = 0.001 "Element (1,1) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_22 = 0.001 "Element (2,2) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_33 = 0.001 "Element (3,3) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_21 = 0 "Element (2,1) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_31 = 0 "Element (3,1) of inertia tensor" annotation(
        Dialog(group = "Body"));
      parameter Modelica.Units.SI.Inertia I_32 = 0 "Element (3,2) of inertia tensor" annotation(
        Dialog(group = "Body"));
      // Hydrostatic force parameters
      parameter Boolean enableHydrostaticForce = true "Switch to enable/disable hydrostatic force calculation" annotation(
        choices(checkBox = true),
        Dialog(group = "Hydrostatic Force Parameters"));
      // Radiation force paramters
      parameter Boolean enableRadiationForce = true "Switch to enable/disable 6D radiation force calculation" annotation(
        Dialog(group = "Radiation Force Parameters"));
      /* 
                                                                            parameter Real Kpx = 0.0 "Proportional gain for x-axis translation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter Real Kpy = 0.0 "Proportional gain for y-axis translation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter Real Kprx = 0.0 "Proportional gain for x-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter Real Kpry = 0.0 "Proportional gain for y-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter Real Kprz = 0.0 "Proportional gain for z-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter TranslationalSpringConstant Kix = 0.0 "Integral gain for x-axis translation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter TranslationalSpringConstant Kiy = 0.0 "Integral gain for y-axis translation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter RotationalSpringConstant Kirx = 0.0 "Integral gain for x-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter RotationalSpringConstant Kiry = 0.0 "Integral gain for y-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                                            parameter RotationalSpringConstant Kirz = 0.0 "Integral gain for z-axis rotation" annotation(
                                                                              Dialog(group = "PTO Parameters"));
                                                
                                                                         */
      /*
                                              // Damping coefficients
                                                parameter Real Cvtx = 0.01 "Translational damping coefficient for x-axis [-]" annotation(HideResult = true);
                                                parameter Real Cvty = 0.01 "Translational damping coefficient for y-axis [-]" annotation(HideResult = true);
                                                parameter Real Cvtz = 0.01 "Translational damping coefficient for z-axis [-]" annotation(HideResult = true);
                                                parameter Real Cvrx = 0.01 "Rotational damping coefficient for x-axis [-]" annotation(HideResult = true);
                                                parameter Real Cvry = 0.01 "Rotational damping coefficient for y-axis [-]" annotation(HideResult = true);
                                                parameter Real Cvrz = 0.01 "Rotational damping coefficient for z-axis [-]" annotation(HideResult = true);
                                                
                                                // Drag coefficients
                                                parameter Real Cdtx = 0.01 "Translational drag coefficient for x-axis [-]" annotation(HideResult = true);
                                                parameter Real Cdty = 0.01 "Translational drag coefficient for y-axis [-]" annotation(HideResult = true);
                                                parameter Real Cdtz = 0.01 "Translational drag coefficient for z-axis [-]" annotation(HideResult = true);
                                                parameter Real Cdrx = 0.01 "Rotational drag coefficient for x-axis [-]" annotation(HideResult = true);
                                                parameter Real Cdry = 0.01 "Rotational drag coefficient for y-axis [-]" annotation(HideResult = true);
                                                parameter Real Cdrz = 0.01 "Rotational drag coefficient for z-axis [-]" annotation(HideResult = true);
                                                */
      Hydro.Hydrostatic hydrostatic(fileName = filePath.FileName, bodyIndex = BodyIndex) annotation(
        Placement(transformation(origin = {-60, 0}, extent = {{-14, -14}, {14, 14}})));
      Modelica.Mechanics.MultiBody.Sensors.AbsoluteSensor absoluteSensor(get_r = true, get_v = true, get_a = true, get_w = true, get_z = true, get_angles = true, resolveInFrame = Modelica.Mechanics.MultiBody.Types.ResolveInFrameA.world) annotation(
        Placement(transformation(origin = {-54, 60}, extent = {{-10, -10}, {10, 10}})));
      Hydro.DampingDrag dampingDrag annotation(
        Placement(transformation(origin = {57, -3}, extent = {{-13, -13}, {13, 13}})));
      BodyCM_am bodyCM(animationEnable = animationEnable, ra_CM = ra_CM, rCM_b = rCM_b, ra_b = ra_CM + rCM_b, fileName = filePath.FileName, bodyIndex = BodyIndex) annotation(
        Placement(transformation(origin = {0, -66}, extent = {{-10, -10}, {10, 10}})));
      parameter Boolean animationEnable = false;
      parameter Real ra_CM[3] = {0, 0, 0};
      parameter Real rCM_b[3] = {0, 0, 0};
      parameter Real ra_b[3] = ra_CM + rCM_b;
      Hydro.Radiation radiation(fileName = filePath.FileName, bodyIndex = BodyIndex) annotation(
        Placement(transformation(origin = {16, 6}, extent = {{-10, -10}, {10, 10}})));
      Excitation_fn excitation_fn(fileName = filePath.FileName, bodyIndex = BodyIndex) annotation(
        Placement(transformation(origin = {26, 50}, extent = {{-10, -10}, {10, 10}})));
    equation
//Conections
      connect(hydrostatic.frame_a, bodyCM.frame_c) annotation(
        Line(points = {{-74, 0}, {-74, -56}, {0, -56}}, color = {95, 95, 95}));
      connect(dampingDrag.frame_a, bodyCM.frame_c) annotation(
        Line(points = {{44, -2}, {42, -2}, {42, -56}, {0, -56}}, color = {95, 95, 95}));
      connect(bodyCM.frame_a, frame_a) annotation(
        Line(points = {{-10, -66}, {-100, -66}, {-100, 0}}, color = {95, 95, 95}));
      connect(bodyCM.frame_b, frame_b) annotation(
        Line(points = {{10, -66}, {100, -66}, {100, 0}}, color = {95, 95, 95}));
      connect(absoluteSensor.frame_a, bodyCM.frame_c) annotation(
        Line(points = {{-64, 60}, {0, 60}, {0, -56}}, color = {95, 95, 95}));
      connect(radiation.frame_a, bodyCM.frame_c) annotation(
        Line(points = {{6, 6}, {0, 6}, {0, -56}}, color = {95, 95, 95}));
      connect(excitation_fn.frame_a, bodyCM.frame_c) annotation(
        Line(points = {{16, 50}, {0, 50}, {0, -56}}, color = {95, 95, 95}));
      annotation(
        Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(extent = {{-150, 145}, {150, 105}}, textString = "%name", textColor = {0, 0, 255}), Rectangle(extent = {{-100, -100}, {100, 100}}), Text(extent = {{-100, -100}, {100, 100}}, textString = "Hydro Body")}),
        Diagram);
    end HydrodynamicBody_full;

    model EnvironmentV3
      extends DataImport.waveData;
      extends Models.physicalConstants;
      extends DataImport.frequencyData;
      outer Hydro.FilePath filePath;
      redeclare parameter String fileName = filePath.FileName;
      redeclare parameter Integer bodyIndex = 1;
      parameter Modelica.Units.SI.Time Trmp = 200 "Interval for ramping up of waves during start phase [s]" annotation(
        Dialog(group = "Simulation Parameters"));
      Modelica.Units.SI.Length SSE "Sea surface elevation [m]";
      // Wave selection
      parameter String waveSelector = "PiersonMoskowitz" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "Linear", choice = "Bretschneider", choice = "PiersonMoskowitz", choice = "JONSWAP", choice = "spectrumImport"));
      parameter Integer n_omega = 100 "Number of frequency components (default is 100 for irregular)" annotation(
        Dialog(group = "Simulation Parameters", enable = waveSelector <> "Linear"));
      parameter Modelica.Units.SI.Length Hs = 2.5 "Significant Wave Height [m]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omega_peak = 0.9423 "Peak spectral frequency [rad/s]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter String frequencySelection = "random" annotation(
        Dialog(group = "Wave Spectrum Parameters"),
        choices(choice = "random", choice = "equalEnergy"));
      Modelica.Units.SI.AngularFrequency omega[n_omega] "Frequency components selected for simulation [rad/s]";
      Modelica.Units.SI.Length zeta[n_omega] "Wave amplitude component [m]";
      Real epsilon[n_omega];
      // = Wave.WaveFunctions.RandomFrequencyFunctions.randomNumberGen(localSeed1, globalSeed1, n_omega) "Wave components phase shift";
    protected
      // Irregular wave spectrum parameters
      parameter Modelica.Units.SI.AngularFrequency omega_min = w[1] "Lowest frequency component [rad/s]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      parameter Modelica.Units.SI.AngularFrequency omega_max = w[end] "Highest frequency component [rad/s]" annotation(
        Dialog(group = "Wave Spectrum Parameters"));
      // Random freqeuncy selection paramters (will be disabled if user opts to use equal energy method)
      parameter Integer localSeed = 614657 "Local random seed for frequency selection" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
      parameter Integer globalSeed = 30020 "Global random seed for frequency selection" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection", enable = frequencySelection == "random"));
      // Equal Energy Parameters
      parameter Integer n_omega_int = 500 "Number of frequency components for spectrum generation and integration (equal energy only)" annotation(
        HideResult = true,
        Dialog(group = "Equal Energy Frequency Selection", enable = frequencySelection == "equalEnergy"));
      Units.SpectrumEnergyDensity S[n_omega] "Wave energy spectrum [m^2*s/rad]";
      // Random phase shift
      Real rnd_shft[n_omega] "Random shifts for frequency selection";
      // Frequency selection and wave spectrum
      Modelica.Units.SI.AngularFrequency domega "Frequency step size [rad/s]";
      //unit issue here
      Modelica.Units.SI.AngularFrequency omega_int[n_omega_int] "Integration frequency step size (equal energy only) [rad/s]";
      Units.SpectrumEnergyDensity S_int[n_omega_int] "Integratation wave energy spectrum [m^2*s/rad]";
      // Derived parameters
      parameter Integer localSeed1 = 614757 "Local random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection"));
      // readd , enable = frequencySelection == "random"
      parameter Integer globalSeed1 = 40020 "Global random seed for phase shifts" annotation(
        HideResult = true,
        Dialog(group = "Random Frequency Selection"));
      // readd , enable = frequencySelection == "random"
      Modelica.Units.SI.Time Tp[n_omega] "Wave period components [s]" annotation(
        HideResult = true);
      Modelica.Units.SI.WaveNumber k[n_omega] "Wave number component [1/m]";
    equation
      if waveSelector == "Linear" then
// Calculate wave amplityde
        zeta[n_omega] = Hs/2 "Wave amplitude [m]";
// Assign peak amplitude to the scalar frequency
        omega[n_omega] = omega_peak;
        epsilon[n_omega] = 0;
        Tp[n_omega] = 0;
        k[n_omega] = 0;
        S_int = zeros(n_omega_int);
        S[n_omega] = 0;
        rnd_shft[n_omega] = 0;
        domega = 0;
        omega_int = zeros(n_omega_int);
      elseif waveSelector == "spectrumImport" then
        zeta = sqrt(2*S*domega);
        S = Modelica.Utilities.Streams.readRealMatrix(fileName, "hydro.wave.spectrumImport.S", 1, n_omega);
//getting size of this is going to suck ass
        omega = Modelica.Utilities.Streams.readRealMatrix(fileName, "hydro.wave.spectrumImport.w", 1, n_omega);
        epsilon = Modelica.Utilities.Streams.readRealMatrix(fileName, "hydro.wave.spectrumImport.phase", 1, n_omega);
        Tp = zeros(n_omega);
        k = zeros(n_omega);
        S_int = zeros(n_omega_int);
        rnd_shft = zeros(n_omega);
        domega = Wave.WaveFunctions.SpectrumFunctions.Calculations.frequencyStepGen(omega, n_omega);
        omega_int = zeros(n_omega_int);
      else
// Calculate wave parameters
        Tp = 2*pi./omega;
        k = Wave.WaveFunctions.WaveParameterFunctions.waveNumber(d, omega);
        epsilon = Wave.WaveFunctions.RandomFrequencyFunctions.randomNumberGen(localSeed1, globalSeed1, n_omega);
        rnd_shft = Wave.WaveFunctions.RandomFrequencyFunctions.randomNumberGen(localSeed, globalSeed, n_omega);
// Calculate wave parameter
        domega = Wave.WaveFunctions.SpectrumFunctions.Calculations.frequencyStepGen(omega, n_omega);
        zeta = sqrt(2*S*domega);
// Select equal energy or random frequency selection
        if frequencySelection == "equalEnergy" then
          omega_int = Wave.WaveFunctions.SpectrumFunctions.Calculations.integrationFrequencyGen(omega_min, omega_max, n_omega_int);
          S_int = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator(waveSelector = waveSelector, Hs = Hs, omega_peak = omega_peak, omega = omega_int, n_omega = n_omega_int);
          (omega, S) = Wave.WaveFunctions.EqualEnergyFrequencyFunctions.equalEnergyFrequencySelector(omega_min, omega_max, n_omega, n_omega_int, omega_int, S_int);
        elseif frequencySelection == "random" then
          omega = Wave.WaveFunctions.RandomFrequencyFunctions.randomFrequencySelector(omega_min, omega_max, rnd_shft, n_omega) "Selected frequency components [rad/s]";
          S = Wave.WaveFunctions.SpectrumFunctions.spectrumGenerator(waveSelector = waveSelector, Hs = Hs, omega_peak = omega_peak, omega = omega, n_omega = n_omega);
          omega_int = zeros(n_omega_int);
          S_int = zeros(n_omega_int);
        end if;
      end if;
      SSE = sum(zeta.*cos(omega*time - 2*pi*epsilon));
    end EnvironmentV3;
  end Experimental;

  package Morison
    function waveKin
    algorithm

    end waveKin;
  end Morison;
      //within OET
  //within OET;
  annotation(
    Icon(graphics = {Line(points = {{-90, 40}, {-60, 60}, {-30, 20}, {0, 60}, {30, 20}, {60, 60}, {90, 40}}, color = {0, 0, 200}, thickness = 2, smooth = Smooth.Bezier), Line(points = {{-90, -40}, {-60, -20}, {-30, -60}, {0, -20}, {30, -60}, {60, -20}, {90, -40}}, color = {0, 0, 200}, thickness = 2, smooth = Smooth.Bezier), Line(points = {{-90, 0}, {-60, 20}, {-30, -20}, {0, 20}, {30, -20}, {60, 20}, {90, 0}}, color = {0, 0, 200}, thickness = 2, smooth = Smooth.Bezier), Ellipse(extent = {{-20, 20}, {20, -20}}, lineColor = {0, 0, 0}, fillColor = // Black circle
    {0, 0, 0}, fillPattern = // Light gray fill
    FillPattern.Solid// Solid fill
    )}),
    Documentation(info = "<html>
    <p><strong>Hydrodynamic Package</strong></p>
    
    <p>This package contains models and components for simulating hydrodynamic systems, 
    particularly focused on Wave Energy Converters (WECs). The current implementation 
    includes a variety of models and force components across several sub-packages.</p>
    
    <p><strong>Key Sub-Packages:</strong></p>
    <ul>
        <li><strong>Example:</strong>
            <ul>
                <li><strong>SingleBodyWEC1D:</strong> A 1D single-body Wave Energy Converter model.</li>
            </ul>
        </li>
        <li><strong>Forces:</strong>
            <ul>
                <li><strong>HydrostaticForce6D:</strong> Calculates 6D hydrostatic forces and torques.</li>
                <li><strong>RadiationForce:</strong> Computes radiation forces (currently 1D, vertical direction only).</li>
                <li><strong>DragForce6D:</strong> Computes 6D drag forces and torques.</li>
                <li><strong>PTO6D:</strong> Models a 6D Power Take-Off system.</li>
                <li><strong>HydrodynamicBlock6D:</strong> Calculates and applies 6D hydrodynamic forces and moments.</li>
                <li><strong>RadiationF3D:</strong> An extended version of RadiationForce for 3D modeling.</li>
            </ul>
        </li>
        <li><strong>WaveProfile:</strong>
            <ul>
                <li><strong>RegularWave:</strong> A linear wave model.</li>
                <li><strong>IrregularWave:</strong> Includes Pierson-Moskowitz, Bretschneider, JONSWAP wave models, and various irregular parameters.</li>
            </ul>
        </li>
        <li><strong>Connector:</strong> Contains connector definitions for hydrodynamic components.</li>
        <li><strong>Internal:</strong> Contains internal utility components used across the package.</li>
        <li><strong>Archive:</strong> Contains deprecated or experimental models and components.</li>
    </ul>
    
    <p><strong>Current Capabilities:</strong></p>
    <p>The package allows for modeling of a single-body WEC with the following features:</p>
    <ul>
        <li>6D modeling of drag, PTO, and hydrostatic forces</li>
        <li>1D and 3D modeling of radiation forces</li>
        <li>External excitation force input</li>
        <li>Rigid body dynamics in 6D</li>
        <li>Wave profile modeling including regular and irregular waves</li>
    </ul>
    
    <p><strong>Limitations and Future Work:</strong></p>
    <ul>
        <li>Further extension of radiation forces to full 6D capabilities</li>
        <li>Expansion of the excitation force model to include full 6D capabilities</li>
        <li>Implementation of additional WEC configurations (e.g., multi-body systems)</li>
    </ul>
    
    <p>This package provides a foundation for hydrodynamic simulations in Modelica, 
    particularly suited for Wave Energy Converter applications. Users can leverage 
    these components to build and simulate various marine energy devices.</p>
</html>"),
    uses(Modelica(version = "4.0.0")));
end OET;
