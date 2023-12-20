@echo off
::echo JAVA_HOME=%JAVA_HOME% >> tmp.log

set PWD=%~dp0JDK11
::set "PWD_FORMAT=%PWD:\=/%"
set "PWD_FORMAT=%PWD%"

::echo %PWD% >> tmp.log
::echo %PWD_FORMAT% >> tmp.log
  
rem --- Base Config   ---
::set TARGET_JAVA_HOME=%PWD_FORMAT%

if "%JAVA_HOME%" == "%PWD_FORMAT%" (
   echo Jar program is running.
) else (
   echo Jar program is not running.
)