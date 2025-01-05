@echo off

powershell -command "(New-Object System.Net.WebClient).DownloadFile('https://download.sysinternals.com/files/ProcessExplorer.zip', '%temp%\ProcessExplorer.zip')" >nul
powershell Expand-Archive -Path "%temp%\ProcessExplorer.zip" -DestinationPath "%temp%" >nul

move /y "%temp%\procexp64.exe" "%windir%" >nul
del /s /q "%Temp%\ProcessExplorer.zip" >nul & del /s /q "%Temp%\procexp.exe" >nul & del /s /q "%Temp%\procexp64a.exe" >nul

Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe" /v "Debugger" /t REG_SZ /d "\"C:\WINDOWS\PROCEXP64.EXE\"" /f >nul

Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "EulaAccepted" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "Windowplacement" /t REG_BINARY /d "2c0000000200000003000000ffffffffffffffffffffffffffffffff75030000110000009506000069020000" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "FindWindowplacement" /t REG_BINARY /d "2c00000000000000000000000000000000000000000000000000000096000000960000000000000000000000" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "SysinfoWindowplacement" /t REG_BINARY /d "2c00000000000000010000000000000000000000ffffffffffffffff28000000280000002c03000042020000" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "PropWindowplacement" /t REG_BINARY /d "2c00000000000000000000000000000000000000000000000000000028000000280000000000000000000000" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "DllPropWindowplacement" /t REG_BINARY /d "2c00000000000000010000000000000000000000ffffffffffffffff2800000028000000e70100009f020000" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "UnicodeFont" /t REG_BINARY /d "080000000000000000000000000000009001000000000000000000004d00530020005300680065006c006c00200044006c00670000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "Divider" /t REG_BINARY /d "3d0ad7a3703dea3f" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "SavedDivider" /t REG_BINARY /d "3d0ad7a3703dea3f" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ProcessImageColumnWidth" /t REG_DWORD /d "261" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowUnnamedHandles" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowDllView" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HandleSortColumn" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HandleSortDirection" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "DllSortColumn" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "DllSortDirection" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ProcessSortColumn" /t REG_DWORD /d "4294967295" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ProcessSortDirection" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HighlightServices" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HighlightOwnProcesses" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HighlightRelocatedDlls" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HighlightJobs" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HighlightNewProc" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HighlightDelProc" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HighlightImmersive" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HighlightProtected" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HighlightPacked" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HighlightNetProcess" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HighlightSuspend" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HighlightDuration" /t REG_DWORD /d "1000" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowCpuFractions" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowLowerpane" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowAllUsers" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowProcessTree" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "SymbolWarningShown" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HideWhenMinimized" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "AlwaysOntop" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "OneInstance" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "NumColumnSets" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ConfirmKill" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "RefreshRate" /t REG_DWORD /d "5000" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "PrcessColumnCount" /t REG_DWORD /d "18" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "DllColumnCount" /t REG_DWORD /d "5" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "HandleColumnCount" /t REG_DWORD /d "2" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "DefaultProcPropPage" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "DefaultSysInfoPage" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "DefaultDllPropPage" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "DbgHelpPath" /t REG_SZ /d "C:\Windows\SYSTEM32\dbghelp.dll" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "SymbolPath" /t REG_SZ /d "" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorPacked" /t REG_DWORD /d "16711808" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorPackedDark" /t REG_DWORD /d "3604508" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorImmersive" /t REG_DWORD /d "15395328" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorImmersiveDark" /t REG_DWORD /d "3355392" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorOwn" /t REG_DWORD /d "16765136" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorOwnDark" /t REG_DWORD /d "6553600" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorServices" /t REG_DWORD /d "13684991" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorServicesDark" /t REG_DWORD /d "100" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorRelocatedDlls" /t REG_DWORD /d "10551295" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorRelocatedDllsDark" /t REG_DWORD /d "22873" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorGraphBk" /t REG_DWORD /d "15790320" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorGraphBkDark" /t REG_DWORD /d "3421236" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorJobs" /t REG_DWORD /d "27856" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorJobsDark" /t REG_DWORD /d "5933" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorDelProc" /t REG_DWORD /d "4605695" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorDelProcDark" /t REG_DWORD /d "70" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorNewProc" /t REG_DWORD /d "4652870" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorNewProcDark" /t REG_DWORD /d "17920" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorNet" /t REG_DWORD /d "10551295" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorNetDark" /t REG_DWORD /d "22873" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorProtected" /t REG_DWORD /d "8388863" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorProtectedDark" /t REG_DWORD /d "1835063" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowHeatmaps" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorSuspend" /t REG_DWORD /d "8421504" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ColorSuspendDark" /t REG_DWORD /d "1776411" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "StatusBarColumns" /t REG_DWORD /d "13589" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowAllCpus" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowAllGpus" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "Opacity" /t REG_DWORD /d "100" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "GpuNodeUsageMask" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "GpuNodeUsageMask1" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "VerifySignatures" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "VirusTotalCheck" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "VirusTotalSubmitUnknown" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ToolbarBands" /t REG_BINARY /d "4b00000001000000000000004b00000002000000000000004b00000003000000000000004b0000000400000000000000400000000500000000000000500000000600000000000000930400000700000000000000000000000800000000000000ffffffff0000000000000000" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowNewProcesses" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "TrayCPUHistory" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowIoTray" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowNetTray" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowDiskTray" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowPhysTray" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowCommitTray" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ShowGpuTray" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "FormatIoBytes" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "StackWindowPlacement" /t REG_BINARY /d "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "ETWstandardUserWarning" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "Theme" /t REG_SZ /d "" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer" /v "UseGoogle" /t REG_DWORD /d "0" /f >nul

Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\DllColumnMap" /v "0" /t REG_DWORD /d "26" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\DllColumnMap" /v "1" /t REG_DWORD /d "42" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\DllColumnMap" /v "2" /t REG_DWORD /d "1033" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\DllColumnMap" /v "3" /t REG_DWORD /d "1111" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\DllColumnMap" /v "4" /t REG_DWORD /d "1670" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\DllColumns" /v "0" /t REG_DWORD /d "110" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\DllColumns" /v "1" /t REG_DWORD /d "180" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\DllColumns" /v "2" /t REG_DWORD /d "140" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\DllColumns" /v "3" /t REG_DWORD /d "300" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\DllColumns" /v "4" /t REG_DWORD /d "100" /f >nul

Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\HandleColumnMap" /v "0" /t REG_DWORD /d "21" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\HandleColumnMap" /v "1" /t REG_DWORD /d "22" /f >nul

Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\HandleColumns" /v "0" /t REG_DWORD /d "100" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\HandleColumns" /v "1" /t REG_DWORD /d "450" /f >nul

Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "0" /t REG_DWORD /d "3" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "1" /t REG_DWORD /d "1055" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "2" /t REG_DWORD /d "1650" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "3" /t REG_DWORD /d "1200" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "4" /t REG_DWORD /d "1092" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "5" /t REG_DWORD /d "1333" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "6" /t REG_DWORD /d "1622" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "7" /t REG_DWORD /d "1636" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "8" /t REG_DWORD /d "1179" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "9" /t REG_DWORD /d "1340" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "10" /t REG_DWORD /d "5" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "11" /t REG_DWORD /d "1339" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "12" /t REG_DWORD /d "1060" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "13" /t REG_DWORD /d "1063" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "14" /t REG_DWORD /d "4" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "15" /t REG_DWORD /d "1065" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "16" /t REG_DWORD /d "18" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "17" /t REG_DWORD /d "1670" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "18" /t REG_DWORD /d "1653" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumnMap" /v "19" /t REG_DWORD /d "1653" /f >nul

Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "0" /t REG_DWORD /d "261" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "1" /t REG_DWORD /d "35" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "2" /t REG_DWORD /d "37" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "3" /t REG_DWORD /d "82" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "4" /t REG_DWORD /d "81" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "5" /t REG_DWORD /d "65" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "6" /t REG_DWORD /d "93" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "7" /t REG_DWORD /d "76" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "8" /t REG_DWORD /d "55" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "9" /t REG_DWORD /d "60" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "10" /t REG_DWORD /d "39" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "11" /t REG_DWORD /d "80" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "12" /t REG_DWORD /d "70" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "13" /t REG_DWORD /d "70" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "14" /t REG_DWORD /d "31" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "15" /t REG_DWORD /d "52" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "16" /t REG_DWORD /d "52" /f >nul
Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\ProcessColumns" /v "17" /t REG_DWORD /d "44" /f >nul

Reg.exe add "HKCU\SOFTWARE\Sysinternals\Process Explorer\VirusTotal" /v "VirusTotalTermsAccepted" /t REG_DWORD /d "1" /f >nul

%windir%"/procexp64.exe

exit
