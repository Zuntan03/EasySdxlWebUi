@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -k
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

where /Q git
if %ERRORLEVEL% equ 0 ( exit /b 0 )
cd > NUL
set PORTABLE_GIT_DIR=%~dp0lib\PortableGit\bin

if not exist %PORTABLE_GIT_DIR%\ (
	if not exist %~dp0lib\ ( mkdir %~dp0lib )

	echo %CURL_CMD% -Lo %~dp0lib\PortableGit.7z.exe https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/PortableGit-2.43.0-64-bit.7z.exe
	%CURL_CMD% -Lo %~dp0lib\PortableGit.7z.exe https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/PortableGit-2.43.0-64-bit.7z.exe
	if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )

	start "" %PS_CMD% -Command "Start-Sleep -Seconds 2; $title='Portable Git for Windows 64-bit'; $window=Get-Process | Where-Object { $_.MainWindowTitle -eq $title } | Select-Object -First 1; if ($window -ne $null) { [void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic'); [Microsoft.VisualBasic.Interaction]::AppActivate($window.Id); Start-Sleep -Seconds 1; Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.SendKeys]::SendWait('{ENTER}') }"

	echo "設定を変更せずに、そのままインストールしてください。"
	%~dp0lib\PortableGit.7z.exe
	if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )

	echo del %~dp0lib\PortableGit.7z.exe
	del %~dp0lib\PortableGit.7z.exe
	if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )
)

set PATH=%PORTABLE_GIT_DIR%;%PATH%

where /Q git
if %ERRORLEVEL% equ 0 ( exit /b 0 )

echo [Error] git をインストールできませんでした。手動で Git for Windows をインストールしてください。
pause & exit /b 1
