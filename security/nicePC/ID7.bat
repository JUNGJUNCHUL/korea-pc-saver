@echo off   
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"   
if '%errorlevel%' NEQ '0' (   
    echo ���� ������ ��û ...   
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
(Powershell.exe -executionpolicy bypass -WindowStyle hidden "C:\security\nicePC\nice.ps1" 7��;)2>>C:\security\error\error7.txt && call c:\security\JCcheck.bat  