@echo off
chcp 65001 > NUL

start "" https://huggingface.co/tsukihara/xl_model

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Model

@REM call %SDXL_WEB_UI%\setup\Download.bat Pony ebara_pony_1.bakedVAE.safetensorss ^
@REM https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_1.bakedVAE.safetensors
@REM if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM call %SDXL_WEB_UI%\setup\Download.bat Pony ebara_pony_1.bakedVAE.png ^
@REM https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_1.png
@REM if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat Pony ebara_pony_1.safetensors ^
https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_1.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat Pony ebara_pony_1.png ^
https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_1.png
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Model
