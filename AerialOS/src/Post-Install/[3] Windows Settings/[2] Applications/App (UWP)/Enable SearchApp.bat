@echo off
:: open please .bat in NSudo

Reg.exe add "HKLM\SOFTWARE\Classes\Folder\shell\pintohome" /v "AppliesTo" /t REG_SZ /d "System.ParsingName:<>\"::{679f85cb-0220-4080-b29b-5540cc05aab6}\" AND System.ParsingName:<>\"::{645FF040-5081-101B-9F08-00AA002F954E}\" AND System.IsFolder:=System.StructuredQueryType.Boolean#True" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Folder\shell\pintohome" /v "MUIVerb" /t REG_SZ /d "@shell32.dll,-51377" /f
Reg.exe add "HKLM\SOFTWARE\Classes\Folder\shell\pintohome\command" /v "DelegateExecute" /t REG_SZ /d "{b455f46e-e4af-4035-b0a4-cf18d2f6f28e}" /f

Reg.exe add "HKCR\Folder\shellex\ContextMenuHandlers\PintoStartScreen" /ve /t REG_SZ /d "{470C0EBD-5D73-4d58-9CED-E91E22E23282}" /f & Reg.exe add "HKCR\exefile\shellex\ContextMenuHandlers\PintoStartScreen" /ve /t REG_SZ /d "{470C0EBD-5D73-4d58-9CED-E91E22E23282}" /f
Reg.exe add "HKCR\Microsoft.Website\shellex\ContextMenuHandlers\PintoStartScreen" /ve /t REG_SZ /d "{470C0EBD-5D73-4d58-9CED-E91E22E23282}" /f & Reg.exe add "HKCR\mscfile\shellex\ContextMenuHandlers\PintoStartScreen" /ve /t REG_SZ /d "{470C0EBD-5D73-4d58-9CED-E91E22E23282}" /f

cd "%windir%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy"
takeown /f SearchHost.exee
icacls SearchHost.exee /grant Administrators:(F)
rename SearchHost.exee SearchHost.exe

takeown /f TextInputHost.exee
icacls TextInputHost.exee /grant Administrators:(F)
rename TextInputHost.exee TextInputHost.exe

cd "%windir%\SystemApps\Microsoft.Windows.StartMenuExperienceHost_cw5n1h2txyewy"
takeown /f StartMenuExperienceHost.exee
icacls StartMenuExperienceHost.exee /grant Administrators:(F)
rename StartMenuExperienceHost.exee StartMenuExperienceHost.exe

exit
