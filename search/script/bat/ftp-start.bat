@echo off
chcp 65001
cd /D %~dp0

setlocal EnableDelayedExpansion 

start /B "filezilla-server" FileZillaServer\filezilla-server.exe

if errorlevel 1 (
	goto error
) else (
	goto finish
)

:error
echo Ftp is start failed.
exit /b 1

:finish
echo Ftp is start success.
exit /b 0