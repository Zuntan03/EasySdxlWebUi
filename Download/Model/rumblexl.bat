@echo off
chcp 65001 > NUL

start "" https://civitai.com/models/296650

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Model

call %SDXL_WEB_UI%\setup\Download.bat Anmg rumblexlAnimagineBased_v13.safetensors ^
https://civitai.com/api/download/models/400175
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Model
