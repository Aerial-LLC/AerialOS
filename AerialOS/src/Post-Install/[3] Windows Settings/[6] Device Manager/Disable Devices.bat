@echo off

devmanview.exe /disable "PCI Data Acquisition and Signal Processing Controller"
devmanview.exe /disable "PCI Encryption/Decryption Controller"
devmanview.exe /disable "PCI Simple Communications Controller"
devmanview.exe /disable "PCI Memory Controller"
devmanview.exe /disable "PCI standard RAM Controller"
devmanview.exe /disable "Communications Port (COM1)"
devmanview.exe /disable "AURA LED Controller"
devmanview.exe /disable "Intel SMBus"
devmanview.exe /disable "AMD PSP"
devmanview.exe /disable "AMD SMBus"
devmanview.exe /disable "Micosoft GS Wavetable Synth"
devmanview.exe /disable "Microsoft Hyper-V Virtualization Infrastructure Driver"
devmanview.exe /disable "Microsoft Virtual Drive Enumerator Driver"
devmanview.exe /disable "Enumerator of virtual network adapters NIC"
devmanview.exe /disable "Remote Desktop Device Redirector Bus"
devmanview.exe /disable "Base System Device"
devmanview.exe /disable "Legacy device"
devmanview.exe /disable "Performance Monitor"
devmanview.exe /disable "Microsoft Kernel Debug Network Adapter"
devmanview.exe /disable "SM Bus Controller"
devmanview.exe /disable "System Speaker"
devmanview.exe /disable "Microsoft Radio Device Enumeration Bus"
devmanview.exe /disable "Direct memory access controller"
devmanview.exe /disable "Programmable Interrupt Controller"
devmanview.exe /disable "Microsoft RRAS Root Enumerator"
devmanview.exe /disable "Microsoft Device Association Root Enumerator"

start devmgmt.msc

exit