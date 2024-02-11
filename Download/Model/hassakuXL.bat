@echo off
chcp 65001 > NUL

start "" https://civitai.com/models/140272

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Model
call %SDXL_WEB_UI%\setup\Download-Aria2.bat . hassakuXLSfwNsfwBeta_betaV04.safetensors ^
https://civitai.com/api/download/models/325904
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
popd
