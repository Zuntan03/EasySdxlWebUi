@echo off
chcp 65001 > NUL
set DL_CMD=%~dp0..\..\SdxlWebUi\setup\Download.bat

start "" https://huggingface.co/stabilityai/stable-zero123

pushd %~dp0..\..\SdxlWebUi\stable-diffusion-webui-forge\models\z123
call %DL_CMD% . stable_zero123.ckpt ^
https://huggingface.co/stabilityai/stable-zero123/resolve/main/stable_zero123.ckpt
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
popd
