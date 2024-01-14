@echo off
chcp 65001 > NUL

if not exist %~dp0SdxlWebUi\setup\lib\lama-cleaner\ (
	mkdir %~dp0SdxlWebUi\setup\lib\lama-cleaner
	pushd %~dp0SdxlWebUi\setup\lib\lama-cleaner
	call %~dp0SdxlWebUi\setup\ActivateVirtualEnvironment.bat
	pip install torch==1.13.1+cu117 torchvision==0.14.1 --extra-index-url https://download.pytorch.org/whl/cu117
	pip install lama-cleaner
	popd rem %~dp0SdxlWebUi\setup\lib\lama-cleaner
)

pushd %~dp0SdxlWebUi\setup\lib\lama-cleaner
call %~dp0SdxlWebUi\setup\ActivateVirtualEnvironment.bat
start http://127.0.0.1:7859/
echo http://127.0.0.1:7859/
lama-cleaner --model=lama --port=7859 --device=cpu
popd rem %~dp0SdxlWebUi\setup\lib\lama-cleaner
