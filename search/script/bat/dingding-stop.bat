@echo off
cd /D %~dp0
echo dingding shutdowm ...

start taskkill -F -im  dingding.exe

if errorlevel 1 goto error
goto finish

:error
echo.
echo dingding is stop failed
echo dingding could not be started
pause

:finish
echo.
echo dingding is stop success