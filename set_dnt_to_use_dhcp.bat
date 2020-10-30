for /f "tokens=1,2,3*" %%i in ('netsh int show interface') do (
     if %%i equ Enabled (
       netsh int ipv4 set dns "%%l" dhcp
     )
)
