@echo off
:: open please .bat in NSudo

cd "%windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy"
taskkill /F /IM ShellExperienceHost.exe
takeown /f ShellExperienceHost.exe
icacls ShellExperienceHost.exe /grant Administrators:(F)
rename ShellExperienceHost.exe ShellExperienceHost.exee

exit
