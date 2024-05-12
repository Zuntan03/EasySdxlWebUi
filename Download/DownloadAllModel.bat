@echo off
chcp 65001 > NUL

pushd %~dp0Model
call 7th_LayerXL.bat
call animagine-xl-3.1.bat
call ebara_pony.bat
call loliDiffusion.bat
call rumblexl.bat
call SwampMachine.bat
call Zipang.bat
popd rem %~dp0Model
