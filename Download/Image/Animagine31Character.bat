@echo off
chcp 65001 > NUL
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
set DST_DIR=%~dp0..\..\save
set BASE_NAME=Animagine31Character
set ZIP_FILE_NAME=%BASE_NAME%.zip

if exist "%DST_DIR%\%BASE_NAME%\0000-789-1girl, souryuu asuka langley, neon genesis evangelion.webp" ( exit /b 0 )

if not exist %DST_DIR% ( md %DST_DIR% )
pushd %DST_DIR%

if exist %BASE_NAME%\ ( rmdir /S /Q %BASE_NAME%\ )
if exist %ZIP_FILE_NAME% ( del %ZIP_FILE_NAME% )

echo call %SDXL_WEB_UI%\setup\Download.bat . %ZIP_FILE_NAME% https://yyy.wpx.jp/EasySdxlWebUi/%ZIP_FILE_NAME%
call %SDXL_WEB_UI%\setup\Download.bat . %ZIP_FILE_NAME% https://yyy.wpx.jp/EasySdxlWebUi/%ZIP_FILE_NAME%
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

echo %PS_CMD% Expand-Archive -Path %ZIP_FILE_NAME% -DestinationPath . -Force
%PS_CMD% Expand-Archive -Path %ZIP_FILE_NAME% -DestinationPath . -Force
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

echo del %ZIP_FILE_NAME%
del %ZIP_FILE_NAME%
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd rem %DST_DIR%
