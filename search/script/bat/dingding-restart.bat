@echo off
cd /D %~dp0
echo dingding is trying to start
echo Please wait  ...

call dingding-stop.bat
call dingding-start.bat