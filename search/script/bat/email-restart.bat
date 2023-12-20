@echo off
cd /D %~dp0
echo email is trying to start
echo Please wait  ...

call email-stop.bat
call email-start.bat