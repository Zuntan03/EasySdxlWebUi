@echo off
chcp 65001 > NUL

pushd %~dp0..

@REM set CONTROLNET_PY=stable-diffusion-webui-forge\extensions-builtin\sd_forge_controlnet\scripts\controlnet.py
@REM if exist %CONTROLNET_PY%.bak (
@REM 	echo move /Y %CONTROLNET_PY%.bak %CONTROLNET_PY% > NUL
@REM 	move /Y %CONTROLNET_PY%.bak %CONTROLNET_PY% > NUL
@REM )

call %~dp0GitCloneOrPull.bat https://github.com/lllyasviel/stable-diffusion-webui-forge main
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM forge Dora https://github.com/lllyasviel/stable-diffusion-webui-forge/pull/608
echo git -C stable-diffusion-webui-forge fetch origin pull/608/head:Dora
git -C stable-diffusion-webui-forge fetch origin pull/608/head:Dora
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM forge Dora https://github.com/lllyasviel/stable-diffusion-webui-forge/pull/608
echo git -C stable-diffusion-webui-forge checkout -f Dora
git -C stable-diffusion-webui-forge checkout -f Dora
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM forge dev2
@REM echo git -C stable-diffusion-webui-forge checkout dev2
@REM git -C stable-diffusion-webui-forge checkout dev2
@REM if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0ActivateVirtualEnvironment.bat venv-forge
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

echo python -m pip install -qq --upgrade pip
python -m pip install -qq --upgrade pip
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd rem %~dp0..

call %~dp0Setup-SdxlWebUi-Common.bat stable-diffusion-webui-forge forge
if %errorlevel% neq 0 ( exit /b %errorlevel% )

pushd %~dp0..\stable-diffusion-webui-forge\extensions

call %~dp0GitCloneOrPull.bat https://github.com/hinablue/adetailer
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/layerdiffusion/sd-forge-layerdiffuse
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

if exist sd-forge-layerdiffusion\ ( rmdir /S /Q sd-forge-layerdiffusion\ )

call %~dp0GitCloneOrPull.bat https://github.com/Haoming02/sd-forge-couple
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM call %~dp0GitCloneOrPull.bat https://github.com/continue-revolution/sd-forge-animatediff
@REM if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..\stable-diffusion-webui-forge\extensions
