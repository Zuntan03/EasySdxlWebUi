@echo off
chcp 65001 > NUL

start "" https://huggingface.co/cagliostrolab/animagine-xl-3.1
start "" https://cagliostrolab.net/posts/animagine-xl-v31-release

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Model

call %SDXL_WEB_UI%\setup\Download.bat Anmg animagine-xl-3.1.safetensors ^
https://huggingface.co/cagliostrolab/animagine-xl-3.1/resolve/main/animagine-xl-3.1.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Model
