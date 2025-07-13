# Scripts Directory - Claude Guidelines

## Purpose
Contains automation scripts for development environment setup, documentation validation, and project maintenance.

## Files in This Directory
- **setup.sh** - Automated development environment setup for macOS/iOS development
- **validate_docs.sh** - Documentation structure and link validation

## Claude Tasks for /scripts
1. **Script Maintenance**: Keep setup.sh current with Unity and iOS requirements
2. **Validation Updates**: Enhance validate_docs.sh as documentation structure evolves
3. **New Automation**: Create additional scripts as development needs arise
4. **Testing**: Ensure all scripts work correctly on target platforms

## Script Usage Guidelines
- **setup.sh**: Run once for new development environment setup
- **validate_docs.sh**: Run before committing documentation changes
- **Permissions**: All scripts should be executable (chmod +x)
- **Error Handling**: Scripts should fail gracefully with helpful messages

## Future Scripts
As development progresses, consider adding:
- **build.sh** - Automated Unity build for iOS
- **test.sh** - Run Unity test suite
- **deploy.sh** - App Store submission automation
- **backup.sh** - Project backup and versioning

## Development Standards
- **Platform Support**: Focus on macOS (required for iOS development)
- **Dependencies**: Check for required tools before proceeding
- **User Feedback**: Provide clear progress and error messages
- **Documentation**: Comment scripts thoroughly for maintenance

## Integration Points
- **Unity Setup**: setup.sh should align with docs/technical/UNITY_SETUP.md
- **Documentation**: validate_docs.sh should check structure defined in docs/INDEX.md
- **Build Process**: Future scripts should follow docs/planning/PLAN.md phases
- **Quality Gates**: Scripts should enforce standards from docs/development/TESTING_STRATEGY.md

## Maintenance Responsibilities
- **Version Compatibility**: Update scripts when Unity/Xcode versions change
- **Path Updates**: Adjust directory checks when project structure evolves
- **Feature Addition**: Add new validations as documentation standards expand
- **Performance**: Keep scripts fast and efficient for frequent use

All scripts should be thoroughly tested and provide helpful feedback to developers throughout the project lifecycle.