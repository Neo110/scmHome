@echo off
cd /D %~dp0
echo Ftp is trying to start
echo Please wait  ...

call sw-stop.bat
call sw-start.bat