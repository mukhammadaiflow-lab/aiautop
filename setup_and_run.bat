@echo off
echo ==========================================
echo      AI Automation Platform Setup
echo ==========================================
echo.

echo [1/3] Checking for Node.js...
where npm >nul 2>nul
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Node.js is NOT installed!
    echo.
    echo Please go to https://nodejs.org/ and install the "LTS" version.
    echo After installing, run this script again.
    echo.
    pause
    exit /b
)
echo Node.js is found.
echo.

echo [2/3] Installing dependencies (this may take a minute)...
call npm install
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Installation failed.
    pause
    exit /b
)
echo Dependencies installed.
echo.

echo [3/3] Starting applications...
echo Starting Backend...
start "Backend Server" cmd /k "npm run dev:server"
echo Starting Frontend...
start "Frontend Studio" cmd /k "npm run dev:web"

echo.
echo ==========================================
echo      All Systems Operational! 🚀
echo ==========================================
echo.
echo You can minimize this window, but do not close it.
echo.
pause
