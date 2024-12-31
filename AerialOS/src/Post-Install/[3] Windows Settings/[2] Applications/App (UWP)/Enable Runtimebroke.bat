@echo off

taskkill /F /IM Runtimebroker.exe

"%windir%\NSudo.exe" -U:S -P:E cmd /c ren "%windir%\System32\smartscreen.exee" "smartscreen.exe"

exit
