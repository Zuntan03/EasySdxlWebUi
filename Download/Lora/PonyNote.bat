@echo off
chcp 65001 > NUL

set NOTE_URL=https://rentry.org/ponyxl_loras_n_stuff
set PS1_URL=https://files.catbox.moe/2kiajb.ps1
set PONY_DIR=..\..\SdxlWebUi\Lora\pony_note

if exist "%~dp0..\..\SdxlWebUi\Lora\" (
	if not exist %PONY_DIR%\ ( mkdir %PONY_DIR% )
) else (
	set PONY_DIR=.
)

set CURL_CMD=C:\Windows\System32\curl.exe
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

if not exist %CURL_CMD% (
	echo [ERROR] %CURL_CMD% が見つかりません。
	pause & exit /b 1
)

echo "PonyXL Notes の LoRA 一覧からダウンロードしたい LoRA を選びます。"
echo "数値による個別指定か「a」の全指定で LoRA を選び、「c」でダウンロードを開始します。"
echo.
echo "LoRA のトリガーワードは基本不要です。"
echo "一部のトリガーワードが必要な LoRA は PonyXL Notes に注釈があります。"
echo.
echo "何かキーを押すと PonyXL Notes を開き、ダウンロード対象の選択画面に進みます。"
echo.
pause

start "" %NOTE_URL%

echo %CURL_CMD% -k -Lo "%~dp0PonyNote.ps1" %PS1_URL%
%CURL_CMD% -k -Lo "%~dp0PonyNote.ps1" %PS1_URL%
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )

echo %PS_CMD% -File "%~dp0PonyNote.ps1" %PONY_DIR%
%PS_CMD% -File "%~dp0PonyNote.ps1" %PONY_DIR%
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )
