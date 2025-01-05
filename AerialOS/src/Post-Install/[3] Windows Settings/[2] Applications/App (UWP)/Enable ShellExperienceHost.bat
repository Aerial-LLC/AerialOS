@echo off
:: open please .bat in NSudo

cd "%windir%\SystemApps\ShellExperienceHost_cw5n1h2txyewy"
takeown /f ShellExperienceHost.exee
icacls ShellExperienceHost.exee /grant Administrators:(F)
rename ShellExperienceHost.exee ShellExperienceHost.exe

exit
