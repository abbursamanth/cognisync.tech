#!/bin/bash
# Simple deployment trigger script for the ceremony

echo "🚀 CogniSync Deployment Script"
echo "=============================="
echo ""

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: Please run this script from the project root directory"
    exit 1
fi

echo "📦 Installing dependencies..."
npm ci

echo "🏗️  Building the project..."
npm run build

echo "✅ Build complete!"
echo ""
echo "🌐 Your website will be available at: https://cognisync.tech"
echo "📧 Email collection is configured and working via EmailJS"
echo "💼 Email history available at: https://dashboard.emailjs.com/"
echo ""
echo "🎉 CogniSync is ready for launch!"
