@echo off
cd /D %~dp0
echo crontab shutdowm ...

start taskkill -F -im  crontab.exe

if errorlevel 1 goto error
goto finish

:error
echo.
echo crontab is stop failed
echo crontab could not be started
pause

:finish
echo.
echo crontab is stop success