@echo off
chcp 65001
cd /D %~dp0

cd C:\jk-katalon\
start /MIN launch.bat

if errorlevel 1 (
	goto error
) else (
	goto finish
)

:error
echo jk is start failed.
exit /b 1

:finish
echo jk is start success.
exit /b 0