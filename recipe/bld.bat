set SRCDIR=%CD%\src

@REM A few (silent) sanity checks that variables are set and meaningful:
if exist %PREFIX%\ echo %PREFIX% is in place
@rem if %errorlevel% neq 0 exit /b %errorlevel% 
if exist %SRCDIR%\ echo %SRCDIR% is in place
@rem if %errorlevel% neq 0 exit /b %errorlevel% 
if exist %SRCDIR%\CMakeLists.txt echo CMakeLists.txt is in place
@rem if %errorlevel% neq 0 exit /b %errorlevel% 

verify other 2> nul
setlocal eneableextensions
if errorlevel 1 echo Unable to enable extensions 
@rem if %errorlevel% neq 0 exit /b %errorlevel% 
if defined PKG_VERSION echo version %PGK_VERSION% 
@rem if %errorlevel% neq 0 exit /b %errorlevel% 
endlocal

mkdir %CD%\build_cif2hkl
set BLDDIR=%CD%\build_cif2hkl

cd %BLDDIR%

cmake ^
    -DCMAKE_INSTALL_PREFIX=%PREFIX% ^
    -S %SRCDIR% ^
    -DCMAKE_INSTALL_LIBDIR=lib ^
    -DCMAKE_BUILD_TYPE=Release ^
    %CMAKE_ARGS%

cmake --build . --config Release
cmake --build . --target install --config Release
