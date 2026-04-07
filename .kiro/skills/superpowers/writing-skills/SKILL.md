---
name: writing-skills
description: Use when creating new skills, editing existing skills, or verifying skills work before deployment
---

# Writing Skills

Writing skills IS Test-Driven Development applied to process documentation.

**Core principle:** If you didn't watch an agent fail without the skill, you don't know if the skill teaches the right thing.

## What is a Skill?

A skill is a reference guide for proven techniques, patterns, or tools. Skills help future agent instances find and apply effective approaches.

**Skills are:** Reusable techniques, patterns, tools, reference guides
**Skills are NOT:** Narratives about how you solved a problem once

## When to Create a Skill

**Create when:** Technique wasn't intuitively obvious, you'd reference this again across projects, pattern applies broadly, others would benefit

**Don't create for:** One-off solutions, standard practices well-documented elsewhere, project-specific conventions

## SKILL.md Structure

**Frontmatter (YAML):** Two required fields: `name` and `description`
- `name`: Use letters, numbers, and hyphens only
- `description`: Third-person, starts with "Use when...", describes ONLY when to use (NOT what it does)

**Body:** Overview with core principle, When to Use, Core Pattern, Quick Reference, Implementation, Common Mistakes

## Directory Structure

```
~/.kiro/skills/superpowers/
  skill-name/
    SKILL.md          # Main reference (required)
    supporting-file.*  # Only if needed
```

## Key Principles

- Description = triggering conditions only, never workflow summary
- One excellent example beats many mediocre ones
- Keep skills concise — target <500 words
- Use cross-references to other skills instead of repeating content
- Flowcharts only for non-obvious decision points
- Test skills before deploying (RED-GREEN-REFACTOR cycle)
