@echo off
echo ===================================================
echo   PCB DIAGNOSTICS AI - FRONTEND WORKSTATION
echo ===================================================
cd /d %~dp0\frontend

set PATH=d:\tools\node;%PATH%
npm run dev -- --host 0.0.0.0 --port 5173
pause
