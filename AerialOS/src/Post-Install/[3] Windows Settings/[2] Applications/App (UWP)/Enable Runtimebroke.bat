@echo off
:: open please .bat in NSudo

cd "%windir%\system32"
takeown /f Runtimebroker.exee
icacls Runtimebroker.exee /grant Administrators:(F)
rename Runtimebroker.exee Runtimebroker.exe

exit
