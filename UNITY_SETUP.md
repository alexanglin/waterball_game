# Unity Setup Guide - Waterball Game

## Required Software

### Unity Installation
- **Unity Hub**: Latest version (download from unity.com)
- **Unity Version**: 2022.3.15f1 LTS (Long Term Support)
- **Platform Modules**: iOS Build Support

### Development Environment
- **macOS**: 12.0 or later (required for iOS development)
- **Xcode**: 14.0 or later (for iOS building and testing)
- **Apple Developer Account**: Required for device testing and App Store

## Unity Project Configuration

### 1. Create New Project
```
Unity Hub → New Project → 3D (Universal Render Pipeline)
Project Name: WaterballGame
Location: [Your preferred directory]
```

### 2. Platform Settings
1. Open Build Settings (File → Build Settings)
2. Switch Platform to iOS
3. Click "Switch Platform" (may take several minutes)

### 3. Player Settings Configuration

#### Company and Product
- Company Name: [Your Company]
- Product Name: Waterball Game
- Bundle Identifier: com.[company].waterballgame

#### iOS Settings
- Target Minimum iOS Version: 14.0
- Architecture: ARM64
- Camera Usage Description: "This game does not use the camera"
- Microphone Usage Description: "This game does not use the microphone"

#### Quality Settings
- Texture Quality: Full Res
- Anti Aliasing: 4x Multi Sampling
- V Sync Count: Every V Blank

#### Graphics Settings
- Scriptable Render Pipeline: Universal Render Pipeline Asset
- Color Space: Linear

## Required Packages

### Install via Package Manager (Window → Package Manager)

#### Essential Packages
1. **Input System** (com.unity.inputsystem) - Version 1.7.0+
2. **Test Framework** (com.unity.test-framework) - Version 1.1.33+
3. **Universal RP** (com.unity.render-pipelines.universal) - Version 14.0.8+

#### Optional but Recommended
1. **Cinemachine** (com.unity.cinemachine) - For camera management
2. **Visual Scripting** (com.unity.visualscripting) - For non-programmers
3. **Timeline** (com.unity.timeline) - For cutscenes/animations

## Water Physics Solutions

### Option 1: Zibra Liquids (Recommended)
- **Source**: Unity Asset Store
- **Price**: $199 (one-time)
- **Performance**: Excellent on modern devices
- **Quality**: Photorealistic water
- **Mobile Optimization**: Built-in

### Option 2: Obi Fluid (Alternative)
- **Source**: Unity Asset Store  
- **Price**: $90 (one-time)
- **Performance**: Good with optimization
- **Quality**: Very good
- **Mobile Optimization**: Requires tuning

### Option 3: Custom Particle System (Fallback)
- **Source**: Unity built-in
- **Price**: Free
- **Performance**: Highly optimizable
- **Quality**: Basic but functional
- **Mobile Optimization**: Full control

## Project Structure

### Folder Organization
```
Assets/
├── _Game/
│   ├── Scripts/
│   │   ├── Core/
│   │   ├── Physics/
│   │   ├── Input/
│   │   ├── UI/
│   │   └── Tests/
│   ├── Prefabs/
│   │   ├── Balls/
│   │   ├── Environment/
│   │   └── UI/
│   ├── Materials/
│   ├── Textures/
│   ├── Sounds/
│   └── Scenes/
├── Plugins/
│   └── [Water Physics Solution]/
└── StreamingAssets/
```

## iOS Build Configuration

### Xcode Project Settings
1. **Deployment Target**: iOS 14.0
2. **Device Family**: iPhone, iPad
3. **Supported Orientations**: Landscape Left, Landscape Right
4. **Status Bar**: Hidden during application launch

### Performance Settings
- **Scripting Backend**: IL2CPP
- **Api Compatibility Level**: .NET Standard 2.1
- **Target Device Family**: iPhone, iPad
- **Optimization**: Size and Speed

## Testing Setup

### Unity Test Runner
1. Install Test Framework package
2. Create Tests folder structure:
```
Assets/_Game/Scripts/Tests/
├── EditMode/
└── PlayMode/
```

### Device Testing
1. Connect iPhone/iPad via USB
2. Enable Developer Mode on device
3. Build and Run from Unity
4. Test on multiple device types

## Version Control Setup

### Git Configuration
1. Initialize repository: `git init`
2. Add Unity .gitignore (from GitHub Unity template)
3. Initial commit with project setup

### Recommended .gitignore additions:
```
# Zibra Liquids cache (if using)
Assets/Zibra/
!/Assets/Zibra/Common/

# Obi cache (if using)  
Assets/Obi/Resources/ObiMaterials/

# Custom
Builds/
*.tmp
```

## Performance Profiling Setup

### Unity Profiler
- Window → Analysis → Profiler
- Connect to device for real-time profiling
- Monitor: CPU, GPU, Memory, Rendering

### Key Metrics to Track
- Frame Time: <16.67ms (60 FPS) or <33.33ms (30 FPS)
- Memory Usage: <1GB total
- Draw Calls: <500 per frame
- Triangles: <100k per frame

## Troubleshooting Common Issues

### Build Errors
- **"iOS module not installed"**: Install iOS Build Support via Unity Hub
- **"Xcode not found"**: Install Xcode from Mac App Store
- **"Development team not set"**: Configure Apple Developer account in Xcode

### Performance Issues
- **Low frame rate**: Reduce water particle count
- **Memory warnings**: Enable texture compression
- **Heat generation**: Lower quality settings

## Next Steps
1. Follow PHYSICS_DESIGN.md for water system implementation
2. Reference TESTING_STRATEGY.md for test creation
3. Use PLAN.md for development phases