@echo off

devmanview.exe /enable "PCI Data Acquisition and Signal Processing Controller"
devmanview.exe /enable "PCI Encryption/Decryption Controller"
devmanview.exe /enable "PCI Simple Communications Controller"
devmanview.exe /enable "PCI Memory Controller"
devmanview.exe /enable "PCI standard RAM Controller"
devmanview.exe /enable "Communications Port (COM1)"
devmanview.exe /enable "AURA LED Controller"
devmanview.exe /enable "Intel SMBus"
devmanview.exe /enable "AMD PSP"
devmanview.exe /enable "AMD SMBus"
devmanview.exe /enable "Micosoft GS Wavetable Synth"
devmanview.exe /enable "Microsoft Hyper-V Virtualization Infrastructure Driver"
devmanview.exe /enable "Microsoft Virtual Drive Enumerator Driver"
devmanview.exe /enable "Enumerator of virtual network adapters NIC"
devmanview.exe /enable "Remote Desktop Device Redirector Bus"
devmanview.exe /enable "Base System Device"
devmanview.exe /enable "Legacy device"
devmanview.exe /enable "Performance Monitor"
devmanview.exe /enable "Microsoft Kernel Debug Network Adapter"
devmanview.exe /enable "SM Bus Controller"
devmanview.exe /enable "System Speaker"
devmanview.exe /enable "Microsoft Radio Device Enumeration Bus"
devmanview.exe /enable "Direct memory access controller"
devmanview.exe /enable "Programmable Interrupt Controller"
devmanview.exe /enable "Microsoft RRAS Root Enumerator"
devmanview.exe /enable "Microsoft Device Association Root Enumerator"

start devmgmt.msc

exit