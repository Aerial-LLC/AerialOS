@echo off
:: open please .bat in NSudo

cd "%windir%\system32"
taskkill /F /IM Runtimebroker.exe
takeown /f Runtimebroker.exe
icacls Runtimebroker.exe /grant Administrators:(F)
rename Runtimebroker.exe Runtimebroker.exee

exit
