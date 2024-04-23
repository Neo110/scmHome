@echo off
cd /D %~dp0
echo sw shutdowm ...

start /B taskkill -F -im  sw.exe

if %errorlevel% == 1 (
	goto error
) else (
	goto finish
)

:error
echo sw is stop failed.
exit /b 1

:finish
echo sw is stop success.
exit /b 0