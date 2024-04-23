@echo off
REM %1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

cd /D %~dp0
echo OpenSSH Start ...
setlocal EnableDelayedExpansion 
 
powershell.exe -ExecutionPolicy Bypass -File .\OpenSSH\install-sshd.ps1
netsh advfirewall firewall add rule name=sshd dir=in action=allow protocol=TCP localport=22

net start sshd
echo %errorlevel%
if errorlevel 1 (
	goto error
) else (
	goto finish
)

:error
echo OpenSSH is start failed.
exit /b 1

:finish
echo OpenSSH is start success.
exit /b 0