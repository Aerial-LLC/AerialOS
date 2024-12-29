@echo off

sc config Wcmsvc start= disabled >nul 2>&1 & sc stop Wcmsvc >nul 2>&1

exit