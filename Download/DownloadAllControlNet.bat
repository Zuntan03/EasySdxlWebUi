@echo off
chcp 65001 > NUL

pushd %~dp0ControlNet
call lllyasviel-sd_control_collection.bat
call bdsqlsz-qinglong_controlnet-lllite.bat
popd rem %~dp0ControlNet
