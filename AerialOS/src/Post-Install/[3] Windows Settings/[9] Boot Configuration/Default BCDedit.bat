@echo off

bcdedit /timeout 30
bcdedit /set bootmenupolicy standard
bcdedit /set allowedinmemorysettings 0x15000075
bcdedit /deletevalue vsmlaunchtype
bcdedit /deletevalue forcefipscrypto
bcdedit /deletevalue tpmbootentropy
bcdedit /deletevalue debug
bcdedit /deletevalue usefirmwarepcisettings
bcdedit /deletevalue quietboot
bcdedit /deletevalue x2apicpolicy
bcdedit /deletevalue ems
bcdedit /deletevalue vm
bcdedit /deletevalue vmslaunchtype
bcdedit /deletevalue bootems
bcdedit /deletevalue perfmem
bcdedit /deletevalue configflags
bcdedit /deletevalue integrityservices
bcdedit /deletevalue bootux
bcdedit /set hypervisorlaunchtype auto
bcdedit /set nx OptIn
bcdedit /deletevalue bootlog
bcdedit /deletevalue event
bcdedit /deletevalue bootdebug
bcdedit /deletevalue linearaddress57
bcdedit /deletevalue firstmegabytepolicy
bcdedit /deletevalue disableelamdrivers
bcdedit /set recoveryenabled Yes

exit