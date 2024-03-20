@echo off
chcp 65001 > NUL

pushd %~dp0Image
call Animagine31Character.bat
popd rem %~dp0Image
