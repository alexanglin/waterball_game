# Waterball Game - Project Requirements Document (PRD)

**Navigation:** [← Game Mechanics](GAME_MECHANICS.md) | [Back to Index](../INDEX.md) | [Next: Plan →](PLAN.md)

**Quick Links:** [Functional Requirements](#2-functional-requirements) | [Technical Requirements](#4-technical-requirements) | [Testing](#6-testing-requirements)

## 1. Project Overview

### 1.1 Purpose
Create a mobile adaptation of the classic water-filled handheld hockey game, where players use water jets to push balls into opponent goals.

### 1.2 Objectives
- Recreate nostalgic gameplay experience on mobile devices
- Deliver smooth, physics-based water simulation
- Provide engaging local multiplayer experience
- Achieve commercial success on iOS App Store

### 1.3 Success Criteria
- 4.5+ star rating on App Store
- 60 FPS performance on modern devices
- Intuitive controls with <30 second learning curve
- High replay value through competitive gameplay

## 2. Functional Requirements

### 2.1 Core Gameplay
- **FR-001**: Two players compete to score goals using water jets
- **FR-002**: Water jets push floating balls across playing field
- **FR-003**: First player to reach target score wins
- **FR-004**: Multiple balls active simultaneously (3-6 balls)
- **FR-005**: Real-time physics simulation for water and ball movement

### 2.2 Game Controls
- **FR-006**: Each player has two jet buttons (left and right)
- **FR-007**: Holding button creates continuous water jet
- **FR-008**: Releasing button stops water jet immediately
- **FR-009**: Support simultaneous button presses
- **FR-010**: Visual feedback on button activation

### 2.3 Game Modes
- **FR-011**: Local multiplayer (2 players, same device)
- **FR-012**: Single player vs AI (future release)
- **FR-013**: Practice mode with no opponent
- **FR-014**: Tournament mode (future release)

### 2.4 Scoring System
- **FR-015**: Goals detected when ball enters opponent's goal area
- **FR-016**: Score displayed prominently for both players
- **FR-017**: Configurable win conditions (score limit or time limit)
- **FR-018**: Sudden death overtime for ties

### 2.5 Game States
- **FR-019**: Main menu with game options
- **FR-020**: Game setup screen for match configuration
- **FR-021**: Active gameplay state
- **FR-022**: Pause functionality during matches
- **FR-023**: Game over screen with winner announcement
- **FR-024**: Rematch option after game completion

## 3. Non-Functional Requirements

### 3.1 Performance
- **NFR-001**: 60 FPS on iPhone 12 and newer
- **NFR-002**: 30 FPS minimum on iPhone X
- **NFR-003**: Load time <3 seconds on modern devices
- **NFR-004**: Responsive touch input (<50ms latency)
- **NFR-005**: Smooth physics simulation without stuttering

### 3.2 Usability
- **NFR-006**: Intuitive controls learnable without tutorial
- **NFR-007**: Clear visual distinction between players (blue/red)
- **NFR-008**: Accessible UI with sufficient touch target sizes
- **NFR-009**: Visual indicators for all game states
- **NFR-010**: Consistent UI/UX patterns throughout

### 3.3 Reliability
- **NFR-011**: No crashes during normal gameplay
- **NFR-012**: Graceful handling of app backgrounding
- **NFR-013**: Game state preservation on interruption
- **NFR-014**: Stable physics simulation (no explosions)

### 3.4 Compatibility
- **NFR-015**: Support iOS 14.0 and above
- **NFR-016**: Compatible with all iPhone models (6.1" and up)
- **NFR-017**: Optimized for iPad (with proper scaling)
- **NFR-018**: Support both portrait and landscape (landscape preferred)

## 4. Technical Requirements

### 4.1 Development Platform
- **TR-001**: Unity 2022.3 LTS as game engine
- **TR-002**: C# as primary programming language
- **TR-003**: Visual Studio or Rider as IDE
- **TR-004**: Git for version control

### 4.2 Physics Engine
- **TR-005**: Realistic water simulation using particle system
- **TR-006**: Buoyancy simulation for floating balls
- **TR-007**: Collision detection for goals and boundaries
- **TR-008**: Optimized for mobile performance

### 4.3 Graphics
- **TR-009**: 3D rendering with fixed camera angle
- **TR-010**: Particle effects for water movement
- **TR-011**: Smooth animations for all interactions
- **TR-012**: Dynamic lighting for water effects

### 4.4 Audio
- **TR-013**: Spatial audio for water sounds
- **TR-014**: Haptic feedback for button presses
- **TR-015**: Background music with volume control
- **TR-016**: Sound effects for goals and collisions

## 5. User Interface Requirements

### 5.1 Menu Design
- **UI-001**: Main menu with clear navigation options
- **UI-002**: Settings accessible from all screens
- **UI-003**: Consistent back button behavior
- **UI-004**: Visual feedback for all interactions

### 5.2 In-Game UI
- **UI-005**: Minimal HUD to maximize play area
- **UI-006**: Score display visible at all times
- **UI-007**: Clear button zones for each player
- **UI-008**: Pause button easily accessible

### 5.3 Visual Design
- **UI-009**: Clean, modern aesthetic
- **UI-010**: High contrast for visibility
- **UI-011**: Consistent color scheme (blue vs red)
- **UI-012**: Smooth transitions between screens

## 6. Testing Requirements

### 6.1 Unit Testing
- **TEST-001**: 80% code coverage minimum
- **TEST-002**: All physics calculations tested
- **TEST-003**: Input handling test suite
- **TEST-004**: Game logic comprehensive tests

### 6.2 Integration Testing
- **TEST-005**: Water-ball interaction validation
- **TEST-006**: Multiplayer synchronization tests
- **TEST-007**: State transition testing
- **TEST-008**: Performance benchmarking

### 6.3 User Testing
- **TEST-009**: Beta testing via TestFlight
- **TEST-010**: Minimum 50 beta testers
- **TEST-011**: Feedback integration process
- **TEST-012**: A/B testing for controls

## 7. Constraints & Assumptions

### 7.1 Constraints
- **C-001**: Initial release iOS only
- **C-002**: No online multiplayer in v1.0
- **C-003**: Limited to 2 players maximum
- **C-004**: English language only initially

### 7.2 Assumptions
- **A-001**: Players familiar with physics-based games
- **A-002**: Devices have sufficient processing power
- **A-003**: Users prefer landscape orientation
- **A-004**: Local multiplayer is primary use case

### 7.3 Dependencies
- **D-001**: Unity water physics plugin selection
- **D-002**: Apple Developer account active
- **D-003**: TestFlight availability
- **D-004**: App Store review process

## 8. Future Enhancements (Post-Launch)

### 8.1 Version 1.1
- Online multiplayer support
- Additional ball types with different physics
- Tournament mode with brackets
- Replay system for goals

### 8.2 Version 2.0
- Android release
- Custom arena designs
- Power-ups and special abilities
- Global leaderboards

## 9. Acceptance Criteria

### 9.1 Minimum Viable Product (MVP)
- [ ] Core water physics working smoothly
- [ ] Local 2-player mode fully functional
- [ ] Basic scoring and win conditions
- [ ] Stable performance on target devices
- [ ] App Store ready with all assets

### 9.2 Definition of Done
- [ ] All functional requirements implemented
- [ ] Performance targets achieved
- [ ] No critical bugs
- [ ] Beta testing completed
- [ ] App Store approved