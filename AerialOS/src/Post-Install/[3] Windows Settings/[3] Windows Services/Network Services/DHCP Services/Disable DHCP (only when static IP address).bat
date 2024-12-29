@echo off

sc config DHCP start= disabled >nul 2>&1 & sc stop DHCP >nul 2>&1

exit