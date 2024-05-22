@echo off
chcp 65001 > NUL

pushd %~dp0..

@REM set CONTROLNET_PY=stable-diffusion-webui-forge\extensions-builtin\sd_forge_controlnet\scripts\controlnet.py
@REM if exist %CONTROLNET_PY%.bak (
@REM 	echo move /Y %CONTROLNET_PY%.bak %CONTROLNET_PY% > NUL
@REM 	move /Y %CONTROLNET_PY%.bak %CONTROLNET_PY% > NUL
@REM )

echo git -C stable-diffusion-webui-forge checkout -f main
git -C stable-diffusion-webui-forge checkout -f main
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..
