@echo off
chcp 65001 > NUL

start "" https://huggingface.co/tsukihara/xl_model

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Model

call %SDXL_WEB_UI%\setup\Download.bat Pony ebara_pony_2.1.safetensors ^
https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_2.1.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat Pony ebara_pony_2.1.png ^
https://huggingface.co/tsukihara/xl_model/resolve/main/sample/ebara_pony_2.jpg
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat Pony ebara_pony_2.safetensors ^
https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_2.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat Pony ebara_pony_2.png ^
https://huggingface.co/tsukihara/xl_model/resolve/main/sample/ebara_pony_2.jpg
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat Pony ebara_pony_1.bakedVAE.safetensors ^
https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_1.bakedVAE.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat Pony ebara_pony_1.bakedVAE.png ^
https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_1.png
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM call %SDXL_WEB_UI%\setup\Download.bat Pony ebara_pony_1.safetensors ^
@REM https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_1.safetensors
@REM if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM call %SDXL_WEB_UI%\setup\Download.bat Pony ebara_pony_1.png ^
@REM https://huggingface.co/tsukihara/xl_model/resolve/main/ebara_pony_1.png
@REM if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Model
