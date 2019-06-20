for /f "delims=" %%a in ('command') do set VARNAME=%%a
for /f "delims=" %%a in ('command1 ^| command2') do set VARNAME2=%%a
