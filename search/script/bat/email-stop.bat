@echo off
cd /D %~dp0
echo email shutdowm ...

start taskkill -F -im  email.exe

if errorlevel 1 goto error
goto finish

:error
echo.
echo email is stop failed
echo email could not be started
pause

:finish
echo.
echo email is stop success