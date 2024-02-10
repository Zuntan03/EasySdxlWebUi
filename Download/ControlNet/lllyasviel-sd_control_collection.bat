@echo off
chcp 65001 > NUL

start "" https://huggingface.co/lllyasviel/sd_control_collection

pushd %~dp0..\..\SdxlWebUi\ControlNet

call %~dp0..\..\SdxlWebUi\setup\Download-HuggingFace.bat . lllyasviel/sd_control_collection *_xl_*
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..\..\SdxlWebUi\Lora
