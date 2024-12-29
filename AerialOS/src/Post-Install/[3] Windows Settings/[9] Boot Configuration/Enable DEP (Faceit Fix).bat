@echo off

bcdedit /deletevalue nx
bcdedit /set hypervisorlaunchtype auto
devmanview.exe /enable "Trusted Platform Module 2.0"

exit