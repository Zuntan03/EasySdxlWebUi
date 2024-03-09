@echo off
chcp 65001 > NUL

start "" https://huggingface.co/ByteDance/SDXL-Lightning
start "" https://huggingface.co/latent-consistency/lcm-lora-sdv1-5

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Lora

call %SDXL_WEB_UI%\setup\Download-HuggingFace.bat SDXL-Lightning ByteDance/SDXL-Lightning *_lora.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat lcm lcm-lora-sd15.safetensors ^
https://huggingface.co/latent-consistency/lcm-lora-sdv1-5/resolve/main/pytorch_lora_weights.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Lora
