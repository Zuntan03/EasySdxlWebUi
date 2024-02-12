@echo off
chcp 65001 > NUL

set SD_DIR=%~1
set SD_NAME=%~2
pushd %~dp0..

@REM config
if not exist config.json ( copy /Y %~dp0res\config.json config.json > NUL )
if not exist ui-config.json ( copy /Y %~dp0res\ui-config.json ui-config.json > NUL )

call :UPDATE_JSON setup\res\config-%SD_NAME%.json %SD_DIR%\config.json
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :UPDATE_JSON setup\res\ui-config-%SD_NAME%.json %SD_DIR%\ui-config.json
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Model
call %~dp0Link.bat %SD_DIR%\models\Stable-diffusion Model
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Model animagine-xl-3.0.safetensors ^
https://huggingface.co/cagliostrolab/animagine-xl-3.0/resolve/main/animagine-xl-3.0.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Model ponyDiffusionV6XL_v6StartWithThisOne.safetensors ^
https://huggingface.co/Zuntan/dist/resolve/main/ponyDiffusionV6XL_v6StartWithThisOne.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Vae
call %~dp0Link.bat %SD_DIR%\models\VAE Vae
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Vae sdxl_vae.safetensors ^
https://huggingface.co/madebyollin/sdxl-vae-fp16-fix/resolve/main/sdxl_vae.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Embedding
call %~dp0Link.bat %SD_DIR%\embeddings Embedding
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Embedding unaestheticXL2v10.safetensors https://civitai.com/api/download/models/302265
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Embedding negativeXL_D.safetensors https://huggingface.co/gsdf/CounterfeitXL/resolve/main/embeddings/negativeXL_D.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM LoRA
call %~dp0Link.bat %SD_DIR%\models\Lora Lora
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM LCM LoRA
call %~dp0Download.bat Lora\lcm lcm-animagine-3.safetensors ^
https://huggingface.co/furusu/SD-LoRA/resolve/main/lcm-animagine-3.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Lora\lcm lcm-lora-sdxl.safetensors ^
https://huggingface.co/latent-consistency/lcm-lora-sdxl/resolve/main/pytorch_lora_weights.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Detail LoRA
call %~dp0Download.bat Lora\iroiro sdxl-flat.safetensors ^
https://huggingface.co/2vXpSwA7/iroiro-lora/resolve/main/sdxl/sdxl-flat.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Upscaler
call %~dp0Link.bat %SD_DIR%\models\ESRGAN Upscaler
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Upscaler 4x-UltraSharp.pth ^
https://huggingface.co/Zuntan/dist/resolve/main/4x-UltraSharp.pth
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Upscaler 4x-AnimeSharp.pth ^
https://huggingface.co/Zuntan/dist/resolve/main/4x-AnimeSharp.pth
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Upscaler 4x_foolhardy_Remacri.pth ^
https://huggingface.co/Zuntan/dist/resolve/main/4x_foolhardy_Remacri.pth
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM ControlNet
call %~dp0Link.bat %SD_DIR%\models\ControlNet ControlNet
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat ControlNet ip-adapter_xl.pth ^
https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_xl.pth
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..
pushd %~dp0..\%SD_DIR%\extensions

call %~dp0GitCloneOrPull.bat https://github.com/DominikDoom/a1111-sd-webui-tagcomplete
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/Bing-su/adetailer
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/adieyal/sd-dynamic-prompts
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/blue-pen5805/sdweb-easy-prompt-selector
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/hako-mikan/sd-webui-cd-tuner
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/hnmr293/sd-webui-cutoff
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/zanllp/sd-webui-infinite-image-browsing
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/hako-mikan/sd-webui-lora-block-weight
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/hako-mikan/sd-webui-negpip
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/hako-mikan/sd-webui-prevent-artifact
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/hako-mikan/sd-webui-regional-prompter
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/hako-mikan/sd-webui-supermerger
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/hako-mikan/sd-webui-traintrain
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/blue-pen5805/Stable-Diffusion-Webui-Civitai-Helper
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/Katsuyuki-Karasawa/stable-diffusion-webui-localization-ja_JP
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/arenasys/stable-diffusion-webui-model-toolkit
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/picobyte/stable-diffusion-webui-wd14-tagger
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM LoraBlockWeight プリセット
copy /Y %~dp0res\lora_block_weight\lbwpresets.txt sd-webui-lora-block-weight\scripts\ > NUL
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM EasyPromptSelector
call %~dp0Link.bat sdweb-easy-prompt-selector\tags %~dp0..\EasyPromptSelector
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Wildcard
call %~dp0Link.bat sd-dynamic-prompts\wildcards %~dp0..\Wildcard
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..\%SD_DIR%\extensions
pushd %~dp0..\Wildcard

call %~dp0Setup-Wildcard.bat
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
popd rem %~dp0..\Wildcard
exit /b 0

:UPDATE_JSON
set SRC_JSON=%1
set DST_JSON=%2

if not exist %DST_JSON% (
	copy /Y %SRC_JSON% %DST_JSON% > NUL
	exit /b 0
)

python %~dp0update_json.py %SRC_JSON% %DST_JSON%
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )
exit /b 0
