@echo off
chcp 65001 > NUL

start "" https://huggingface.co/2vXpSwA7/iroiro-lora
start "" https://note.com/2vxpswa7/n/n046c3e928f1e

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Lora

call %SDXL_WEB_UI%\setup\Download-HuggingFace.bat iroiro 2vXpSwA7/iroiro-lora sdxl/*
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

move /Y iroiro\sdxl\*.* iroiro
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

rmdir /S /Q iroiro\sdxl
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Lora
