@echo off
chcp 65001 > NUL

start "" https://huggingface.co/toynya/Z3D-E621-Convnext

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\TaggerOnnx

call %SDXL_WEB_UI%\setup\Download.bat Z3D-E621-Convnext Z3D-E621-Convnext.onnx ^
https://huggingface.co/toynya/Z3D-E621-Convnext/resolve/main/model.onnx
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat Z3D-E621-Convnext tags-selected.csv ^
https://huggingface.co/toynya/Z3D-E621-Convnext/resolve/main/tags-selected.csv
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\TaggerOnnx
