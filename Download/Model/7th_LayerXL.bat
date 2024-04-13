@echo off
chcp 65001 > NUL

start "" https://huggingface.co/syaimu/7th_Layer_XL

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Model

call %SDXL_WEB_UI%\setup\Download.bat Anmg 7th_anime_XL-A-fp16.safetensors ^
https://huggingface.co/syaimu/7th_Layer_XL/resolve/main/7th_anime_XL-A-fp16.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat Pony 7th_anime_XL-B-fp16.safetensors ^
https://huggingface.co/syaimu/7th_Layer_XL/resolve/main/7th_anime_XL-B-fp16.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Model
