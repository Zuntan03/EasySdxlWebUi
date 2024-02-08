@echo off
chcp 65001 > NUL
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

call %~dp0SetGitPath.bat
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

pushd %~dp0..

call :GIT_CLONE_OR_PULL https://github.com/AUTOMATIC1111/stable-diffusion-webui
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0ActivateVirtualEnvironment.bat
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Model
call %~dp0Download.bat Model animagine-xl-3.0.safetensors ^
https://huggingface.co/cagliostrolab/animagine-xl-3.0/resolve/main/animagine-xl-3.0.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM call %~dp0Download.bat Model\ ponyDiffusionV6XL_v6StartWithThisOne.safetensors https://civitai.com/api/download/models/290640
call %~dp0Download.bat Model ponyDiffusionV6XL_v6StartWithThisOne.safetensors https://huggingface.co/AstraliteHeart/pony-diffusion-v6/resolve/main/v6.safetensors?download=true
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Vae
call %~dp0Download.bat Vae sdxl_vae.safetensors ^
https://huggingface.co/madebyollin/sdxl-vae-fp16-fix/resolve/main/sdxl_vae.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Embedding
call %~dp0Download.bat Embedding unaestheticXL2v10.safetensors https://civitai.com/api/download/models/302265
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Embedding negativeXL_D.safetensors https://huggingface.co/gsdf/CounterfeitXL/resolve/main/embeddings/negativeXL_D.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM LCM LoRA
call %~dp0Download.bat Lora\lcm lcm-animagine-3.safetensors ^
https://huggingface.co/furusu/SD-LoRA/resolve/main/lcm-animagine-3.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Lora\lcm lcm-lora-sdxl.safetensors ^
https://huggingface.co/latent-consistency/lcm-lora-sdxl/resolve/main/pytorch_lora_weights.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Detail LoRA
call %~dp0Download.bat Lora\detail sdxl-flat.safetensors ^
https://huggingface.co/2vXpSwA7/iroiro-lora/resolve/main/sdxl/sdxl-flat.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Lora\detail sdxl-hairdetailer_01.safetensors ^
https://huggingface.co/2vXpSwA7/iroiro-lora/resolve/main/sdxl/sdxl-hairdetailer_01.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Lora\detail sdxl-hairdetailer_02.safetensors ^
https://huggingface.co/2vXpSwA7/iroiro-lora/resolve/main/sdxl/sdxl-hairdetailer_02.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Upscaler
call %~dp0Download.bat Upscaler 4x-UltraSharp.pth ^
https://huggingface.co/Zuntan/dist/resolve/main/4x-UltraSharp.pth
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Upscaler 4x-AnimeSharp.pth ^
https://huggingface.co/Zuntan/dist/resolve/main/4x-AnimeSharp.pth
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM ControlNet
call %~dp0Download.bat ControlNet ip-adapter_xl.pth ^
https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_xl.pth
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM config
if not exist stable-diffusion-webui\config.json ( copy /Y %~dp0res\config.json stable-diffusion-webui\config.json > NUL )
if not exist stable-diffusion-webui\ui-config.json ( copy /Y %~dp0res\ui-config.json stable-diffusion-webui\ui-config.json > NUL )
if not exist stable-diffusion-webui\styles.csv ( copy /Y %~dp0res\styles.csv stable-diffusion-webui\styles.csv > NUL )

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

call :GIT_CLONE_OR_PULL https://github.com/hako-mikan/sd-webui-regional-prompter
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
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM EasyPromptSelector
xcopy /SQY %~dp0res\easy_prompt_selector\ sdweb-easy-prompt-selector\tags\ > NUL

%PS_CMD% "try { &{(Get-Content 'sdweb-easy-prompt-selector\tags\Animagine XL 3.0.yml') -creplace 'LCM Karras', 'LCM' | Set-Content 'sdweb-easy-prompt-selector\tags\Animagine XL 3.0.yml' -Encoding utf8 } } catch { exit 1 }"
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM Wildcard
call %~dp0Link.bat sd-dynamic-prompts\wildcards %~dp0..\Wildcard
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..\stable-diffusion-webui\extensions

pushd %~dp0..\Wildcard
call %~dp0Setup-Wildcard.bat
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
popd rem %~dp0..\Wildcard

exit /b 0

:GIT_CLONE_OR_PULL
set GIT_COP_URL=%1
for /f "tokens=*" %%i in ("%GIT_COP_URL%") do set GIT_COP_DIR=%%~nxi

if exist %GIT_COP_DIR%\ (
	echo git -C %GIT_COP_DIR% pull
	git -C %GIT_COP_DIR% pull
) else (
	echo git clone %GIT_COP_URL%
	git clone %GIT_COP_URL%
)
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )
exit /b 0
