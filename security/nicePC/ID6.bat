@echo off   
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"   
if '%errorlevel%' NEQ '0' (   
    echo 관리 권한을 요청 ...   
    goto UACPrompt   
) else ( goto gotAdmin )   
:UACPrompt   
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"   
    set params = %*:"=""   
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"   
    "%temp%\getadmin.vbs"   
    rem del "%temp%\getadmin.vbs"   
    exit /B   
:gotAdmin   
pushd "%CD%"   
    CD /D "%~dp0"  
(Powershell.exe -executionpolicy bypass -WindowStyle hidden "C:\security\nicePC\nice.ps1" 6번;)2>>C:\security\error\error6.txt && call c:\security\JCcheck.bat  
