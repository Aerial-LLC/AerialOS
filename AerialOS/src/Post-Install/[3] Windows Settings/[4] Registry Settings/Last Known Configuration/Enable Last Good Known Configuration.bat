@echo off

Reg.exe delete "HKLM\System\ControlSet001\Control\PnP" /v "DisableLKG" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ReportBootOk" /t REG_SZ /d "1" /f

exit