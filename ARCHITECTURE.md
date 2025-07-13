# Waterball Game - Architecture Design

## Technology Stack Decision: Unity

### Why Unity?
1. **No coding experience required initially** - Visual scripting with Bolt/Visual Scripting
2. **Best water physics** - Multiple fluid simulation plugins available
3. **Looks great** - Excellent rendering capabilities and visual effects
4. **iOS first, Android later** - Easy to port between platforms
5. **Local multiplayer** - Built-in support for split-screen

### Recommended Unity Setup
- **Unity Version**: 2022.3 LTS (Long Term Support)
- **Water Physics**: Zibra Liquids (best looking) or Obi Fluid (good performance)
- **Input System**: New Unity Input System for touch controls
- **UI Framework**: Unity UI Toolkit

## Implementation Plan

### Phase 1: Core Prototype (Week 1-2)
1. Set up Unity project with iOS build settings
2. Create basic playing field (hockey rink layout)
3. Implement simple ball physics (no water yet)
4. Add basic touch controls for testing

### Phase 2: Water Physics (Week 3-4)
1. Integrate water simulation plugin
2. Configure water jets from button presses
3. Tune water-ball interactions
4. Optimize performance for mobile

### Phase 3: Game Logic (Week 5)
1. Goal detection system
2. Score tracking
3. Game states (menu, play, pause, win)
4. Round/match system

### Phase 4: Polish & Local Multiplayer (Week 6-7)
1. Split-screen setup for iPad
2. Visual effects (splashes, ripples)
3. Sound effects and haptic feedback
4. UI polish and animations

### Phase 5: Testing & Launch (Week 8)
1. Performance optimization
2. Device testing (various iOS devices)
3. App Store preparation
4. Beta testing

## Architecture Components

```
WaterballGame/
├── GameCore/
│   ├── GameManager (singleton, controls game flow)
│   ├── MatchController (handles rounds/scoring)
│   └── PlayerManager (tracks player states)
├── Physics/
│   ├── WaterController (manages fluid simulation)
│   ├── JetSpawner (creates water jets from input)
│   └── BallController (ball physics and goal detection)
├── Input/
│   ├── TouchInputHandler (converts touch to actions)
│   └── HapticFeedback (vibration controller)
├── UI/
│   ├── MainMenu
│   ├── GameHUD (scores, timer)
│   └── PauseMenu
└── Audio/
    ├── SoundManager
    └── MusicController
```

## Key Design Decisions

### Water Simulation
- **Particle-based** for best visual quality
- Adjust particle count based on device performance
- Pre-baked water movements for consistent gameplay

### Controls
- **Two circular buttons** per player (matching physical game)
- **Hold to spray** - continuous water jet while pressed
- **Visual feedback** - buttons light up when pressed

### Visual Style
- **Clean, modern** aesthetic with subtle nostalgia
- **Translucent water** with refractive effects
- **Bright colors** - maintain blue vs red team identity
- **Smooth animations** for satisfying gameplay

### Performance Targets
- 60 FPS on iPhone 12 and newer
- 30 FPS minimum on iPhone X
- Dynamic quality adjustment

## Learning Resources
1. Unity Learn - Free official tutorials
2. Brackeys YouTube channel - Beginner friendly
3. Unity Asset Store - Pre-made water systems
4. Apple Developer documentation - iOS specific features

## Next Steps
1. Download Unity Hub and Unity 2022.3 LTS
2. Create new 3D mobile project
3. Import water physics asset
4. Start with Phase 1 prototype