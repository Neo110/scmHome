@echo off
cd /D %~dp0

call mysql-stop.bat
call mysql-start.bat
