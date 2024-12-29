@echo off

DevManView.exe /enable "PCI standard ISA bridge"

reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\msisadrv" /v "Start" /t REG_DWORD /d "0" /f

exit