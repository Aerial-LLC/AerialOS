@echo off

Reg.exe delete "HKLM\System\ControlSet001\Control\Session Manager\Memory Management" /v "MoveImages" /f

exit