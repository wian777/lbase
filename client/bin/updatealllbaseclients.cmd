@echo off
:: wian 20160503
:: call updatealllbaseclients.cmd
:: update aller lbaseinternal Clients
:: brgo 20170629
:: not lbase63 or lbase64. Correct is lbase-6.3 or lbase-6.4
:: brgo 20170629
:: now get lbase-7.0, and not lbase-6.3
:: brgo 20170817
:: now get lbase-7.1, and not lbase-7.0

:: Prüfe zuerst, ob tfdbntfs01 ueberhaupt erreichbar ist:
:: ping -n 1 localhost >/nul
:: ping -n 5 tfdbntfs01 >/nul
:: if "%errorlevel%" == "0" (
:: Main

:: echo %cd%
set binpath=\cygwin64\bin\
cmd.exe /c PowerShell.exe -ExecutionPolicy Bypass -File %binpath%\updatealllbaseclients.ps1 Main
:: cmd.exe /c powershell -Command "& {$title=echo lbaseClientUpdate Main: do not close!;$Host.UI.RawUI.WindowTitle = $title;$h = (ls \\tfdbntfs02\builds\LBASE\Main\|sort -property lastwritetime |Select-Object -Last 1) -split ' ';robocopy \\tfdbntfs02\builds\LBASE\Main\$h\x86\Debug c:\lbaseinternal\lbase7\ /mir /XF lbase.ini}

:: lbase72
:: cmd.exe /c PowerShell.exe -ExecutionPolicy Bypass -File %binpath%\updatealllbaseclients.ps1 Release_7.2_DEV
:: cmd.exe /c powershell -Command "& {$title=echo lbaseClientUpdate lbase72: do not close!;$Host.UI.RawUI.WindowTitle = $title;$h = (ls \\tfdbntfs02\builds\LBASE\Release_7.2_DEV\|sort -property lastwritetime |Select-Object -Last 1) -split ' ';robocopy \\tfdbntfs02\builds\LBASE\Release_7.2_DEV\$h\x86\Debug c:\lbaseinternal\lbase-7.2\ /mir /XF lbase.ini}

:: lbase71
:: cmd.exe /c PowerShell.exe -ExecutionPolicy Bypass -File %binpath%\updatealllbaseclients.ps1 Release_7.1_DEV
:: cmd.exe /c powershell -Command "& {$title=echo lbaseClientUpdate lbase71: do not close!;$Host.UI.RawUI.WindowTitle = $title;$h = (ls \\tfdbntfs02\builds\LBASE\Release_7.1_DEV\|sort -property lastwritetime |Select-Object -Last 1) -split ' ';robocopy \\tfdbntfs02\builds\LBASE\Release_7.1_DEV\$h\x86\Debug c:\lbaseinternal\lbase-7.1\ /mir /XF lbase.ini}

:: lbase64
:: cmd.exe /c powershell -Command "& {$title=echo lbaseClientUpdate lbase64: do not close!;$Host.UI.RawUI.WindowTitle = $title;$h = (ls \\tfdbntfs02\builds\LBASE\Release_6.4_DEV\|sort -property lastwritetime |Select-Object -Last 1) -split ' ';robocopy \\tfdbntfs02\builds\LBASE\Release_6.4_DEV\$h\x86\Debug c:\lbaseinternal\lbase-6.4\ /mir /XF lbase.ini}

:: pause
:: lbase63
:: cmd.exe /c powershell -Command "& {$title=echo lbaseClientUpdate lbase64: do not close!;$Host.UI.RawUI.WindowTitle = $title;$h = (ls \\tfdbntfs01\builds\LBASE\Release_6.3_DEV\|sort -property lastwritetime |Select-Object -Last 1) -split ' ';robocopy \\tfdbntfs01\builds\LBASE\Release_6.3_DEV\$h\x86\Debug c:\lbaseinternal\lbase-6.3\ /mir /XF lbase.ini}

:: lbase62
:: cmd.exe /c powershell -Command "& {$title=echo lbaseClientUpdate lbase64: do not close!;$Host.UI.RawUI.WindowTitle = $title;$h = (ls \\tfdbntfs01\builds\LBASE\Release_6.2_DEV\|sort -property lastwritetime |Select-Object -Last 1) -split ' ';robocopy \\tfdbntfs01\builds\LBASE\Release_6.2_DEV\$h\x86\Debug c:\lbaseinternal\lbase-6.2\ /mir /XF lbase.ini}

:: lbase61
:: cmd.exe /c powershell -Command "& {$title=echo lbaseClientUpdate lbase64: do not close!;$Host.UI.RawUI.WindowTitle = $title;$h = (ls \\tfdbntfs01\builds\LBASE\Release_6.1_DEV\|sort -property lastwritetime |Select-Object -Last 1) -split ' ';robocopy \\tfdbntfs01\builds\LBASE\Release_6.1_DEV\$h\x86\Debug c:\lbaseinternal\lbase-6.1\ /mir /XF lbase.ini}
:: ) else (
:: echo Server tfdbntfs01 ist nicht erreichbar!
:: pause
:: )


:: kopiere die neueste lbaseDotNetCustomControls vom tfdbntfs02\builds\LBASE nach %tricentis_home%\dll\DotNetEngine\CustomControls\
:: cmd.exe /c powershell -Command "& {$title=echo lbaseDotNetCustomControls: do not close!;$sourceDir='\\tfdbntfs02\builds\LBASE Tosca\';$Host.UI.RawUI.WindowTitle = $title;$h = (ls $sourceDir|sort -property lastwritetime |Select-Object -Last 1) -split ' ';xcopy /Y $sourceDir\$h\Main\lbaseDotNetCustomControls\bin\Release\lbaseDotNetCustomControls.* %tricentis_home%\dll\DotNetEngine\CustomControls\}
:: kopiere die neueste lbaseWebNetCustomControls vom tfdbntfs02\builds\LBASE nach %tricentis_home%\Automation\Framework\
:: cmd.exe /c powershell -Command "& {$title=echo lbaseWebCustomControls: do not close!;$sourceDir='\\tfdbntfs02\builds\LBASE Tosca\';$Host.UI.RawUI.WindowTitle = $title;$h = (ls $sourceDir|sort -property lastwritetime |Select-Object -Last 1) -split ' ';xcopy /Y $sourceDir\$h\Main\lbasewebcustomcontrols\bin\Release\lbaseWebCustomControls.* %tricentis_home%\Automation\Framework\}

REM xcopy /Y \\tfdbnbld01\LBase\INTERNAL\client\LBaseInternal\lbaseTCAPI\LBASE_Smoketests.exe "%TRICENTIS_PROJECTS%\Tosca_Workspaces\lbaseGuiTests\."
REM xcopy /Y \\tfdbnbld01\LBase\INTERNAL\client\LBaseInternal\lbaseTCAPI\LBASE_Smoketests.pdb "%TRICENTIS_PROJECTS%\Tosca_Workspaces\lbaseGuiTests\."
REM xcopy /Y \\tfdbnbld01\LBase\INTERNAL\client\LBaseInternal\lbaseTCAPI\LBASE_Smoketests.exe "%TRICENTIS_PROJECTS%\Tosca_Workspaces\lbase\."
REM xcopy /Y \\tfdbnbld01\LBase\INTERNAL\client\LBaseInternal\lbaseTCAPI\LBASE_Smoketests.pdb "%TRICENTIS_PROJECTS%\Tosca_Workspaces\lbase\."
REM xcopy /Y \\tfdbnbld01\LBase\INTERNAL\client\LBaseInternal\lbaseTCAPI\LBASE_Smoketests.exe "%TRICENTIS_PROJECTS%\Tosca_Workspaces\lbase7web\."
REM xcopy /Y \\tfdbnbld01\LBase\INTERNAL\client\LBaseInternal\lbaseTCAPI\LBASE_Smoketests.pdb "%TRICENTIS_PROJECTS%\Tosca_Workspaces\lbase7web\."
REM xcopy /Y \\tfdbnbld01\LBase\INTERNAL\client\LBaseInternal\lbaseTCAPI\LBASE_Smoketests.exe "%TRICENTIS_PROJECTS%\Tosca_Workspaces\lbaseGuiFeatureTests\."
REM xcopy /Y \\tfdbnbld01\LBase\INTERNAL\client\LBaseInternal\lbaseTCAPI\LBASE_Smoketests.pdb "%TRICENTIS_PROJECTS%\Tosca_Workspaces\lbaseGuiFeatureTests\."
:: pause
:: cd %TRICENTIS_HOME%\
:: start Tricentis.Common.LogServer.exe all
:: siehe Log4net-log.txt unter C:\ProgramData\TRICENTIS\TOSCA Testsuite\7.0.0\logs\Automation
