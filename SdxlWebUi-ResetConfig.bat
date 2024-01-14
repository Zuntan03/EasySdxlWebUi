@echo off
chcp 65001 > NUL

@REM echo SdxlWebUi の設定をリセットしますか？ [y/n]
@REM set /p YES_OR_NO=
@REM if /i not "%YES_OR_NO%" == "y" ( popd & exit /b 1 )

copy /Y %~dp0SdxlWebUi\setup\res\config.json %~dp0SdxlWebUi\stable-diffusion-webui\config.json
copy /Y %~dp0SdxlWebUi\setup\res\ui-config.json %~dp0SdxlWebUi\stable-diffusion-webui\ui-config.json
copy /Y %~dp0SdxlWebUi\setup\res\styles.csv %~dp0SdxlWebUi\stable-diffusion-webui\styles.csv
