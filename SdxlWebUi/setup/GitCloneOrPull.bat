@echo off
chcp 65001 > NUL

call %~dp0SetGitPath.bat
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

set GIT_CLONE_OR_PULL_URL=%~1
for /f "tokens=*" %%i in ("%GIT_CLONE_OR_PULL_URL%") do set GIT_CLONE_OR_PULL_DIR=%%~nxi

for /f "delims=" %%i in ('git -C %GIT_CLONE_OR_PULL_DIR% config --get remote.origin.url') do set "REMOTE_ORIGIN_URL=%%i"

set CHECKOUT_NAME=%2
setlocal enabledelayedexpansion
if exist %GIT_CLONE_OR_PULL_DIR%\ (
	if "%GIT_CLONE_OR_PULL_URL%"=="%REMOTE_ORIGIN_URL%" (
		if "%CHECKOUT_NAME%" neq "" (
			echo git -C %GIT_CLONE_OR_PULL_DIR% checkout -f %CHECKOUT_NAME%
			git -C %GIT_CLONE_OR_PULL_DIR% checkout -f %CHECKOUT_NAME%
		)

		echo git -C %GIT_CLONE_OR_PULL_DIR% pull
		git -C %GIT_CLONE_OR_PULL_DIR% pull
		if !errorlevel! neq 0 ( pause & endlocal & exit /b 1 )
		endlocal & exit /b 0
	) else (
		echo rmdir /S /Q %GIT_CLONE_OR_PULL_DIR%
		rmdir /S /Q %GIT_CLONE_OR_PULL_DIR%
		if !errorlevel! neq 0 ( pause & endlocal & exit /b 1 )
	)
)
endlocal

echo git clone %GIT_CLONE_OR_PULL_URL%
git clone %GIT_CLONE_OR_PULL_URL%
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )
