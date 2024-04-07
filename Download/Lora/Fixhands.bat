@echo off
chcp 65001 > NUL

start "" https://huggingface.co/bdsqlsz/stable-diffusion-xl-anime-5.2

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Lora

call %SDXL_WEB_UI%\setup\Download.bat . Fixhands_anime_bdsqlsz_V1.safetensors ^
https://huggingface.co/bdsqlsz/stable-diffusion-xl-anime-5.2/resolve/main/Fixhands_anime_bdsqlsz_V1.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Lora
