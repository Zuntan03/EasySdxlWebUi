@echo off
chcp 65001 > NUL

setlocal enabledelayedexpansion
if not exist %~dp0SdxlWebUi\stable-diffusion-webui-forge\ (
	echo call %~dp0SdxlWebUi\setup\Setup-SdxlWebUi-forge.bat
	call %~dp0SdxlWebUi\setup\Setup-SdxlWebUi-forge.bat
	if !errorlevel! neq 0 ( exit /b !errorlevel! )
)
endlocal

pushd %~dp0SdxlWebUi\stable-diffusion-webui-forge\

set PYTHON=%~dp0SdxlWebUi\venv-forge\Scripts\python.exe
set VENV_DIR=%~dp0SdxlWebUi\venv-forge
set GIT=
where /Q git
if %ERRORLEVEL% neq 0 (
	set GIT=%~dp0SdxlWebUi\setup\lib\PortableGit\bin\git.exe
)

set CKPT_DIR=../Model
set VAE_PATH=../Vae
set EMBEDDINGS_DIR=../Embedding
set LORA_DIR=../Lora

set COMMANDLINE_ARGS=^
	--ckpt-dir %CKPT_DIR%^
	--vae-dir %VAE_PATH%^
	--embeddings-dir %EMBEDDINGS_DIR%^
	--lora-dir %LORA_DIR%^
	%~1

call webui.bat

popd rem %~dp0SdxlWebUi\stable-diffusion-webui-forge\
