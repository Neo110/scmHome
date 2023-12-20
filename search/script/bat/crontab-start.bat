@echo off
chcp 65001
cd /D %~dp0

setlocal EnableDelayedExpansion 

cd crontab
start /B "crontab" crontab.exe

if errorlevel 1 goto error
goto finish

:error
echo.
echo crontab is start failed
echo crontab could not be started
pause

:finish
echo.
echo crontab is start success

endlocal