@echo off
setlocal EnableExtensions

:: =========================
:: 1) Clean %LOCALAPPDATA%\Temp
:: =========================
set "TEMP_DIR=%LOCALAPPDATA%\Temp"

if exist "%TEMP_DIR%\" (
  :: Xóa file trong Temp (file bị khóa sẽ tự bỏ qua)
  del /f /q "%TEMP_DIR%\*" >nul 2>&1

  :: Xóa thư mục con trong Temp (thư mục đang dùng sẽ tự bỏ qua)
  for /d %%D in ("%TEMP_DIR%\*") do (
    rd /s /q "%%D" >nul 2>&1
  )
)

:: =========================
:: 2) Empty Recycle Bin (silently)
:: =========================
powershell -NoProfile -ExecutionPolicy Bypass -Command "try { Clear-RecycleBin -Force -ErrorAction Stop } catch { }" >nul 2>&1
echo Da xoa sach Thung rac (Recycle Bin).
pause
