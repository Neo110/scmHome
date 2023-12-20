@echo off
cd /D %~dp0

REM setlocal EnableDelayedExpansion 

start /B "nginx" nginx-1.14.2\nginx.exe  -p ./nginx-1.14.2
if errorlevel 1 goto error
goto finish

:error
echo.
echo Nginx konnte nicht gestartet werden
echo Nginx is start failed
pause

:finish
echo.
echo Nginx is start success