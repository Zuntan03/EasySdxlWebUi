@echo off
chcp 65001 > NUL

start "" https://civitai.com/models/289041

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Model

call %SDXL_WEB_UI%\setup\Download.bat Pony gnomePower_v111.safetensors ^
https://civitai.com/api/download/models/367352
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Model
