@echo off
set PATH=C:\Users\pitkyal\node\node-v26.3.1-win-x64\node-v26.3.1-win-x64;%PATH%
cd /d "%~dp0"
echo Starting slides editor...
start http://localhost:3456
npx slides-grab edit --slides-dir decks\noon-fy26-reforecast
pause
