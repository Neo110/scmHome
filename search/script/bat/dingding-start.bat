@echo off
chcp 65001
cd /D %~dp0

setlocal EnableDelayedExpansion 

cd dingding
start /B "dingding" dingding.exe

if errorlevel 1 goto error
goto finish

:error
echo.
echo dingding is start failed
echo dingding could not be started
pause

:finish
echo.
echo dingding is start success

endlocal