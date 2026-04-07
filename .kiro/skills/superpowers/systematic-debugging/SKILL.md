---
name: systematic-debugging
description: Use when encountering any bug, test failure, or unexpected behavior, before proposing fixes
---

# Systematic Debugging

## Overview

Random fixes waste time and create new bugs. Quick patches mask underlying issues.

**Core principle:** ALWAYS find root cause before attempting fixes. Symptom fixes are failure.

## The Iron Law

```
NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST
```

If you haven't completed Phase 1, you cannot propose fixes.

## The Four Phases

### Phase 1: Root Cause Investigation

**BEFORE attempting ANY fix:**

1. **Read Error Messages Carefully** - Don't skip past errors. Read stack traces completely. Note line numbers, file paths, error codes.
2. **Reproduce Consistently** - Can you trigger it reliably? What are the exact steps?
3. **Check Recent Changes** - Git diff, recent commits, new dependencies, config changes
4. **Gather Evidence in Multi-Component Systems** - Add diagnostic instrumentation at each component boundary. Log what enters and exits each component. Run once to gather evidence showing WHERE it breaks.
5. **Trace Data Flow** - Where does bad value originate? What called this with bad value? Keep tracing up until you find the source. Fix at source, not at symptom.

### Phase 2: Pattern Analysis

1. **Find Working Examples** - Locate similar working code in same codebase
2. **Compare Against References** - Read reference implementation COMPLETELY, don't skim
3. **Identify Differences** - List every difference between working and broken
4. **Understand Dependencies** - What other components, settings, config, environment does this need?

### Phase 3: Hypothesis and Testing

1. **Form Single Hypothesis** - "I think X is the root cause because Y"
2. **Test Minimally** - SMALLEST possible change, one variable at a time
3. **Verify Before Continuing** - Didn't work? Form NEW hypothesis. DON'T add more fixes on top.

### Phase 4: Implementation

1. **Create Failing Test Case** - Use test-driven-development skill
2. **Implement Single Fix** - ONE change at a time. No "while I'm here" improvements.
3. **Verify Fix** - Test passes? No other tests broken?
4. **If Fix Doesn't Work** - Count attempts. If ≥ 3: STOP and question the architecture. Discuss with user before attempting more fixes.

## Red Flags - STOP and Follow Process

- "Quick fix for now, investigate later"
- "Just try changing X and see if it works"
- "Add multiple changes, run tests"
- "It's probably X, let me fix that"
- "I don't fully understand but this might work"
- Proposing solutions before tracing data flow
- "One more fix attempt" (when already tried 2+)

**ALL of these mean: STOP. Return to Phase 1.**

## Supporting Techniques

- **Root-cause tracing** - Trace bugs backward through call stack to find original trigger. Never fix just where the error appears.
- **Defense-in-depth** - When you fix a bug caused by invalid data, validate at EVERY layer data passes through (entry point, business logic, environment guards, debug instrumentation).
- **Condition-based waiting** - Replace arbitrary timeouts with condition polling. Wait for the actual condition you care about, not a guess about how long it takes.
