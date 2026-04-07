---
name: using-git-worktrees
description: Use when starting feature work that needs isolation from current workspace or before executing implementation plans
---

# Using Git Worktrees

Git worktrees create isolated workspaces sharing the same repository, allowing work on multiple branches simultaneously without switching.

**Core principle:** Systematic directory selection + safety verification = reliable isolation.

**Announce at start:** "I'm using the using-git-worktrees skill to set up an isolated workspace."

## Directory Selection Process

1. Check for existing `.worktrees/` or `worktrees/` directories (`.worktrees` wins if both exist)
2. Check project docs for worktree directory preference
3. If neither found, ask user:
   - `.worktrees/` (project-local, hidden)
   - `~/.config/superpowers/worktrees/<project>/` (global location)

## Safety Verification

For project-local directories, verify the directory is in `.gitignore`:
```bash
git check-ignore -q .worktrees 2>/dev/null
```
If NOT ignored: add to `.gitignore`, commit, then proceed.

## Creation Steps

1. Detect project name: `basename "$(git rev-parse --show-toplevel)"`
2. Create worktree: `git worktree add <path> -b <branch-name>`
3. Run project setup (auto-detect from package.json, Cargo.toml, requirements.txt, go.mod, etc.)
4. Verify clean baseline — run tests
5. Report location and test status

## Common Mistakes

- Skipping ignore verification → worktree contents get tracked
- Assuming directory location → follow priority: existing > docs > ask
- Proceeding with failing tests → report failures, get explicit permission
- Hardcoding setup commands → auto-detect from project files

## Red Flags

**Never:** Create worktree without verifying it's ignored (project-local), skip baseline test verification, proceed with failing tests without asking

**Always:** Follow directory priority, verify directory is ignored, auto-detect and run project setup, verify clean test baseline
