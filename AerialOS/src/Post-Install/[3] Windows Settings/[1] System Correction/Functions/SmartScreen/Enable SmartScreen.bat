@echo off

cd "%windir%\system32"
takeown /f smartscreen.exee
icacls smartscreen.exee /grant Administrators:(F)
rename smartscreen.exee smartscreen.exe

exit
