@echo off
cd /D %~dp0
echo %~dp0

set "CURRENT_DIR=%cd%"
set "CATALINA_BASE=%CURRENT_DIR%\tomcat"
set "CATALINA_HOME=%CURRENT_DIR%\tomcat"
set "CATALINA_TMPDIR=%CURRENT_DIR%\tomcat\temp"
echo %CATALINA_HOME%

REM "%CATALINA_HOME%\bin\catalina.bat" run 
call "%CATALINA_HOME%\bin\startup.bat"  

if errorlevel 1 (
	goto error
) else (
	goto finish
)

:error
echo Tomcat is start failed.
exit /b 1

:finish
echo Tomcat is start success.
exit /b 0