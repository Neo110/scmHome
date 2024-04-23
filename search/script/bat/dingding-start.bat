@echo off
chcp 65001
cd /D %~dp0

setlocal EnableDelayedExpansion 

cd dingding
start /B "dingding" dingding.exe

if errorlevel 1 (
	goto error
) else (
	goto finish
)


:error
echo dingding is start failed.
exit /b 1

:finish
echo dingding is start success.
exit /b 0