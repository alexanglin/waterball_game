# Physics Design Document - Waterball Game

**Navigation:** [← Unity Setup](UNITY_SETUP.md) | [Back to Index](../INDEX.md) | [Next: Performance →](PERFORMANCE_TARGETS.md)

**Quick Links:** [Water Physics](#water-physics-simulation) | [Ball Physics](#ball-physics) | [Force Systems](#force-systems)

## Overview
This document defines the physics simulation requirements and calculations for realistic water and ball interactions in the Waterball Game.

## Water Physics Simulation

### Core Requirements
- Particle-based fluid simulation
- Real-time performance on mobile devices
- Responsive to player input (jets)
- Visually appealing water movement
- **Cost-effective**: Free implementation using Unity built-in features

### Free Water Implementation Strategy

#### Approach 1: Unity Particle System (RECOMMENDED)
Using Unity's built-in Shuriken particle system - completely free and mobile-optimized.

**Particle Properties**
```
Particle Count: 500-1000 (mobile-optimized)
Particle Size: 0.05-0.1 units
Emission Rate: 100-300 particles/second
Lifetime: 2-3 seconds
Gravity: Standard (1.0)
Collision: Enabled with world
Start Speed: 5-10 units/second (jet force)
```

**Visual Enhancements (Free)**
- Unity Shader Graph for water appearance
- Particle sprites for splash effects
- Color gradients for depth illusion
- Emission shapes for jet nozzles

#### Approach 2: 2D Water Effect (Alternative)
For top-down view, use 2D shader effects with invisible physics forces.

**Benefits**
- Extremely performant
- Visually impressive from top-down
- No particle count limitations
- Easy to implement

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

## Water Simulation Implementation (Free Approach)

### Unity Particle System Setup
```csharp
// Free implementation using built-in Unity Particle System
ParticleSystem.MainModule main = waterParticles.main;
main.startLifetime = 3f; // Limited lifetime for performance
main.startSpeed = 5f; // Jet initial velocity
main.maxParticles = 1000; // Mobile-friendly limit
main.simulationSpace = ParticleSystemSimulationSpace.World;
main.gravityModifier = 1f;

// Enable collision for ball interaction
var collision = waterParticles.collision;
collision.enabled = true;
collision.type = ParticleSystemCollisionType.World;
collision.bounce = 0.1f;
collision.dampen = 0.8f;
```

### Free Water Physics Integration
```csharp
void FixedUpdate()
{
    // Simplified free approach
    UpdateParticleJets(); // Control particle emission
    ApplyParticleForcesToBalls(); // Custom force transfer
    CalculateBuoyancy(); // Simple float calculation
    DetectGoalCollisions();
}

// Visual Enhancement with Free Shaders
void EnhanceWaterVisuals()
{
    // Use Unity Shader Graph (free) for water surface
    // Add refraction/reflection with screen-space effects
    // Use particle sprites for splashes (free assets)
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

### Calibration Values (Free Implementation)
```
Jet Force Range: 25-75 Newtons (user testing)
Ball Mass Range: 0.03-0.08 kg (gameplay feel)
Particle Emission Rate: 100-300/second (performance)
Particle Count: 500-1000 (mobile limit)
Force Influence Radius: 0.5 units
Visual Enhancement: Shader-based (not physics)
```

### Free Asset Resources
- **Unity Particle Pack**: Free on Asset Store
- **Shader Graph**: Built into Unity (water shaders)
- **Standard Assets**: Legacy but useful water effects
- **OpenGameArt**: Free water sprites and textures

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