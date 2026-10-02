@echo off
setlocal enabledelayedexpansion

cls
echo.
echo ============================================================================
echo   Local Coding Assistant - Aider Windows Setup
necho ============================================================================
echo.

REM ------------------------------------------------------------
REM Check Python installation
REM ------------------------------------------------------------
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not available in PATH.
    echo.
    echo Please install Python 3.10 or newer from:
    echo https://www.python.org/downloads/
    echo.
    echo IMPORTANT: During installation, check "Add Python to PATH".
    echo Then restart this terminal and run the script again.
    echo.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('python --version 2^>^&1') do set PYTHON_VERSION=%%i
echo OK: Python detected: %PYTHON_VERSION%

REM ------------------------------------------------------------
REM Validate Python version >= 3.10
REM ------------------------------------------------------------
python -c "import sys; raise SystemExit(0 if sys.version_info >= (3, 10) else 1)" >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python version must be 3.10 or newer.
    echo Current version: %PYTHON_VERSION%
    echo.
    echo Please install Python 3.12 (recommended) from:
    echo https://www.python.org/downloads/
    echo.
    pause
    exit /b 1
)

REM ------------------------------------------------------------
REM Ensure pip is present
REM ------------------------------------------------------------
python -m pip --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: pip is not available.
    echo Reinstall Python with pip included.
    pause
    exit /b 1
)

REM ------------------------------------------------------------
REM Upgrade pip
REM ------------------------------------------------------------
echo.
echo Installing/updating pip...
python -m pip install --upgrade pip --quiet
if errorlevel 1 (
    echo WARNING: pip upgrade returned a warning, continuing...
)

REM ------------------------------------------------------------
REM Install Aider if missing
REM ------------------------------------------------------------
aider --version >nul 2>&1
if errorlevel 1 (
    echo.
    echo Installing Aider...
    python -m pip install aider-chat --quiet
    if errorlevel 1 (
        echo ERROR: Aider installation failed.
        echo.
        echo Try these fixes:
        echo 1. Enable Windows Long Path support:
        echo    reg add HKLM\SYSTEM\CurrentControlSet\Control\FileSystem /v LongPathsEnabled /d 1 /f
        echo 2. Restart the PC after enabling long paths.
        echo 3. Reinstall Python 3.12.
        echo 4. Retry: python -m pip install aider-chat
        echo.
        pause
        exit /b 1
    )
) else (
    for /f "tokens=*" %%i in ('aider --version 2^>^&1') do set AIDER_VERSION=%%i
    echo OK: Aider already installed: %AIDER_VERSION%
)

REM ------------------------------------------------------------
REM Check Ollama installation
REM ------------------------------------------------------------
where ollama >nul 2>&1
if errorlevel 1 (
    echo WARNING: Ollama not found in PATH.
    echo Please install Ollama from: https://ollama.com/
    echo Then run this script again.
    echo.
    pause
    exit /b 1
)

REM ------------------------------------------------------------
REM Check if Ollama is running
REM ------------------------------------------------------------
curl -s http://127.0.0.1:11434/api/tags >nul 2>&1
if errorlevel 1 (
    echo WARNING: Ollama is installed but not running.
    echo.
    echo Please start Ollama and then run this script again.
    echo Example: open the Ollama app or run: ollama serve
    echo.
    pause
    exit /b 1
)

REM ------------------------------------------------------------
REM Check current local models
REM ------------------------------------------------------------
for /f "tokens=*" %%i in ('curl -s http://127.0.0.1:11434/api/tags 2^>nul') do set MODELS_JSON=%%i
if not defined MODELS_JSON (
    echo WARNING: Ollama is running but no model list was returned.
    echo You can pull a model later with:
    echo   ollama pull qwen2.5-coder:3b
    echo   or
    echo   ollama pull qwen2.5-coder:1.5b
) else (
    echo OK: Ollama is running and responding.
    echo Available model data detected.
)

REM ------------------------------------------------------------
REM Final verification
REM ------------------------------------------------------------
aider --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Aider verification failed.
    pause
    exit /b 1
)

for /f "tokens=*" %%i in ('aider --version 2^>^&1') do set FINAL_AIDER=%%i
echo OK: Aider verified: %FINAL_AIDER%

echo.
echo ============================================================================
echo   Setup complete.
echo ============================================================================
echo.
echo Next steps:
echo   1. Ensure Ollama is running.
echo   2. Pull a model if needed:
    echo      ollama pull qwen2.5-coder:3b
    echo   3. Start Aider for your project:
    echo      scripts\start_aider.cmd "C:\path\to\your\project"
    echo.
    echo Examples inside Aider:
    echo   /ask Explain the architecture of this project
    echo   /ask Generate unit tests for the main module
    echo   /ask Troubleshoot this error: <paste stack trace>
    echo   /help
    echo.
    pause
    exit /b 0
