@echo off
cd /D %~dp0
echo Minio shutdowm ...

TASKKILL /f /IM minio.exe

if errorlevel 1 goto error
goto finish

:error
echo.
echo Minio 停止失败
echo Minio could not be started
pause

:finish
echo.
echo Minio is stop success!  停止成功