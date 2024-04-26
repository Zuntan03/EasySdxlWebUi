@echo off
chcp 65001 > NUL

start "" https://huggingface.co/ByteDance/Hyper-SD

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Lora

call %SDXL_WEB_UI%\setup\Download.bat Hyper-SD Hyper-SDXL-1step-lora.safetensors ^
https://huggingface.co/ByteDance/Hyper-SD/resolve/main/Hyper-SDXL-1step-lora.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat Hyper-SD Hyper-SDXL-2steps-lora.safetensors ^
https://huggingface.co/ByteDance/Hyper-SD/resolve/main/Hyper-SDXL-2steps-lora.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat Hyper-SD Hyper-SDXL-4steps-lora.safetensors ^
https://huggingface.co/ByteDance/Hyper-SD/resolve/main/Hyper-SDXL-4steps-lora.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat Hyper-SD Hyper-SDXL-8steps-lora.safetensors ^
https://huggingface.co/ByteDance/Hyper-SD/resolve/main/Hyper-SDXL-8steps-lora.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Lora
