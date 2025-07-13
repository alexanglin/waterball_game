# Unity Code Patterns - Waterball Game

**Navigation:** [← Back to Reference](DOCUMENTATION_IMPROVEMENTS.md) | [Back to Index](../INDEX.md)

## 🎯 Project Code Standards

### Namespace Convention
```csharp
namespace WaterballGame.[Category]
{
    // Categories: Core, Physics, Input, UI, Audio, Data
}
```

### File Organization
```csharp
using UnityEngine;
using System.Collections;
// Third-party usings
// Project usings

namespace WaterballGame.Core
{
    /// <summary>
    /// Brief description of class purpose
    /// </summary>
    public class ClassName : MonoBehaviour
    {
        #region Constants
        private const float DEFAULT_VALUE = 1.0f;
        #endregion

        #region Fields
        [Header("Configuration")]
        [SerializeField] private float _speed = 5f;
        
        [Header("References")]
        [SerializeField] private Transform _target;
        
        private float _currentValue;
        #endregion

        #region Properties
        public float Speed => _speed;
        #endregion

        #region Unity Lifecycle
        private void Awake() { }
        private void Start() { }
        private void Update() { }
        private void FixedUpdate() { }
        private void OnDestroy() { }
        #endregion

        #region Public Methods
        #endregion

        #region Private Methods
        #endregion

        #region Event Handlers
        #endregion
    }
}
```

## 🏗 Common Unity Patterns

### Singleton Manager
```csharp
public class GameManager : MonoBehaviour
{
    private static GameManager _instance;
    public static GameManager Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = FindObjectOfType<GameManager>();
                if (_instance == null)
                {
                    GameObject go = new GameObject("GameManager");
                    _instance = go.AddComponent<GameManager>();
                }
            }
            return _instance;
        }
    }

    private void Awake()
    {
        if (_instance != null && _instance != this)
        {
            Destroy(gameObject);
            return;
        }
        
        _instance = this;
        DontDestroyOnLoad(gameObject);
        
        Initialize();
    }

    private void Initialize()
    {
        // Initialization logic
    }
}
```

### Object Pooling
```csharp
public class ObjectPool<T> where T : Component
{
    private Queue<T> _pool = new Queue<T>();
    private T _prefab;
    private Transform _parent;
    
    public ObjectPool(T prefab, int initialSize, Transform parent = null)
    {
        _prefab = prefab;
        _parent = parent;
        
        for (int i = 0; i < initialSize; i++)
        {
            Create();
        }
    }
    
    public T Get()
    {
        if (_pool.Count == 0)
        {
            Create();
        }
        
        T obj = _pool.Dequeue();
        obj.gameObject.SetActive(true);
        return obj;
    }
    
    public void Return(T obj)
    {
        obj.gameObject.SetActive(false);
        _pool.Enqueue(obj);
    }
    
    private void Create()
    {
        T obj = Object.Instantiate(_prefab, _parent);
        obj.gameObject.SetActive(false);
        _pool.Enqueue(obj);
    }
}
```

### Event System
```csharp
// Event definition
public static class GameEvents
{
    public static System.Action<int> OnScoreChanged;
    public static System.Action<GameState> OnGameStateChanged;
    public static System.Action<Vector3, float> OnGoalScored;
}

// Event publisher
public class ScoreManager : MonoBehaviour
{
    private int _playerScore;
    
    public void AddScore(int points)
    {
        _playerScore += points;
        GameEvents.OnScoreChanged?.Invoke(_playerScore);
    }
}

// Event subscriber
public class UIManager : MonoBehaviour
{
    private void OnEnable()
    {
        GameEvents.OnScoreChanged += UpdateScoreDisplay;
    }
    
    private void OnDisable()
    {
        GameEvents.OnScoreChanged -= UpdateScoreDisplay;
    }
    
    private void UpdateScoreDisplay(int score)
    {
        // Update UI
    }
}
```

### State Machine
```csharp
public enum GameState
{
    Menu,
    Playing,
    Paused,
    GameOver
}

public class GameStateManager : MonoBehaviour
{
    private GameState _currentState;
    private Dictionary<GameState, System.Action> _stateEnterActions;
    private Dictionary<GameState, System.Action> _stateExitActions;
    
    private void Awake()
    {
        InitializeStateMachine();
    }
    
    private void InitializeStateMachine()
    {
        _stateEnterActions = new Dictionary<GameState, System.Action>
        {
            { GameState.Menu, EnterMenu },
            { GameState.Playing, EnterPlaying },
            { GameState.Paused, EnterPaused },
            { GameState.GameOver, EnterGameOver }
        };
        
        _stateExitActions = new Dictionary<GameState, System.Action>
        {
            { GameState.Menu, ExitMenu },
            { GameState.Playing, ExitPlaying },
            { GameState.Paused, ExitPaused },
            { GameState.GameOver, ExitGameOver }
        };
    }
    
    public void ChangeState(GameState newState)
    {
        if (_stateExitActions.ContainsKey(_currentState))
            _stateExitActions[_currentState]?.Invoke();
            
        _currentState = newState;
        
        if (_stateEnterActions.ContainsKey(_currentState))
            _stateEnterActions[_currentState]?.Invoke();
            
        GameEvents.OnGameStateChanged?.Invoke(_currentState);
    }
}
```

## 🎮 Game-Specific Patterns

### Physics Calculation Pattern
```csharp
public class WaterJet : MonoBehaviour
{
    [SerializeField] private float _forceMultiplier = 50f;
    [SerializeField] private float _jetRadius = 2f;
    
    public void ActivateJet(Vector3 direction)
    {
        Collider[] balls = Physics.OverlapSphere(transform.position, _jetRadius, LayerMask.GetMask("Ball"));
        
        foreach (var ball in balls)
        {
            if (ball.TryGetComponent<Rigidbody>(out var rb))
            {
                float distance = Vector3.Distance(transform.position, ball.transform.position);
                float forceFalloff = 1f - (distance / _jetRadius);
                Vector3 force = direction * _forceMultiplier * forceFalloff;
                
                rb.AddForce(force, ForceMode.Impulse);
            }
        }
    }
}
```

### Input Handler Pattern
```csharp
public class TouchInputHandler : MonoBehaviour
{
    [System.Serializable]
    public class TouchZone
    {
        public Rect area;
        public System.Action<bool> onStateChanged;
    }
    
    [SerializeField] private TouchZone[] _touchZones;
    private Dictionary<int, TouchZone> _activeTouches = new Dictionary<int, TouchZone>();
    
    private void Update()
    {
        foreach (Touch touch in Input.touches)
        {
            Vector2 normalizedPos = GetNormalizedPosition(touch.position);
            
            switch (touch.phase)
            {
                case TouchPhase.Began:
                    HandleTouchBegan(touch.fingerId, normalizedPos);
                    break;
                case TouchPhase.Ended:
                case TouchPhase.Canceled:
                    HandleTouchEnded(touch.fingerId);
                    break;
            }
        }
    }
}
```

### Coroutine Patterns
```csharp
// Cached coroutines to prevent garbage
private Coroutine _activeEffect;

public void StartEffect()
{
    if (_activeEffect != null)
        StopCoroutine(_activeEffect);
        
    _activeEffect = StartCoroutine(EffectCoroutine());
}

private IEnumerator EffectCoroutine()
{
    float elapsed = 0f;
    float duration = 1f;
    
    while (elapsed < duration)
    {
        elapsed += Time.deltaTime;
        float t = elapsed / duration;
        
        // Apply effect based on t
        transform.localScale = Vector3.Lerp(Vector3.one, Vector3.one * 1.5f, t);
        
        yield return null;
    }
    
    _activeEffect = null;
}
```

## 🧪 Test Patterns

### Unity Test Pattern
```csharp
[TestFixture]
public class BallPhysicsTests
{
    private GameObject _testBall;
    
    [SetUp]
    public void Setup()
    {
        _testBall = new GameObject("TestBall");
        _testBall.AddComponent<Rigidbody>();
        _testBall.AddComponent<BallController>();
    }
    
    [TearDown]
    public void TearDown()
    {
        Object.DestroyImmediate(_testBall);
    }
    
    [Test]
    public void Ball_Should_Float_When_InWater()
    {
        // Arrange
        var ball = _testBall.GetComponent<BallController>();
        float waterLevel = 0f;
        
        // Act
        ball.UpdateBuoyancy(waterLevel);
        
        // Assert
        Assert.Greater(ball.GetBuoyancyForce().y, 0f);
    }
}
```

## 📝 Common Pitfalls to Avoid

### ❌ Don't Do This
```csharp
// Finding objects every frame
void Update()
{
    GameObject player = GameObject.Find("Player"); // BAD!
}

// Public fields instead of SerializeField
public Transform target; // BAD - use [SerializeField] private
```

### ✅ Do This Instead
```csharp
// Cache references
private GameObject _player;
void Start()
{
    _player = GameObject.Find("Player");
}

// Proper serialization
[SerializeField] private Transform _target;
```

---

**Remember**: Consistency is key in solo development. Stick to these patterns throughout the project!