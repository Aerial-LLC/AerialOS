@echo off

cd "%windir%\system32"
taskkill /f /im smartscreen.exe
takeown /f smartscreen.exe
icacls smartscreen.exe /grant Administrators:(F)
rename smartscreen.exe smartscreen.exee

exit
