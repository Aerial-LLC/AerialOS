@echo off
:: open please .bat in NSudo

Reg.exe delete "HKLM\SOFTWARE\Classes\Folder\shell\pintohome" /f

Reg.exe delete "HKCR\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f & Reg.exe delete "HKCR\exefile\shellex\ContextMenuHandlers\PintoStartScreen" /f
Reg.exe delete "HKCR\Microsoft.Website\shellex\ContextMenuHandlers\PintoStartScreen" /f & Reg.exe delete "HKCR\mscfile\shellex\ContextMenuHandlers\PintoStartScreen" /f

cd "%windir%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy"
taskkill /F /IM SearchHost.exe
takeown /f SearchHost.exe
icacls SearchHost.exe /grant Administrators:(F)
rename SearchHost.exe SearchHost.exee

taskkill /F /IM TextInputHost.exe
takeown /f TextInputHost.exe
icacls TextInputHost.exe /grant Administrators:(F)
rename TextInputHost.exe TextInputHost.exee

cd "%windir%\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy"
taskkill /F /IM StartMenuExperienceHost.exe
takeown /f StartMenuExperienceHost.exe
icacls StartMenuExperienceHost.exe /grant Administrators:(F)
rename StartMenuExperienceHost.exe StartMenuExperienceHost.exee

exit
