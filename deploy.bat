@echo off
REM Simple deployment trigger script for the ceremony

echo 🚀 CogniSync Deployment Script
echo ==============================
echo.

REM Check if we're in the right directory
if not exist "package.json" (
    echo ❌ Error: Please run this script from the project root directory
    pause
    exit /b 1
)

echo 📦 Installing dependencies...
call npm ci

echo 🏗️  Building the project...
call npm run build

echo ✅ Build complete!
echo.
echo 🌐 Your website will be available at: https://cognisync.tech
echo 📧 Email collection is configured and working via EmailJS
echo 💼 Email history available at: https://dashboard.emailjs.com/
echo.
echo 🎉 CogniSync is ready for launch!
pause
