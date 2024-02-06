@echo off
chcp 65001 > NUL

echo SdxlWebUi の設定を更新しますか？ [y/n]
set /p YES_OR_NO=
if /i not "%YES_OR_NO%" == "y" ( popd & exit /b 1 )

pushd %~dp0SdxlWebUi

call setup\ActivateVirtualEnvironment.bat
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

call :UPDATE_JSON setup\res\config.json stable-diffusion-webui\config.json
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :UPDATE_JSON setup\res\ui-config.json stable-diffusion-webui\ui-config.json
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0SdxlWebUi
exit /b 0

:UPDATE_JSON
set SRC_JSON=%1
set DST_JSON=%2

if not exist %DST_JSON% (
	copy /Y %SRC_JSON% %DST_JSON% > NUL
	exit /b 0
)

python setup\update_json.py %SRC_JSON% %DST_JSON%
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )

exit /b 0
