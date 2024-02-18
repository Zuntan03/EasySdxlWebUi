@echo off
chcp 65001 > NUL

start "" https://huggingface.co/MayonakaManic/LoRA

set SDXL_WEB_UI=%~dp0..\..\SdxlWebUi
pushd %SDXL_WEB_UI%\Lora
call %SDXL_WEB_UI%\setup\Download.bat MayonakaManic LECO_LessMuscularityXL.safetensors ^
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LECO/LECO_LessMuscularityXL.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat MayonakaManic LECO_LessMuscularityXL_forPony.safetensors ^
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LECO/LECO_LessMuscularityXL_forPony.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat MayonakaManic LECO_LessMonsterGirlsXL.safetensors ^
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LECO/LECO_LessMonsterGirls/LECO_LessMonsterGirlsXL.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat MayonakaManic LECO_LessChibiAndDollsXL.safetensors ^
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LECO/LECO_LessChibiAndDolls/LECO_LessChibiAndDollsXL.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %SDXL_WEB_UI%\setup\Download.bat MayonakaManic LECO_LessTraditionsAndCulturesXL.safetensors ^
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LECO/LECO_LessTraditionsAndCultures/LECO_LessTraditionsAndCulturesXL.safetensors
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %SDXL_WEB_UI%\Lora

