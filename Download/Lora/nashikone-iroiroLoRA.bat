@echo off
chcp 65001 > NUL

start "" https://huggingface.co/nashikone/iroiroLoRA/blob/main/Animagine-xl_3.0/Animagine-xl_3.0_LoRAReadme.txt
start "" https://huggingface.co/nashikone/iroiroLoRA/blob/main/PonyDiffusionV6XL/ponyDiffusionV6XL_LoRAReadme%%20.txt

pushd %~dp0..\..\SdxlWebUi\Lora

call %~dp0..\..\SdxlWebUi\setup\Download-HuggingFace.bat nashikone nashikone/iroiroLoRA
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..\..\SdxlWebUi\Lora
