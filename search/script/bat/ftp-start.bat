@echo off
chcp 65001
cd /D %~dp0

setlocal EnableDelayedExpansion 

start /B "filezilla-server" FileZillaServer\filezilla-server.exe

if errorlevel 1 goto error
goto finish

:error
echo.
echo Ftp is start failed
echo Ftp could not be started
pause

:finish
echo.
echo Ftp is start success

endlocal