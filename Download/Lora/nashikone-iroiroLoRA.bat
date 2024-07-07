@echo off
chcp 65001 > NUL

start "" https://huggingface.co/nashikone/iroiroLoRA/blob/main/Animagine-xl_3.0_LoRAReadme.txt
start "" https://huggingface.co/nashikone/iroiroLoRA/blob/main/ponyDiffusionV6XL_LoRAReadme.txt

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Lora

call %SDXL_WEB_UI%\setup\Download-HuggingFace.bat nashikone nashikone/iroiroLoRA
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Lora
