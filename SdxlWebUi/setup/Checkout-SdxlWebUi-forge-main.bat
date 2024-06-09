@echo off
chcp 65001 > NUL

pushd %~dp0..

@REM forge main https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/801
echo git -C stable-diffusion-webui-forge checkout -b main_29be1da 29be1da
git -C stable-diffusion-webui-forge checkout -b main_29be1da 29be1da
if %errorlevel% neq 0 (
	echo git -C stable-diffusion-webui-forge checkout -f main_29be1da
	git -C stable-diffusion-webui-forge checkout -f main_29be1da
)
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd rem %~dp0..
