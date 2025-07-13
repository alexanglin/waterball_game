# UI/UX Design Document - Waterball Game

## Design Philosophy
- **Minimalist**: Clean interface that doesn't obstruct gameplay
- **Nostalgic**: Subtle references to classic handheld water games
- **Accessible**: Large touch targets, high contrast, clear feedback
- **Responsive**: Immediate visual feedback for all interactions

## Screen Layouts

### 1. Main Menu Screen

#### Layout Structure
```
┌─────────────────────────────────┐
│              LOGO               │
│         Waterball Game          │
│                                 │
│        [▶ PLAY GAME]           │
│        [⚙ SETTINGS]            │
│        [? HOW TO PLAY]         │
│        [🏆 ACHIEVEMENTS]       │
│                                 │
│     Made with Unity 2022       │
└─────────────────────────────────┘
```

#### Design Specifications
- **Background**: Animated water particles (subtle)
- **Logo**: Clean typography with water droplet accent
- **Buttons**: Rounded rectangles, 60pt height minimum
- **Colors**: Blue (#0077BE), White (#FFFFFF), Gray (#666666)

### 2. Game Setup Screen

#### Layout Structure
```
┌─────────────────────────────────┐
│  [←] GAME SETUP                │
│                                 │
│  Match Settings:                │
│  ┌─────────────────────────────┐ │
│  │ Score to Win: [5] [7] [10]  │ │
│  │ Ball Count:   [3] [5] [7]   │ │
│  │ Difficulty:   [Easy] [Hard] │ │
│  └─────────────────────────────┘ │
│                                 │
│  Players:                       │
│  ┌─────────────────────────────┐ │
│  │ Player 1 (Blue):  [Ready]   │ │
│  │ Player 2 (Red):   [Ready]   │ │
│  └─────────────────────────────┘ │
│                                 │
│         [START GAME]            │
└─────────────────────────────────┘
```

### 3. Gameplay Screen (Primary Interface)

#### Layout Structure (Landscape)
```
┌───────────────────────────────────────────────────────────┐
│ [⏸] P1: 3    WATERBALL GAME    P2: 2 [🔊]               │
├───────────────────────────────────────────────────────────┤
│                                                           │
│     ┌─────────────────────────────────────────────┐      │
│     │  🥅                WATER                🥅   │      │
│     │      ⚪  ⚪                  ⚪  ⚪        │      │
│     │         ⚪     CENTER      ⚪             │      │
│     │              ⚪  ⚪  ⚪                   │      │
│     └─────────────────────────────────────────────┘      │
│                                                           │
│ ┌───┐ ┌───┐                           ┌───┐ ┌───┐        │
│ │ L │ │ R │   Player 1 (Blue)        │ L │ │ R │        │
│ └───┘ └───┘                           └───┘ └───┘        │
│                                    Player 2 (Red)        │
└───────────────────────────────────────────────────────────┘
```

#### Touch Zones
- **Player 1 Buttons**: Bottom-left corner (L/R jets)
- **Player 2 Buttons**: Bottom-right corner (L/R jets)
- **Pause Button**: Top-left corner
- **Volume**: Top-right corner

#### Visual Elements
- **Water**: Translucent blue with particle effects
- **Balls**: White spheres with subtle shadows
- **Goals**: Circular openings with team colors
- **Jets**: Particle streams when buttons pressed

### 4. Pause Menu Overlay

#### Layout Structure
```
┌─────────────────────────────────┐
│        GAME PAUSED             │
│                                 │
│        [▶ RESUME]              │
│        [🔄 RESTART]            │
│        [⚙ SETTINGS]            │
│        [🏠 MAIN MENU]          │
│                                 │
│   Score: Blue 3 - Red 2        │
└─────────────────────────────────┘
```

### 5. Game Over Screen

#### Layout Structure
```
┌─────────────────────────────────┐
│         🎉 BLUE WINS! 🎉       │
│                                 │
│      Final Score: 5 - 3        │
│                                 │
│     ⭐ Match Statistics ⭐     │
│     Goals: Blue 5, Red 3       │
│     Duration: 2:34              │
│     Total Shots: 127            │
│                                 │
│        [🔄 PLAY AGAIN]         │
│        [🏠 MAIN MENU]          │
└─────────────────────────────────┘
```

## Visual Design System

### Color Palette
```
Primary Colors:
- Water Blue:    #0077BE
- Player 1 Blue: #4A90E2
- Player 2 Red:  #E85D75
- Success Green: #7ED321
- Warning Orange:#F5A623

Neutral Colors:
- Background:    #F8F9FA
- Text Dark:     #2C3E50
- Text Light:    #7F8C8D
- Border:        #E0E6ED
```

### Typography
```
Primary Font: San Francisco (iOS system font)
- Heading 1: 28pt, Bold
- Heading 2: 22pt, Semibold  
- Body Text: 16pt, Regular
- Button Text: 18pt, Medium
- Score Text: 32pt, Bold
```

### Iconography
- **Style**: Rounded, minimal line icons
- **Size**: 24pt standard, 32pt for primary actions
- **Weight**: 2pt stroke width
- **Library**: SF Symbols (iOS) + custom water icons

## Responsive Design

### Device Adaptations

#### iPhone (Portrait - Menu Only)
- Stack buttons vertically
- Larger touch targets (70pt height)
- Single column layout

#### iPhone (Landscape - Gameplay)
- Optimized button placement for thumbs
- Minimal UI to maximize play area
- Score display at top corners

#### iPad (Landscape - Primary)
- Larger playing field
- Enhanced water effects
- Optional picture-in-picture mode

### Screen Size Breakpoints
```
Small Phone:  < 5.5"  (iPhone SE)
Large Phone:  5.5-6.7" (iPhone 11-14)
Small Tablet: 7-9"    (iPad mini)
Large Tablet: 10-13"  (iPad Pro)
```

## Interaction Design

### Button States
```css
Default:  Background #F8F9FA, Border #E0E6ED
Pressed:  Background #E9ECEF, Border #ADB5BD
Active:   Background [Team Color], Border Darker
Disabled: Background #F8F9FA, Opacity 0.5
```

### Touch Feedback
- **Haptic**: Light impact on button press
- **Visual**: Immediate color change + ripple effect
- **Audio**: Subtle water splash sound
- **Scale**: Brief 0.95x scale on press

### Water Jet Visual Feedback
```
Button Press → Particle Stream → Force Visualization
    ↓              ↓                    ↓
  Haptic        Animation           Ball Movement
```

## Accessibility Features

### WCAG 2.1 Compliance
- **Color Contrast**: Minimum 4.5:1 ratio
- **Touch Targets**: Minimum 44pt square
- **Text Size**: Scalable with iOS settings
- **Focus Indicators**: Clear visual focus states

### Inclusive Design
- **Colorblind Support**: Shapes + colors for team distinction
- **Motor Accessibility**: Large button zones, hold gestures
- **Cognitive Accessibility**: Clear visual hierarchy, simple navigation

## Animation Guidelines

### Micro-Interactions
- **Button Press**: 150ms ease-out scale animation
- **Page Transitions**: 300ms slide animations
- **Score Update**: 500ms celebrate animation
- **Water Effects**: Real-time particle simulation

### Performance Considerations
- **60 FPS**: All UI animations maintain frame rate
- **GPU Accelerated**: Use transform properties only
- **Reduced Motion**: Respect iOS accessibility settings

## Dark Mode Support

### Color Adaptations
```
Light Mode → Dark Mode:
Background #F8F9FA → #1C1C1E
Text #2C3E50 → #FFFFFF
Cards #FFFFFF → #2C2C2E
Borders #E0E6ED → #3A3A3C
```

### Design Principles
- Maintain color coding for teams
- Increase contrast for water visibility
- Preserve game readability

## Error States

### Connection Issues
```
┌─────────────────────────────────┐
│         ⚠ No Connection        │
│                                 │
│   Check your internet and      │
│   try again.                    │
│                                 │
│        [TRY AGAIN]             │
└─────────────────────────────────┘
```

### Performance Issues
- Automatic quality reduction
- User notification of changes
- Option to manually adjust settings

## Implementation Notes

### Unity UI Components
- **Canvas**: Screen Space - Overlay
- **Render Mode**: Screen Space - Camera
- **UI Scale Mode**: Scale With Screen Size
- **Reference Resolution**: 1920x1080

### Responsive Layout
```csharp
// Example: Adaptive button sizing
float screenWidth = Screen.width;
float buttonWidth = Mathf.Clamp(screenWidth * 0.15f, 120f, 200f);
```

### Performance Optimization
- UI object pooling for dynamic elements
- Texture atlasing for UI sprites
- Minimal overdraw in UI layers

This design system ensures a cohesive, accessible, and engaging user experience across all supported devices while maintaining the nostalgic charm of the original water game.