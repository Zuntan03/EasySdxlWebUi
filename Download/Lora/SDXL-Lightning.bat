@echo off
chcp 65001 > NUL

start "" https://huggingface.co/ByteDance/SDXL-Lightning

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Lora

call %SDXL_WEB_UI%\setup\Download-HuggingFace.bat SDXL-Lightning ByteDance/SDXL-Lightning *_lora.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Lora
