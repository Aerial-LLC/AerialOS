@echo off

echo. & sc query Winmgmt | findstr "RUNNING" >nul || (
    echo error: WMI Service is Disabled...
    pause >nul & exit /b 1
)

for %%a in (" Win32_VideoController" " Win32_NetworkAdapter") do (
    for /f "delims=" %%b in ('wmic path %%~a get PnPDeviceID^|findstr /l "PCI\VEN_"') do (
        for /f "tokens=3" %%c in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\%%b" /v "Driver"') do echo %%~a : %%c
    )
    echo.
)

pause >nul