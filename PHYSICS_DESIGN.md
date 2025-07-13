# Physics Design Document - Waterball Game

## Overview
This document defines the physics simulation requirements and calculations for realistic water and ball interactions in the Waterball Game.

## Water Physics Simulation

### Core Requirements
- Particle-based fluid simulation
- Real-time performance on mobile devices
- Responsive to player input (jets)
- Visually appealing water movement

### Water Particle System

#### Particle Properties
```
Particle Count: 2000-5000 (dynamic based on device)
Particle Mass: 0.1 kg
Particle Radius: 0.02 units
Viscosity: 0.8 (water-like)
Surface Tension: 0.1
Damping: 0.95
```

#### Performance Optimization
- **LOD System**: Reduce particles when far from camera
- **Culling**: Don't simulate off-screen particles
- **Pooling**: Reuse particle objects
- **Spatial Hashing**: Optimize collision detection

### Water Jet Mechanics

#### Jet Force Calculation
```csharp
Vector3 jetForce = direction * intensity * deltaTime;
float intensity = Mathf.Lerp(0f, maxJetForce, buttonPressure);
float maxJetForce = 50.0f; // Newtons

// Apply force to particles in cone area
float coneAngle = 30f; // degrees
float jetRange = 2.0f; // units
```

#### Jet Behavior
- **Activation**: Instantaneous on button press
- **Intensity**: Constant while held
- **Deactivation**: Immediate on button release
- **Cooldown**: None (continuous operation)

#### Water Flow Patterns
- **Initial Burst**: Strong directional force
- **Sustained Flow**: Continuous pressure
- **Dispersion**: Widens over distance
- **Surface Interaction**: Creates ripples and waves

## Ball Physics

### Ball Properties
```
Mass: 0.05 kg (lightweight, floatable)
Radius: 0.1 units
Material: Rubber (bouncy)
Drag Coefficient: 0.47 (sphere)
Buoyancy Force: Archimedes principle
```

### Buoyancy Calculation
```csharp
float submergedVolume = CalculateSubmergedVolume(ball, waterLevel);
Vector3 buoyancyForce = Vector3.up * waterDensity * submergedVolume * Physics.gravity.magnitude;
rigidbody.AddForce(buoyancyForce);
```

### Ball Movement States
1. **Floating**: On water surface (stable)
2. **Pushed**: Moving due to water current
3. **Airborne**: Above water (brief)
4. **Submerged**: Under water (returns to surface)

### Ball-Water Interaction
- **Current Response**: Balls follow water flow direction
- **Resistance**: Some drag when moving through water
- **Bobbing**: Natural up/down motion on surface
- **Collision**: Balls can push each other

## Environmental Physics

### Playing Field Boundaries
```
Field Dimensions: 16:9 aspect ratio
Width: 8 units
Height: 4.5 units
Wall Height: 0.5 units
Wall Friction: 0.3
Wall Restitution: 0.7 (bouncy)
```

### Goal Detection
```csharp
// Goal zone properties
Goal Radius: 0.5 units
Goal Depth: 0.2 units
Detection Method: Trigger collider
```

### Water Container
- **Base Level**: 0.0 units (sea level)
- **Max Level**: 0.3 units
- **Volume**: Calculated based on particle count
- **Evaporation**: None (game balance)

## Force Systems

### Primary Forces on Balls
1. **Gravity**: -9.81 m/s² (downward)
2. **Buoyancy**: Variable (upward, water dependent)
3. **Water Current**: Variable (directional)
4. **Drag**: Opposes motion
5. **Collision**: Contact forces

### Force Priority
```
1. Collision Forces (highest)
2. Water Current Forces
3. Buoyancy Forces
4. Drag Forces
5. Gravity (lowest, but constant)
```

## Performance Calculations

### Target Frame Rates
- **iPhone 12+**: 60 FPS (16.67ms per frame)
- **iPhone X-11**: 30 FPS (33.33ms per frame)
- **iPad**: 60 FPS (larger thermal envelope)

### Physics Budget
```
Total Frame Time: 16.67ms (60 FPS)
Physics Allocation: 5ms (30%)
  - Water Simulation: 3ms
  - Ball Physics: 1ms
  - Collision Detection: 1ms
```

### Optimization Strategies
1. **Adaptive Quality**: Reduce particles on performance drop
2. **Fixed Timestep**: Consistent physics regardless of framerate
3. **Predictive Culling**: Don't simulate invisible areas
4. **Batched Updates**: Process similar objects together

## Water Simulation Implementation

### Particle System Setup
```csharp
ParticleSystem.MainModule main = waterParticles.main;
main.startLifetime = Mathf.Infinity;
main.startSpeed = 0f;
main.maxParticles = GetOptimalParticleCount();
main.simulationSpace = ParticleSystemSimulationSpace.World;
```

### Custom Physics Integration
```csharp
void FixedUpdate()
{
    UpdateWaterParticles();
    ApplyJetForces();
    CalculateBuoyancy();
    DetectGoalCollisions();
}
```

### Water-Ball Force Transfer
```csharp
float CalculateWaterForceOnBall(Ball ball)
{
    Vector3 totalForce = Vector3.zero;
    foreach (Particle particle in nearbyParticles)
    {
        Vector3 direction = particle.velocity.normalized;
        float distance = Vector3.Distance(ball.position, particle.position);
        float influence = 1f - (distance / maxInfluenceRange);
        totalForce += direction * particle.velocity.magnitude * influence;
    }
    return totalForce;
}
```

## Testing Requirements

### Physics Validation
- **Ball Floats**: Verify buoyancy calculation
- **Water Flows**: Check jet force application
- **Boundaries Work**: Confirm collision detection
- **Performance**: Maintain target frame rates

### Calibration Values
```
Jet Force Range: 25-75 Newtons (user testing)
Ball Mass Range: 0.03-0.08 kg (gameplay feel)
Water Viscosity: 0.6-1.0 (visual appeal)
Particle Count: 1000-8000 (performance)
```

### Edge Cases
- Multiple balls in goal simultaneously
- All balls pushed to one side
- Rapid button pressing (no jet stuttering)
- Device rotation during gameplay

## Debugging Tools

### Visual Debugging
- Force vector visualization
- Particle velocity display
- Buoyancy force indicators
- Performance overlay

### Physics Profiling
```csharp
Profiler.BeginSample("Water Simulation");
// Water physics code
Profiler.EndSample();
```

### Logging Critical Values
- Frame rate drops
- Particle count changes
- Force magnitude spikes
- Memory allocations

## Future Enhancements

### Advanced Water Features
- **Wave Propagation**: Ripples from ball impacts
- **Temperature Effects**: Hot/cold water behavior
- **Additives**: Soap bubbles, oil slicks
- **Depth Variation**: Shallow and deep areas

### Enhanced Ball Physics
- **Different Materials**: Cork, metal, plastic balls
- **Size Variations**: Small/large balls
- **Magnetic Effects**: Attracted/repelled balls
- **Power-ups**: Temporary physics modifications