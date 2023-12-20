@echo off
REM %1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

cd /D %~dp0
echo FlashFXP Start ...
 
start FlashFXP/FlashFXP.exe

echo %errorlevel%
if errorlevel 1 (
	echo.
	echo FlashFXP konnte nicht gestartet werden
	echo FlashFXP is start failed	
) else (
	echo.
	echo FlashFXP is start success
)
