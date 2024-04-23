@echo off
chcp 65001
cd /D %~dp0

echo Nginx start ...
 
start /B nginx\nginx.exe  -p ./nginx

if errorlevel 1 (
	goto error
) else (
	goto finish
)

:error
echo Nginx is start failed.
exit /b 1

:finish
echo Nginx is start success.
exit /b 0