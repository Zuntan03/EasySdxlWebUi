@echo off
chcp 65001 > NUL

setlocal enabledelayedexpansion
if not exist %~dp0SdxlWebUi\stable-diffusion-webui-forge\ (
	echo call %~dp0SdxlWebUi\setup\Setup-SdxlWebUi-forge.bat
	call %~dp0SdxlWebUi\setup\Setup-SdxlWebUi-forge.bat
	if !errorlevel! neq 0 ( exit /b !errorlevel! )
)
if not exist %~dp0SdxlWebUi\venv-forge\ (
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
if %ERRORLEVEL% neq 0 ( set GIT=%~dp0SdxlWebUi\setup\lib\PortableGit\bin\git.exe )

set COMMANDLINE_ARGS=--gradio-allowed-path .. %*

%PYTHON% %~dp0SdxlWebUi\setup\update_json.py %~dp0SdxlWebUi\config.json config.json
if %errorlevel% neq 0 ( pause popd & exit /b %errorlevel% )

%PYTHON% %~dp0SdxlWebUi\setup\update_json.py %~dp0SdxlWebUi\ui-config.json ui-config.json
if %errorlevel% neq 0 ( pause popd & exit /b %errorlevel% )

echo webui.bat %COMMANDLINE_ARGS%
call webui.bat

popd rem %~dp0SdxlWebUi\stable-diffusion-webui-forge\
