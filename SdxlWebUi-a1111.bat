@echo off
chcp 65001 > NUL

setlocal enabledelayedexpansion
if not exist %~dp0SdxlWebUi\stable-diffusion-webui\ (
	call %~dp0SdxlWebUi\setup\Setup-SdxlWebUi-a1111.bat
	if !errorlevel! neq 0 ( endlocal & exit /b !errorlevel! )
)
if not exist %~dp0SdxlWebUi\venv-a1111\ (
	call %~dp0SdxlWebUi\setup\Setup-SdxlWebUi-a1111.bat
	if !errorlevel! neq 0 ( endlocal & exit /b !errorlevel! )
)
endlocal

pushd %~dp0SdxlWebUi\stable-diffusion-webui\

set PYTHON=%~dp0SdxlWebUi\venv-a1111\Scripts\python.exe
set VENV_DIR=%~dp0SdxlWebUi\venv-a1111
set GIT=
where /Q git
if %ERRORLEVEL% neq 0 (
	set GIT=%~dp0SdxlWebUi\setup\lib\PortableGit\bin\git.exe
)

set PYTORCH_CUDA_ALLOC_CONF=garbage_collection_threshold:0.75,max_split_size_mb:128

@REM VRAM が足りない場合に以下を COMMANDLINE_ARGS 追加。生成が数割遅くなり、メインメモリの消費量も数GB増える。
@REM --medvram-sdxl

set COMMANDLINE_ARGS=^
--gradio-allowed-path .. ^
--xformers ^
--opt-channelslast ^
%*

@REM 手元で優位性を確認できず。
@REM --opt-sdp-no-mem-attention --opt-sdp-attention --opt-channelslast

%PYTHON% %~dp0SdxlWebUi\setup\update_json.py %~dp0SdxlWebUi\config.json config.json
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

%PYTHON% %~dp0SdxlWebUi\setup\update_json.py %~dp0SdxlWebUi\ui-config.json ui-config.json
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

@REM style.csv の同期
set SRC_STYLE_PATH=..\stable-diffusion-webui-forge\styles.csv
for %%i in ("%SRC_STYLE_PATH%") do set "SRC_STYLE_DATE=%%~ti"

set DST_STYLE_PATH=styles.csv
for %%i in ("%DST_STYLE_PATH%") do set "DST_STYLE_DATE=%%~ti"

set "DATE_TIME=%DATE:/=-%_%TIME::=-%"
set "DATE_TIME=%DATE_TIME: =0%"
set "DATE_TIME=%DATE_TIME:~0,-3%"
set DST_STYLE_BACKUP_PATH=styles_%DATE_TIME%.csv

setlocal enabledelayedexpansion
if exist %SRC_STYLE_PATH% (
	if exist %DST_STYLE_PATH% (
		if "%SRC_STYLE_DATE%" gtr "%DST_STYLE_DATE%" (
			echo move %DST_STYLE_PATH% %DST_STYLE_BACKUP_PATH%
			move %DST_STYLE_PATH% %DST_STYLE_BACKUP_PATH%
			if !errorlevel! neq 0 ( pause & endlocal & popd & exit /b 1 )

			echo copy %SRC_STYLE_PATH% %DST_STYLE_PATH%
			copy %SRC_STYLE_PATH% %DST_STYLE_PATH%
			if !errorlevel! neq 0 ( pause & endlocal & popd & exit /b 1 )
		)
	) else (
		echo copy %SRC_STYLE_PATH% %DST_STYLE_PATH%
		copy %SRC_STYLE_PATH% %DST_STYLE_PATH%
		if !errorlevel! neq 0 ( pause & endlocal & popd & exit /b 1 )
	)
)
endlocal

echo webui.bat %COMMANDLINE_ARGS%
call webui.bat

popd rem %~dp0SdxlWebUi\stable-diffusion-webui\
