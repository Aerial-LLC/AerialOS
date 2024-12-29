@echo off

set /p "user_input=Enter Number (5000, 5080, 6000 etc.) or enter "X" to return to the default values: "

if /i "%user_input%"=="X" (
    taskkill /im SetTimerResolution.exe /f >nul 2>&1
    reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SetTimerResolution" /f >nul 2>&1
    if exist "%windir%\SetTimerResolution.exe" (
    move /y "%windir%\SetTimerResolution.exe" "%USERPROFILE%\Desktop\Post-Install\[3] Windows Settings\[5] HPET System Timer\TimerResolution" >nul 2>&1
    )
) else (
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "SetTimerResolution" /t REG_SZ /d "%windir%\SetTimerResolution.exe --resolution %user_input% --no-console" /f >nul 2>&1
    if not exist "%windir%\SetTimerResolution.exe" (
    move /y "%USERPROFILE%\Desktop\Post-Install\[3] Windows Settings\[5] HPET System Timer\TimerResolution\SetTimerResolution.exe" "%windir%" >nul 2>&1
    )
    start "" "%windir%\SetTimerResolution.exe" --resolution %user_input% --no-console >nul 2>&1
)

exit