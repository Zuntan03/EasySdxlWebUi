@echo off
chcp 65001 > NUL

if not exist %~dp0lib\ ( mkdir %~dp0lib )
pushd %~dp0lib
setlocal enabledelayedexpansion
if exist venv\ (
	call %~dp0ActivateVirtualEnvironment.bat
	if !errorlevel! neq 0 ( popd & exit /b !errorlevel! )
) else (
	call %~dp0ActivateVirtualEnvironment.bat
	if !errorlevel! neq 0 ( popd & exit /b !errorlevel! )

	pip install huggingface_hub
	if !errorlevel! neq 0 ( pause & popd & exit /b !errorlevel! )
)
endlocal
popd rem %~dp0lib

python %~dp0download_huggingface.py %*
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )