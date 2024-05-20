@echo off
chcp 65001 > NUL

pushd %~dp0..

set CONTROLNET_PY=stable-diffusion-webui-forge\extensions-builtin\sd_forge_controlnet\scripts\controlnet.py
if exist %CONTROLNET_PY%.bak (
	echo move /Y %CONTROLNET_PY%.bak %CONTROLNET_PY% > NUL
	move /Y %CONTROLNET_PY%.bak %CONTROLNET_PY% > NUL
)

@REM forge Dora https://github.com/lllyasviel/stable-diffusion-webui-forge/pull/608
echo git -C stable-diffusion-webui-forge checkout Dora
git -C stable-diffusion-webui-forge checkout Dora
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..
