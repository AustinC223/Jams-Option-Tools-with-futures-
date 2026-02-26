@echo off
chcp 65001 >nul
title JAMS Capital Terminal - Anaconda Mode

:: 1. 設定 Anaconda 的路徑 (請根據你的安裝位置調整)
:: 通常是在 C:\Users\你的使用者名稱\anaconda3
:: 或者 C:\ProgramData\anaconda3
set ANACONDA_PATH=%UserProfile%\anaconda3

:: 2. 啟動 Anaconda 環境 (預設環境名稱通常是 base)
call %ANACONDA_PATH%\Scripts\activate.bat %ANACONDA_PATH%

:: 3. 定位到檔案所在位置
cd /d "%~dp0"

echo ==========================================
echo    JAMS Capital - Anaconda Environment
echo ==========================================
echo 正在透過 Anaconda 啟動 Streamlit...

:: 4. 執行 Streamlit
python -m streamlit run app.py

if %errorlevel% neq 0 (
    echo.
    echo [錯誤] 啟動失敗。如果是因為找不到路徑，
    echo 請確認 .bat 檔中的 ANACONDA_PATH 設定是否正確。
    pause
)