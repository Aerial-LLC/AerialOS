@echo off

chcp 65001

set "google_dns=8.8.8.8"

netsh interface ip set dns "Ethernet" static %google_dns% primary
netsh interface ip add dns "Ethernet" 8.8.4.4

for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /c:"IPv4" /c:"Subnet Mask" /c:"Default Gateway"') do (
    if not defined ip (
        set "ip=%%a"
    ) else if not defined mask (
        set "mask=%%a"
    ) else (
        set "gateway=%%a"
    )
)

netsh interface ipv4 set address name="Ethernet" static %ip: =% %mask: =% %gateway: =% 1

ncpa.cpl

exit