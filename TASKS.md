# Waterball Game - Task List

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

## Phase 1: Foundation Setup
- [ ] Install Unity Hub and Unity 2022.3 LTS
- [ ] Create new Unity 3D project named "WaterballGame"
- [ ] Configure iOS build settings in Unity
- [ ] Initialize git repository with .gitignore for Unity
- [ ] Set up Unity Test Framework
- [ ] Create basic project folder structure
- [ ] Write first failing test for scene loading
- [ ] Create minimal scene to pass test

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
- [ ] Research Unity water physics solutions
- [ ] Evaluate Zibra Liquids performance
- [ ] Evaluate Obi Fluid as alternative
- [ ] Write tests for water system initialization
- [ ] Integrate chosen water solution
- [ ] Write tests for water-ball interaction
- [ ] Implement buoyancy system
- [ ] Write performance benchmark tests
- [ ] Optimize water particle count

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

## Phase 0: Pre-Development Documentation (Priority - Solo Developer Focus)

### Visual Documentation (Week 0.1)
- [x] Create architecture diagram with Mermaid showing system components (docs/reference/ARCHITECTURE_DIAGRAM.md)
- [x] Draw game state machine diagram for GameStateManager (included in ARCHITECTURE_DIAGRAM.md)
- [x] Create physics system flowchart (input → jets → water → balls → goals) (included in ARCHITECTURE_DIAGRAM.md)
- [ ] Sketch UI wireframes for all screens (can be hand-drawn, then scanned)
- [ ] Create visual git workflow diagram for solo development

### Quick Reference Guides (Week 0.2)
- [x] Create UNITY_CHEATSHEET.md with common commands and shortcuts (docs/reference/UNITY_CHEATSHEET.md)
- [ ] Write DEBUGGING_GUIDE.md with common Unity issues and solutions
- [ ] Create PERFORMANCE_CHECKLIST.md for optimization steps
- [x] Write CODE_PATTERNS.md with Unity best practices for this project (docs/reference/CODE_PATTERNS.md)
- [x] Create DAILY_WORKFLOW.md for consistent solo dev routine (docs/reference/DAILY_WORKFLOW.md)

### Development Templates (Week 0.3)
- [ ] Create test template files for each test category (unit, integration, performance)
- [ ] Write Unity component templates (Manager, Controller, Handler patterns)
- [ ] Create physics calculation snippet library
- [ ] Build UI component templates matching the design system
- [ ] Create bug report template for self-tracking

### Solo Developer Tools (Week 0.4)
- [x] Set up DECISIONS.md to log important choices and rationale (docs/reference/DECISIONS.md)
- [ ] Create DAILY_LOG.md template for progress tracking
- [ ] Build simple bug tracking spreadsheet (Google Sheets/Excel)
- [ ] Create performance benchmark recording template
- [ ] Set up personal kanban board (Trello/Notion alternative to TASKS.md)

### Documentation Improvements (Lower Priority)
- [ ] Add screenshots to Unity setup guide (during actual setup)
- [ ] Implement automated link checking (if time permits)
- [ ] Add CHANGELOG.md for version tracking
- [ ] Create troubleshooting documentation (as issues arise)
- [ ] Add API reference structure for future code docs

## Ongoing Tasks
- [ ] Update documentation with implementation changes
- [ ] Maintain 80% test coverage
- [ ] Performance profiling after each phase
- [ ] Regular git commits with clear messages
- [ ] Keep TASKS.md updated with new discoveries
- [ ] Review and update documentation each sprint
- [ ] Run scripts/validate_docs.sh before major commits
- [ ] Update cross-references when moving or changing docs

## Notes
- Always write tests before implementation (TDD)
- Mark tasks complete immediately when finished
- Add new tasks as they're discovered
- Update time estimates based on actual progress
- Keep documentation current with implementation changes
- Use cross-references to link related documents