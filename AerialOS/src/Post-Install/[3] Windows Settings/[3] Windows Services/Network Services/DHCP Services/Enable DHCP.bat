@echo off

sc config DHCP start= auto
sc start DHCP

exit