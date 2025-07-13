# Testing Strategy - Waterball Game

## Testing Philosophy
Follow Test-Driven Development (TDD) with comprehensive coverage across all game systems. Write tests first, implement features second, refactor third.

## Test Categories

### 1. Unit Tests (80% Coverage Target)

#### Physics System Tests
```csharp
[Test]
public void Ball_ShouldFloat_WhenPlacedInWater()
{
    // Arrange
    Ball ball = CreateTestBall();
    WaterSimulation water = CreateTestWater();
    
    // Act
    ball.PlaceInWater(water);
    
    // Assert
    Assert.IsTrue(ball.IsFloating);
    Assert.Greater(ball.Position.y, water.SurfaceLevel);
}

[Test]
public void WaterJet_ShouldPushBall_WhenActivated()
{
    // Arrange
    Ball ball = CreateTestBall();
    WaterJet jet = CreateTestJet();
    Vector3 initialPosition = ball.Position;
    
    // Act
    jet.Activate(direction: Vector3.right, intensity: 1.0f);
    Physics.Simulate(1.0f); // Simulate 1 second
    
    // Assert
    Assert.Greater(ball.Position.x, initialPosition.x);
}
```

#### Input System Tests
```csharp
[Test]
public void TouchInput_ShouldTriggerJet_WhenButtonPressed()
{
    // Arrange
    TouchInputHandler input = new TouchInputHandler();
    bool jetActivated = false;
    input.OnJetActivated += () => jetActivated = true;
    
    // Act
    input.SimulateTouch(ButtonZone.Player1Left, TouchPhase.Began);
    
    // Assert
    Assert.IsTrue(jetActivated);
}

[Test]
public void MultiTouch_ShouldActivateMultipleJets_Simultaneously()
{
    // Arrange
    TouchInputHandler input = new TouchInputHandler();
    int jetsActivated = 0;
    input.OnJetActivated += () => jetsActivated++;
    
    // Act
    input.SimulateTouch(ButtonZone.Player1Left, TouchPhase.Began);
    input.SimulateTouch(ButtonZone.Player1Right, TouchPhase.Began);
    
    // Assert
    Assert.AreEqual(2, jetsActivated);
}
```

#### Game Logic Tests
```csharp
[Test]
public void Goal_ShouldIncrementScore_WhenBallEnters()
{
    // Arrange
    ScoreManager scoreManager = new ScoreManager();
    Goal goal = CreateTestGoal(PlayerId.Player1);
    Ball ball = CreateTestBall();
    
    // Act
    goal.OnBallEntered(ball);
    
    // Assert
    Assert.AreEqual(1, scoreManager.GetScore(PlayerId.Player1));
}

[Test]
public void Game_ShouldEnd_WhenTargetScoreReached()
{
    // Arrange
    GameManager gameManager = new GameManager(targetScore: 5);
    ScoreManager scoreManager = gameManager.ScoreManager;
    
    // Act
    for (int i = 0; i < 5; i++)
    {
        scoreManager.IncrementScore(PlayerId.Player1);
    }
    
    // Assert
    Assert.IsTrue(gameManager.IsGameOver);
    Assert.AreEqual(PlayerId.Player1, gameManager.Winner);
}
```

### 2. Integration Tests

#### Physics Integration
```csharp
[Test]
public void WaterBallSystem_ShouldWorkTogether_InGameplayScenario()
{
    // Arrange
    Scene gameScene = SceneManager.LoadScene("GameplayScene");
    WaterSimulation water = FindObjectOfType<WaterSimulation>();
    Ball[] balls = FindObjectsOfType<Ball>();
    JetController jets = FindObjectOfType<JetController>();
    
    // Act
    jets.ActivateJet(JetId.Player1Left, intensity: 1.0f);
    yield return new WaitForSeconds(2.0f);
    
    // Assert
    Assert.IsTrue(balls.Any(b => b.HasMoved));
    Assert.IsTrue(water.HasActiveFlow);
}
```

#### UI Integration
```csharp
[Test]
public void UI_ShouldUpdateScore_WhenGoalScored()
{
    // Arrange
    UIManager uiManager = FindObjectOfType<UIManager>();
    ScoreManager scoreManager = FindObjectOfType<ScoreManager>();
    
    // Act
    scoreManager.IncrementScore(PlayerId.Player1);
    
    // Assert
    Assert.AreEqual("1", uiManager.Player1ScoreText.text);
}
```

### 3. Performance Tests

#### Frame Rate Testing
```csharp
[Test]
public void Performance_ShouldMaintain60FPS_OnModernDevices()
{
    // Arrange
    PerformanceProfiler profiler = new PerformanceProfiler();
    GameSession session = StartGameSession();
    
    // Act
    profiler.StartProfiling();
    session.RunFor(seconds: 30);
    PerformanceData data = profiler.StopProfiling();
    
    // Assert
    Assert.GreaterOrEqual(data.AverageFrameRate, 58.0f);
    Assert.LessOrEqual(data.FrameTimeVariance, 2.0f);
}
```

#### Memory Testing
```csharp
[Test]
public void Memory_ShouldStayUnder1GB_DuringExtendedPlay()
{
    // Arrange
    MemoryProfiler memProfiler = new MemoryProfiler();
    GameSession session = StartGameSession();
    
    // Act
    memProfiler.StartProfiling();
    session.RunFor(minutes: 10);
    MemoryData data = memProfiler.StopProfiling();
    
    // Assert
    Assert.Less(data.PeakMemoryUsage, 1024 * 1024 * 1024); // 1GB
    Assert.IsFalse(data.HasMemoryLeaks);
}
```

### 4. Device Testing Matrix

#### Target Devices
| Device | iOS Version | Expected FPS | Memory Limit | Priority |
|--------|-------------|--------------|--------------|----------|
| iPhone 14 Pro | 16.0+ | 60 | 8GB | High |
| iPhone 13 | 15.0+ | 60 | 4GB | High |
| iPhone 12 | 14.0+ | 60 | 4GB | Medium |
| iPhone 11 | 14.0+ | 45 | 4GB | Medium |
| iPhone X | 14.0+ | 30 | 3GB | Low |
| iPad Pro | 16.0+ | 60 | 8GB | High |
| iPad Air | 15.0+ | 60 | 4GB | Medium |

#### Test Scenarios per Device
1. **Cold Start**: Launch time measurement
2. **Extended Play**: 30-minute session
3. **Thermal Throttling**: Performance under heat
4. **Memory Pressure**: Behavior during low memory
5. **Interruptions**: Call/notification handling

### 5. User Experience Tests

#### Usability Testing
```csharp
[Test]
public void Controls_ShouldBeIntuitive_ForNewPlayers()
{
    // Test user can start playing within 30 seconds
    // Test user can score a goal within 2 minutes
    // Test user understands scoring system
}

[Test]
public void UI_ShouldBeAccessible_ForAllUsers()
{
    // Test touch targets are >= 44pt (iOS guidelines)
    // Test contrast ratios meet WCAG standards
    // Test text is readable on all devices
}
```

#### A/B Testing Scenarios
1. **Button Size**: Small vs Large touch zones
2. **Jet Intensity**: Weak vs Strong water force
3. **Ball Count**: 3 vs 5 vs 7 balls
4. **Game Length**: 5 vs 7 vs 10 point matches

### 6. Automated Testing Pipeline

#### Continuous Integration Tests
```yaml
# Unity Cloud Build configuration
build_steps:
  - name: "Unit Tests"
    command: "Unity -runTests -projectPath . -testResults results.xml"
  - name: "Build iOS"
    command: "Unity -buildTarget iOS -quit"
  - name: "Performance Baseline"
    command: "Unity -executeMethod PerformanceTests.RunBaseline"
```

#### Test Automation
- **Nightly Builds**: Full test suite on all target devices
- **Pull Request**: Unit and integration tests
- **Release Candidate**: Complete device matrix testing
- **Production**: Smoke tests and performance monitoring

### 7. Beta Testing Strategy

#### TestFlight Beta Phases

##### Internal Testing (Week 1)
- **Participants**: Development team (5 people)
- **Focus**: Core functionality, obvious bugs
- **Duration**: 1 week
- **Success Criteria**: No crashes, basic gameplay works

##### Closed Beta (Week 2-3)
- **Participants**: Friends and family (25 people)
- **Focus**: Gameplay balance, user experience
- **Duration**: 2 weeks
- **Success Criteria**: 4.0+ rating, core features stable

##### Open Beta (Week 4-5)
- **Participants**: Public beta testers (100+ people)
- **Focus**: Performance across devices, final polish
- **Duration**: 2 weeks
- **Success Criteria**: 4.5+ rating, no critical issues

#### Feedback Collection
```csharp
public class BetaFeedbackCollector
{
    public void RecordGameplayEvent(string eventName, Dictionary<string, object> parameters)
    {
        // Send to analytics service
        Analytics.SendEvent(eventName, parameters);
    }
    
    public void RecordPerformanceMetric(string metricName, float value)
    {
        // Track performance across devices
        PerformanceAnalytics.RecordMetric(metricName, value, SystemInfo.deviceModel);
    }
}
```

### 8. Quality Gates

#### Pre-Development
- [ ] All test cases written and reviewed
- [ ] Performance targets defined
- [ ] Device matrix confirmed

#### Development Phase
- [ ] Unit test coverage >= 80%
- [ ] All integration tests passing
- [ ] Performance within 10% of targets

#### Pre-Beta
- [ ] Zero critical bugs
- [ ] Performance targets met on primary devices
- [ ] All user stories completed

#### Pre-Release
- [ ] Beta feedback addressed
- [ ] Performance validated on all target devices
- [ ] App Store guidelines compliance verified

### 9. Test Data Management

#### Test Scenes
- **UnitTestScene**: Minimal scene for unit tests
- **IntegrationTestScene**: Full gameplay environment
- **PerformanceTestScene**: Stress test environment
- **UITestScene**: UI-only testing environment

#### Mock Data
```csharp
public static class TestDataFactory
{
    public static Ball CreateTestBall(Vector3 position = default)
    {
        // Create standardized test ball
    }
    
    public static WaterSimulation CreateTestWater(int particleCount = 1000)
    {
        // Create controlled water environment
    }
}
```

### 10. Reporting and Metrics

#### Test Reports
- **Daily**: Unit test results, build status
- **Weekly**: Performance trends, device coverage
- **Release**: Complete test execution summary

#### Key Metrics
- Test coverage percentage
- Performance regression detection
- Bug discovery rate
- User satisfaction scores (beta)

This comprehensive testing strategy ensures high quality, performance, and user satisfaction for the Waterball Game across all target devices and user scenarios.