@echo off
chcp 65001 > NUL
setlocal
set LINK_DST=%~1
set LINK_DST_DIR=%~dp1
set LINK_DST_NAME=%~nx1
set LINK_SRC=%~2

@REM DST がリンク済みなら何もしない
for /f "delims=" %%A in ('dir /aL /b "%LINK_DST_DIR%" 2^>NUL') do (
	if /i "%%~A"=="%LINK_DST_NAME%" ( exit /b 0 )
)

@REM リンク済みでない DST があればバックアップ、言語ロケールの影響に注意が必要
set "DATE_TIME=%DATE:/=-%_%TIME::=-%"
set "DATE_TIME=%DATE_TIME: =0%"
set "DATE_TIME=%DATE_TIME:~0,-3%"
set "NEW_NAME=%LINK_DST_NAME%_%DATE_TIME%"
if exist "%LINK_DST%" ( ren "%LINK_DST%" "%NEW_NAME%" )
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )

mklink /j "%LINK_DST%" "%LINK_SRC%" >NUL
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )

endlocal
