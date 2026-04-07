---
name: subagent-driven-development
description: Use when executing implementation plans with independent tasks in the current session
---

# Subagent-Driven Development

Execute plan by dispatching fresh subagent per task, with two-stage review after each: spec compliance review first, then code quality review.

**Why subagents:** Delegate tasks to specialized agents with isolated context. By precisely crafting their instructions and context, you ensure they stay focused. They should never inherit your session's context — you construct exactly what they need.

**Core principle:** Fresh subagent per task + two-stage review (spec then quality) = high quality, fast iteration

## The Process

1. Read plan, extract all tasks with full text, note context
2. For each task:
   a. Dispatch implementer subagent with full task text + context
   b. If implementer asks questions, answer and re-dispatch
   c. Implementer implements, tests, commits, self-reviews
   d. Dispatch spec reviewer subagent — confirms code matches spec
   e. If spec issues found, implementer fixes, re-review
   f. Dispatch code quality reviewer subagent
   g. If quality issues found, implementer fixes, re-review
   h. Mark task complete
3. After all tasks: dispatch final code reviewer for entire implementation
4. Use finishing-a-development-branch skill

## Handling Implementer Status

- **DONE:** Proceed to spec compliance review
- **DONE_WITH_CONCERNS:** Read concerns before proceeding. Address correctness/scope concerns before review.
- **NEEDS_CONTEXT:** Provide missing context and re-dispatch
- **BLOCKED:** Assess blocker — provide more context, use more capable model, break into smaller pieces, or escalate to user

## Implementer Prompt Template

When dispatching an implementer subagent, provide:
- Full task text from plan (don't make subagent read file)
- Scene-setting context (where task fits, dependencies)
- Working directory
- Instructions: implement, write tests (TDD), verify, commit, self-review, report status

## Spec Reviewer Prompt Template

Dispatch after implementation. Reviewer must:
- Read actual code (not trust implementer's report)
- Check for missing requirements, extra/unneeded work, misunderstandings
- Report ✅ spec compliant or ❌ issues with file:line references

## Code Quality Reviewer Prompt Template

Dispatch ONLY after spec compliance passes. Reviewer checks:
- Clean separation of concerns, proper error handling, type safety
- Sound architecture, performance, security
- Tests actually test logic (not mocks), edge cases covered
- Reports: Strengths, Issues (Critical/Important/Minor), Assessment

## Red Flags

**Never:**
- Skip reviews (spec compliance OR code quality)
- Proceed with unfixed issues
- Dispatch multiple implementation subagents in parallel (conflicts)
- Make subagent read plan file (provide full text instead)
- Start code quality review before spec compliance is ✅
- Move to next task while either review has open issues

**If reviewer finds issues:** Implementer fixes → reviewer reviews again → repeat until approved
