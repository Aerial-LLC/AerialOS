@echo off

bcdedit /set {current} safeboot minimal
shutdown /r /f /t 5 /c "System will boot into safe mode in 5 seconds..."

exit