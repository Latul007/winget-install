@echo off
:: BatchGotAdmin
::-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"="
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
::--------------------------------------

::ENTER YOUR CODE BELOW:
color 0a
echo.
echo Appuyer sur 1 pour installer SANS LibreOffice + Lenovo Vantage
echo.
echo.
echo Appuyer sur 2 pour installer AVEC LibreOffice + Lenovo Vantage
echo.
echo.
echo Appuyer sur 3 pour RIEN installer + Lenovo Vantage
echo.
Set /p Julien=Le choix:
If "%Julien%"=="1" goto 1
If "%Julien%"=="2" goto 2
If "%Julien%"=="3" goto 3



:1
cls
title "Installation des Application sans LibreOffice"
winget install Google.Chrome
winget install Microsoft.Edge
winget install 7zip.7zip
winget install VideoLAN.VLC
winget install TeamViewer.TeamViewer
winget install Adobe.Acrobat.Reader.64-bit
winget install 9NR5B8GVVM13
timeout -T 5 /nobreak
goto End
:2
cls
title "Installation des Application avec LibreOffice"
winget install Google.Chrome
winget install Microsoft.Edge
winget install 7zip.7zip
winget install VideoLAN.VLC
winget install TheDocumentFoundation.LibreOffice
winget install TeamViewer.TeamViewer
winget install Adobe.Acrobat.Reader.64-bit
winget install 9NR5B8GVVM13
timeout -T 5 /nobreak
goto End

:3
cls
title "Rien à installer"
winget install 9NR5B8GVVM13
goto End

:End
@exit