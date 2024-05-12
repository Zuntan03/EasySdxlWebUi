@echo off
chcp 65001 > NUL

start "" https://huggingface.co/JosefJilek/loliDiffusion

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Model

call %SDXL_WEB_UI%\setup\Download.bat Pony loliDiffusionV1.1.0_PDXL_Lx7-CLIP_VAE_FP16.safetensors ^
https://huggingface.co/JosefJilek/loliDiffusion/resolve/main/loliDiffusionV1.1.0_PDXL_Lx7-CLIP_VAE_FP16.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Model
