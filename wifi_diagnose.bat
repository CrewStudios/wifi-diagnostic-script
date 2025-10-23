@echo off
chcp 65001 >nul
title [BETA] CrewSystems Wi-Fi Diagnostic Utility
color 0A

echo ============================================
echo        Wi-Fi Diagnostic Utility (v1.3)
echo ============================================
echo.

:: 1. Show Wi-Fi interfaces
echo [1/5] Checking Wi-Fi interfaces...
netsh wlan show interfaces
echo.

:: 2. Show IP configuration
echo [2/5] Showing IP configuration...
ipconfig /all
echo.

:: 3. Ping default gateway
echo [3/5] Testing connection to default gateway...
echo Please enter your router's IP (usually something like 192.168.1.1 or 172.16.70.1):
set /p gateway=Router IP: 
if "%gateway%"=="" (
    echo ❌ No gateway entered, skipping test.
) else (
    echo Pinging %gateway%...
    ping %gateway% -n 3
)
echo.

:: 4. Ping internet
echo [4/5] Testing internet connectivity...
ping 8.8.8.8 -n 3
if errorlevel 1 (
    echo ❌ Internet not reachable.
) else (
    echo ✅ Internet reachable.
)
echo.

:: 5. DNS test
echo [5/5] Testing DNS resolution...
nslookup www.google.com
if errorlevel 1 (
    echo ❌ DNS resolution failed.
) else (
    echo ✅ DNS works.
)
echo.
echo ============================================
echo Diagnostics complete!
echo ============================================
pause
exit
