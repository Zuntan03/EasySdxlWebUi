@echo off
chcp 65001 > NUL

start "" https://huggingface.co/MayonakaManic/LoRA

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Lora
call %SDXL_WEB_UI%\setup\Download-Aria2.bat utility LECO_LessMuscularityXL.safetensors ^
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LECO/LECO_LessMuscularityXL.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
popd
