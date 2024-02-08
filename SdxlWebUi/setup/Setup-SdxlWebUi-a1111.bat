@echo off
chcp 65001 > NUL

pushd %~dp0..

call %~dp0GitCloneOrPull.bat https://github.com/AUTOMATIC1111/stable-diffusion-webui
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0ActivateVirtualEnvironment.bat venv-a1111
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..

call %~dp0Setup-SdxlWebUi-Common.bat stable-diffusion-webui-forge a1111
if %errorlevel% neq 0 ( exit /b %errorlevel% )

pushd %~dp0..\stable-diffusion-webui\extensions

call %~dp0GitCloneOrPull.bat https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM dev なら LCM サンプラーがデフォルトで存在するが master にはない
call %~dp0GitCloneOrPull.bat https://github.com/continue-revolution/sd-webui-animatediff
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/Mikubill/sd-webui-controlnet
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..\stable-diffusion-webui\extensions
