# Architecture Diagrams - Waterball Game

**Navigation:** [← Back to Reference](DOCUMENTATION_IMPROVEMENTS.md) | [Back to Index](../INDEX.md) | [Technical Architecture →](../technical/ARCHITECTURE.md)

## System Architecture Overview

```mermaid
graph TB
    %% Main Game Systems
    subgraph "Game Core"
        GM[GameManager<br/>Singleton]
        GSM[GameStateManager]
        SM[ScoreManager]
    end

    subgraph "Physics System"
        WS[WaterSimulation]
        PM[PhysicsManager]
        BP[BallPhysics]
        JC[JetController]
    end

    subgraph "Input System"
        TIH[TouchInputHandler]
        IMP[InputMapper]
        HC[HapticController]
    end

    subgraph "UI System"
        MM[MenuManager]
        HUD[HUDManager]
        PS[PauseSystem]
    end

    subgraph "Audio System"
        AM[AudioManager]
        SFX[SoundEffects]
        BGM[MusicController]
    end

    %% Connections
    TIH --> IMP
    IMP --> JC
    JC --> WS
    WS --> BP
    BP --> SM
    SM --> HUD
    
    GM --> GSM
    GSM --> MM
    GSM --> HUD
    GSM --> PS
    
    JC --> HC
    BP --> SFX
    GSM --> BGM

    %% External Systems
    Unity{{Unity Engine}} --> GM
    iOS{{iOS Platform}} --> TIH
```

## Game State Flow

```mermaid
stateDiagram-v2
    [*] --> Loading
    Loading --> MainMenu: Assets Loaded
    
    MainMenu --> GameSetup: Play Button
    MainMenu --> Settings: Settings Button
    Settings --> MainMenu: Back
    
    GameSetup --> Playing: Start Game
    Playing --> Paused: Pause Button
    Paused --> Playing: Resume
    Paused --> MainMenu: Quit
    
    Playing --> RoundEnd: Goal Scored
    RoundEnd --> Playing: Next Round
    RoundEnd --> GameOver: Final Score
    
    GameOver --> MainMenu: Menu
    GameOver --> GameSetup: Rematch
```

## Physics System Flow

```mermaid
graph LR
    subgraph "Input"
        TB[Touch Button]
    end
    
    subgraph "Force Generation"
        JF[Jet Force<br/>50N]
        JP[Jet Position]
    end
    
    subgraph "Water Simulation"
        WP[Water Particles<br/>2000-5000]
        WF[Water Flow]
        WV[Velocity Field]
    end
    
    subgraph "Ball Physics"
        BF[Buoyancy Force]
        DF[Drag Force]
        CF[Current Force]
    end
    
    subgraph "Goal Detection"
        GT[Goal Trigger]
        SD[Score++]
    end

    TB -->|Press| JF
    JF --> WP
    WP --> WF
    WF --> WV
    WV --> CF
    CF --> BF
    BF --> DF
    DF -->|Ball Movement| GT
    GT --> SD
```

## Component Communication

```mermaid
sequenceDiagram
    participant User
    participant TouchInput
    participant JetController
    participant WaterSim
    participant Ball
    participant ScoreManager
    participant HUD

    User->>TouchInput: Press Button
    TouchInput->>JetController: ActivateJet(position, player)
    JetController->>WaterSim: ApplyForce(vector, intensity)
    WaterSim->>Ball: TransferMomentum(force)
    Ball->>Ball: UpdatePosition()
    Ball->>ScoreManager: OnGoalEntered()
    ScoreManager->>HUD: UpdateScore(player, score)
    HUD->>User: Display New Score
```

## Data Flow Architecture

```mermaid
graph TD
    subgraph "Persistent Data"
        PS[PlayerSettings]
        GS[GameSettings]
        HS[HighScores]
    end
    
    subgraph "Runtime Data"
        GSD[GameSessionData]
        PD[PhysicsData]
        ID[InputData]
    end
    
    subgraph "Managers"
        DM[DataManager]
        CM[CacheManager]
    end
    
    PS --> DM
    GS --> DM
    HS --> DM
    
    DM --> GSD
    DM --> CM
    
    ID --> PD
    PD --> GSD
    GSD --> DM
    
    DM -->|Save| PS
    DM -->|Save| GS
    DM -->|Save| HS
```

## Performance Architecture

```mermaid
graph TB
    subgraph "Quality Manager"
        QM[QualityManager]
        FPS[FPSMonitor]
        TM[ThermalMonitor]
    end
    
    subgraph "Optimization Systems"
        LOD[LOD System]
        OP[Object Pooling]
        PC[Particle Culling]
    end
    
    subgraph "Render Pipeline"
        CAM[Cameras]
        UI[UI Canvas]
        WAT[Water Renderer]
        ENV[Environment]
    end
    
    FPS --> QM
    TM --> QM
    
    QM -->|Adjust| LOD
    QM -->|Control| OP
    QM -->|Limit| PC
    
    LOD --> WAT
    OP --> ENV
    PC --> WAT
    
    WAT --> CAM
    ENV --> CAM
    UI --> CAM
```

## Unity Scene Hierarchy

```
WaterballGame Scene
├── _Managers
│   ├── GameManager
│   ├── AudioManager
│   ├── InputManager
│   └── UIManager
├── _Environment
│   ├── PlayingField
│   ├── Goals
│   ├── Boundaries
│   └── Lighting
├── _Physics
│   ├── WaterSystem
│   ├── BallSpawner
│   └── JetEmitters
├── _UI
│   ├── MainCanvas
│   ├── HUD
│   └── Menus
└── _Cameras
    ├── MainCamera
    ├── Player1Cam (Multiplayer)
    └── Player2Cam (Multiplayer)
```

## Memory Allocation Strategy

```mermaid
pie title "1GB Memory Budget"
    "Unity Engine" : 200
    "Game Logic" : 100
    "Water Physics" : 300
    "Audio" : 50
    "UI" : 30
    "Textures" : 250
    "Buffer" : 70
```

---

**Usage Notes**:
- Keep these diagrams visible while coding
- Update when architecture changes
- Use for onboarding future team members
- Reference in code comments: `// See ARCHITECTURE_DIAGRAM.md#game-state-flow`