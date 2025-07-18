# Waterball Game - Project Guidelines

## Important: Start of Conversation Protocol
1. **Always read docs/planning/PLAN.md first** to understand the project roadmap
2. **Read TASKS.md** to see current progress and pending tasks
3. **Check docs/INDEX.md** for documentation organization
4. **Check current phase guide** in docs/reference/PHASE{N}_GUIDE.md
5. **Mark tasks as completed immediately** when finished
6. **Add any new tasks** discovered during work to TASKS.md
7. **Update cross-references** when modifying documentation
8. **Use navigation headers** in all documentation files
9. **Run scripts/validate_docs.sh** before committing major doc changes

## Phase Guide Maintenance
When working on implementation:
1. **Follow the current phase guide** step-by-step
2. **Update guide with discoveries** - Add solutions to common issues
3. **Track actual vs estimated time** - Update day breakdowns if needed
4. **Document deviations** - Note when guide steps need modification
5. **Add code examples** - Include working code snippets as implemented
6. **Update success checkpoints** - Refine based on actual experience

## Project Overview
Mobile adaptation of a classic water-filled handheld hockey game where players use water jets to push balls into goals.

## Tech Stack
- **Framework**: Unity 6.1
- **Physics Engine**: Zibra Liquids or Obi Fluid
- **Platform**: iOS (Android in future)
- **Multiplayer**: Local split-screen only initially

## Game Requirements
- Realistic water physics simulation
- Responsive touch controls
- Multiplayer support (local and/or online)
- Score tracking and game states
- Visual effects for water movement

## Development Priorities
1. Unity project setup and scene creation
2. Core physics engine and water simulation
3. Touch controls and input handling
4. Game logic and scoring system
5. Local multiplayer split-screen
6. Visual polish and effects
7. Performance optimization
8. App Store release

## Testing Approach
- Follow Test-Driven Development (TDD) methodology
- Write tests first, then implementation
- Unit tests for game logic
- Physics simulation tests
- UI interaction tests
- Performance benchmarks for physics calculations
- Minimum 80% code coverage

## Code Standards
- Modular architecture separating physics, game logic, and UI
- Clear separation of concerns
- Comprehensive documentation for physics algorithms
- Performance-optimized code for smooth gameplay

## Documentation Standards
- **Organization**: Use docs/ directory structure (planning/, technical/, development/, reference/)
- **Navigation**: Add navigation headers with prev/next links and quick access
- **Cross-References**: Link related documents and maintain link accuracy
- **Maintenance**: Update documentation with implementation changes
- **Quality**: Ensure accuracy, clarity, and current information
- **Access**: Use docs/INDEX.md for role-based navigation
- **Validation**: Run scripts/validate_docs.sh to check structure
- **Automation**: Use scripts/ directory for setup and maintenance tools
- **Directory Guidance**: Each directory with files has a CLAUDE.md with specific guidelines

## Directory-Specific Guidelines
- **docs/**: Documentation organization and navigation ([CLAUDE.md](docs/CLAUDE.md))
- **docs/planning/**: Requirements and roadmap maintenance ([CLAUDE.md](docs/planning/CLAUDE.md))
- **docs/technical/**: Architecture and implementation specs ([CLAUDE.md](docs/technical/CLAUDE.md))
- **docs/development/**: TDD methodology and testing ([CLAUDE.md](docs/development/CLAUDE.md))
- **docs/reference/**: Process improvements and standards ([CLAUDE.md](docs/reference/CLAUDE.md))
- **scripts/**: Automation tools and maintenance ([CLAUDE.md](scripts/CLAUDE.md))
- **assets/**: Visual assets and media organization ([CLAUDE.md](assets/CLAUDE.md))