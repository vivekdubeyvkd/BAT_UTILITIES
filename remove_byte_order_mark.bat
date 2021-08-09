@echo off
REM remove byte order mark e.g. chars like ï»¿ 
REM sample file is myfile.txt with content as shown below
REM myfile.txt =>
REM ï»¿my name is vivek
REM ensure that GIT bash is installed on windows machine with command line utilities

set PATH=C:\Program Files\Git\usr\bin;C:\Program Files\Git\mingw64\bin;%PATH%
set FILE_NAME=myfile.txt
sed -i '1 s/^\xef\xbb\xbf//' %FILE_NAME%
echo.
echo %FILE_NAME%
echo.
