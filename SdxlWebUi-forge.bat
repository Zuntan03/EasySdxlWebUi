@echo off
chcp 65001 > NUL


if not exist %~dp0SdxlWebUi\stable-diffusion-webui-forge\ (
	echo call %~dp0SdxlWebUi\setup\Setup-SdxlWebUi-forge.bat
	call %~dp0SdxlWebUi\setup\Setup-SdxlWebUi-forge.bat

)
if not exist %~dp0SdxlWebUi\venv-forge\ (
	echo call %~dp0SdxlWebUi\setup\Setup-SdxlWebUi-forge.bat
	call %~dp0SdxlWebUi\setup\Setup-SdxlWebUi-forge.bat
)
if %errorlevel% neq 0 ( exit /b %errorlevel% )

pushd %~dp0SdxlWebUi\stable-diffusion-webui-forge\

set PYTHON=%~dp0SdxlWebUi\venv-forge\Scripts\python.exe
set VENV_DIR=%~dp0SdxlWebUi\venv-forge
set GIT=
where /Q git
if %ERRORLEVEL% neq 0 ( set GIT=%~dp0SdxlWebUi\setup\lib\PortableGit\bin\git.exe )

set COMMANDLINE_ARGS=^
--styles-file ../styles.csv ^
--gradio-allowed-path ..

@REM if "%DISABLE_LISTEN_AUTOLAUNCH%" == "" (
@REM 	set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% --listen --autolaunch
@REM )

set COMMANDLINE_ARGS=%COMMANDLINE_ARGS% %*

if not exist config.json ( copy /Y %~dp0SdxlWebUi\setup\res\config-forge.json config.json )
%PYTHON% %~dp0SdxlWebUi\setup\update_json.py %~dp0SdxlWebUi\config.json config.json
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

if not exist ui-config.json ( copy /Y %~dp0SdxlWebUi\setup\res\ui-config-forge.json ui-config.json )
%PYTHON% %~dp0SdxlWebUi\setup\update_json.py %~dp0SdxlWebUi\ui-config.json ui-config.json
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

echo webui.bat %COMMANDLINE_ARGS%
call webui.bat

popd rem %~dp0SdxlWebUi\stable-diffusion-webui-forge\
