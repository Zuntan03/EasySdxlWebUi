@echo off
chcp 65001 > NUL

pushd %~dp0Tagger
call Z3D-E621-Convnext.bat
popd rem %~dp0Tagger
