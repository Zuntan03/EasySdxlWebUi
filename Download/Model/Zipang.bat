@echo off
chcp 65001 > NUL

start "" https://huggingface.co/deadman44/SDXL_Photoreal_Merged_Models

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Model

call %SDXL_WEB_UI%\setup\Download.bat Anmg zipang_XL_test3.1.fp16.safetensors ^
https://huggingface.co/deadman44/SDXL_Photoreal_Merged_Models/resolve/main/zipang_XL_test3.1.fp16.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat Pony ponypang_XL_test02.fp16.safetensors ^
https://huggingface.co/deadman44/SDXL_Photoreal_Merged_Models/resolve/main/ponypang_XL_test02.fp16.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Model

pushd %SDXL_WEB_UI%\Lora

call %SDXL_WEB_UI%\setup\Download.bat Zipang myjc_v1_XL.safetensors ^
https://huggingface.co/deadman44/SDXL_Photoreal_Merged_Models/resolve/main/myjc_v1_XL.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat Zipang myjs_XL_zipang_test03.safetensors ^
https://huggingface.co/deadman44/SDXL_Photoreal_Merged_Models/resolve/main/myjs_XL_zipang_test03.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat Zipang myjs_XL_popang02.safetensors ^
https://huggingface.co/deadman44/SDXL_Photoreal_Merged_Models/resolve/main/myjs_XL_popang02.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Lora
