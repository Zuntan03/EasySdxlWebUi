@echo off
chcp 65001 > NUL
pushd %~dp0SdxlWebUi\stable-diffusion-webui\

set PYTHON=%~dp0SdxlWebUi\venv\Scripts\python.exe
set VENV_DIR=%~dp0SdxlWebUi\venv
set GIT=
where /Q git
if %ERRORLEVEL% neq 0 (
	set GIT=%~dp0SdxlWebUi\setup\lib\PortableGit\bin\git.exe
)

set PYTORCH_CUDA_ALLOC_CONF=garbage_collection_threshold:0.75,max_split_size_mb:128

set CKPT_DIR=../Model
set VAE_PATH=../Vae
set EMBEDDINGS_DIR=../Embedding
set LORA_DIR=../Lora

@REM VRAM が足りない場合に以下を COMMANDLINE_ARGS 追加。生成が数割遅くなり、メインメモリの消費量も数GB増える。
@REM --medvram-sdxl

set COMMANDLINE_ARGS=^
	--ckpt-dir %CKPT_DIR%^
	--vae-dir %VAE_PATH%^
	--embeddings-dir %EMBEDDINGS_DIR%^
	--lora-dir %LORA_DIR%^
	--xformers^
	--opt-channelslast^
	%~1

@REM 手元で優位性を確認できず。
@REM --opt-sdp-no-mem-attention --opt-sdp-attention --opt-channelslast

call webui.bat

popd rem %~dp0SdxlWebUi\stable-diffusion-webui\
