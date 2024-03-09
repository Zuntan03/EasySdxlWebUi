@echo off
chcp 65001 > NUL

if not exist %~dp0lib\ ( mkdir %~dp0lib )
pushd %~dp0lib

call %~dp0ActivateVirtualEnvironment.bat
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

pip install -q unidiff
if %errorlevel% neq 0 ( pause & popd & exit /b %errorlevel% )

popd rem %~dp0lib

python %~dp0patch.py %*
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )
