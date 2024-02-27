@echo off
chcp 65001 > NUL

pushd %~dp0Forge
call Zero123.bat
popd rem %~dp0Forge
