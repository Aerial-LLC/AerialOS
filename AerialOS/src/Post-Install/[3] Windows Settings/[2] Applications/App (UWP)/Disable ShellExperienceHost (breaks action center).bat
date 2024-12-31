@echo off

taskkill /F /IM ShellExperienceHost.exe

"%windir%\NSudo.exe" -U:S -P:E cmd /c ren  "C:\Windows\SystemApps\ShellExperienceHost_cw5n1h2txyewy\ShellExperienceHost.exe" "ShellExperienceHost.exee"

exit
