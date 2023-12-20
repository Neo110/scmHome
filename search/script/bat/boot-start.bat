@echo off
cd /D %~dp0
echo %~dp0

::set JAVA_HOME=%~dp0/JDK8
::set PATH=%JAVA_HOME%/bin;%JAVA_HOME%/jre/bin  
::set CLASSPATH=.;%JAVA_HOME%\lib\dt.jar;%JAVA_HOME%\lib\tools.jar;
::set JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

cd ./Sys/
start /b java -jar sys-boot.jar -p ./Sys/ >> ../log/boot.log

if errorlevel 1 goto error
goto finish

:error
echo.
echo Boot is start failed
echo Boot could not be started
pause

:finish
echo.
echo Boot is start success!