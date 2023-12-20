@echo off
cd /D %~dp0
echo Tomcat shutdowm ...

set "CURRENT_DIR=%cd%"
set "CATALINA_HOME=%CURRENT_DIR%\tomcat"
echo "CURRENT_DIR=%CURRENT_DIR%"
echo "CATALINA_HOME=%CATALINA_HOME%"

REM "%CATALINA_HOME%\bin\catalina.bat" stop
call "%CATALINA_HOME%\bin\shutdown.bat"

if errorlevel 1 goto error
goto finish

:error
echo.
echo Tomcat is stop faild
echo Tomcat could not be started
pause

:finish
echo.
echo Tomcat is stop success