@echo off
chcp 65001 > NUL

pushd %~dp0..

call %~dp0GitCloneOrPull.bat https://github.com/lllyasviel/stable-diffusion-webui-forge main
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM  forge b9705c5
echo git -C stable-diffusion-webui-forge checkout b9705c5
git -C stable-diffusion-webui-forge checkout b9705c5 2>NUL
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

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

@REM call %~dp0GitCloneOrPull.bat https://github.com/continue-revolution/sd-forge-animatediff
@REM if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..\stable-diffusion-webui-forge\extensions
