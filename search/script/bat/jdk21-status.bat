@echo off
set PWD=%~dp0JDK21
set "PWD_FORMAT=%PWD%"
rem --- Base Config   ---
::set TARGET_JAVA_HOME=%PWD_FORMAT%

if "%JAVA_HOME%" == "%PWD_FORMAT%" (
   echo Jar program is running.
) else (
   echo Jar program is not running.
)
