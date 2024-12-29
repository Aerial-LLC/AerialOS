@echo off

copy /y "%cd%\Custom Hosts" "%windir%\System32\drivers\etc\hosts"

exit