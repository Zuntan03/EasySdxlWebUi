@echo off
chcp 65001 > NUL
setlocal
set CURL_CMD=C:\Windows\System32\curl.exe

set DOWNLOAD_DIR=%1
set DOWNLOAD_FILE=%2
set DOWNLOAD_URL=%3
if exist %DOWNLOAD_DIR%\%DOWNLOAD_FILE% ( exit /b 0 )

if not exist %DOWNLOAD_DIR%\ ( mkdir %DOWNLOAD_DIR% )

echo %CURL_CMD% -Lo %DOWNLOAD_DIR%\%DOWNLOAD_FILE% %DOWNLOAD_URL%
%CURL_CMD% -Lo %DOWNLOAD_DIR%\%DOWNLOAD_FILE% %DOWNLOAD_URL%
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )

endlocal
