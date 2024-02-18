@echo off
chcp 65001 > NUL

set FC_CMD=C:\Windows\System32\fc.exe
set SRC_CONFIG=%~dp0config.json
set DST_CONFIG=%~1

if not exist "%SRC_CONFIG%" (
	echo "%SRC_CONFIG% が見つかりません。"
	pause & exit /b 1
)

if "%DST_CONFIG%" == "" (
	echo "すぐ横の config.json をコピー(Ctrl + C, Ctrl + V)してから Web UI で設定を保存します。"
	echo "config - コピー.json をこの config Diff.bat にドラッグ＆ドロップして、差分を SdxlWebUi/config.json に書き足してください。"
	pause & exit /b 1
)

%FC_CMD% "%SRC_CONFIG%" "%DST_CONFIG%"
pause
