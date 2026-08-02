@echo off
chcp 65001 >nul
cd /d "%~dp0"
echo 電子黒板付き写真台帳を起動します。
echo この画面を閉じると、同じWi-Fi上のiPhone/iPadから接続できなくなります。
where py >nul 2>nul
if %errorlevel%==0 (
  start "" "http://localhost:8080"
  py -m http.server 8080 --bind 0.0.0.0
  exit /b
)
where python >nul 2>nul
if %errorlevel%==0 (
  start "" "http://localhost:8080"
  python -m http.server 8080 --bind 0.0.0.0
  exit /b
)
echo Pythonが見つかりません。通常のHTMLとして開きます。
start "" "%~dp0index.html"
pause
