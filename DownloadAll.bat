@echo off
chcp 65001 > NUL

pushd %~dp0Download\ControlNet
call lllyasviel-sd_control_collection.bat
call bdsqlsz-qinglong_controlnet-lllite.bat
popd rem %~dp0Download\ControlNet

pushd %~dp0Download\Forge
call Zero123.bat
popd rem %~dp0Download\Forge

pushd %~dp0Download\Model
call ebara_pony.bat
call gnomePower.bat
call SwampMachine.bat
call rumblexl.bat
popd rem %~dp0Download\Model

pushd %~dp0Download\Tagger
call Z3D-E621-Convnext.bat
popd rem %~dp0Download\Tagger

pushd %~dp0Download\Lora
call 2vXpSwA7-iroiro-lora.bat
call MayonakaManic-LoRA.bat
call nashikone-iroiroLoRA.bat
call SDXL-Lightning.bat

call PonyNote.bat
popd rem %~dp0Download\Lora
