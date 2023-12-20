@echo off
chcp 65001
cd /D %~dp0

start /B "redis-server" redis/redis-server.exe
if errorlevel 1 goto error
goto finish

:error
echo.
echo Redis konnte nicht gestartet werden
echo Redis is start failed
pause

:finish
echo.
echo Redis is start success