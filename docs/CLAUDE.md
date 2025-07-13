# Documentation Directory - Claude Guidelines

## Purpose
This directory contains all project documentation organized by category and purpose.

## Directory Structure
- **planning/** - Project requirements, game mechanics, roadmap
- **technical/** - Architecture, Unity setup, physics design
- **development/** - TDD methodology, testing, UI/UX
- **reference/** - Process improvements, troubleshooting

## Navigation
**Entry Point:** Always start with [INDEX.md](INDEX.md) for role-based navigation

## Claude Tasks for /docs
1. **Reading Documentation**: Use INDEX.md to find relevant documents by role
2. **Updating Documents**: Follow navigation chains, update cross-references
3. **Adding New Docs**: Place in appropriate subdirectory, add to INDEX.md
4. **Validation**: Run `../scripts/validate_docs.sh` before committing

## Best Practices
- **Navigation Headers**: All docs must have navigation with prev/next links
- **Cross-References**: Link related documents across directories
- **Index Updates**: Add new documents to INDEX.md with proper categorization
- **Link Maintenance**: Update relative paths when moving documents

## Quick Access
- [Project Overview](planning/PROJECT_REQUIREMENTS_DOCUMENT.md)
- [Unity Setup](technical/UNITY_SETUP.md)
- [Development Process](development/DEVELOPMENT_PLAN.md)
- [Testing Strategy](development/TESTING_STRATEGY.md)

When working in this directory, always maintain the logical flow and cross-references between documents.