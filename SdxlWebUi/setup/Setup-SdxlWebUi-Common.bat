@echo off
chcp 65001 > NUL

set SD_DIR=%~1
set SD_NAME=%~2
pushd %~dp0..

@REM e621-v3-20221117-sgd-e32
echo pip -qq install tensorflow_io
pip -qq install tensorflow_io
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM ModuleNotFoundError: No module named 'keras.__internal__'
echo pip -qq install -U "keras==2.15.0" "transformers==4.30.2"
pip -qq install -U "keras==2.15.0" "transformers==4.30.2"
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

copy /Y setup\Install-EasySdxlWebUi-a1111.bat ..\SdxlWebUi-Update-a1111.bat > NUL
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

copy /Y setup\Install-EasySdxlWebUi-forge.bat ..\SdxlWebUi-Update-forge.bat > NUL
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM config
if not exist config.json ( copy /Y %~dp0res\config.json config.json > NUL )

copy /Y "%~dp0res\config Diff.bat" "config Diff.bat" > NUL
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

if not exist ui-config.json ( copy /Y %~dp0res\ui-config.json ui-config.json > NUL )
if not exist styles.csv ( copy /Y %~dp0res\styles.csv styles.csv > NUL )

call :UPDATE_JSON setup\res\config-%SD_NAME%.json %SD_DIR%\config.json
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call :UPDATE_JSON setup\res\ui-config-%SD_NAME%.json %SD_DIR%\ui-config.json
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Model
call %~dp0Link.bat %SD_DIR%\models\Stable-diffusion Model
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Vae
call %~dp0Link.bat %SD_DIR%\models\VAE Vae
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Embedding
call %~dp0Link.bat %SD_DIR%\embeddings Embedding
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM LoRA
call %~dp0Link.bat %SD_DIR%\models\Lora Lora
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Upscaler
call %~dp0Link.bat %SD_DIR%\models\ESRGAN Upscaler
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM ControlNet
call %~dp0Link.bat %SD_DIR%\models\ControlNet ControlNet
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Tagger
if not exist TaggerDeepDanboooru\ ( mkdir TaggerDeepDanboooru )
call %~dp0Link.bat %SD_DIR%\models\deepdanbooru TaggerDeepDanboooru
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

if not exist TaggerOnnx\ ( mkdir TaggerOnnx )
call %~dp0Link.bat %SD_DIR%\models\TaggerOnnx TaggerOnnx
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..
pushd %~dp0..\%SD_DIR%\extensions

call %~dp0GitCloneOrPull.bat https://github.com/DominikDoom/a1111-sd-webui-tagcomplete
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Fork 版を使用
@REM call %~dp0GitCloneOrPull.bat https://github.com/Bing-su/adetailer
@REM if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/adieyal/sd-dynamic-prompts
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/p1atdev/sd-danbooru-tags-upsampler
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/blue-pen5805/sdweb-easy-generate-forever
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/blue-pen5805/sdweb-easy-prompt-selector
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/hako-mikan/sd-webui-cd-tuner
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM SDXL で影響はあるが効果が確認できない
@REM call %~dp0GitCloneOrPull.bat https://github.com/hnmr293/sd-webui-cutoff
@REM if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/zanllp/sd-webui-infinite-image-browsing
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/hako-mikan/sd-webui-lora-block-weight
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/hako-mikan/sd-webui-negpip
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/hako-mikan/sd-webui-regional-prompter
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/hako-mikan/sd-webui-supermerger
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/hako-mikan/sd-webui-traintrain
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/nihedon/sd-webui-weight-helper
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/blue-pen5805/Stable-Diffusion-Webui-Civitai-Helper
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0GitCloneOrPull.bat https://github.com/Katsuyuki-Karasawa/stable-diffusion-webui-localization-ja_JP
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Super Mergier と機能が被っている
@REM call %~dp0GitCloneOrPull.bat https://github.com/arenasys/stable-diffusion-webui-model-toolkit
@REM if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Unpatch.bat %~dp0res\wd14-tagger_wd14v3.patch
call %~dp0GitCloneOrPull.bat https://github.com/picobyte/stable-diffusion-webui-wd14-tagger
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Patch.bat %~dp0res\wd14-tagger_wd14v3.patch

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
