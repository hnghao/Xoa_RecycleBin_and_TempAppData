@echo off
setlocal EnableExtensions

call :CLEAN_DIR "%TEMP%"
call :CLEAN_DIR "%TMP%"

:: =========================
:: Empty Recycle Bin (silently)
:: =========================
powershell -NoProfile -ExecutionPolicy Bypass -Command "try { Clear-RecycleBin -Force -ErrorAction Stop } catch { }" >nul 2>&1

echo.
echo Done! Da don %TEMP%, %TMP% va da xoa Recycle Bin.
echo (Cua so CMD se giu nguyen, bam phim bat ky de thoat.)
pause >nul
exit /b


:: ============================================================
:: CLEAN_DIR: xóa nội dung trong thư mục, giữ nguyên thư mục gốc
:: - Xóa file + thư mục con
:: - Mục nào bị khóa/không có quyền sẽ tự bỏ qua (không báo lỗi)
:: ============================================================
:CLEAN_DIR
set "TARGET=%~1"

if not defined TARGET goto :eof
if not exist "%TARGET%\" goto :eof

del /f /q "%TARGET%\*" >nul 2>&1
for /d %%D in ("%TARGET%\*") do (
  rd /s /q "%%D" >nul 2>&1
)
goto :eof
