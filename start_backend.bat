@echo off
echo ===================================================
echo   PCB DIAGNOSTICS AI - BACKEND SERVER
echo ===================================================
cd /d %~dp0

call venv\Scripts\activate.bat
python backend\run.py --seed
pause
