@echo off
chcp 65001 > NUL
pushd %~dp0..

@REM Model
call %~dp0Download.bat Model animagine-xl-3.0.safetensors ^
https://huggingface.co/cagliostrolab/animagine-xl-3.0/resolve/main/animagine-xl-3.0.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Model ponyDiffusionV6XL_v6StartWithThisOne.safetensors ^
https://huggingface.co/Zuntan/dist/resolve/main/ponyDiffusionV6XL_v6StartWithThisOne.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Vae
call %~dp0Download.bat Vae sdxl_vae.safetensors ^
https://huggingface.co/madebyollin/sdxl-vae-fp16-fix/resolve/main/sdxl_vae.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Embedding
call %~dp0Download.bat Embedding unaestheticXL2v10.safetensors ^
https://civitai.com/api/download/models/302265
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Embedding negativeXL_D.safetensors ^
https://huggingface.co/gsdf/CounterfeitXL/resolve/main/embeddings/negativeXL_D.safetensors
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

@REM SDXL-Lightning LoRA
call %~dp0Download.bat Lora\SDXL-Lightning sdxl_lightning_2step_lora.safetensors ^
https://huggingface.co/ByteDance/SDXL-Lightning/resolve/main/sdxl_lightning_2step_lora.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat Lora\SDXL-Lightning sdxl_lightning_8step_lora.safetensors ^
https://huggingface.co/ByteDance/SDXL-Lightning/resolve/main/sdxl_lightning_8step_lora.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

@REM Upscaler
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
call %~dp0Download.bat ControlNet ip-adapter_xl.pth ^
https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_xl.pth
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..
