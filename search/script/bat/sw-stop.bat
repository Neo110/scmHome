@echo off
cd /D %~dp0
echo sw shutdowm ...

start taskkill -F -im  sw.exe

if errorlevel 1 goto error
goto finish

:error
echo.
echo sw is stop failed
echo sw could not be started
pause

:finish
echo.
echo sw is stop success