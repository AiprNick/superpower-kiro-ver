---
name: requesting-code-review
description: Use when completing tasks, implementing major features, or before merging to verify work meets requirements
---

# Requesting Code Review

Dispatch a code reviewer subagent to catch issues before they cascade. The reviewer gets precisely crafted context — never your session's history.

**Core principle:** Review early, review often.

## When to Request Review

**Mandatory:** After each task in subagent-driven development, after completing major feature, before merge to main

**Optional but valuable:** When stuck, before refactoring, after fixing complex bug

## How to Request

1. Get git SHAs (base and head)
2. Dispatch code reviewer subagent with:
   - What was implemented
   - Plan or requirements reference
   - Base and head SHAs
   - Brief description
3. Act on feedback:
   - Fix Critical issues immediately
   - Fix Important issues before proceeding
   - Note Minor issues for later
   - Push back if reviewer is wrong (with reasoning)

## Code Reviewer Template

The reviewer should check:

**Code Quality:** Clean separation of concerns, proper error handling, type safety, DRY, edge cases

**Architecture:** Sound design, scalability, performance, security

**Testing:** Tests actually test logic (not mocks), edge cases covered, integration tests where needed

**Requirements:** All plan requirements met, implementation matches spec, no scope creep

**Output format:** Strengths, Issues (Critical/Important/Minor with file:line references), Assessment (Ready to merge? Yes/No/With fixes)

## Integration with Workflows

- **Subagent-Driven Development:** Review after EACH task
- **Executing Plans:** Review after each batch
- **Ad-Hoc Development:** Review before merge
