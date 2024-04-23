@echo off
cd /D %~dp0
echo dingding shutdowm ...

start taskkill -F -im  dingding.exe

if errorlevel 1 (
	goto error
) else (
	goto finish
)

:error
echo dingding is stop failed.
exit /b 1

:finish
echo dingding is stop success.
exit /b 0