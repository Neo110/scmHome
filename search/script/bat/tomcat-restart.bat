@echo off
cd /D %~dp0

call tomcat-stop.bat
call tomcat-start.bat