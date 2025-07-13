# Development Documentation - Claude Guidelines

## Purpose
Contains development methodology, testing strategies, and design specifications for implementation phases.

## Files in This Directory
- **DEVELOPMENT_PLAN.md** - Detailed TDD implementation approach with phase breakdowns
- **TESTING_STRATEGY.md** - Comprehensive test cases, performance tests, and quality gates
- **UI_UX_DESIGN.md** - Interface wireframes, design system, and accessibility guidelines

## Claude Tasks for /docs/development
1. **TDD Guidance**: Follow DEVELOPMENT_PLAN.md for test-first implementation
2. **Test Creation**: Use TESTING_STRATEGY.md to write specific test cases
3. **UI Implementation**: Reference UI_UX_DESIGN.md for interface specifications
4. **Quality Assurance**: Ensure adherence to testing coverage and performance standards

## Implementation Workflow
```
DEVELOPMENT_PLAN.md (TDD phases) → TESTING_STRATEGY.md (test cases) → UI_UX_DESIGN.md (interface specs)
```

## Critical TDD Process
1. **Red Phase**: Write failing tests based on TESTING_STRATEGY.md
2. **Green Phase**: Implement minimal code following DEVELOPMENT_PLAN.md
3. **Refactor Phase**: Improve code while maintaining test coverage
4. **Validate**: Ensure UI matches UI_UX_DESIGN.md specifications

## Cross-References for Implementation
- **Requirements Traceability**: Link to ../planning/PROJECT_REQUIREMENTS_DOCUMENT.md
- **Technical Constraints**: Reference ../technical/PERFORMANCE_TARGETS.md
- **Physics Integration**: Coordinate with ../technical/PHYSICS_DESIGN.md
- **Architecture Alignment**: Follow ../technical/ARCHITECTURE.md patterns

## Quality Standards
- **Test Coverage**: Minimum 80% as specified in TESTING_STRATEGY.md
- **Performance**: Meet targets defined in ../technical/PERFORMANCE_TARGETS.md
- **Design Consistency**: Follow UI_UX_DESIGN.md specifications exactly
- **TDD Compliance**: All features must follow test-first development

## Phase Coordination
- **Phase Boundaries**: Align with ../planning/PLAN.md milestones
- **Task Tracking**: Update ../../TASKS.md with development progress
- **Documentation Updates**: Keep technical specs current with implementation

When implementing features, always start with this directory's guidance before writing any production code. The TDD methodology is mandatory for all development work.