@echo off
cd /D %~dp0
echo Redis shutdowm ...


start taskkill -F -im  redis-server.exe

if errorlevel 1 goto error
goto finish

:error
echo.
echo Redis is stop failed
echo Redis could not be started
pause

:finish
echo.
echo Redis is stop success