@echo off

REM enable quota for a drive C
fsutil quota enforce  C:

REM get initial quota details for drive C
fsutil quota query  C:

REM set quota for local user vivek on the machine
fsutil quota  modify C: 18446744073709551615 18446744073709551615 vivek

REM set quota for domain user domain_name\vivek on the machine
fsutil quota  modify C: 18446744073709551615 18446744073709551615 domain_name\vivek

REM get updated quota details for drive C
fsutil quota query  C:
