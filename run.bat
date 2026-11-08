@echo off
title All-in-One AI Consultant Launcher
echo ==============================================
echo   Starting All-in-One AI Consultant
echo ==============================================
echo.

cd /d "%~dp0"

echo [1/2] Starting Backend API (FastAPI) on http://127.0.0.1:8000 ...
start "AI Consultant - Backend" cmd /k "cd /d ""%~dp0backend"" && .venv\Scripts\uvicorn.exe app.main:app --reload --host 127.0.0.1 --port 8000"

timeout /t 2 /nobreak >nul

echo [2/2] Starting Frontend (Next.js) on http://localhost:3000 ...
start "AI Consultant - Frontend" cmd /k "cd /d ""%~dp0frontend"" && npm.cmd run dev"

echo.
echo ==============================================
echo   Services are running!
echo   Frontend : http://localhost:3000
echo   Backend  : http://127.0.0.1:8000
echo   API Docs : http://127.0.0.1:8000/docs
echo ==============================================
echo.
pause
