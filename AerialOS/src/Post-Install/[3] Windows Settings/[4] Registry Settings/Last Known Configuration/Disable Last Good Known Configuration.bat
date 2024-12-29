@echo off

Reg.exe add "HKLM\System\ControlSet001\Control\PnP" /v "DisableLKG" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "ReportBootOk" /t REG_SZ /d "0" /f

exit