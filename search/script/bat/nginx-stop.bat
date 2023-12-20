@echo off
cd /D %~dp0
echo Nginx shutdowm ...


start nginx-1.14.2\nginx -s stop -p ./nginx-1.14.2

if errorlevel 1 goto error
goto finish

:error
echo.
echo Nginx is stop failed
echo Nginx could not be started
pause

:finish
echo.
echo Nginx is stop success