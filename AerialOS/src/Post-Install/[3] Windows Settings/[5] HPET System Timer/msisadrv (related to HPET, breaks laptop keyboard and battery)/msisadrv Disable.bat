@echo off

DevManView.exe /disable "PCI standard ISA bridge"

reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\msisadrv" /v "Start" /t REG_DWORD /d "4" /f

exit