# Daily Solo Developer Workflow - Waterball Game

**Navigation:** [← Back to Reference](DOCUMENTATION_IMPROVEMENTS.md) | [Back to Index](../INDEX.md)

## 🌅 Daily Development Routine

### Morning Setup (10 minutes)
1. **Review Yesterday's Progress**
   - Check DAILY_LOG.md
   - Review git log: `git log --oneline -5`
   - Check outstanding bugs/issues

2. **Plan Today's Tasks**
   - Pick 1-3 tasks from TASKS.md
   - Write them in DAILY_LOG.md
   - Set realistic goals (solo = slower pace)

3. **Prepare Environment**
   - Open Unity project
   - Open VS Code with documentation
   - Start background music/focus app
   - Grab coffee ☕

### 🔄 Development Cycle (Per Task)

#### 1. Task Start Ritual (5 minutes)
```markdown
## [Date] - [Task Name]
**Goal**: Clear, specific objective
**Success Criteria**: How I'll know it's done
**Time Estimate**: Be realistic
**Start Time**: [timestamp]
```

#### 2. TDD Implementation Flow
```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│ Write Test  │ --> │ Implement   │ --> │  Refactor   │
│   (15 min) │     │   (30 min)  │     │   (15 min)  │
└─────────────┘     └─────────────┘     └─────────────┘
        ↑                                        │
        └────────────────────────────────────────┘
```

#### 3. Progress Checkpoints
- **Every 25 minutes**: Pomodoro break (5 min)
- **Every 2 hours**: Longer break (15 min)
- **Before break**: Quick git commit
- **After break**: Review progress

### 📝 Documentation While Coding

#### Inline Documentation
```csharp
// DECISION: Using object pooling for balls because
// performance tests showed 20% improvement
```

#### Update Tracking
- [ ] Update DECISIONS.md for significant choices
- [ ] Log bugs immediately in tracking sheet
- [ ] Note performance metrics when testing

### 🧪 Testing Routine

#### Before Implementation
1. Write failing test
2. Run test to confirm failure
3. Commit test with message: `test: Add test for [feature]`

#### After Implementation  
1. Run specific test
2. Run related test suite
3. Check performance impact
4. Commit working code: `feat: Implement [feature]`

### 💾 Git Workflow for Solo Dev

#### Commit Strategy
```bash
# Micro-commits for easy rollback
git add -p  # Review changes
git commit -m "type: Short description"

# Types: feat, fix, test, docs, refactor, perf, style
```

#### Daily Branches
```bash
# Start day
git checkout -b feature/[date]-[feature-name]

# End day (if stable)
git checkout main
git merge feature/[date]-[feature-name]
git push origin main

# End day (if unstable)
git push origin feature/[date]-[feature-name]
# Continue tomorrow
```

### 🐛 Bug Handling Process

#### When Bug Found
1. **Document Immediately**
   ```markdown
   ## Bug #[number]
   **Found**: [timestamp]
   **Severity**: Low/Medium/High/Critical
   **Description**: What happened
   **Steps**: How to reproduce
   **Expected**: What should happen
   ```

2. **Decide Action**
   - Critical: Stop and fix now
   - High: Fix before next commit
   - Medium: Add to tomorrow's tasks
   - Low: Add to backlog

### 🏁 End of Day Routine (15 minutes)

1. **Final Commit**
   ```bash
   git add .
   git commit -m "wip: End of day checkpoint"
   git push origin [current-branch]
   ```

2. **Update Documentation**
   - Complete DAILY_LOG.md entry
   - Update TASKS.md progress
   - Note any blockers/concerns

3. **Prepare Tomorrow**
   - Write top 3 priorities
   - Note where you left off
   - Set up any reminders

### 📊 Weekly Review (Fridays, 30 minutes)

1. **Metrics Review**
   - Tasks completed vs planned
   - Time estimates accuracy
   - Bug discovery rate
   - Performance benchmarks

2. **Process Improvements**
   - What slowed me down?
   - What worked well?
   - Documentation needs?
   - Tool improvements?

3. **Next Week Planning**
   - Review PLAN.md milestones
   - Adjust timeline if needed
   - Set weekly goals

## 🚨 Common Solo Dev Pitfalls

### Avoiding Isolation Issues
- **Problem**: No code reviews
- **Solution**: Review own code after breaks
- **Tool**: Git diff before commits

### Maintaining Consistency
- **Problem**: Forgetting conventions
- **Solution**: Keep CODE_PATTERNS.md open
- **Tool**: Unity code templates

### Staying Motivated
- **Problem**: Large task overwhelming
- **Solution**: Break into 1-hour chunks
- **Tool**: Pomodoro timer

### Preventing Scope Creep
- **Problem**: "While I'm here..." additions
- **Solution**: Write ideas in BACKLOG.md
- **Tool**: Strict task focus

## 🎯 Quick Decision Framework

When stuck on a decision:
1. **Time box**: 10 minutes max
2. **Document**: Write options in DECISIONS.md
3. **Choose**: Pick simplest that works
4. **Move on**: Can refactor later
5. **Review**: Revisit in weekly review

## 💡 Solo Dev Mantras

- "Done is better than perfect"
- "Commit early, commit often"
- "When in doubt, write a test"
- "Future me will thank current me for this documentation"
- "One feature at a time"

---

**Remember**: Solo development is a marathon, not a sprint. Consistent daily progress beats sporadic bursts!