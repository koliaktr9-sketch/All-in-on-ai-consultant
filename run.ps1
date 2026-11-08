Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "  Starting All-in-One AI Consultant" -ForegroundColor Cyan
Write-Host "==============================================" -ForegroundColor Cyan

$root = $PSScriptRoot
Set-Location $root

Write-Host "`n[1/2] Starting Backend API (FastAPI)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$root\backend'; .\.venv\Scripts\uvicorn.exe app.main:app --reload --host 127.0.0.1 --port 8000"

Start-Sleep -Seconds 2

Write-Host "[2/2] Starting Frontend (Next.js)..." -ForegroundColor Yellow
Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$root\frontend'; npm.cmd run dev"

Write-Host "`nServices are launched!" -ForegroundColor Green
Write-Host "Frontend : http://localhost:3000" -ForegroundColor Cyan
Write-Host "Backend  : http://127.0.0.1:8000" -ForegroundColor Cyan
Write-Host "API Docs : http://127.0.0.1:8000/docs" -ForegroundColor Cyan
