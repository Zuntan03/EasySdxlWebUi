@echo off
chcp 65001 > NUL

pushd %~dp0ControlNet
call 2vXpSwA7-cnlllite-anystyle_v3.bat
call bdsqlsz-qinglong_controlnet-lllite.bat
call lllyasviel-sd_control_collection.bat
call TTPlanet-TTPLanet_SDXL_Controlnet_Tile_Realistic.bat
popd rem %~dp0ControlNet
