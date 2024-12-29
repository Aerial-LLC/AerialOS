@echo off

xcopy /s /e /i /y /q "RW" "%windir%\RW\"
xcopy /y /q "XHCI IMOD Interval.lnk" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\"

exit