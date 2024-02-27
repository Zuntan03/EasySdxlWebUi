@echo off
chcp 65001 > NUL

pushd %~dp0Lora
call 2vXpSwA7-iroiro-lora.bat
call MayonakaManic-LoRA.bat
call nashikone-iroiroLoRA.bat
call SDXL-Lightning.bat

call PonyNote.bat
popd rem %~dp0Lora
