@echo off
cd /D %~dp0
echo Diese Eingabeforderung nicht waehrend des Running beenden
echo Please dont close Window while Minio is running
echo Minio is trying to start
echo Please wait  ...
echo Minio is starting with Minio\conf\Minio.conf (console)

start /b minio\minio.exe server minio\data --address ":8999" >> .\log\minio.log

if errorlevel 1 (
	goto error
) else (
	goto finish
)

:error
echo Minio is stop failed.
exit /b 0

:finish
echo Minio is start success.
exit /b 1