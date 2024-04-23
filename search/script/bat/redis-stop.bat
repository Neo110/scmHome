@echo off
cd /D %~dp0
echo Redis shutdowm ...

start taskkill -F -im  redis-server.exe

if errorlevel 1 (
	goto error
) else (
	goto finish
)


:error
echo Redis is stop failed.
exit /b 1

:finish
echo Redis is stop success.
exit /b 0