@echo off
chcp 65001 > NUL
pushd %~dp0
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

set CURL_CMD=C:\Windows\System32\curl.exe
if not exist %CURL_CMD% (
	echo [ERROR] %CURL_CMD% が見つかりません。
	pause & popd & exit /b 1
)

setlocal enabledelayedexpansion
if exist SdxlWebUi\venv-forge\ (
	echo "更新に時間がかかりますが、安全のために SdxlWebUi\venv-forge\ を削除しますか？"
	echo "SdxlWebUi\venv-forge\ 削除せずに更新したあとに問題が発生した場合は、再度更新をして SdxlWebUi\venv-forge\ を削除してください。"
	echo "SdxlWebUi\venv-forge\ を削除しますか？ [y/n]"
	set /p YES_OR_NO=
	if /i "!YES_OR_NO!" == "y" (
		echo rmdir /SQ SdxlWebUi\venv-forge\
		rmdir /SQ SdxlWebUi\venv-forge\
		if !errorlevel! neq 0 ( pause & popd & exit /b !errorlevel! )
	)
) else (
	echo "以下の配布元から関連ファイルをダウンロードして使用します（URL を Ctrl + クリックで開けます）。"
	echo https://www.python.org
	echo https://github.com/pypa/get-pip
	echo https://github.com/git-for-windows
	echo https://github.com/lllyasviel/stable-diffusion-webui-forge
	echo.
	echo https://huggingface.co/cagliostrolab/animagine-xl-3.0
	echo https://civitai.com/models/257749
	echo https://huggingface.co/madebyollin/sdxl-vae-fp16-fix/
	echo https://civitai.com/models/119032
	echo https://huggingface.co/gsdf/CounterfeitXL
	echo https://huggingface.co/furusu/SD-LoRA
	echo https://huggingface.co/latent-consistency/lcm-lora-sdxl
	echo https://huggingface.co/2vXpSwA7/iroiro-lora
	echo https://huggingface.co/lllyasviel/sd_control_collection
	echo.
	echo https://github.com/DominikDoom/a1111-sd-webui-tagcomplete
	echo https://github.com/Bing-su/adetailer
	echo https://github.com/adieyal/sd-dynamic-prompts
	echo https://github.com/blue-pen5805/sdweb-easy-prompt-selector
	echo https://github.com/hako-mikan/sd-webui-cd-tuner
	echo https://github.com/hnmr293/sd-webui-cutoff
	echo https://github.com/hako-mikan/sd-webui-lora-block-weight
	echo https://github.com/hako-mikan/sd-webui-negpip
	echo https://github.com/hako-mikan/sd-webui-traintrain
	echo https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper
	echo https://github.com/Katsuyuki-Karasawa/stable-diffusion-webui-localization-ja_JP
	echo https://github.com/arenasys/stable-diffusion-webui-model-toolkit
	echo https://github.com/picobyte/stable-diffusion-webui-wd14-tagger
	echo https://github.com/hako-mikan/sd-webui-supermerger
	echo.
	echo https://huggingface.co/spaces/Linaqruf/animagine-xl
	echo https://br-d.fanbox.cc/posts/5680274
	echo https://rentry.org/NAIwildcards
	echo https://rentry.co/NAIDv3artisttagtestoverview
	echo https://civitai.com/models/236447/based68
	echo https://rentry.org/ponyxl_loras_n_stuff
	echo https://huggingface.co/Zuntan/dist
	echo よろしいですか？ [y/n]
	set /p YES_OR_NO=
	if /i not "!YES_OR_NO!" == "y" ( popd & exit /b 1 )
)
endlocal

if not exist SdxlWebUi\setup\lib\ ( mkdir SdxlWebUi\setup\lib )

echo %CURL_CMD% -Lo SdxlWebUi\setup\lib\EasySdxlWebUi.zip https://github.com/Zuntan03/EasySdxlWebUi/archive/refs/heads/main.zip
%CURL_CMD% -Lo SdxlWebUi\setup\lib\EasySdxlWebUi.zip https://github.com/Zuntan03/EasySdxlWebUi/archive/refs/heads/main.zip
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

echo %PS_CMD% Expand-Archive -Path SdxlWebUi\setup\lib\EasySdxlWebUi.zip -DestinationPath SdxlWebUi\setup\lib -Force
%PS_CMD% Expand-Archive -Path SdxlWebUi\setup\lib\EasySdxlWebUi.zip -DestinationPath SdxlWebUi\setup\lib -Force
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

echo del SdxlWebUi\setup\lib\EasySdxlWebUi.zip
del SdxlWebUi\setup\lib\EasySdxlWebUi.zip
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

echo /QSY .\SdxlWebUi\setup\lib\EasySdxlWebUi-main\ .
xcopy /QSY .\SdxlWebUi\setup\lib\EasySdxlWebUi-main\ .
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

echo copy /Y .\SdxlWebUi\setup\Install-EasySdxlWebUi-a1111.bat .\SdxlWebUi-Update-a1111.bat
copy /Y .\SdxlWebUi\setup\Install-EasySdxlWebUi-a1111.bat .\SdxlWebUi-Update-a1111.bat
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

echo copy /Y .\SdxlWebUi\setup\Install-EasySdxlWebUi-forge.bat .\SdxlWebUi-Update-forge.bat
copy /Y .\SdxlWebUi\setup\Install-EasySdxlWebUi-forge.bat .\SdxlWebUi-Update-forge.bat
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

call SdxlWebUi\setup\Setup-SdxlWebUi-forge.bat
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

start "" SdxlWebUi-forge.bat

popd rem %~dp0

if exist %~dp0Install-EasySdxlWebUi-forge.bat ( del %~dp0Install-EasySdxlWebUi-forge.bat )
