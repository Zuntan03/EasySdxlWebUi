@echo off
chcp 65001 > NUL

pushd %~dp0Model
call ebara_pony.bat
call gnomePower.bat
call SwampMachine.bat
call rumblexl.bat
popd rem %~dp0Model
