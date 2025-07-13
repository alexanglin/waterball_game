#!/bin/bash
# Waterball Game - Development Environment Setup Script

echo "🌊 Waterball Game - Development Setup"
echo "====================================="

# Check if running on macOS (required for iOS development)
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "❌ Error: iOS development requires macOS"
    exit 1
fi

echo "✅ macOS detected - iOS development supported"

# Check for Unity Hub
if ! command -v unity-hub &> /dev/null; then
    echo "📥 Unity Hub not found. Please install from: https://unity.com/download"
    echo "   1. Download Unity Hub"
    echo "   2. Install Unity 2022.3 LTS"
    echo "   3. Add iOS Build Support module"
    exit 1
fi

echo "✅ Unity Hub found"

# Check for Xcode
if ! command -v xcodebuild &> /dev/null; then
    echo "📥 Xcode not found. Please install from Mac App Store"
    echo "   Required for iOS building and device testing"
    exit 1
fi

echo "✅ Xcode found"

# Check Unity version
UNITY_VERSION="2022.3"
if unity-hub list 2>/dev/null | grep -q "$UNITY_VERSION"; then
    echo "✅ Unity $UNITY_VERSION LTS found"
else
    echo "📥 Unity $UNITY_VERSION LTS not found"
    echo "   Install via Unity Hub: Add -> $UNITY_VERSION LTS -> iOS Build Support"
    exit 1
fi

# Create Unity project structure
echo "📁 Creating project directory structure..."
mkdir -p WaterballGame/{Assets,ProjectSettings,Packages}
mkdir -p WaterballGame/Assets/{_Game/{Scripts/{Core,Physics,Input,UI,Tests},Prefabs,Materials,Textures,Sounds,Scenes},Plugins,StreamingAssets}

echo "🎯 Project structure created successfully!"

# Clone repository (if not already in it)
if [ ! -f "README.md" ]; then
    echo "📥 Cloning project repository..."
    git clone https://github.com/alexanglin/waterball_game.git .
fi

echo "✅ Repository ready"

# Install dependencies reminder
echo ""
echo "🚀 Next Steps:"
echo "1. Open Unity Hub"
echo "2. Add project: WaterballGame/"
echo "3. Install water physics asset (Zibra Liquids recommended)"
echo "4. Review docs/INDEX.md for development guides"
echo "5. Start with Phase 1 tasks in TASKS.md"
echo ""
echo "📚 Documentation: docs/INDEX.md"
echo "🎯 Current Tasks: TASKS.md"
echo "🏗 Architecture: docs/technical/ARCHITECTURE.md"
echo ""
echo "Happy coding! 🌊🏒"