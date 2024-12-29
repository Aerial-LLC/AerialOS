@echo off

bcdedit /deletevalue useplatformclock >nul 2>&1
bcdedit /set useplatformtick yes >nul 2>&1
bcdedit /set disabledynamictick yes >nul 2>&1

DevManView.exe /disable "System Timer" >nul 2>&1
DevManView.exe /disable "High precision event timer" >nul 2>&1

exit