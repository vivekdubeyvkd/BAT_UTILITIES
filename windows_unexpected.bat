REM ****
REM while setting PATH env variable as given below 
REM set PATH=C:\Windows\Microsoft.NET\Framework64\v4.0.30319;C:\Windows\Microsoft.NET\Framework\v4.0.30319;%PATH%
REM Script gives error saying \Windows was unexpected at this time.
REM ****
REM set PATH env variable as shown below to fix this issue

set "PATH=C:\Windows\\Microsoft.NET\Framework64\v4.0.30319;C:\Windows\Microsoft.NET\Framework\v4.0.30319;%PATH%"


