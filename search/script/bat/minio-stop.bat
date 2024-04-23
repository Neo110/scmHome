@echo off
cd /D %~dp0
echo Minio shutdowm ...

start taskkill -F -im  minio.exe

if errorlevel 1 (
	goto error
) else (
	goto finish
)

:error
echo Minio is stop failed.
exit /b 1

:finish
echo Minio is stop success.
exit /b 0