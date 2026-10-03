@echo off
echo ====================================================================
echo   LAUNCHING PCB DIAGNOSTICS AI ENGINEERING WORKSTATION PLATFORM
echo ====================================================================
echo Starting Backend Server on http://127.0.0.1:5000 ...
start "PCB Diagnostics AI - Backend" cmd /k "%~dp0start_backend.bat"

timeout /t 3 /nobreak >nul

echo Starting Frontend UI on http://localhost:5173 ...
start "PCB Diagnostics AI - Frontend" cmd /k "%~dp0start_frontend.bat"

echo ====================================================================
echo Platform initiated! Open http://localhost:5173 in your browser.
echo Default Demo Engineer: engineer@pcbdiag.ai / Engineer@123
echo Default Demo Admin:    admin@pcbdiag.ai / Admin@123
echo ====================================================================
