# Waterball Game - Task List

**🎯 Current Status**: Unity 6.1 installed ✅ | **Next**: Create Unity project | **Guide**: [NEXT_STEPS.md](docs/reference/NEXT_STEPS.md)

## Task Tracking
Mark tasks as ✅ when completed. Add new tasks as discovered.

## Documentation Tasks
- [x] Create GAME_MECHANICS.md documenting physical game analysis
- [x] Create ARCHITECTURE.md with technology decisions
- [x] Create PROJECT_REQUIREMENTS_DOCUMENT.md with detailed requirements
- [x] Create PLAN.md with development roadmap
- [x] Create TASKS.md for task tracking
- [x] Update CLAUDE.md with workflow instructions
- [x] Create UNITY_SETUP.md for exact configuration requirements
- [x] Create PHYSICS_DESIGN.md with water simulation calculations
- [x] Create TESTING_STRATEGY.md with comprehensive test cases
- [x] Create UI_UX_DESIGN.md with wireframes and layouts
- [x] Create PERFORMANCE_TARGETS.md with optimization strategies
- [x] Create DEVELOPMENT_PLAN.md with detailed TDD implementation steps

## Phase 1: Foundation Setup (Week 1)
**📖 Step-by-Step Guide**: [Phase 1 Implementation Guide](docs/reference/PHASE1_GUIDE.md)

### Day 1: Unity Setup ⏱ 4-6 hours
- [x] Install Unity Hub
- [x] Install Unity 6.1 with iOS support
- ⏳ **IN PROGRESS** - Ready to create project!

**🎯 NEXT STEPS - Do These Now:** (Total time: ~2 hours)
- [ ] Create new Unity 3D (URP) project named "WaterballGame" (30 min)
  - Open Unity Hub → New Project → 3D (URP) template
  - Name: WaterballGame
  - Location: Your development folder
- [ ] Switch platform to iOS (20 min)
  - File → Build Settings → iOS → Switch Platform
  - Wait for import to complete
- [ ] Verify initial build works (30 min)
  - Build Settings → Build → Create Builds/iOS/ folder
  - Ensure no errors
- [ ] Save project and create MainScene (10 min)
  - File → Save As → Assets/_Game/Scenes/MainScene.unity
  - Add scene to Build Settings

### Day 2: Git & Structure ⏱ 4 hours
- [ ] Initialize git repository with Unity .gitignore
- [ ] Create folder structure (Assets/_Game/Scripts, etc.)
- [ ] Set up assembly definitions
- [ ] Make initial commit and push

### Day 3: Test Framework ⏱ 5 hours
- [ ] Install Unity Test Framework
- [ ] Create EditMode test example
- [ ] Create PlayMode test structure
- [ ] Configure test assemblies
- [ ] Verify all tests run

### Day 4: Scene Creation ⏱ 5 hours
- [ ] Write test for scene objects
- [ ] Create GameScene with required objects
- [ ] Create basic playing field
- [ ] Add scene to build settings
- [ ] All tests passing

### Day 5: iOS Configuration ⏱ 5 hours
- [ ] Configure iOS player settings
- [ ] Create build script
- [ ] Test iOS build in Xcode
- [ ] Run on physical device
- [ ] Document any issues

## Phase 2: Core Mechanics
- [ ] Write tests for ball spawning system
- [ ] Create ball prefab with physics
- [ ] Write tests for input detection
- [ ] Implement touch input handler
- [ ] Write tests for force application
- [ ] Create jet force system (without water)
- [ ] Write tests for collision detection
- [ ] Implement boundary colliders

## Phase 3: Water Physics
- [x] Research Unity water physics solutions ✅ Selected free Unity Particle System
- [ ] ~~Evaluate Zibra Liquids performance~~ (Not needed - using free solution)
- [ ] ~~Evaluate Obi Fluid as alternative~~ (Not needed - using free solution)
- [ ] Write tests for particle system initialization
- [ ] Implement Unity Particle System for water
- [ ] Configure particle emission from jet positions
- [ ] Write tests for particle-ball collision
- [ ] Implement custom force transfer from particles to balls
- [ ] Create water shader with Shader Graph
- [ ] Write performance benchmark tests
- [ ] Optimize particle count (target: 500-1000 max)

## Phase 4: Game Logic
- [ ] Write tests for goal detection
- [ ] Implement goal trigger zones
- [ ] Write tests for score tracking
- [ ] Create ScoreManager class
- [ ] Write tests for game states
- [ ] Implement GameStateManager
- [ ] Write tests for win conditions
- [ ] Create match end logic

## Phase 5: UI/UX
- [ ] Write tests for menu navigation
- [ ] Create main menu scene
- [ ] Write tests for settings persistence
- [ ] Implement settings system
- [ ] Write tests for HUD updates
- [ ] Create in-game HUD
- [ ] Write tests for pause functionality
- [ ] Implement pause menu

## Phase 6: Multiplayer
- [ ] Write tests for split-screen setup
- [ ] Implement camera configuration
- [ ] Write tests for input routing
- [ ] Create PlayerInputManager
- [ ] Write tests for simultaneous play
- [ ] Ensure physics consistency
- [ ] Write tests for rematch flow
- [ ] Implement rematch system

## Phase 7: Polish
- [ ] Write performance tests
- [ ] Implement object pooling
- [ ] Write audio tests
- [ ] Add sound effects
- [ ] Write haptic feedback tests
- [ ] Implement vibration
- [ ] Create particle effects
- [ ] Add UI animations

## Phase 8: Release
- [ ] Create app icon set
- [ ] Capture screenshots for App Store
- [ ] Write app description
- [ ] Set up TestFlight
- [ ] Conduct beta testing
- [ ] Fix reported bugs
- [ ] Submit to App Store
- [ ] Prepare day-one patch

## Documentation Organization (Completed! ✅)
- [x] Create docs/ directory structure (planning/, technical/, development/, reference/)
- [x] Move documentation files to appropriate subdirectories
- [x] Add navigation headers to all documentation files
- [x] Create docs/INDEX.md with role-based navigation
- [x] Add cross-references between related documents
- [x] Create setup automation script (scripts/setup.sh)
- [x] Create documentation validation script (scripts/validate_docs.sh)
- [x] Add CLAUDE.md files to each directory with specific guidelines
- [x] Update main CLAUDE.md with directory-specific guidance references
- [x] Update validation script to check for all CLAUDE.md files
- [ ] Add visual diagrams to architecture documentation
- [ ] Create CHANGELOG.md for version tracking
- [ ] Implement documentation validation in CI/CD
- [ ] Add troubleshooting section to common issues

## ✅ Phase 0: Pre-Development Documentation (COMPLETED)

### Visual Documentation ✓
- [x] Architecture diagram with Mermaid (docs/reference/ARCHITECTURE_DIAGRAM.md)
- [x] Game state machine diagram (in ARCHITECTURE_DIAGRAM.md)
- [x] Physics system flowchart (in ARCHITECTURE_DIAGRAM.md)

### Quick Reference Guides ✓
- [x] UNITY_CHEATSHEET.md (docs/reference/UNITY_CHEATSHEET.md)
- [x] CODE_PATTERNS.md (docs/reference/CODE_PATTERNS.md)
- [x] DAILY_WORKFLOW.md (docs/reference/DAILY_WORKFLOW.md)
- [x] DECISIONS.md (docs/reference/DECISIONS.md)
- [x] NEXT_STEPS.md for current action items

### Deferred to Later Phases
- UI wireframes (do during Phase 5: UI Implementation)
- Debugging guide (create as issues arise)
- Performance checklist (create during Phase 7: Optimization)
- Bug tracking (set up when bugs appear)

### Documentation Improvements (Lower Priority)
- [ ] Add screenshots to Unity setup guide (during actual setup)
- [ ] Implement automated link checking (if time permits)
- [ ] Add CHANGELOG.md for version tracking
- [ ] Create troubleshooting documentation (as issues arise)
- [ ] Add API reference structure for future code docs

## 📍 Current Focus: Phase 1, Day 1 - Unity Project Setup
**📖 Check [NEXT_STEPS.md](docs/reference/NEXT_STEPS.md) for detailed step-by-step instructions!**

### Today's Goal
Create and configure Unity project for iOS development. By end of day:
- Unity project created with URP
- iOS platform configured
- Initial build successful
- Basic scene saved

## Ongoing Tasks
- [ ] Update documentation with implementation changes
- [ ] Check off tasks immediately when completed
- [ ] Note Unity 6.1 specific discoveries
- [ ] Regular git commits with clear messages
- [ ] Keep TASKS.md updated with progress
- [ ] Update time estimates based on actual time spent
- [ ] Document any Unity 6.1 differences from tutorials

## Notes
- Always write tests before implementation (TDD)
- Mark tasks complete immediately when finished
- Add new tasks as they're discovered
- Update time estimates based on actual progress
- Keep documentation current with implementation changes
- Use cross-references to link related documents
- **Unity 6.1**: Document any version-specific differences encountered
- **Daily Progress**: Update this file after each work session