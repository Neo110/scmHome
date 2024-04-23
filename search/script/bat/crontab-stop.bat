@echo off
cd /D %~dp0
echo crontab shutdowm ...

start taskkill -F -im  crontab.exe

if errorlevel 1 (
	goto error
) else (
	goto finish
)

:error
echo crontab is stop failed.
exit /b 1

:finish
echo crontab is stop success.
exit /b 0