# Unity Cheatsheet - Waterball Game

**Navigation:** [← Back to Reference](DOCUMENTATION_IMPROVEMENTS.md) | [Back to Index](../INDEX.md)

## 🎮 Unity Editor Shortcuts (macOS)

### Essential Navigation
- `Cmd + 1` - Scene view
- `Cmd + 2` - Game view  
- `Cmd + 3` - Inspector
- `Cmd + 4` - Hierarchy
- `Cmd + 5` - Project
- `Cmd + 6` - Console
- `Cmd + Shift + C` - Open Console

### Object Manipulation
- `W` - Move tool
- `E` - Rotate tool
- `R` - Scale tool
- `T` - Rect tool
- `F` - Focus on selected object
- `Cmd + D` - Duplicate
- `Cmd + Shift + D` - Delete

### Play Mode
- `Cmd + P` - Play/Stop
- `Cmd + Shift + P` - Pause
- `Cmd + Alt + P` - Step frame

## 📁 Project Structure Commands

### Create Folders (Right-click in Project)
```
_Game/
├── Scripts/
│   ├── Core/
│   ├── Physics/
│   ├── Input/
│   ├── UI/
│   └── Tests/
├── Prefabs/
├── Materials/
└── Scenes/
```

### Script Template
```csharp
using UnityEngine;

namespace WaterballGame.Core
{
    public class ComponentName : MonoBehaviour
    {
        #region Fields
        [SerializeField] private float _parameter;
        #endregion

        #region Unity Lifecycle
        private void Awake() { }
        private void Start() { }
        private void Update() { }
        #endregion

        #region Public Methods
        #endregion

        #region Private Methods
        #endregion
    }
}
```

## 🧪 Testing Commands

### Run Tests
- Window → General → Test Runner
- `Run All` - Execute all tests
- `Run Selected` - Run specific test
- `Rerun Failed` - Re-run only failed tests

### Create Test
```csharp
[Test]
public void ComponentName_Should_ExpectedBehavior_When_Condition()
{
    // Arrange
    var component = new GameObject().AddComponent<ComponentName>();
    
    // Act
    component.DoSomething();
    
    // Assert
    Assert.AreEqual(expected, actual);
}
```

## 🏗 Build Commands

### iOS Build Settings
1. File → Build Settings
2. Platform: iOS → Switch Platform
3. Player Settings:
   - Bundle ID: `com.company.waterballgame`
   - Target SDK: Device SDK
   - Minimum iOS: 14.0

### Build Shortcuts
- `Cmd + B` - Build
- `Cmd + Shift + B` - Build and Run

## 🐛 Debug Commands

### Console Filtering
- Click message types to filter (Log/Warning/Error)
- Search bar for specific messages
- "Clear on Build" - Auto-clear console
- "Collapse" - Group duplicate messages

### Debug Shortcuts
```csharp
// Quick debug outputs
Debug.Log($"Variable: {variable}");
Debug.LogWarning("Performance issue");
Debug.LogError("Critical problem");

// Visual debugging
Debug.DrawLine(start, end, Color.red);
Debug.DrawRay(origin, direction * distance);
```

## ⚡ Performance Commands

### Profiler
- Window → Analysis → Profiler
- `Deep Profile` - Detailed performance data
- `Clear` - Reset profiler data
- `Record` - Start/stop profiling

### Stats Window (Game View)
- Click "Stats" button in Game view
- Shows FPS, draw calls, triangles, etc.

## 🎯 Physics Debugging

### Physics Debug Visualization
- Edit → Project Settings → Physics
- Enable "Queries Hit Triggers"
- Window → Analysis → Physics Debugger

### Gizmos
- Toggle in Scene view toolbar
- Show colliders, triggers, joints

## 💾 Version Control

### Git Commands for Unity
```bash
# Before committing
git add . -u  # Don't add untracked
git status    # Check changes

# Smart commits
git add Assets/_Game/  # Add only game files
git commit -m "feat: Add water physics"

# Useful aliases
git config --global alias.unity-clean "clean -xfd -e Library/"
```

## 🔧 Common Fixes

### Build Errors
- "iOS module not installed" → Unity Hub → Add Modules
- "Xcode not found" → Install from App Store
- "Signing failed" → Xcode → Preferences → Accounts

### Performance Issues
1. Quality Settings → iOS → Lower quality
2. Reduce water particles
3. Enable GPU Instancing on materials
4. Use object pooling

### Import Issues
- Right-click → Reimport
- Edit → Clear Cache
- Close Unity, delete Library/, reopen

## 📱 Device Testing

### Build to Device
1. Connect iPhone via USB
2. Xcode → Window → Devices and Simulators
3. Unity → Build and Run
4. Trust developer certificate on device

### Remote Debugging
- Build with "Development Build" checked
- Enable "Script Debugging"
- Connect Unity Profiler to device

## 🎨 Quick Material Setup

### Water Material
1. Create → Material → URP/Lit
2. Surface: Transparent
3. Base Color: Light blue with alpha
4. Smoothness: 0.9
5. Enable "Receive Shadows"

### Ball Material
1. Create → Material → URP/Lit  
2. Base Color: White
3. Smoothness: 0.7
4. Metallic: 0

---

**Pro Tip**: Keep this cheatsheet open in a separate monitor/iPad while developing!