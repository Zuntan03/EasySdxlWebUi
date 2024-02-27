@echo off
chcp 65001 > NUL

start "" https://huggingface.co/bdsqlsz/qinglong_controlnet-lllite

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\ControlNet

call %SDXL_WEB_UI%\setup\Download-HuggingFace.bat . bdsqlsz/qinglong_controlnet-lllite *.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Lora
