@echo off
chcp 65001 > NUL

start "" https://twitter.com/8co28/status/1793460439059485169

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\ControlNet

call %SDXL_WEB_UI%\setup\Download.bat . controlnet852AClone_v10.safetensors ^
https://civitai.com/api/download/models/515749
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat . controlnet852A_normal.safetensors ^
https://civitai.com/api/download/models/507015
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat . controlnet852A_hard.safetensors ^
https://civitai.com/api/download/models/506983
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat . controlnet852A_veryhard.safetensors ^
https://civitai.com/api/download/models/506961
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Lora
