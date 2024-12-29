@echo off

bcdedit /deletevalue useplatformclock
bcdedit /deletevalue useplatformtick
bcdedit /deletevalue disabledynamictick

DevManView.exe /enable "System Timer" >nul 2>&1
DevManView.exe /enable "High precision event timer" >nul 2>&1

exit