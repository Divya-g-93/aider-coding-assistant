@echo off
setlocal

if "%~1"=="" (
    echo Usage:
    echo   start_aider.cmd "C:\path\to\your\project"
    echo Example:
    echo   start_aider.cmd "C:\Users\YourName\Projects\my-app"
    echo.
    pause
    exit /b 1
)

set PROJECT_PATH=%~1

if not exist "%PROJECT_PATH%" (
    echo ERROR: Project folder does not exist:
    echo %PROJECT_PATH%
    echo.
    pause
    exit /b 1
)

cd /d "%PROJECT_PATH%"
echo Starting Aider for:
echo %PROJECT_PATH%
echo.

set /p MODEL="Enter model name [default: qwen2.5-coder:3b]: "
if "%MODEL%"=="" set MODEL=qwen2.5-coder:3b

aider --model ollama/%MODEL%
