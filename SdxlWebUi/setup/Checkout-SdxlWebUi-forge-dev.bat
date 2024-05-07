@echo off
chcp 65001 > NUL

pushd %~dp0..

@REM forge dev
echo git -C stable-diffusion-webui-forge checkout dev
git -C stable-diffusion-webui-forge checkout dev 2>NUL
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..
