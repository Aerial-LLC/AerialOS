@echo off

Reg.exe delete "HKLM\SOFTWARE\Classes\Folder\shell\pintohome" /f

Reg.exe delete "HKCR\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /f & Reg.exe delete "HKCR\exefile\shellex\ContextMenuHandlers\PintoStartScreen" /f
Reg.exe delete "HKCR\Microsoft.Website\shellex\ContextMenuHandlers\PintoStartScreen" /f & Reg.exe delete "HKCR\mscfile\shellex\ContextMenuHandlers\PintoStartScreen" /f

taskkill /F /IM SearchApp.exe & taskkill /F /IM TextInputHost.exe & taskkill /F /IM StartMenuExperienceHost.exe

"%windir%\NSudo.exe" -U:S -P:E cmd /c ren "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe" "SearchHost.exee" & "%windir%\NSudo.exe" -U:S -P:E cmd /c ren "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe" "TextInputHost.exee" & "%windir%\NSudo.exe" -U:S -P:E cmd /c ren "C:\Windows\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy\StartMenuExperienceHost.exe" "StartMenuExperienceHost.exee"

exit
