@echo off
chcp 65001 > NUL

pushd %~dp0..

call %~dp0GitCloneOrPull.bat https://github.com/AUTOMATIC1111/stable-diffusion-webui master
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM a1111 PerfBundle https://github.com/AUTOMATIC1111/stable-diffusion-webui/pull/15821
echo git -C stable-diffusion-webui fetch origin pull/15821/head:PerfBundle
git -C stable-diffusion-webui fetch origin pull/15821/head:PerfBundle
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0ActivateVirtualEnvironment.bat venv-a1111
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

echo python -m pip install -qq --upgrade pip
python -m pip install -qq --upgrade pip
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd rem %~dp0..

call %~dp0Setup-SdxlWebUi-Common.bat stable-diffusion-webui a1111
if %errorlevel% neq 0 ( exit /b %errorlevel% )

pushd %~dp0..\stable-diffusion-webui\extensions

call %~dp0GitCloneOrPull.bat https://github.com/Bing-su/adetailer
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM call %~dp0GitCloneOrPull.bat https://github.com/continue-revolution/sd-webui-animatediff
@REM if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/Mikubill/sd-webui-controlnet
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )


popd rem %~dp0..\stable-diffusion-webui\extensions
