@echo off
cd /D %~dp0
echo Ftp shutdowm ...

start taskkill -F -im  filezilla-server.exe

if errorlevel 1 goto error
goto finish

:error
echo.
echo Ftp is stop failed
echo Ftp could not be started
pause

:finish
echo.
echo Ftp is stop success