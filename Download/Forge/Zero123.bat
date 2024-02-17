@echo off
chcp 65001 > NUL

start "" https://huggingface.co/stabilityai/stable-zero123

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\stable-diffusion-webui-forge\models\z123

call %SDXL_WEB_UI%\setup\Download.bat . stable_zero123.ckpt ^
https://huggingface.co/stabilityai/stable-zero123/resolve/main/stable_zero123.ckpt
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\stable-diffusion-webui-forge\models\z123
