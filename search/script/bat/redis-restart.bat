@echo off
cd /D %~dp0

call redis-stop.bat
call redis-start.bat