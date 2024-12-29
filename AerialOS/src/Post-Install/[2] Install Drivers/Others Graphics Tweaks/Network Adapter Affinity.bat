@echo off

sc query Winmgmt | findstr "RUNNING" >nul || (echo ERROR: WMI Service is Disabled... & pause >nul & exit /b 1)

cls & echo. & echo.

set /p NumRssQueues="Enter value for NumRssQueues: "
set /p RssBaseProcNumber="Enter value for RssBaseProcNumber: "

for %%a in ("Win32_NetworkAdapter") do (
    for /f "delims=" %%b in ('wmic path %%~a get PnPDeviceID^|findstr /l "PCI\VEN_"') do (
        for /f "tokens=3" %%c in ('reg query "HKLM\SYSTEM\CurrentControlSet\Enum\%%b" /v "Driver"') do (
            for /f "tokens=1-3" %%d in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%c" /v "NetCfgInstanceId" 2^>nul') do (
                if "%%e"=="REG_SZ" (
                    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%c" /v "*NumRssQueues" /t REG_SZ /d "%NumRssQueues%" /f >nul 2>&1 && cls && echo. && echo  Successfully updated "NumRssQueues"... || cls && echo. && echo  Error updating "NumRssQueues"...
                    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\%%c" /v "*RssBaseProcNumber" /t REG_SZ /d "%RssBaseProcNumber%" /f >nul 2>&1 && echo  Successfully updated "RssBaseProcNumber"... || echo  Error updating "RssBaseProcNumber"...
                )
            )
        )
    )
)

timeout 3 >nul & exit