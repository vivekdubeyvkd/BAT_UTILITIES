REM run below command in admin CMD
reg add HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem /v LongPathsEnabled /t REG_DWORD /d 1 /f

REM if it does not fix the issue without reboot, then try to reboot the system, run below command for same in the admin CMD
shutdown /r
