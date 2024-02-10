@echo off
chcp 65001 > NUL

start "" https://huggingface.co/2vXpSwA7/iroiro-lora
start "" https://note.com/2vxpswa7/n/n046c3e928f1e

pushd %~dp0..\..\SdxlWebUi\Lora

call %~dp0..\..\SdxlWebUi\setup\Download-HuggingFace.bat iroiro 2vXpSwA7/iroiro-lora sdxl/*
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

move /Y iroiro\sdxl\*.* iroiro
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

rmdir /S /Q iroiro\sdxl
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd rem %~dp0..\..\SdxlWebUi\Lora
