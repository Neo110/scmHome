@echo off
cd /D %~dp0
echo Ftp shutdowm ...

start taskkill -F -im  filezilla-server.exe

if errorlevel 1 (
	goto error
) else (
	goto finish
)

:error
echo Ftp is stop failed.
exit /b 1

:finish
echo Ftp is stop success.
exit /b 0