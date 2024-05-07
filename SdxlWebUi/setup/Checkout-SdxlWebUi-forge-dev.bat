@echo off
chcp 65001 > NUL

pushd %~dp0..

set CONTROLNET_PY=stable-diffusion-webui-forge\extensions-builtin\sd_forge_controlnet\scripts\controlnet.py
if exist %CONTROLNET_PY%.bak (
	echo move /Y %CONTROLNET_PY%.bak %CONTROLNET_PY% > NUL
	move /Y %CONTROLNET_PY%.bak %CONTROLNET_PY% > NUL
)

@REM forge dev
echo git -C stable-diffusion-webui-forge checkout dev
git -C stable-diffusion-webui-forge checkout dev
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..
