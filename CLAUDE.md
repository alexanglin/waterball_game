# Waterball Game - Project Guidelines

## Important: Start of Conversation Protocol
1. **Always read PLAN.md first** to understand the project roadmap
2. **Read TASKS.md** to see current progress and pending tasks
3. **Mark tasks as completed immediately** when finished
4. **Add any new tasks** discovered during work to TASKS.md

## Project Overview
Mobile adaptation of a classic water-filled handheld hockey game where players use water jets to push balls into goals.

## Tech Stack
- **Framework**: Unity 2022.3 LTS
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