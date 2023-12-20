@echo off
cd /D %~dp0

call nginx-stop.bat
call nginx-start.bat