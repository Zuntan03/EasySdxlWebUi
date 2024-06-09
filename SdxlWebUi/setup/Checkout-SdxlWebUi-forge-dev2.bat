@echo off
chcp 65001 > NUL

pushd %~dp0..

@REM forge dev2
echo git -C stable-diffusion-webui-forge checkout -b dev2_77bdb92 77bdb92
git -C stable-diffusion-webui-forge checkout -b dev2_77bdb92 77bdb92
if %errorlevel% neq 0 (
	echo git -C stable-diffusion-webui-forge checkout -f dev2_77bdb92
	git -C stable-diffusion-webui-forge checkout -f dev2_77bdb92
)
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd rem %~dp0..
