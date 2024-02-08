@echo off
chcp 65001 > NUL

setlocal enabledelayedexpansion
if not exist %~dp0SdxlWebUi\stable-diffusion-webui\ (
	call %~dp0SdxlWebUi\setup\Setup-SdxlWebUi-a1111.bat
	if !errorlevel! neq 0 ( exit /b !errorlevel! )
)
if not exist %~dp0SdxlWebUi\venv-a1111\ (
	call %~dp0SdxlWebUi\setup\Setup-SdxlWebUi-a1111.bat
	if !errorlevel! neq 0 ( exit /b !errorlevel! )
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

echo webui.bat %COMMANDLINE_ARGS%
call webui.bat

popd rem %~dp0SdxlWebUi\stable-diffusion-webui\
