@echo off

bcdedit /deletevalue {current} safeboot
bcdedit /deletevalue {current} safebootalternateshell
shutdown /r /f /t 5 /c "System will boot into safe mode in 5 seconds..."

exit