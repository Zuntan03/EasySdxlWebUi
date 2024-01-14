@echo off
chcp 65001 > NUL

pushd %~dp0SdxlWebUi\setup\lib
if not exist GenImageViewer\ (
	call %~dp0SdxlWebUi\setup\SetGitPath.bat
	git clone https://github.com/Zuntan03/GenImageViewer.git
	copy /Y ..\res\GenImageViewer.json .\GenImageViewer\GenImageViewer.json
	if not exist %~dp0output\ ( mkdir %~dp0output )
)
popd rem %~dp0SdxlWebUi\setup\lib

pushd %~dp0SdxlWebUi\setup\lib\GenImageViewer
call GenImageViewer.bat
popd rem %~dp0SdxlWebUi\setup\lib\GenImageViewer
