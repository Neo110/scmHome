@echo off
cd /D %~dp0
echo Tomcat shutdowm ...

set "CURRENT_DIR=%cd%"
set "CATALINA_HOME=%CURRENT_DIR%\tomcat"
echo "CURRENT_DIR=%CURRENT_DIR%"
echo "CATALINA_HOME=%CATALINA_HOME%"

REM "%CATALINA_HOME%\bin\catalina.bat" stop
call "%CATALINA_HOME%\bin\shutdown.bat"

if errorlevel 1 (
	goto error
) else (
	goto finish
)


:error
echo Tomcat is stop faild.
exit /b 1

:finish
echo Tomcat is stop success.
exit /b 0