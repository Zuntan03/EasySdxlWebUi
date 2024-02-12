@echo off
chcp 65001 > NUL

start "" https://civitai.com/models/296650

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Model
call %SDXL_WEB_UI%\setup\Download.bat . rumblexl_v11.safetensors ^
https://civitai.com/api/download/models/333327
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
popd
