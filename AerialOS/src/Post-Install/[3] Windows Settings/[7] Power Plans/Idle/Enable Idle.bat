@echo off

powercfg /setacvalueindex scheme_current sub_processor 00000000-16f6-45a6-9fcf-0fa130b83c01 0 && powercfg /setactive scheme_current

exit