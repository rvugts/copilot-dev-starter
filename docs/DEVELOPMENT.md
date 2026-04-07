# Development Guide

Welcome to the project! This guide helps both humans and AI agents (like Copilot) understand our development practices and keep code quality high.

## Core Development Philosophy

We practice **Spec-Driven Development (SDD)** and **Test-Driven Development (TDD)** to keep AI agents on the rails and ensure features are correctly implemented from conception.

### Spec-Driven Development (SDD)

Before writing any code, features must have a specification:

1. **Create `spec.md`** at project root or in the feature directory
2. Use the template in `docs/spec.template.md`
3. Include: Context, Requirements, Edge Cases, Success Criteria
4. Get approval before starting implementation

**Why:** The spec is the contract. AI agents must reference @spec.md to validate their suggestions align with requirements.

### Test-Driven Development (TDD)

All features use the **Red-Green-Refactor** workflow:

1. **Red:** Write a failing test that defines desired behavior
2. **Green:** Write minimal code to make the test pass
3. **Refactor:** Improve code quality while tests stay passing

**Why:** TDD ensures requirements are met and prevents "golden hammer" solutions by AI agents.

## Getting Started

### 1. Install Dependencies
```bash
pip install -r requirements.txt      # Python dependencies
npm install                           # If applicable
```

### 2. Understand the Structure

```
project/
├── .github/
│   ├── copilot-instructions.md      # Repository-wide AI guidance
│   ├── instructions/                # Language-specific AI guidance
│   ├── skills/                      # Reusable Copilot skills
│   ├── prompts/                     # Reusable task prompts
│   ├── pull_request_template.md     # GitHub PR template
│   └── workflows/                   # CI/CD workflows (if applicable)
├── spec.md                          # Feature specification (root or feature dir)
├── docs/
│   ├── DEVELOPMENT.md               # This file
│   ├── TROUBLESHOOTING.md           # Common issues & solutions
│   ├── spec.template.md             # Template for feature specs
│   └── adr/                         # Architecture Decision Records
├── tests/
│   ├── test_example.py              # Reference TDD pattern
│   └── conftest.py                  # Shared pytest fixtures
└── src/                             # Implementation
```

### 3. Review Relevant Guidelines

**For all developers:**
- Read `.github/copilot-instructions.md` (repository-wide rules)
- Read `docs/adr/` (architectural decisions)

**For your language/role:**
- **Python:** Read `.github/instructions/python/python-general.instructions.md`
- **FastAPI:** Read `.github/instructions/python/python-fastapi.instructions.md`
- **Django:** Read `.github/instructions/python/python-django.instructions.md`
- **React/TypeScript:** Read `.github/instructions/javascript/react.instructions.md`
- **Node.js backend:** Read `.github/instructions/javascript/nodejs.instructions.md`
- **Terraform/IaC:** Read `.github/instructions/terraform/terraform.instructions.md`
- **Testing patterns:** Read `.github/instructions/workflows/tdd.instructions.md`

## Development Workflow

### Creating a New Feature

```bash
# 1. Create specification (at project root or feature directory)
cp docs/spec.template.md spec.md
# Edit with requirements, edge cases, success criteria

# 2. Get approval (team review)
# [ ] Spec reviewed and approved

# 3. Create feature branch
git checkout -b feature/your-feature-name

# 4. Write test first (Red phase)
# See tests/test_example.py for pattern
pytest tests/test_your_feature.py -v

# 5. Implement to pass test (Green phase)
# Follow language-specific instructions in .github/instructions/

# 6. Refactor for quality (Refactor phase)
# Use /refactor-python skill in Copilot Chat if applicable
# See .github/skills/README.md for available skills

# 7. Verify spec alignment
# Run: python scripts/validate-spec.py (if exists)
# Manual check: Does code match spec.md exactly?

# 8. Commit with clear message
git add .
git commit -m "feat: description following conventional commits"

# 9. Push and create PR
git push origin feature/your-feature-name
# See .github/pull_request_template.md for PR checklist
```

### Using Copilot Effectively

**Copilot Skills Available:**

Invoke with `/` in Copilot Chat:
- `/audit-security` - Security audit of codebase
- `/create-prompt` - Generate reusable prompts
- `/refactor-python` - Refactor Python code
- `/run-prompt` - Execute saved prompts

See `.github/skills/README.md` for details.

**Requesting Features from Copilot:**

```
✅ GOOD:
Create a Python function to validate email addresses.
Follow TDD - write tests first. Reference python-general.instructions.md
and ensure the implementation aligns with @spec.md section 2.1.

❌ BAD:
Write validation code for emails.
```

**Keeping Copilot on Rails:**

Always include:
1. Reference to @spec.md (if applicable)
2. Expected language/framework (Python, React, etc.)
3. TDD requirement (write tests first)
4. Acceptance criteria

## Code Quality Standards

### Type Hints
- **Required for all Python functions and methods**
- Use `typing` module for complex types
- Example: `def process_data(items: List[Dict[str, Any]]) -> bool:`

### Testing
- **Minimum coverage: 80%**
- **All tests must pass before commit** (enforced by pre-commit hook)
- Use `pytest` fixtures from `tests/conftest.py`
- Follow test pattern in `tests/test_example.py`

### Line Length
- **Python:** Maximum 100 characters
- **JavaScript/TypeScript:** Maximum 100 characters

### Documentation
- **Docstrings required** for all modules, classes, and public functions
- Use **Sphinx format** for Python: `:param`, `:return:`, `:raises:`
- Include examples for complex functions

### Security
- **No hardcoded secrets** - use environment variables
- **Parameterized queries only** - never string concatenation for SQL
- **No eval() or exec()** - ever
- **Sanitize all user inputs**
- Validate API requests with models (Pydantic for FastAPI, marshmallow for Django)

## Running Tests

```bash
# Run all tests
pytest

# Run with coverage
pytest --cov=src --cov-report=html

# Run specific test
pytest tests/test_specific.py::test_function

# Watch mode (auto-rerun on file changes)
pytest-watch
```

## Code Review Checklist

Before submitting a PR, ensure:
- [ ] Tests written first (Red phase complete)
- [ ] All tests passing (`pytest --cov=src --cov-fail-under=80`)
- [ ] Code follows language-specific instructions (`.github/instructions/`)
- [ ] Spec.md alignment verified (if feature-related)
- [ ] Type hints on all functions
- [ ] No hardcoded secrets or credentials
- [ ] Complex logic has inline comments
- [ ] Docstrings follow Sphinx format
- [ ] Commits follow conventional commits format
- [ ] No `eval()`, `exec()`, or other security anti-patterns

For detailed PR checklist, see `.github/pull_request_template.md`

## Architecture Decisions

Major architecture decisions are recorded in `docs/adr/` using ADR format.

When making significant technical decisions:
1. Check existing ADRs to understand context
2. Create new ADR following the template in `docs/adr/adr.template.md`
3. Reference relevant ADRs in your implementation

Examples:
- **ADR-001:** Monolithic backend architecture
- **ADR-002:** Async by default for I/O operations

## Troubleshooting

Having issues with Copilot guidance? See `docs/TROUBLESHOOTING.md` for common problems and solutions.

## Additional Resources

- **GitHub Copilot Skills:** `.github/skills/README.md`
- **Custom Instructions:** `.github/instructions/README.md`
- **Architecture Decisions:** `docs/adr/`
- **Spec Template:** `docs/spec.template.md`
- **Test Example:** `tests/test_example.py`

---

**Questions?** Check the relevant guide above or open an issue for clarification.
