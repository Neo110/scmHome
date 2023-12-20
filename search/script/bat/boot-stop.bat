@echo off
cd /D %~dp0
echo Boot shutdowm ...

::set JAVA_HOME=%~dp0/JDK8
::set PATH=%JAVA_HOME%/bin;%JAVA_HOME%/jre/bin  
::set CLASSPATH=.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;
::set JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

setlocal EnableDelayedExpansion 

for /f "usebackq tokens=1-5" %%a in (`jps -l`) do (
	echo %%a %%b
	if [%%b] EQU [sys-boot.jar] (
		echo stop %%a
		taskkill /F /PID %%a
	)
)


if errorlevel 1 goto error
goto finish

:error
echo.
echo Boot is stop failed
echo Boot could not be stoped
pause

:finish
echo.
echo Boot is stop success

endlocal