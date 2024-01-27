@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

call %~dp0SetGitPath.bat
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

pushd %~dp0..

call :GIT_CLONE_OR_PULL https://github.com/AUTOMATIC1111/stable-diffusion-webui
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0ActivateVirtualEnvironment.bat
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Model
call :CURL_DL Model\ animagine-xl-3.0.safetensors ^
https://huggingface.co/cagliostrolab/animagine-xl-3.0/resolve/main/animagine-xl-3.0.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM call :CURL_DL Model\ ponyDiffusionV6XL_v6StartWithThisOne.safetensors https://civitai.com/api/download/models/290640
call :CURL_DL Model\ ponyDiffusionV6XL_v6StartWithThisOne.safetensors https://huggingface.co/AstraliteHeart/pony-diffusion-v6/resolve/main/v6.safetensors?download=true
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Vae
call :CURL_DL Vae\ sdxl_vae.safetensors ^
https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :CURL_DL Vae\ ponyDiffusionV6XL_vae.safetensors "https://civitai.com/api/download/models/290640?type=VAE"
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

if not exist Embedding ( mkdir Embedding )

@REM LCM LoRA
call :CURL_DL Lora\lcm lcm-animagine-3.safetensors ^
https://huggingface.co/furusu/SD-LoRA/resolve/main/lcm-animagine-3.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :CURL_DL Lora\lcm lcm-lora-sdxl.safetensors ^
https://huggingface.co/latent-consistency/lcm-lora-sdxl/resolve/main/pytorch_lora_weights.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Detail LoRA
call :CURL_DL Lora\detail sdxl-flat.safetensors ^
https://huggingface.co/2vXpSwA7/iroiro-lora/resolve/main/sdxl/sdxl-flat.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :CURL_DL Lora\detail sdxl-hairdetailer_01.safetensors ^
https://huggingface.co/2vXpSwA7/iroiro-lora/resolve/main/sdxl/sdxl-hairdetailer_01.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :CURL_DL Lora\detail sdxl-hairdetailer_02.safetensors ^
https://huggingface.co/2vXpSwA7/iroiro-lora/resolve/main/sdxl/sdxl-hairdetailer_02.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM ControlNet
call :CURL_DL ControlNet ip-adapter_xl.pth ^
https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_xl.pth
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM config
if not exist stable-diffusion-webui\config.json ( copy /Y %~dp0setup\res\config.json stable-diffusion-webui\config.json > NUL )
if not exist stable-diffusion-webui\ui-config.json ( copy /Y %~dp0setup\res\ui-config.json stable-diffusion-webui\ui-config.json > NUL )
if not exist stable-diffusion-webui\styles.csv ( copy /Y %~dp0setup\res\styles.csv stable-diffusion-webui\styles.csv > NUL )

popd rem %~dp0..
pushd %~dp0..\stable-diffusion-webui\extensions

call :GIT_CLONE_OR_PULL https://github.com/DominikDoom/a1111-sd-webui-tagcomplete
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :GIT_CLONE_OR_PULL https://github.com/Bing-su/adetailer
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :GIT_CLONE_OR_PULL https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :GIT_CLONE_OR_PULL https://github.com/adieyal/sd-dynamic-prompts
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :GIT_CLONE_OR_PULL https://github.com/blue-pen5805/sdweb-easy-prompt-selector
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM dev なら LCM サンプラーがデフォルトで存在するが master にはない
call :GIT_CLONE_OR_PULL https://github.com/continue-revolution/sd-webui-animatediff
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM f8 未対応っぽい
call :GIT_CLONE_OR_PULL https://github.com/hako-mikan/sd-webui-cd-tuner
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :GIT_CLONE_OR_PULL https://github.com/Mikubill/sd-webui-controlnet
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :GIT_CLONE_OR_PULL https://github.com/hnmr293/sd-webui-cutoff
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :GIT_CLONE_OR_PULL https://github.com/hako-mikan/sd-webui-lora-block-weight
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM f8 未対応っぽい
call :GIT_CLONE_OR_PULL https://github.com/hako-mikan/sd-webui-negpip
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :GIT_CLONE_OR_PULL https://github.com/hako-mikan/sd-webui-traintrain
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :GIT_CLONE_OR_PULL https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :GIT_CLONE_OR_PULL https://github.com/Katsuyuki-Karasawa/stable-diffusion-webui-localization-ja_JP
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :GIT_CLONE_OR_PULL https://github.com/arenasys/stable-diffusion-webui-model-toolkit
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :GIT_CLONE_OR_PULL https://github.com/picobyte/stable-diffusion-webui-wd14-tagger
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM dev で起動時エラー
call :GIT_CLONE_OR_PULL https://github.com/hako-mikan/sd-webui-supermerger
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM LoraBlockWeight プリセット
copy /Y %~dp0res\lora_block_weight\lbwpresets.txt sd-webui-lora-block-weight\scripts\ > NUL
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM EasyPromptSelector
xcopy /SQY %~dp0res\easy_prompt_selector\ sdweb-easy-prompt-selector\tags\ > NUL

@REM Wildcard
xcopy /SQY %~dp0res\wildcards\ sd-dynamic-prompts\wildcards\ > NUL

call :CURL_DL sd-dynamic-prompts\wildcards\animagine character.txt ^
https://huggingface.co/spaces/Linaqruf/animagine-xl/resolve/main/wildcard/character.txt
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

setlocal enabledelayedexpansion
if not exist sd-dynamic-prompts\wildcards\bd\ (
	echo %CURL_CMD% -Lo %~dp0lib\bd.zip https://downloads.fanbox.cc/files/post/5680274/IUTQ62gtRAYNNIQHMwWtm5Mg.zip
	%CURL_CMD% -Lo %~dp0lib\bd.zip https://downloads.fanbox.cc/files/post/5680274/IUTQ62gtRAYNNIQHMwWtm5Mg.zip
	if !errorlevel! neq 0 ( pause & popd & exit /b !errorlevel! )

	echo %PS_CMD% "try { Expand-Archive -Path %~dp0lib\bd.zip  -DestinationPath %~dp0lib\bd\ -Force } catch { exit 1 }"
	%PS_CMD% "try { Expand-Archive -Path %~dp0lib\bd.zip  -DestinationPath %~dp0lib\bd\ -Force } catch { exit 1 }"
	if !errorlevel! neq 0 ( pause & popd & exit /b !errorlevel! )
	del /q %~dp0lib\bd.zip

	%PS_CMD% -File %~dp0EpsCategory2Wildcard.ps1 %~dp0lib\bd\BD_エフェクト.yml
	%PS_CMD% -File %~dp0EpsCategory2Wildcard.ps1 %~dp0lib\bd\BD_コーデ.yml
	%PS_CMD% -File %~dp0EpsCategory2Wildcard.ps1 %~dp0lib\bd\BD_ファンタジコーデ.yml
	%PS_CMD% -File %~dp0EpsCategory2Wildcard.ps1 %~dp0lib\bd\BD_感情.yml
	%PS_CMD% -File %~dp0EpsCategory2Wildcard.ps1 %~dp0lib\bd\BD_旅.yml
	%PS_CMD% "&{(Get-Content '%~dp0lib\bd\旅.txt') -replace 'BREAK.*$', '' | Set-Content '%~dp0lib\bd\bg.txt' }"

	if not exist sd-dynamic-prompts\wildcards\bd\ ( mkdir sd-dynamic-prompts\wildcards\bd\ )
	move /Y %~dp0lib\bd\エフェクト.txt sd-dynamic-prompts\wildcards\bd\effect.txt
	move /Y %~dp0lib\bd\コーデ.txt sd-dynamic-prompts\wildcards\bd\outfit.txt
	move /Y %~dp0lib\bd\ファンタジーコーデ.txt sd-dynamic-prompts\wildcards\bd\fantasy_outfit.txt
	move /Y %~dp0lib\bd\感情.txt sd-dynamic-prompts\wildcards\bd\emotion.txt
	move /Y %~dp0lib\bd\旅.txt sd-dynamic-prompts\wildcards\bd\journey.txt
	move /Y %~dp0lib\bd\bg.txt sd-dynamic-prompts\wildcards\bd\bg.txt
)
endlocal

call :CURL_DL sd-dynamic-prompts\wildcards\nai bdsm.txt https://pastebin.com/raw/yNeiK7BL
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai bdsm_item.txt https://rentry.org/osttx/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai bdsm_outfit.txt https://pastebin.com/raw/LZKytJys
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai character.txt https://pastebin.com/raw/SpRg5EBK
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
%PS_CMD% "try { &{(Get-Content 'sd-dynamic-prompts\wildcards\nai\character.txt') -replace '\\', '' -replace '\(', '\(' -replace '\)', '\)' | Set-Content 'sd-dynamic-prompts\wildcards\nai\character.txt' } } catch { exit 1 }"
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :CURL_DL sd-dynamic-prompts\wildcards\nai clothing.txt https://pastebin.com/raw/pg3ef3CN
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai cum.txt https://rentry.org/hoom5/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai exposing.txt https://pastebin.com/raw/FySHX8bK
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :CURL_DL sd-dynamic-prompts\wildcards\nai fetish.txt https://rentry.org/qm6dx/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai framing.txt https://rentry.org/7droi/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai hair.txt https://rentry.org/gzmd7/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai lingerie.txt https://rentry.org/kgg24/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai lingerie_state.txt https://rentry.org/nxgvi/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai location.txt https://rentry.org/uh9p5/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai naked_outfit.txt https://rentry.org/wquaq/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai pose.txt https://rentry.org/m9dz6/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai publicity.txt https://rentry.org/hqv3p/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai sex_act.txt https://rentry.org/k5auh/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai sex_face.txt https://rentry.org/gt8wk/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai sex_position.txt https://rentry.org/ma68z/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call :CURL_DL sd-dynamic-prompts\wildcards\nai sex_toy.txt https://rentry.org/6xyrr/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..\stable-diffusion-webui\extensions
exit /b 0

:CURL_DL
set DL_DIR=%1
set DL_FILE=%2
set DL_URL=%3
if exist %DL_DIR%\%DL_FILE% ( exit /b 0 )

if not exist %DL_DIR%\ ( mkdir %DL_DIR% )
echo %CURL_CMD% -Lo %DL_DIR%\%DL_FILE% %DL_URL%
%CURL_CMD% -Lo %DL_DIR%\%DL_FILE% %DL_URL%
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )
exit /b 0

:GIT_CLONE_OR_PULL
set GIT_COP_URL=%1
for /f "tokens=*" %%i in ("%GIT_COP_URL%") do set GIT_COP_DIR=%%~nxi

if exist %GIT_COP_DIR%\ (
	echo git -C %GIT_COP_DIR% pull
	@REM git -C %GIT_COP_DIR% pull
) else (
	echo git clone %GIT_COP_URL%
	git clone %GIT_COP_URL%
)
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )
exit /b 0
