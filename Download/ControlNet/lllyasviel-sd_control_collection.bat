@echo off
chcp 65001 > NUL

start "" https://huggingface.co/lllyasviel/sd_control_collection

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\ControlNet

call %SDXL_WEB_UI%\setup\Download-HuggingFace.bat . lllyasviel/sd_control_collection *_xl_*
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Lora
