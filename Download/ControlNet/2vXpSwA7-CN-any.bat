@echo off
chcp 65001 > NUL

start "" https://huggingface.co/2vXpSwA7/iroiro-lora

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\ControlNet

call %SDXL_WEB_UI%\setup\Download.bat . cnlllite-anystyle_v3-step00004000.safetensors ^
https://huggingface.co/2vXpSwA7/iroiro-lora/resolve/main/test_controlnet/cnlllite-anystyle_v3-step00004000.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat . CN-anytest_v1_fp16.safetensors ^
https://huggingface.co/2vXpSwA7/iroiro-lora/resolve/main/test_controlnet/CN-anytest_v1_fp16.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download-HuggingFace.bat . 2vXpSwA7/iroiro-lora test_controlnet2/CN-anytest_v3-50000_*.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download-HuggingFace.bat . 2vXpSwA7/iroiro-lora test_controlnet2/CN-anytest_v4-marged_*.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Lora
