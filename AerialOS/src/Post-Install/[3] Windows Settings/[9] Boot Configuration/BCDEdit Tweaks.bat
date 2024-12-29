:: @echo off

:: Set the time to wait for the system to be selected for booting
:: Choose 30 if you have more than one OS
bcdedit /timeout 0

:: Disable the Windows logo at boot time
bcdedit /set {globalsettings} custom16000067 true

:: Disabling messages during download
bcdedit /set {globalsettings} custom16000068 true

:: Disabling animated circle at boot time
bcdedit /set {globalsettings} custom16000069 true

:: Specifies the type of boot menu the system will use. For Windows 10 / Windows 8.1 / Windows 8 / Windows 8 / Windows RT, the default is set to Standard. For Windows Server 2012 R2 / Windows Server 2012, the default is Legacy
:: If Legacy is set, the "Advanced Options" menu (F8) is available
bcdedit /set bootmenupolicy legacy

:: This parameter sets the allowed settings in memory. It can be used to control memory access to the operating system
bcdedit /set allowedinmemorysettings 0

:: Controls the type of virtual secure mode startup
bcdedit /set vsmlaunchtype Off

:: Disable FIPS cryptography
bcdedit /set forcefipscrypto No

:: Forces the bootloader to select a specific TPM Boot Entropy policy and pass it to the kernel
bcdedit /set tpmbootentropy ForceDisable

:: Disables kernel debugger (breaks WinDbg)
bcdedit /set debug No

:: If set to "yes", PCI LOCK is checked in msconfig. Not recommended (leave as default)
:: Enables or disables BIOS configured peripheral component interconnect (PCI) resources
:: Stops Windows dynamically assigning IO/IRQ resources to PCI devices and leaves BIOS configured devices
bcdedit /deletevalue usefirmwarepcisettings

:: Controls the display of a high-resolution bitmap image instead of displaying and animating the Windows boot screen
bcdedit /set quietboot Yes

:: Enables the use of advanced APIC mode, if supported. The system defaults to using advanced APIC mode if it is available
bcdedit /set x2apicpolicy enable

:: Disable Emergency Management Services (EMS) to indicate operating system booting
bcdedit /set ems No

:: Disable system virtualization
bcdedit /set vm No
bcdedit /set vmslaunchtype Off

:: Emergency Management Services (EMS) provides a serial console interface with RS-232 access to the bootloader menu in modern versions of Microsoft Windows
::EMS allows users to remotely manage certain server components even if the server is not connected to a network or other standard remote administration tools
bcdedit /set bootems No

:: The size of the buffer allocated for logging performance data
:: This option acts similarly to the removememory item in that it prevents Windows from treating the specified size as available memory
bcdedit /set perfmem 0

:: Specifies the configuration flags related to the processor
bcdedit /set configflags 0

:: Enables or disables code integrity services that are used for code signing in kernel mode. The default is enabled.
:: If I understand this correctly, you will not need to enter nointegritychecks when setting this option. Disabling services is better than just not allowing them to run.
bcdedit /set integrityservices disable

:: Defines the boot graphics that the user will see. Disabled means that no graphics will be seen during boot (only a black screen).
bcdedit /set bootux Disabled

:: Enables hypervisor booting on a Hyper-V system or forcibly disables it.
bcdedit /set hypervisorlaunchtype Off

:: Configures Data Execution Protection (DEP), a set of hardware and software technologies designed to prevent malicious code from running in protected memory locations.
bcdedit /set nx AlwaysOff

:: Disables the system initialization log. This log is stored in the Ntbtlog.txt file in the %WINDIR% directory. 
:: It contains a list of loaded and unloaded drivers in text format.
bcdedit /set bootlog no

:: Disabling remote event logging for the current Windows operating system boot item
bcdedit /event off

:: Disables boot debugging, it is enabled by default.
bcdedit /bootdebug off

:: Specifies how the first megabyte of memory will be used
:: FirstMegabytePolicyUseNone (0) Do not use the first megabyte of memory.
:: FirstMegabytePolicyUseAll (1) Use the entire first megabyte of memory.
:: FirstMegabytePolicyUsePrivate (2) Reserved for future use.
:: bcdedit /set firstmegabytepolicy UseAll

:: Controls driver downloads from "unsafe sources"
bcdedit /set disableelamdrivers Yes

:: Disable recovery options for frequent system reboots
bcdedit /set recoveryenabled no

exit