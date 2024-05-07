@echo off
chcp 65001 > NUL

pushd %~dp0..

@REM forge dev2
echo git -C stable-diffusion-webui-forge checkout dev2
git -C stable-diffusion-webui-forge checkout dev2 2>NUL
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..
