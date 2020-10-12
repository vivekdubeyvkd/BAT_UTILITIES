
pushd %WORKSPACE%\..
echo off
FOR /D %%i IN (*) DO  ( 
   if not "%%i" == "%JOB_BASE_NAME%" (
      echo on
      echo "removing %%i to clear space from workspace root drive to avoid build failure due to disk space related issues"
      echo off
      rd /s /q %%i
      set ERRORLEVL=0
      dir
   )
)
