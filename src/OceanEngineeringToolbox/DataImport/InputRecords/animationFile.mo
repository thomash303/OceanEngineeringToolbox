within OceanEngineeringToolbox.DataImport.InputRecords;

partial class animationFile
  "Partial class containing the user input file path to the geometry data"
  /* Due to how the parameters are read in fixed-shape, the parameters cannot be concatenated. Thus load resource cannot be used, instead the fill path, including (file://) must be manually defined*/
  
  // Importing from the MSL
  import Modelica.Mechanics.MultiBody.Types;
  import Modelica.Utilities.Files.loadResource;
  
  parameter Boolean animationEnable "Parameter to enable the body's animation" annotation(
    Dialog(group = "Animation Data"));
  parameter String geometryFile "Path to the geometry (.stl) file. Note: the file path must be prefaced by (file://)" annotation(
    Dialog(group = "Animation Data"));
  parameter Types.Color bodyColour "Colour of animated body" annotation(
    Dialog(group = "Animation Data"));
      
 annotation(
    Dialog(group = "Animation Data", enable = animationEnable));

end animationFile;
