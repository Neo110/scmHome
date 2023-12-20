@echo off
cd /D %~dp0

call minio-stop.bat
call minio-start.bat