DLL_NAME=test
DLL_PATH=C:\Users\scm\Desktop
NETFX_TOOL="C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.7 Tools"
ILASM_TOOL_PATH=C:\Windows\Microsoft.NET\Framework\v2.0.50727
SNK_KEY=%DLL_PATH%\mykey.snk

if exist %DLL_PATH%\%DLL_NAME%.il del /f %DLL_PATH%\%DLL_NAME%.il

%NETFX_TOOL%\ildasm /all /out=%DLL_PATH%\%DLL_NAME%.il %DLL_PATH%\%DLL_NAME%.dll

move /y %DLL_PATH%\%DLL_NAME%.dll %DLL_PATH%\%DLL_NAME%.dll_orig

%NETFX_TOOL%\sn -k %SNK_KEY%

%ILASM_TOOL_PATH%\ilasm.exe /dll /key=%SNK_KEY% %DLL_PATH%\%DLL_NAME%.il
