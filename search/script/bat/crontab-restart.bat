@echo off
cd /D %~dp0
echo Crontab is trying to start
echo Please wait  ...

call crontab-stop.bat
call crontab-start.bat