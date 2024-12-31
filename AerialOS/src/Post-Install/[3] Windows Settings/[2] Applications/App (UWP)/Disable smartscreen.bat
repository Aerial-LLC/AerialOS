@echo off

taskkill /f /im smartscreen.exe >nul
"%windir%\NSudo.exe" -U:S -P:E cmd /c ren "%windir%\System32\smartscreen.exe" "smartscreen.exee"

exit
