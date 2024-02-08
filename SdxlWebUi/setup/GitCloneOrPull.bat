@echo off
chcp 65001 > NUL

call %~dp0SetGitPath.bat
if %errorlevel% neq 0 ( popd & exit /b %errorlevel% )

set GIT_CLONE_OR_PULL_URL=%~1
for /f "tokens=*" %%i in ("%GIT_CLONE_OR_PULL_URL%") do set GIT_CLONE_OR_PULL_DIR=%%~nxi

if exist %GIT_CLONE_OR_PULL_DIR%\ (
	echo git -C %GIT_CLONE_OR_PULL_DIR% pull
	git -C %GIT_CLONE_OR_PULL_DIR% pull

) else (
	echo git clone %GIT_CLONE_OR_PULL_URL%
	git clone %GIT_CLONE_OR_PULL_URL%
)
if %errorlevel% neq 0 ( pause & exit /b %errorlevel% )
