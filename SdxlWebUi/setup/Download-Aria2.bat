@echo off
chcp 65001 > NUL
setlocal enabledelayedexpansion
set CURL_CMD=C:\Windows\System32\curl.exe -k
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

set DOWNLOAD_DIR=%1
set DOWNLOAD_FILE=%2
set DOWNLOAD_URL=%3

if exist %DOWNLOAD_DIR%\%DOWNLOAD_FILE% (
	if not exist %DOWNLOAD_DIR%\%DOWNLOAD_FILE%.aria2 ( exit /b 0 )
)

if not exist %DOWNLOAD_DIR%\ ( mkdir %DOWNLOAD_DIR% )

set ARIA_VER=1.37.0
set ARIA_NAME=aria2-%ARIA_VER%-win-64bit-build1
set ARIA_EXE=%~dp0lib\%ARIA_NAME%\aria2c.exe
set ARIA_CMD=%ARIA_EXE% --console-log-level=warn --file-allocation=none -x2

if not exist %ARIA_EXE% (
	echo %CURL_CMD% -Lo %~dp0lib\aria2.zip https://github.com/aria2/aria2/releases/download/release-%ARIA_VER%/%ARIA_NAME%.zip
	%CURL_CMD% -Lo %~dp0lib\aria2.zip https://github.com/aria2/aria2/releases/download/release-%ARIA_VER%/%ARIA_NAME%.zip
	if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )

	echo 	%PS_CMD% "try { Expand-Archive -Path %~dp0lib\aria2.zip  -DestinationPath %~dp0lib\ -Force } catch { exit 1 }"
	%PS_CMD% "try { Expand-Archive -Path %~dp0lib\aria2.zip  -DestinationPath %~dp0lib\ -Force } catch { exit 1 }"
	if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )

	echo del /Q %~dp0lib\aria2.zip
	del /Q %~dp0lib\aria2.zip
	if !errorlevel! neq 0 ( pause & exit /b !errorlevel! )
)

echo %ARIA_CMD% -o %DOWNLOAD_DIR%\%DOWNLOAD_FILE% %DOWNLOAD_URL%
%ARIA_CMD% -o %DOWNLOAD_DIR%\%DOWNLOAD_FILE% %DOWNLOAD_URL%
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )

endlocal
