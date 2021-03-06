@ECHO OFF
REM ---------------------------------------------------------------------------------------

REM Script to setup the environment for building Roam with QGIS 2.x.
REM This script sets the base folder that is used though out the build process
REM and sets the location to Python.

REM Change %OSGEO4W_ROOT% in setenv.bat to change in the location of QGIS.

REM ---------------------------------------------------------------------------------------


for %%x in (%cmdcmdline%) do if /i "%%~x"=="/c" set DOUBLECLICKED=1

REM Change OSGeo4W_ROOT to point to your install of QGIS.


IF "%1"=="2.16" CALL %~dp0env-2.16.bat
IF "%1"=="2.18" CALL %~dp0env-2.18.bat

IF NOT DEFINED OSGEO4W_ROOT SET OSGEO4W_ROOT=C:\OSGeo4W
IF NOT DEFINED QGISNAME SET QGISNAME=qgis
ECHO Setup environment for
ECHO ROOT: %OSGEO4W_ROOT%
ECHO QGIS: %QGISNAME%
SET QGIS=%OSGEO4W_ROOT%\apps\%QGISNAME%
set QGIS_PREFIX_PATH=%QGIS%

CALL "%OSGEO4W_ROOT%\bin\o4w_env.bat"

: Python Setup
set PATH=%OSGEO4W_ROOT%\bin;%QGIS%\bin;%~dp0\..\src\;C:\Program Files (x86)\Git\bin;%PATH%;
SET PYTHONHOME=%OSGEO4W_ROOT%\apps\Python27
set PYTHONPATH=%~dp0\..\src;%QGIS%\python;%PYTHONPATH%

ECHO OSGeo path is: %OSGEO4W_ROOT%
ECHO Getting QGIS libs from: %QGIS%
ECHO Python loaded from: %PYTHONHOME%
