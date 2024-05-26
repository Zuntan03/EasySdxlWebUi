@echo off
chcp 65001 > NUL

pushd %~dp0ControlNet
call 2vXpSwA7-CN-any.bat
call bdsqlsz-qinglong_controlnet-lllite.bat
call controlnet852A.bat
call kataragi-ControlNet.bat
call lllyasviel-sd_control_collection.bat
call TheMistoAI-MistoLine.bat
call TTPlanet-TTPLanet_SDXL_Controlnet_Tile_Realistic.bat
popd rem %~dp0ControlNet
