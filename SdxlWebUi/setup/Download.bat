@echo off
chcp 65001 > NUL
setlocal enabledelayedexpansion
set CURL_CMD=C:\Windows\System32\curl.exe
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

set DOWNLOAD_DIR=%1
set DOWNLOAD_FILE=%2
set DOWNLOAD_URL=%3

if exist %DOWNLOAD_DIR%\%DOWNLOAD_FILE% (
	if not exist %DOWNLOAD_DIR%\%DOWNLOAD_FILE%.aria2 ( exit /b 0 )
)

if not exist %DOWNLOAD_DIR%\ ( mkdir %DOWNLOAD_DIR% )

echo %CURL_CMD% -Lo %DOWNLOAD_DIR%\%DOWNLOAD_FILE% %DOWNLOAD_URL%
%CURL_CMD% -Lo %DOWNLOAD_DIR%\%DOWNLOAD_FILE% %DOWNLOAD_URL%
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )
endlocal
exit /b 0
