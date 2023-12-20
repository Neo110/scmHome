@echo off
cd /D %~dp0

call ssh-stop.bat
call ssh-start.bat