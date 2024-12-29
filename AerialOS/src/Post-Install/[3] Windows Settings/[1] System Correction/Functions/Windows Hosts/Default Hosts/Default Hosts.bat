@echo off

copy /y "%cd%\Default Hosts" "%windir%\System32\drivers\etc\hosts"

exit