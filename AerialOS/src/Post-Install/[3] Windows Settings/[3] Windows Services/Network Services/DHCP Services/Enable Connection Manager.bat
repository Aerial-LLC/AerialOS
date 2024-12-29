@echo off

sc config Wcmsvc start= auto
sc start Wcmsvc

exit