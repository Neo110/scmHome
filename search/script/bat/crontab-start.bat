@echo off
chcp 65001
cd /D %~dp0

setlocal EnableDelayedExpansion 

cd crontab
start /B "crontab" crontab.exe

if errorlevel 1 (
	goto error
) else (
	goto finish
)

:error
echo crontab is start failed.
exit /b 1

:finish
echo crontab is start success.
exit /b 0