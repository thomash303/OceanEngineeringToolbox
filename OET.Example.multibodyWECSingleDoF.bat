@echo off
SET PATH=C:/Program Files/OpenModelica1.24.3-64bit/bin/;C:/Program Files/OpenModelica1.24.3-64bit/lib//omc;C:/Program Files/OpenModelica1.24.3-64bit/lib/;C:/Users/thogan1/AppData/Roaming/.openmodelica/binaries/Modelica;C:/Users/thogan1/AppData/Roaming/.openmodelica/libraries/Modelica 4.0.0+maint.om/Resources/Library/ucrt64;C:/Users/thogan1/AppData/Roaming/.openmodelica/libraries/Modelica 4.0.0+maint.om/Resources/Library/win64;C:/Users/thogan1/AppData/Roaming/.openmodelica/libraries/Modelica 4.0.0+maint.om/Resources/Library;C:/Program Files/OpenModelica1.24.3-64bit/bin/;%PATH%;
SET ERRORLEVEL=
CALL "%CD%/OET.Example.multibodyWECSingleDoF.exe" %*
SET RESULT=%ERRORLEVEL%

EXIT /b %RESULT%
