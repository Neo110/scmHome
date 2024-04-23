@echo off
chcp 65001
cd /D %~dp0

cd sw
start /B sw.exe -p ./sw

if %errorlevel% == 1 (
	goto error
) else (
	goto finish
)

:error
echo sw is start failed.
exit /b 1

:finish
echo sw is start success.
exit /b 0