@echo off
chcp 65001
cd /D %~dp0
echo Nginx shutdowm ...

start nginx\nginx -s stop -p ./nginx

if errorlevel 1 (
	goto error
) else  (
	goto finish
)


:error
echo Nginx is stop failed.
exit /b 1

:finish
echo Nginx is stop success.
exit /b 0