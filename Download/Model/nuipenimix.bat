@echo off
chcp 65001 > NUL

start "" https://civitai.com/models/81937

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Model

call %SDXL_WEB_UI%\setup\Download.bat . nuipenimix_ver3.safetensors ^
https://civitai.com/api/download/models/333698
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Model
