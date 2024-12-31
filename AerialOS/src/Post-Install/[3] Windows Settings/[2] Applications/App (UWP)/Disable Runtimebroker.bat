@echo off

taskkill /F /IM Runtimebroker.exe

"%windir%\NSudo.exe" -U:S -P:E cmd /c ren "C:\Windows\System32\Runtimebroker.exe" "Runtimebroker.exee"

exit
