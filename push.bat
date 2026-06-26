@echo off
cd /d "%~dp0"
echo.
echo === Petrol Pump DCR — Push to GitHub ===
echo.
if exist .git\index.lock (
    echo Clearing stale git lock...
    del /f .git\index.lock
)
git add -A
git status
echo.
set /p MSG="Commit message (press Enter for 'Update'): "
if "%MSG%"=="" set MSG=Update
git commit -m "%MSG%"
echo.
echo Pushing to GitHub...
git push
echo.
echo Done! Render will auto-deploy in ~1-2 minutes.
echo.
pause
