@echo off
chcp 65001 > NUL

set SETUP=%~dp0SdxlWebUi\setup

pushd %~dp0
echo call %SETUP%\GitCloneOrPull.bat https://github.com/lllyasviel/IC-Light
call %SETUP%\GitCloneOrPull.bat https://github.com/lllyasviel/IC-Light
if %errorlevel% neq 0 ( popd & exit /b 1 )
popd rem %~dp0

pushd %~dp0IC-Light
call %SETUP%\ActivateVirtualEnvironment.bat
if %errorlevel% neq 0 ( popd & exit /b 1 )

echo pip install -q torch torchvision --index-url https://download.pytorch.org/whl/cu121
pip install -q torch torchvision --index-url https://download.pytorch.org/whl/cu121
if %errorlevel% neq 0 ( pause & popd & exit /b 1 )

echo pip install -q -r requirements.txt
pip install -q -r requirements.txt
if %errorlevel% neq 0 ( pause & popd & exit /b 1 )

echo start "" cmd /c "timeout /t 10 /nobreak && start http://localhost:7860"
start "" cmd /c "timeout /t 10 /nobreak && start http://localhost:7860"

echo python gradio_demo_bg.py
python gradio_demo_bg.py

popd rem %~dp0IC-Light
