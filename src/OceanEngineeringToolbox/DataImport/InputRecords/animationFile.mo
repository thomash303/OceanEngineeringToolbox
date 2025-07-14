within OceanEngineeringToolbox.DataImport.InputRecords;

partial class animationFile
  "Partial class containing the user input file path to the geometry data"
  
  // Importing from the MSL
  import Modelica.Mechanics.MultiBody.Types;
  
  parameter Boolean animationEnable "Parameter to enable the body's animation" annotation(
    Dialog(group = "Animation Data"));
  parameter String geometryFile "Path to the geometry (.stl) file. Note: the file path must be prefaced by (file://)" annotation(
    Dialog(group = "Animation Data"));
  parameter Types.Color bodyColour "Colour of animated body" annotation(
    Dialog(group = "Animation Data"));

end animationFile;
