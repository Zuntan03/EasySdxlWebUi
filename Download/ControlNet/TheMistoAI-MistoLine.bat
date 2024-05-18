@echo off
chcp 65001 > NUL

start "" https://huggingface.co/TheMistoAI/MistoLine

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\ControlNet

call %SDXL_WEB_UI%\setup\Download.bat . mistoLine_rank256.safetensors ^
https://huggingface.co/TheMistoAI/MistoLine/resolve/main/mistoLine_rank256.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat . mistoLine_fp16.safetensors ^
https://huggingface.co/TheMistoAI/MistoLine/resolve/main/mistoLine_fp16.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Lora
