@echo off

set PWD=%~dp0JDK8
::set "PWD_FORMAT=%PWD:\=/%"
set "PWD_FORMAT=%PWD%"
echo %path% >>%PWD_FORMAT%\default.path.bak.txt
set pathStr=%path%

set JAVA_HOME=%PWD_FORMAT%\
set JAVA_HOME=%JAVA_HOME:~0,-1%
set jdkPath=%JAVA_HOME%\bin
set jrePath=%JAVA_HOME%\jre\bin

wmic environment where "name='JAVA_HOME'" delete
wmic environment where "name='CLASSPATH'" delete

setlocal enableDelayedExpansion

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

set nPath=%nPath:"=%
setx Path "%nPath%" /m >nul

rem -- refresh env ---
::call "sjdk\renv.exe"

::if errorlevel 1 goto error
goto finish

:error
echo.
echo jdk8 is stop failed
echo jdk8 could not be stoped
pause

:finish
echo.
echo Path=%nPath%>%PWD_FORMAT%\conf.ini
echo JAVA_HOME=>>%PWD_FORMAT%\conf.ini
echo CLASSPATH=>>%PWD_FORMAT%\conf.ini

echo jdk8 is stop success!
