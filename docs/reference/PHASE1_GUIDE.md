# Phase 1: Foundation Setup - Step-by-Step Guide

**Navigation:** [← Back to Plan](../planning/PLAN.md) | [Back to Index](../INDEX.md) | [Next Phase →](PHASE2_GUIDE.md)

## Overview
This guide walks you through every step of Phase 1, from installing Unity to building your first iOS test.

## Day 1: Unity Setup and Project Creation

### Morning (2-3 hours)
#### Step 1: Install Unity Hub
```bash
# Download from https://unity.com/download
# Install Unity Hub
# Sign in with Unity account (create if needed)
```

#### Step 2: Install Unity 6.1
1. Open Unity Hub
2. Click "Installs" → "Install Editor"
3. Select "6.1" (Latest version)
4. Check modules:
   - ✅ iOS Build Support
   - ✅ Visual Studio (or preferred IDE)
   - ✅ Documentation
5. Click "Install" (takes 20-40 minutes)

**Note**: Unity 6.1 is newer than the LTS version, so some features may differ from older tutorials.

#### Step 3: Create Project
1. Unity Hub → "Projects" → "New Project"
2. Template: "3D (URP)" 
3. Project Name: `WaterballGame`
4. Location: Your dev folder
5. Click "Create Project"

### Afternoon (2-3 hours)
#### Step 4: Initial Project Configuration
```csharp
// File → Build Settings
// 1. Select iOS platform
// 2. Click "Switch Platform" (5-10 minutes)
// 3. Player Settings:
```
- Company Name: Your name/company
- Product Name: Waterball Game
- Bundle ID: `com.yourcompany.waterballgame`
- Minimum iOS: 14.0

#### Step 5: Verify Build Works
1. File → Build Settings → Build
2. Save to `Builds/iOS/` folder
3. Should complete without errors
4. Don't need to run on device yet

### End of Day Checklist
- [ ] Unity 6.1 installed with iOS support
- [ ] New project created with URP template
- [ ] Platform switched to iOS
- [ ] Initial build succeeds

## Day 2: Git Repository and Folder Structure

### Morning (2 hours)
#### Step 1: Initialize Git Repository
```bash
cd WaterballGame
git init
git remote add origin https://github.com/yourusername/waterball_game.git
```

#### Step 2: Create Unity .gitignore
Create `.gitignore`:
```
# Unity folders
[Ll]ibrary/
[Tt]emp/
[Oo]bj/
[Bb]uild/
[Bb]uilds/
[Ll]ogs/
[Uu]ser[Ss]ettings/

# Memory captures
[Mm]emoryCaptures/

# Asset meta data
!/[Aa]ssets/**/*.meta

# Unity generated
ExportedObj/
.consulo/
*.csproj
*.unityproj
*.sln
*.suo
*.tmp
*.user
*.userprefs
*.pidb
*.booproj
*.svd
*.pdb
*.mdb
*.opendb
*.VC.db

# OS generated
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db
```

#### Step 3: Create Folder Structure
In Unity Project window, create:
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
│   ├── Materials/
│   ├── Textures/
│   └── Scenes/
├── Plugins/
└── StreamingAssets/
```

### Afternoon (2 hours)
#### Step 4: Create Assembly Definitions
1. Right-click `_Game/Scripts` → Create → Assembly Definition
2. Name: `WaterballGame.Scripts`
3. Right-click `_Game/Scripts/Tests` → Create → Assembly Definition
4. Name: `WaterballGame.Tests`
5. Add reference to `WaterballGame.Scripts`

#### Step 5: Initial Commit
```bash
git add .
git commit -m "Initial Unity project setup with folder structure"
git push -u origin main
```

### End of Day Checklist
- [ ] Git repository initialized
- [ ] Proper .gitignore for Unity
- [ ] Folder structure created
- [ ] Assembly definitions set up
- [ ] First commit pushed

## Day 3: Test Framework Integration

### Morning (3 hours)
#### Step 1: Install Test Framework
1. Window → Package Manager
2. Packages: Unity Registry
3. Search "Test Framework"
4. Install (if not already)

#### Step 2: Create First Test
Create `Assets/_Game/Scripts/Tests/EditMode/SampleTest.cs`:
```csharp
using NUnit.Framework;
using UnityEngine;

namespace WaterballGame.Tests.EditMode
{
    public class SampleTest
    {
        [Test]
        public void SampleTest_PassesCorrectly()
        {
            // Arrange
            int expected = 2;
            
            // Act
            int actual = 1 + 1;
            
            // Assert
            Assert.AreEqual(expected, actual);
        }
    }
}
```

#### Step 3: Run Test
1. Window → General → Test Runner
2. Click "EditMode" tab
3. Click "Run All"
4. Should see green checkmark

### Afternoon (2 hours)
#### Step 4: Create PlayMode Test
Create `Assets/_Game/Scripts/Tests/PlayMode/SceneLoadTest.cs`:
```csharp
using System.Collections;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;
using UnityEngine.SceneManagement;

namespace WaterballGame.Tests.PlayMode
{
    public class SceneLoadTest
    {
        [UnityTest]
        public IEnumerator MainScene_LoadsWithoutErrors()
        {
            // Act
            SceneManager.LoadScene("MainScene");
            
            // Wait for scene to load
            yield return null;
            
            // Assert
            Assert.AreEqual("MainScene", SceneManager.GetActiveScene().name);
        }
    }
}
```

#### Step 5: Configure Test Assembly
Edit `WaterballGame.Tests.asmdef`:
- Add references:
  - UnityEngine.TestRunner
  - UnityEditor.TestRunner
  - WaterballGame.Scripts
- Platform settings: Any Platform
- Define Constraints: UNITY_INCLUDE_TESTS

### End of Day Checklist
- [ ] Test Framework installed
- [ ] Edit mode test working
- [ ] Play mode test structure ready
- [ ] Test Runner window familiar

## Day 4: Basic Scene Creation with Tests

### Morning (3 hours)
#### Step 1: Create Test for Scene Objects
Create `Assets/_Game/Scripts/Tests/PlayMode/GameSceneTest.cs`:
```csharp
using System.Collections;
using NUnit.Framework;
using UnityEngine;
using UnityEngine.TestTools;

namespace WaterballGame.Tests.PlayMode
{
    public class GameSceneTest
    {
        [UnityTest]
        public IEnumerator GameScene_ContainsRequiredObjects()
        {
            // Arrange
            yield return LoadGameScene();
            
            // Assert
            Assert.IsNotNull(GameObject.Find("PlayingField"), "PlayingField not found");
            Assert.IsNotNull(GameObject.Find("MainCamera"), "MainCamera not found");
            Assert.IsNotNull(GameObject.Find("Lighting"), "Lighting not found");
        }
        
        private IEnumerator LoadGameScene()
        {
            var loadOperation = UnityEngine.SceneManagement.SceneManager.LoadSceneAsync("GameScene");
            while (!loadOperation.isDone)
                yield return null;
        }
    }
}
```

#### Step 2: Create Scene to Pass Test
1. File → New Scene → Basic (URP)
2. Save as `Assets/_Game/Scenes/GameScene.unity`
3. Create GameObjects:
   - Create Empty → Name: "PlayingField"
   - Camera already exists as "Main Camera"
   - Create Empty → Name: "Lighting"
4. File → Build Settings → Add Open Scenes

### Afternoon (2 hours)
#### Step 3: Create Playing Field
1. Select PlayingField GameObject
2. Create child: 3D Object → Plane
3. Scale: (2, 1, 3) for 16:9 aspect
4. Create Material:
   - Right-click Materials folder → Create → Material
   - Name: "IceRink"
   - Albedo: Light blue color
   - Smoothness: 0.8

#### Step 4: Run Tests
1. Open Test Runner
2. Run PlayMode tests
3. All should pass
4. Commit changes

### End of Day Checklist
- [ ] Game scene created
- [ ] Tests for scene structure
- [ ] Basic playing field
- [ ] All tests passing

## Day 5: iOS Build Configuration and Testing

### Morning (3 hours)
#### Step 1: Configure iOS Settings
File → Build Settings → Player Settings:
```
Other Settings:
- Bundle Identifier: com.yourcompany.waterballgame
- Version: 0.1.0
- Build: 1
- Target minimum iOS Version: 14.0
- Architecture: ARM64
- Target Device Family: iPhone + iPad
- Requires Persistent WiFi: Off
```

#### Step 2: Create Build Script
Create `Assets/_Game/Scripts/Editor/BuildScript.cs`:
```csharp
using UnityEditor;
using UnityEditor.Build.Reporting;
using UnityEngine;

public static class BuildScript
{
    [MenuItem("Build/Build iOS")]
    public static void BuildiOS()
    {
        BuildPlayerOptions buildPlayerOptions = new BuildPlayerOptions();
        buildPlayerOptions.scenes = new[] { "Assets/_Game/Scenes/GameScene.unity" };
        buildPlayerOptions.locationPathName = "Builds/iOS/WaterballGame";
        buildPlayerOptions.target = BuildTarget.iOS;
        buildPlayerOptions.options = BuildOptions.None;

        BuildReport report = BuildPipeline.BuildPlayer(buildPlayerOptions);
        BuildSummary summary = report.summary;

        if (summary.result == BuildResult.Succeeded)
        {
            Debug.Log("Build succeeded: " + summary.totalSize + " bytes");
        }
        else
        {
            Debug.LogError("Build failed");
        }
    }
}
```

### Afternoon (2 hours)
#### Step 3: Test iOS Build
1. Build → Build iOS (or use menu item)
2. Open Xcode project in Builds/iOS/
3. Connect iOS device
4. Select your team in Signing
5. Build and run on device

#### Step 4: Create Build Test
```csharp
[Test]
public void BuildSettings_ConfiguredForiOS()
{
    Assert.AreEqual(BuildTarget.iOS, EditorUserBuildSettings.activeBuildTarget);
    Assert.IsTrue(PlayerSettings.GetApplicationIdentifier(BuildTargetGroup.iOS).StartsWith("com."));
}
```

### End of Day Checklist
- [ ] iOS build settings configured
- [ ] Build script created
- [ ] Successfully built to Xcode
- [ ] Ran on iOS device (empty scene)
- [ ] All tests passing

## Phase 1 Completion Checklist

### Must Have
- [x] Unity project created and configured
- [x] Git repository with proper structure
- [x] Test framework integrated
- [x] Basic scene with tests
- [x] iOS build working

### Nice to Have
- [ ] Automated build pipeline
- [ ] Multiple test scenes
- [ ] Performance baseline

## Common Issues & Solutions

### Unity Hub won't install Unity version
- Check disk space (need ~10GB)
- Try different Unity Hub version
- Download Unity directly

### iOS build fails
- Check Xcode is installed
- Verify Apple Developer account
- Try cleaning build folder

### Tests not showing up
- Reimport test files
- Check assembly definition references
- Restart Unity

## Next Phase
Ready for [Phase 2: Core Mechanics](PHASE2_GUIDE.md) where we'll add ball physics and touch input!