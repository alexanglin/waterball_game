# Technical Documentation - Claude Guidelines

## Purpose
Contains technical specifications, architecture design, and implementation guides for the Waterball Game.

## Files in This Directory
- **ARCHITECTURE.md** - System design and technology stack decisions
- **UNITY_SETUP.md** - Step-by-step development environment configuration
- **PHYSICS_DESIGN.md** - Water simulation and ball physics calculations
- **PERFORMANCE_TARGETS.md** - Frame rate, memory, and optimization requirements

## Claude Tasks for /docs/technical
1. **Architecture Updates**: Modify ARCHITECTURE.md when system design changes
2. **Setup Maintenance**: Keep UNITY_SETUP.md current with Unity/iOS updates
3. **Physics Refinement**: Update PHYSICS_DESIGN.md with implementation learnings
4. **Performance Monitoring**: Adjust PERFORMANCE_TARGETS.md based on testing results

## Navigation Flow
```
../planning/PLAN.md → ARCHITECTURE.md → UNITY_SETUP.md → PHYSICS_DESIGN.md → PERFORMANCE_TARGETS.md → ../development/DEVELOPMENT_PLAN.md
```

## Implementation Dependencies
- **UNITY_SETUP.md** → Must align with Phase 1 tasks in ../../TASKS.md
- **PHYSICS_DESIGN.md** → Must satisfy requirements in ../planning/PROJECT_REQUIREMENTS_DOCUMENT.md
- **PERFORMANCE_TARGETS.md** → Must support testing strategy in ../development/TESTING_STRATEGY.md
- **ARCHITECTURE.md** → Must enable UI design in ../development/UI_UX_DESIGN.md

## Critical Maintenance Areas
- **Unity Version**: Update setup guide when Unity LTS changes
- **iOS Requirements**: Monitor Apple developer requirements changes
- **Physics Libraries**: Track updates to Zibra Liquids or alternatives
- **Performance Baselines**: Update targets based on new device releases

## Code Integration Points
When implementation begins:
- **Physics Parameters**: Values in PHYSICS_DESIGN.md become code constants
- **Performance Metrics**: Targets become automated test assertions
- **Architecture Components**: Translate to Unity project structure
- **Setup Steps**: Become onboarding scripts and documentation

Ensure all technical specifications are implementable and testable before development phases begin.