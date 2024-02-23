@echo off
chcp 65001 > NUL

pushd %~dp0..

call %~dp0GitCloneOrPull.bat https://github.com/lllyasviel/stable-diffusion-webui-forge
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0ActivateVirtualEnvironment.bat venv-forge
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..

call %~dp0Setup-SdxlWebUi-Common.bat stable-diffusion-webui-forge forge
if %errorlevel% neq 0 ( exit /b %errorlevel% )

pushd %~dp0..\stable-diffusion-webui-forge\extensions

call %~dp0GitCloneOrPull.bat https://github.com/hinablue/adetailer
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM call %~dp0GitCloneOrPull.bat https://github.com/continue-revolution/sd-forge-animatediff
@REM if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..\stable-diffusion-webui-forge\extensions
