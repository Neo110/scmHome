@echo off
chcp 65001
cd /D %~dp0

setlocal EnableDelayedExpansion 

cd email
start /B "email" email.exe

if errorlevel 1 goto error
goto finish

:error
echo.
echo email is start failed
echo email could not be started
pause

:finish
echo.
echo email is start success

endlocal