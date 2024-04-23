@echo off
chcp 65001
cd /D %~dp0

start /B "redis-server" redis/redis-server.exe
if errorlevel 1 (
	goto error
) else (
	goto finish
)

:error
echo Redis is start failed.
exit /b 1

:finish
echo Redis is start success.
exit /b 0