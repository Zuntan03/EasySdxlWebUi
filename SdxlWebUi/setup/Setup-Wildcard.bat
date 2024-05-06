@echo off
chcp 65001 > NUL
pushd %~dp0..\Wildcard
set CURL_CMD=C:\Windows\System32\curl.exe -k
set PS_CMD=PowerShell -Version 5.1 -ExecutionPolicy Bypass

xcopy /SQY %~dp0res\wildcards\ . > NUL

call %~dp0Download.bat animagine character.txt ^
https://huggingface.co/spaces/Linaqruf/animagine-xl/resolve/main/wildcard/character.txt
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat anmg31 char_add.txt ^
https://huggingface.co/spaces/cagliostrolab/animagine-xl-3.1/resolve/main/wildcard/character31.txt
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

setlocal enabledelayedexpansion

if not exist anmg31\char_full.txt (
	call %~dp0Download.bat anmg31 char_full.txt ^
	https://huggingface.co/spaces/cagliostrolab/animagine-xl-3.1/resolve/main/wildcard/characterfull.txt
	if !errorlevel! neq 0 ( popd & exit /b !errorlevel! )

	@REM 改行置換できず
	%PS_CMD% "try { &{(Get-Content 'anmg31\char_full.txt') -replace '1girl, , original', '' | Set-Content 'anmg31\char_full.txt' } } catch { exit 1 }"
	if !errorlevel! neq 0 ( pause & popd & exit /b !errorlevel! )
)

if not exist pony\female.txt (
	call %~dp0Download.bat pony female.txt https://files.catbox.moe/oklpz8.txt
	if !errorlevel! neq 0 ( popd & exit /b !errorlevel! )

	%PS_CMD% "try { &{(Get-Content 'pony\female.txt') -replace '_\(', ' \(' -replace '\)', '\)' | Set-Content 'pony\female.txt' } } catch { exit 1 }"
	if !errorlevel! neq 0 ( pause & popd & exit /b !errorlevel! )
)

if not exist pony\male.txt (
	call %~dp0Download.bat pony male.txt https://files.catbox.moe/1lptzn.txt
	if !errorlevel! neq 0 ( popd & exit /b !errorlevel! )

	%PS_CMD% "try { &{(Get-Content 'pony\male.txt') -replace '_\(', ' \(' -replace '\)', '\)' | Set-Content 'pony\male.txt' } } catch { exit 1 }"
	if !errorlevel! neq 0 ( pause & popd & exit /b !errorlevel! )
)

if not exist bd\ (
	echo %CURL_CMD% -Lo %~dp0lib\bd.zip https://downloads.fanbox.cc/files/post/5680274/IUTQ62gtRAYNNIQHMwWtm5Mg.zip
	%CURL_CMD% -Lo %~dp0lib\bd.zip https://downloads.fanbox.cc/files/post/5680274/IUTQ62gtRAYNNIQHMwWtm5Mg.zip
	if !errorlevel! neq 0 ( pause & popd & exit /b !errorlevel! )

	echo %PS_CMD% "try { Expand-Archive -Path %~dp0lib\bd.zip  -DestinationPath %~dp0lib\bd\ -Force } catch { exit 1 }"
	%PS_CMD% "try { Expand-Archive -Path %~dp0lib\bd.zip  -DestinationPath %~dp0lib\bd\ -Force } catch { exit 1 }"
	if !errorlevel! neq 0 ( pause & popd & exit /b !errorlevel! )
	del /q %~dp0lib\bd.zip

	%PS_CMD% -File %~dp0EpsCategory2Wildcard.ps1 %~dp0lib\bd\BD_エフェクト.yml
	%PS_CMD% -File %~dp0EpsCategory2Wildcard.ps1 %~dp0lib\bd\BD_コーデ.yml
	%PS_CMD% -File %~dp0EpsCategory2Wildcard.ps1 %~dp0lib\bd\BD_ファンタジコーデ.yml
	%PS_CMD% -File %~dp0EpsCategory2Wildcard.ps1 %~dp0lib\bd\BD_感情.yml
	%PS_CMD% -File %~dp0EpsCategory2Wildcard.ps1 %~dp0lib\bd\BD_旅.yml
	%PS_CMD% "try { &{(Get-Content '%~dp0lib\bd\旅.txt') -replace 'BREAK.*$', '' | Set-Content '%~dp0lib\bd\bg.txt' } } catch { exit 1 }"

	if not exist bd\ ( mkdir bd\ )
	move /Y %~dp0lib\bd\エフェクト.txt bd\effect.txt
	move /Y %~dp0lib\bd\コーデ.txt bd\outfit.txt
	move /Y %~dp0lib\bd\ファンタジーコーデ.txt bd\fantasy_outfit.txt
	move /Y %~dp0lib\bd\感情.txt bd\emotion.txt
	move /Y %~dp0lib\bd\旅.txt bd\journey.txt
	move /Y %~dp0lib\bd\bg.txt bd\bg.txt
)

if not exist bd\situation.txt (
	echo %CURL_CMD% -Lo %~dp0lib\bd_situ.zip https://downloads.fanbox.cc/files/post/5754786/IT4TSnDvgWu21nis0hxY0Vkm.zip
	%CURL_CMD% -Lo %~dp0lib\bd_situ.zip https://downloads.fanbox.cc/files/post/5754786/IT4TSnDvgWu21nis0hxY0Vkm.zip
	if !errorlevel! neq 0 ( pause & popd & exit /b !errorlevel! )

	echo %PS_CMD% "try { Expand-Archive -Path %~dp0lib\bd_situ.zip  -DestinationPath %~dp0lib\bd\ -Force } catch { exit 1 }"
	%PS_CMD% "try { Expand-Archive -Path %~dp0lib\bd_situ.zip  -DestinationPath %~dp0lib\bd\ -Force } catch { exit 1 }"
	if !errorlevel! neq 0 ( pause & popd & exit /b !errorlevel! )
	del /q %~dp0lib\bd_situ.zip

	%PS_CMD% -File %~dp0EpsCategory2Wildcard.ps1 %~dp0lib\bd\BD_シチュエーション.yml
	move /Y %~dp0lib\bd\シチュエーション.txt bd\situation.txt
)

if not exist bd\new_fantasy_outfit.txt (
	echo %CURL_CMD% -Lo %~dp0lib\bd_nfo.zip https://downloads.fanbox.cc/files/post/5822703/VhuspaHInNLgrra6qhQWKtNC.zip
	%CURL_CMD% -Lo %~dp0lib\bd_nfo.zip https://downloads.fanbox.cc/files/post/5822703/VhuspaHInNLgrra6qhQWKtNC.zip
	if !errorlevel! neq 0 ( pause & popd & exit /b !errorlevel! )

	echo %PS_CMD% "try { Expand-Archive -Path %~dp0lib\bd_nfo.zip -DestinationPath %~dp0lib\bd\ -Force } catch { exit 1 }"
	%PS_CMD% "try { Expand-Archive -Path %~dp0lib\bd_nfo.zip -DestinationPath %~dp0lib\bd\ -Force } catch { exit 1 }"
	if !errorlevel! neq 0 ( pause & popd & exit /b !errorlevel! )
	del /q %~dp0lib\bd_nfo.zip

	%PS_CMD% -File %~dp0EpsCategory2Wildcard.ps1 %~dp0lib\bd\BD_Newファンタジーコーデ.yml
	move /Y %~dp0lib\bd\Newファンタジーコーデ.txt bd\new_fantasy_outfit.txt
)
endlocal

call %~dp0Download.bat nai bdsm.txt https://pastebin.com/raw/yNeiK7BL
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai bdsm_item.txt https://rentry.org/osttx/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai bdsm_outfit.txt https://pastebin.com/raw/LZKytJys
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai character.txt https://pastebin.com/raw/SpRg5EBK
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
%PS_CMD% "try { &{(Get-Content 'nai\character.txt') -replace '\\', '' -replace '\(', '\(' -replace '\)', '\)' | Set-Content 'nai\character.txt' } } catch { exit 1 }"
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat nai clothing.txt https://pastebin.com/raw/pg3ef3CN
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai cum.txt https://rentry.org/hoom5/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai exposing.txt https://pastebin.com/raw/FySHX8bK
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

call %~dp0Download.bat nai fetish.txt https://rentry.org/qm6dx/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai framing.txt https://rentry.org/7droi/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai hair.txt https://rentry.org/gzmd7/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai lingerie.txt https://rentry.org/kgg24/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai lingerie_state.txt https://rentry.org/nxgvi/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai location.txt https://rentry.org/uh9p5/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai naked_outfit.txt https://rentry.org/wquaq/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai pose.txt https://rentry.org/m9dz6/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai publicity.txt https://rentry.org/hqv3p/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai sex_act.txt https://rentry.org/k5auh/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai sex_face.txt https://rentry.org/gt8wk/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai sex_position.txt https://rentry.org/ma68z/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )
call %~dp0Download.bat nai sex_toy.txt https://rentry.org/6xyrr/raw
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

popd rem %~dp0..\Wildcard
