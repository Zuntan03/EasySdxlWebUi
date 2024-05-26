@echo off
chcp 65001 > NUL

start "" https://huggingface.co/kataragi/controlnetXL_inpaint
start "" https://huggingface.co/kataragi/ControlNet-LineartXL

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\ControlNet

call %SDXL_WEB_UI%\setup\Download.bat . Kataragi_inpaintXL-fp16.safetensors ^
https://huggingface.co/kataragi/controlnetXL_inpaint/resolve/main/Kataragi_inpaintXL-fp16.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat . Kataragi_inpaintXL-lora128.safetensors ^
https://huggingface.co/kataragi/controlnetXL_inpaint/resolve/main/Kataragi_inpaintXL-lora128.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )


call %SDXL_WEB_UI%\setup\Download.bat . Katarag_lineartXL-fp16.safetensors ^
https://huggingface.co/kataragi/ControlNet-LineartXL/resolve/main/Katarag_lineartXL-fp16.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat . Kataragi_lineartXL-lora128.safetensors ^
https://huggingface.co/kataragi/ControlNet-LineartXL/resolve/main/Kataragi_lineartXL-lora128.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Lora
