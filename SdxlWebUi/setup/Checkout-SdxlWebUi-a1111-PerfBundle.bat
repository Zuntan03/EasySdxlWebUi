@echo off
chcp 65001 > NUL

pushd %~dp0..

@REM a1111 PerfBundle https://github.com/AUTOMATIC1111/stable-diffusion-webui/pull/15821
echo git -C stable-diffusion-webui checkout PerfBundle
git -C stable-diffusion-webui checkout PerfBundle
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..
