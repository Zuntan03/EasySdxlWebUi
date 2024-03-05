@echo off
chcp 65001 > NUL

pushd %~dp0ControlNet
call TTPlanet-TTPLanet_SDXL_Controlnet_Tile_Realistic_V1.bat
call lllyasviel-sd_control_collection.bat
call bdsqlsz-qinglong_controlnet-lllite.bat
popd rem %~dp0ControlNet
