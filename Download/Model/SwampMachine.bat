@echo off
chcp 65001 > NUL

start "" https://civitai.com/models/286574

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Model

call %SDXL_WEB_UI%\setup\Download.bat . SwampMachine-V2.0.safetensors ^
https://huggingface.co/gsdf/SwampMachine/resolve/main/SwampMachine-V2.0.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Model
