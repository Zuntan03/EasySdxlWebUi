@echo off
chcp 65001 > NUL

if "%~1"=="" (
	echo "他の場所にインストールした stable-diffusion-webui\embeddings\ などをドラッグ＆ドロップしてください。"
	echo "ドロップしたフォルダへのリンクを作成して、リンク先のファイルを利用できるようにします。"
	pause & exit /b 1
)

call %~dp0..\setup\Link.bat "%~dp0%~nx1" "%~1"
if %errorlevel% neq 0 ( exit /b %errorlevel% )
