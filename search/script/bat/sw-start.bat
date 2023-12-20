@echo off
chcp 65001
cd /D %~dp0

setlocal EnableDelayedExpansion 

cd sw
start /B "sw" sw.exe

if errorlevel 1 goto error
goto finish

:error
echo.
echo sw is start failed
echo sw could not be started
pause

:finish
echo.
echo sw is start success

endlocal