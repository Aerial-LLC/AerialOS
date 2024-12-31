@echo off

taskkill /f /im smartscreen.exe >nul
"%windir%\NSudo.exe" -U:S -P:E cmd /c ren "%windir%\System32\smartscreen.exee" "smartscreen.exe"

exit
