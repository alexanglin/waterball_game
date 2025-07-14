# Next Steps - Current Action Plan

**Navigation:** [← Back to Index](../INDEX.md) | [Phase 1 Guide →](PHASE1_GUIDE.md)

## Current Status
✅ Unity Hub installed  
✅ Unity 6.1 installed  
⏳ Ready to create project

## Immediate Next Steps (Today)

### 1. Create Unity Project (30 minutes)
```bash
# Steps:
1. Open Unity Hub
2. Click "New Project"
3. Select "3D (URP)" template
4. Name: WaterballGame
5. Location: Your development folder
6. Click "Create Project"
```

**Success Check**: Project opens in Unity Editor

### 2. Configure for iOS (20 minutes)
```bash
# In Unity:
1. File → Build Settings
2. Select "iOS" platform
3. Click "Switch Platform" (this takes 5-10 minutes)
4. Close Build Settings when done
```

**Success Check**: iOS icon appears next to scenes in Build Settings

### 3. Test Initial Build (30 minutes)
```bash
# Quick test:
1. File → Build Settings
2. Click "Build"
3. Create folder: Builds/iOS/
4. Save as "WaterballGame"
5. Let it build (don't need to open Xcode yet)
```

**Success Check**: Build completes without errors

### 4. Save & Version Project (20 minutes)
```bash
# In Unity:
1. File → Save Project
2. Create initial scene: File → Save As → "MainScene"
3. Save to: Assets/_Game/Scenes/MainScene.unity
```

### 5. Update Documentation (10 minutes)
After completing above:
1. Check off completed tasks in TASKS.md
2. Note any Unity 6.1 specific issues
3. Update time estimates if needed

## Tomorrow's Plan (Day 2)

### Git Repository Setup
1. Create .gitignore for Unity
2. Initialize repository
3. Create folder structure
4. Make first commit

**Preparation**: Have GitHub account ready

## Common Issues & Quick Fixes

### Unity 6.1 Specific
- **Template looks different**: Choose "3D (URP)" or "3D (HDRP Mobile)"
- **Switch platform fails**: Ensure iOS module installed in Unity Hub
- **Build errors**: Check Xcode is installed (even if not using yet)

### Quick Decisions
- **URP vs HDRP**: Use URP for mobile performance
- **Folder location**: Keep project in ~/Development/ or similar
- **Scene name**: "MainScene" for now, rename later

## Daily Log Template
```markdown
## [Date] - Day 1 Progress
**Completed**:
- Created Unity project
- Switched to iOS platform
- Initial build successful

**Issues**:
- [Note any problems]

**Time**: 
- Estimated: 2 hours
- Actual: [your time]

**Tomorrow**: Git setup
```

## Quick Commands Reference

### Terminal (for tomorrow)
```bash
cd WaterballGame
git init
echo "# Unity .gitignore" > .gitignore
```

### Unity Shortcuts
- `Cmd+S` - Save scene
- `Cmd+Shift+B` - Build settings
- `Cmd+B` - Build
- `Cmd+0` - Open project folder

---

**Remember**: Small progress is still progress. Focus on one task at a time!