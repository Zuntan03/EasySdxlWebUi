@echo off
chcp 65001 > NUL

pushd %~dp0..

@REM set CONTROLNET_PY=stable-diffusion-webui-forge\extensions-builtin\sd_forge_controlnet\scripts\controlnet.py
@REM if exist %CONTROLNET_PY%.bak (
@REM 	echo move /Y %CONTROLNET_PY%.bak %CONTROLNET_PY% > NUL
@REM 	move /Y %CONTROLNET_PY%.bak %CONTROLNET_PY% > NUL
@REM )

@REM forge dev2_Dora 
echo git -C stable-diffusion-webui-forge checkout -b dev2_Dora dev2
git -C stable-diffusion-webui-forge checkout -b dev2_Dora dev2
if %errorlevel% neq 0 (
	echo git -C stable-diffusion-webui-forge checkout -f dev2_Dora
	git -C stable-diffusion-webui-forge checkout -f dev2_Dora
)

@REM forge Dora https://github.com/lllyasviel/stable-diffusion-webui-forge/pull/608
echo git -C stable-diffusion-webui-forge merge Dora
git -C stable-diffusion-webui-forge merge Dora
@REM if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
cd > NUL

@REM echo copy /Y %CONTROLNET_PY% %CONTROLNET_PY%.bak
@REM copy /Y %CONTROLNET_PY% %CONTROLNET_PY%.bak > NUL
@REM set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass
@REM echo %PS_CMD% "try { &{(Get-Content '%CONTROLNET_PY%') -replace 'from lib_controlnet.enums import HiResFixOption', 'from lib_controlnet.enums import HiResFixOption, InputMode' | Set-Content '%CONTROLNET_PY%' } } catch { exit 1 }"
@REM %PS_CMD% "try { &{(Get-Content '%CONTROLNET_PY%') -replace 'from lib_controlnet.enums import HiResFixOption', 'from lib_controlnet.enums import HiResFixOption, InputMode' | Set-Content '%CONTROLNET_PY%' } } catch { exit 1 }"
@REM if %errorlevel% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0..
