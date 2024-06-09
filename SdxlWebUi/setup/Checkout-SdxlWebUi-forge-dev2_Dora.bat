@echo off
chcp 65001 > NUL

pushd %~dp0..

@REM forge dev2_Dora 
echo git -C stable-diffusion-webui-forge checkout -b dev2_77bdb92_Dora 77bdb92
git -C stable-diffusion-webui-forge checkout -b dev2_77bdb92_Dora 77bdb92
if %errorlevel% neq 0 (
	echo git -C stable-diffusion-webui-forge checkout -f dev2_77bdb92_Dora
	git -C stable-diffusion-webui-forge checkout -f dev2_77bdb92_Dora
)
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM forge Dora https://github.com/lllyasviel/stable-diffusion-webui-forge/pull/608
echo git -C stable-diffusion-webui-forge merge --no-edit Dora
git -C stable-diffusion-webui-forge merge --no-edit Dora
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )
@REM cd > NUL

popd rem %~dp0..
