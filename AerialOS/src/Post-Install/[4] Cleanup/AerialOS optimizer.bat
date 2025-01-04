@echo off & SetLocal EnableDelayedExpansion & color A & title AerialOS Optimizer... & mode con: cols=90 lines=20

:: Developer - @e1uen_
:: You are not allowed to claim copyright. 
:: https://reddit.com/user/e1uen
:: https://dsc.gg/aerialos

cd /d C:\Windows >nul & del /f *.log System32\*.log SysWOW64\*.log >nul

for %%i in ("%temp%" "%windir%\CbsTemp" "%windir%\Temp" "%windir%\SoftwareDistribution" "%windir%\Prefetch" "%SystemRoot%\System32\LogFiles" "%SystemRoot%\System32\sru" "%localappdata%\Microsoft\Windows\INetCache\IE\*") do (
  rd /s /q "%%i" >nul
  mkdir "%%i" >nul
)

exit
