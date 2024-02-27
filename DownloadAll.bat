@echo off
chcp 65001 > NUL

call %~dp0Download\DownloadAllControlNet.bat
call %~dp0Download\DownloadAllForge.bat
call %~dp0Download\DownloadAllModel.bat
call %~dp0Download\DownloadAllTagger.bat
call %~dp0Download\DownloadAllLora.bat
