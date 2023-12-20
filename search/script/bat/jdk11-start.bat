@echo off

set PWD=%~dp0JDK11
::set "PWD_FORMAT=%PWD:\=/%"
set "PWD_FORMAT=%PWD%"
echo %path% >>%PWD_FORMAT%\default.path.bak.txt
set JAVA_HOME=%PWD_FORMAT%\
set JAVA_HOME=%JAVA_HOME:~0,-1%

:: 先删除环境变量中的JAVA_HOME、CLASSPATH、Path中的bin路径
set jdkPath=%JAVA_HOME%\bin
set jrePath=%JAVA_HOME%\jre\bin

setlocal enableDelayedExpansion

set pathStr=%path%
set nPath=hello

:Loop
for /f "delims=; tokens=1,*" %%a in ("%pathStr%") do (
  if not "%%a"=="%jdkPath%" if not "%%a"=="%jrePath%" (
    if "!nPath!"=="hello" (
      set nPath="%%a"
    ) else (
      set nPath=%nPath%;"%%a"
    )
  )
  set pathStr=%%b
  goto Loop
)

set pathStr=%nPath:"=%

set CLASSPATH=.;%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar;
set jdkPath=%%JAVA_HOME%%\bin
set jrePath=%%JAVA_HOME%%\jre\bin
set newPath=%pathStr%;%jdkPath%;%jrePath%


setx JAVA_HOME %JAVA_HOME% /m
setx CLASSPATH %CLASSPATH% /m
setx Path "%newPath%" /m

rem -- refresh env ---
call "sjdk\renv.exe"

::if errorlevel 1 goto error
goto finish

:error
echo.
echo jdk8 is start failed
echo jdk8 could not be started
pause

:finish
echo.
echo JAVA_HOME=%JAVA_HOME%>%PWD_FORMAT%\conf.ini
echo CLASSPATH=%CLASSPATH%>>%PWD_FORMAT%\conf.ini
echo Path=%newPath%>>%PWD_FORMAT%\conf.ini

echo jdk8 is start success!