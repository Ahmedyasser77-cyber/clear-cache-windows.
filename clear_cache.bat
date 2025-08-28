@echo off
echo Clearing Windows Cache and Temp Files...
echo.

:: Delete user temp
rd /s /q %temp%
mkdir %temp%

:: Delete Windows temp
rd /s /q C:\Windows\Temp
mkdir C:\Windows\Temp

:: Delete prefetch files
rd /s /q C:\Windows\Prefetch
mkdir C:\Windows\Prefetch

echo.
echo ✅ Done! Some files may remain if they were in use.
pause
