within OceanEngineeringToolbox.DataImport.InputRecords;

partial class BodyIndex
  "Partial class containing the user input body index to the corresponding body in the hydrodynamic data"
  parameter Integer bodyIndex = 1 "Body index corresponding to BEM results" annotation(
    Dialog(group = "Body Data"));
protected
  parameter String bodyIndexString = String(bodyIndex);
end BodyIndex;
