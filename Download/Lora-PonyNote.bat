@echo off
chcp 65001 > NUL

set NOTE_URL=https://rentry.org/ponyxl_loras_n_stuff
set PS1_URL=https://files.catbox.moe/2kiajb.ps1
set PONY_DIR=..\SdxlWebUi\Lora\pony_note

if exist %~dp0..\SdxlWebUi\Lora\ (
	if not exist %PONY_DIR%\ ( mkdir %PONY_DIR% )
) else (
	set PONY_DIR=.
)

set CURL_CMD=C:\Windows\System32\curl.exe
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

echo "LoRA 一覧からダウンロード対象を数値による個別指定か「a」の全指定で選び、「c」でダウンロードを開始します。"
echo "何かキーを押すと LoRA 一覧をダウンロードして、ダウンロード対象の選択画面に進みます。"
pause

start "" %NOTE_URL%

echo %CURL_CMD% -Lo %~dp0Lora-PonyNote.ps1 %PS1_URL%
%CURL_CMD% -Lo %~dp0Lora-PonyNote.ps1 %PS1_URL%
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )

echo %PS_CMD% -File %~dp0Lora-PonyNote.ps1 %PONY_DIR%
%PS_CMD% -File %~dp0Lora-PonyNote.ps1 %PONY_DIR%
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )
