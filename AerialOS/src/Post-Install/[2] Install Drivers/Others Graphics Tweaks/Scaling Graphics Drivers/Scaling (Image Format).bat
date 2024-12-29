@echo off

for %%a in (Scaling) do for /f "delims=" %%b in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /s /f "%%a" ^| findstr "HKEY"') do reg.exe add "%%b" /v "%%a" /t REG_DWORD /d "4" /f >nul 2>&1

exit