---
name: finishing-a-development-branch
description: Use when implementation is complete, all tests pass, and you need to decide how to integrate the work
---

# Finishing a Development Branch

Guide completion of development work by presenting clear options and handling chosen workflow.

**Core principle:** Verify tests → Present options → Execute choice → Clean up.

**Announce at start:** "I'm using the finishing-a-development-branch skill to complete this work."

## The Process

### Step 1: Verify Tests
Run project's test suite. If tests fail: report failures, stop. Don't proceed to Step 2.

### Step 2: Determine Base Branch
```bash
git merge-base HEAD main 2>/dev/null || git merge-base HEAD master 2>/dev/null
```

### Step 3: Present Options
```
Implementation complete. What would you like to do?

1. Merge back to <base-branch> locally
2. Push and create a Pull Request
3. Keep the branch as-is (I'll handle it later)
4. Discard this work

Which option?
```

### Step 4: Execute Choice

- **Option 1 (Merge):** Switch to base, pull latest, merge, verify tests, delete feature branch, cleanup worktree
- **Option 2 (PR):** Push branch, create PR with summary and test plan, cleanup worktree
- **Option 3 (Keep):** Report branch name and worktree path. Don't cleanup.
- **Option 4 (Discard):** Confirm first (require typed "discard"), then delete branch and cleanup worktree

### Step 5: Cleanup Worktree
For Options 1, 2, 4: remove worktree if applicable. For Option 3: keep worktree.

## Red Flags

**Never:** Proceed with failing tests, merge without verifying tests on result, delete work without confirmation, force-push without explicit request

**Always:** Verify tests before offering options, present exactly 4 options, get typed confirmation for Option 4
