@echo off
cd /D %~dp0
echo Diese Eingabeforderung nicht waehrend des Running beenden
echo Please dont close Window while Minio is running
echo Minio is trying to start
echo Please wait  ...
echo Minio is starting with Minio\conf\Minio.conf (console)

start /b minio\minio.exe server minio\data --address ":8999" >> .\log\minio.log

if errorlevel 1 goto error
goto finish

:error
echo.
echo Minio konnte nicht gestartet werden
echo Minio could not be started
pause

:finish
echo.
echo Minio is start success!