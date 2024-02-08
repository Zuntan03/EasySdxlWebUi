@echo off
chcp 65001 > NUL

set CURL_CMD=C:\Windows\System32\curl.exe

if not exist %CURL_CMD% (
	echo [ERROR] %CURL_CMD% が見つかりません。
	pause & exit /b 1
)

%CURL_CMD% -Lo %~dp0\..\..\SdxlWebUi\stable-diffusion-webui-forge\models\z123\stable_zero123.ckpt ^
https://huggingface.co/stabilityai/stable-zero123/resolve/main/stable_zero123.ckpt
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )
