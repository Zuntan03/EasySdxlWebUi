@echo off
chcp 65001 > NUL
pushd %~dp0

if exist ../venv-forge/ (
	call ../venv-forge/Scripts/activate.bat
) else (
	if exist ../venv-a1111/ (
		call ../venv-a1111/Scripts/activate.bat
	) else (
		echo "[ERROR] venv not found."
		pause & popd & exit /b 1
	)
)

python ..\setup\generate_dart_wildcard.py
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd rem %~dp0
