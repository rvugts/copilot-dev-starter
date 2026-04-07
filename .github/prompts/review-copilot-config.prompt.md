---
name: review-copilot-config
description: "Review GitHub Copilot configuration scalability, context efficiency, and coverage. Analyze skills, instructions, and specifications. Use when: auditing customization setup, identifying context pollution, planning enhancements, or ensuring spec-driven/test-driven principles are enforced."
---

# Review Copilot Configuration

## Purpose
Analyze the `.github/` Copilot configuration for:
1. **Context efficiency** - Are files too large? Is there redundancy/overlap?
2. **Coverage gaps** - Are there missing files that prevent AI agent autonomy?
3. **Spec/TDD enforcement** - Can Copilot be kept "on the rails" via prompts, templates, or instructions?

## Analysis Scope

Review these elements:

### 1. Size & Context Pollution
- Line count by file (target: individual instruction <100 lines, repository-wide <200)
- Content overlap (same guidance in multiple files)
- Frontmatter patterns (`applyTo` specificity - avoid `applyTo: "**"`)

### 2. Coverage & Gaps
Check for presence of:
- [ ] `copilot-instructions.md` (repository-wide rules)
- [ ] Path-specific instruction files (`.github/instructions/`)
- [ ] Skill files (`.github/skills/`)
- [ ] Spec template (`spec.md` sample or template)
- [ ] Test template (sample test structure)
- [ ] Architecture Decision Record (ADR) template
- [ ] PR/code review checklist
- [ ] Contribution guidelines with AI agent considerations

### 3. Spec-Driven & Test-Driven Enforcement
Assess whether configuration supports:
- [ ] Mandatory @spec.md reference in instructions
- [ ] TDD workflow (Red-Green-Refactor) highlighted prominently
- [ ] Test file templates that enforce patterns
- [ ] Validation prompts that check spec compliance before implementation
- [ ] Hooks that run linters/tests on commit (prevent non-TDD code)

## Recommendations Template

For each finding:
1. **Issue**: What's the problem?
2. **Impact**: Why does it matter?
3. **Recommendation**: Specific action to improve
4. **Priority**: High/Medium/Low based on context efficiency and control enforcement

## Conversation Extraction

If this analysis came from iteration:
- What task was being performed that surfaced this need?
- What patterns emerged from recent work?
- What "near-miss" failures could a template or instruction have prevented?
