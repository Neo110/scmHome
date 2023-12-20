@echo off
cd /D %~dp0
echo Ftp is trying to start
echo Please wait  ...

call ftp-stop.bat
call ftp-start.bat