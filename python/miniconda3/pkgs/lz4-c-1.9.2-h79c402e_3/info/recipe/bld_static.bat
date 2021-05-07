:: Build
set PLATFORM=x64
set CONFIGURATION=Release
set VSPROJ_DIR=%SRC_DIR%\visual\VS2017
set BUILD_DIR=%VSPROJ_DIR%\bin\%PLATFORM%_%CONFIGURATION%
COPY %BUILD_DIR%\liblz4_static.lib %LIBRARY_LIB%
if errorlevel 1 exit 1

