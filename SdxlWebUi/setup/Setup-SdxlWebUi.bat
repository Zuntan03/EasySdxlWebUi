@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

call %~dp0SetGitPath.bat
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

pushd %~dp0..

if not exist stable-diffusion-webui\ (
	echo git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
	git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui
	@REM fp8 config.json に "fp8_storage": "Enable for SDXL", "cache_fp16_weight": true,
	@REM echo git clone -b dev https://github.com/AUTOMATIC1111/stable-diffusion-webui
	@REM git clone -b dev https://github.com/AUTOMATIC1111/stable-diffusion-webui
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

call %~dp0ActivateVirtualEnvironment.bat
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

if not exist Model ( mkdir Model )
if not exist Model\animagine-xl-3.0.safetensors (
	echo %CURL_CMD% -Lo Model\animagine-xl-3.0.safetensors https://huggingface.co/cagliostrolab/animagine-xl-3.0/resolve/main/animagine-xl-3.0.safetensors
	%CURL_CMD% -Lo Model\animagine-xl-3.0.safetensors https://huggingface.co/cagliostrolab/animagine-xl-3.0/resolve/main/animagine-xl-3.0.safetensors
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist Vae ( mkdir Vae )

if not exist Embedding ( mkdir Embedding )

if not exist Lora\lcm\ ( mkdir Lora\lcm )

if not exist Lora\lcm\lcm-animagine-3.safetensors (
	echo %CURL_CMD% -Lo Lora\lcm\lcm-animagine-3.safetensors https://huggingface.co/furusu/SD-LoRA/resolve/main/lcm-animagine-3.safetensors
	%CURL_CMD% -Lo Lora\lcm\lcm-animagine-3.safetensors https://huggingface.co/furusu/SD-LoRA/resolve/main/lcm-animagine-3.safetensors
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist Lora\lcm\lcm-lora-sdxl.safetensors (
	echo %CURL_CMD% -Lo Lora\lcm\lcm-lora-sdxl.safetensors https://huggingface.co/latent-consistency/lcm-lora-sdxl/resolve/main/pytorch_lora_weights.safetensors
	%CURL_CMD% -Lo Lora\lcm\lcm-lora-sdxl.safetensors https://huggingface.co/latent-consistency/lcm-lora-sdxl/resolve/main/pytorch_lora_weights.safetensors
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist Lora\detail\ ( mkdir Lora\detail )

if not exist Lora\detail\sdxl-flat.safetensors (
	echo %CURL_CMD% -Lo Lora\detail\sdxl-flat.safetensors https://huggingface.co/2vXpSwA7/iroiro-lora/resolve/main/sdxl/sdxl-flat.safetensors
	%CURL_CMD% -Lo Lora\detail\sdxl-flat.safetensors https://huggingface.co/2vXpSwA7/iroiro-lora/resolve/main/sdxl/sdxl-flat.safetensors
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist ControlNet\ip-adapter_xl.pth (
	echo %CURL_CMD% -Lo ControlNet\ip-adapter_xl.pth https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_xl.pth
	%CURL_CMD% -Lo ControlNet\ip-adapter_xl.pth https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_xl.pth
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

popd rem %~dp0..
pushd %~dp0..\stable-diffusion-webui\extensions

if not exist a1111-sd-webui-tagcomplete\ (
	echo git clone https://github.com/DominikDoom/a1111-sd-webui-tagcomplete
	git clone https://github.com/DominikDoom/a1111-sd-webui-tagcomplete
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist adetailer\ (
	echo git clone https://github.com/Bing-su/adetailer
	git clone https://github.com/Bing-su/adetailer
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist multidiffusion-upscaler-for-automatic1111\ (
	echo git clone https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111
	git clone https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist sd-dynamic-prompts\ (
	echo git clone https://github.com/adieyal/sd-dynamic-prompts
	git clone https://github.com/adieyal/sd-dynamic-prompts
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

@REM dev なら lcm があるが master にはない
if not exist sd-webui-animatediff\ (
	echo git clone https://github.com/continue-revolution/sd-webui-animatediff
	git clone https://github.com/continue-revolution/sd-webui-animatediff
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

@REM f8 非対応
if not exist sd-webui-cd-tuner\ (
	echo git clone https://github.com/hako-mikan/sd-webui-cd-tuner
	git clone https://github.com/hako-mikan/sd-webui-cd-tuner
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist sd-webui-controlnet\ (
	echo git clone https://github.com/Mikubill/sd-webui-controlnet
	git clone https://github.com/Mikubill/sd-webui-controlnet
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist sd-webui-cutoff\ (
	echo git clone https://github.com/hnmr293/sd-webui-cutoff
	git clone https://github.com/hnmr293/sd-webui-cutoff
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist sd-webui-lora-block-weight\ (
	echo git clone https://github.com/hako-mikan/sd-webui-lora-block-weight
	git clone https://github.com/hako-mikan/sd-webui-lora-block-weight
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

@REM f8 非対応
if not exist sd-webui-negpip\ (
	echo git clone https://github.com/hako-mikan/sd-webui-negpip
	git clone https://github.com/hako-mikan/sd-webui-negpip
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist Stable-Diffusion-Webui-Civitai-Helper\ (
	echo git clone https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper
	git clone https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist stable-diffusion-webui-localization-ja_JP (
	echo git clone https://github.com/Katsuyuki-Karasawa/stable-diffusion-webui-localization-ja_JP
	git clone https://github.com/Katsuyuki-Karasawa/stable-diffusion-webui-localization-ja_JP
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist stable-diffusion-webui-model-toolkit\ (
	echo git clone https://github.com/arenasys/stable-diffusion-webui-model-toolkit
	git clone https://github.com/arenasys/stable-diffusion-webui-model-toolkit
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist stable-diffusion-webui-wd14-tagger\ (
	echo git clone https://github.com/picobyte/stable-diffusion-webui-wd14-tagger
	git clone https://github.com/picobyte/stable-diffusion-webui-wd14-tagger
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

@REM dev で起動時エラー
if not exist sd-webui-supermerger\ (
	echo git clone https://github.com/hako-mikan/sd-webui-supermerger
	git clone https://github.com/hako-mikan/sd-webui-supermerger
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist sd-dynamic-prompts\wildcards\animagine\ (
	xcopy /SQY %~dp0res\wildcards\animagine\ sd-dynamic-prompts\wildcards\animagine\
)

if not exist sd-dynamic-prompts\wildcards\animagine\character.txt (
	echo %CURL_CMD% -Lo sd-dynamic-prompts\wildcards\animagine\character.txt https://huggingface.co/spaces/Linaqruf/animagine-xl/resolve/main/wildcard/character.txt
	%CURL_CMD% -Lo sd-dynamic-prompts\wildcards\animagine\character.txt https://huggingface.co/spaces/Linaqruf/animagine-xl/resolve/main/wildcard/character.txt
	if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
)

if not exist %~dp0lib\bd\ (
	echo https://br-d.fanbox.cc/posts/5680274
	%CURL_CMD% -Lo %~dp0lib\bd.zip https://downloads.fanbox.cc/files/post/5680274/IUTQ62gtRAYNNIQHMwWtm5Mg.zip
	%PS_CMD% Expand-Archive -Path %~dp0lib\bd.zip  -DestinationPath %~dp0lib\bd\ -Force
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

if not exist sd-dynamic-prompts\wildcards\nai\ (
	echo https://rentry.org/NAIwildcards
	mkdir sd-dynamic-prompts\wildcards\nai
	curl -Lo sd-dynamic-prompts\wildcards\nai\character.txt https://pastebin.com/raw/SpRg5EBK
	%PS_CMD% "&{(Get-Content 'sd-dynamic-prompts\wildcards\nai\character.txt') -replace '\\', '' -replace '\(', '\(' -replace '\)', '\)' | Set-Content 'sd-dynamic-prompts\wildcards\nai\character.txt' }"
	curl -Lo sd-dynamic-prompts\wildcards\nai\clothing.txt https://pastebin.com/raw/pg3ef3CN
	curl -Lo sd-dynamic-prompts\wildcards\nai\location.txt https://rentry.org/uh9p5/raw
	curl -Lo sd-dynamic-prompts\wildcards\nai\framing.txt https://rentry.org/7droi/raw
	curl -Lo sd-dynamic-prompts\wildcards\nai\pose.txt https://rentry.org/m9dz6/raw
	curl -Lo sd-dynamic-prompts\wildcards\nai\face.txt https://pastebin.com/raw/TckYiQGc
	curl -Lo sd-dynamic-prompts\wildcards\nai\hair.txt https://rentry.org/gzmd7/raw
)

if not exist sd-dynamic-prompts\wildcards\nai_sex\ (
	mkdir sd-dynamic-prompts\wildcards\nai_sex
	curl -Lo sd-dynamic-prompts\wildcards\nai_sex\act.txt https://rentry.org/k5auh/raw
	curl -Lo sd-dynamic-prompts\wildcards\nai_sex\face.txt https://rentry.org/gt8wk/raw
	curl -Lo sd-dynamic-prompts\wildcards\nai_sex\position.txt https://rentry.org/ma68z/raw
)

if not exist sd-dynamic-prompts\wildcards\nai_play\ (
	mkdir sd-dynamic-prompts\wildcards\nai_play
	curl -Lo sd-dynamic-prompts\wildcards\nai_play\bdsm.txt https://pastebin.com/raw/yNeiK7BL
	curl -Lo sd-dynamic-prompts\wildcards\nai_play\cum.txt https://rentry.org/hoom5/raw
	curl -Lo sd-dynamic-prompts\wildcards\nai_play\fetish.txt https://rentry.org/qm6dx/raw
	curl -Lo sd-dynamic-prompts\wildcards\nai_play\publicity.txt https://rentry.org/hqv3p/raw
)

if not exist sd-dynamic-prompts\wildcards\nai_outfit\ (
	mkdir sd-dynamic-prompts\wildcards\nai_outfit
	curl -Lo sd-dynamic-prompts\wildcards\nai_outfit\bdsm.txt https://pastebin.com/raw/LZKytJys
	curl -Lo sd-dynamic-prompts\wildcards\nai_outfit\exposing.txt https://pastebin.com/raw/FySHX8bK
	curl -Lo sd-dynamic-prompts\wildcards\nai_outfit\lingerie.txt https://rentry.org/kgg24/raw
	curl -Lo sd-dynamic-prompts\wildcards\nai_outfit\lingerie_state.txt https://rentry.org/nxgvi/raw
	curl -Lo sd-dynamic-prompts\wildcards\nai_outfit\naked.txt https://rentry.org/wquaq/raw
)

if not exist sd-dynamic-prompts\wildcards\nai_item\ (
	mkdir sd-dynamic-prompts\wildcards\nai_item
	curl -Lo sd-dynamic-prompts\wildcards\nai_item\bdsm.txt https://rentry.org/osttx/raw
	curl -Lo sd-dynamic-prompts\wildcards\nai_item\toy.txt https://rentry.org/6xyrr/raw
)

popd rem %~dp0..\stable-diffusion-webui\extensions
