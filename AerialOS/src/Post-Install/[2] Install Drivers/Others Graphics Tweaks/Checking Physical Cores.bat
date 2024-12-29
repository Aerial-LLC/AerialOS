
@echo off & setlocal EnableDelayedExpansion

for /F "tokens=* skip=1" %%a in ('wmic cpu get NumberOfCores ^| findstr "."') do set /a CORES=%%a

set "HT=Disable"
if %NUMBER_OF_PROCESSORS% GTR %CORES% set "HT=Enable"

echo   Hyper-Threading %HT%:
set /a CORES=%NUMBER_OF_PROCESSORS% - 1
echo. & set "output=     "

if "%HT%"=="Enable" (
    for /L %%a in (0,2,%CORES%) do set "output=!output! %%a"
) else (
    for /L %%a in (0,1,%CORES%) do set "output=!output! %%a"
)

echo %output:~1%

echo. & echo   Press any key to exit. & pause >nul